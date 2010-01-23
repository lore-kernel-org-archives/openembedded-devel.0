Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NYbd2-0004xs-VG
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 09:46:04 +0100
Received: from tamarin.localnet (123-192-163-227.dynamic.kbronet.com.tw
	[123.192.163.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id A15081B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 08:42:31 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2010 09:43:24 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
MIME-Version: 1.0
Message-Id: <201001230943.24210.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Patchwork Workflow improvement
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 23 Jan 2010 08:46:04 -0000
X-Groupsio-MsgNum: 16053
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_sarWLFB0AT3MASW"

--Boundary-00=_sarWLFB0AT3MASW
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi All,

right now I'm writing a Qt 4.6 based application that might help us a bit with 
the patchwork queue.

The idea of the script is to have two things at the end:
	1.) a branch with all the patches that applied and that can be published
	2.) a list of patches that don't apply.


What people are supposed to:

1.) Cherry pick from the branch
2.) Send updated patches, close the reports on patchwork...



The current version is able to download the information of all pending 
patches, the next thing is to do is to apply them and keep track of the 
result...



--Boundary-00=_sarWLFB0AT3MASW
Content-Type: text/x-c++src;
  charset="UTF-8";
  name="main.cc"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="main.cc"

/*
 * Copyright (C) 2010 Holger Hans Peter Freyther
 *
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY APPLE COMPUTER, INC. ``AS IS'' AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL APPLE COMPUTER, INC. OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <QApplication>
#include <QWebFrame>
#include <QWebElement>
#include <QWebPage>

class Worker : public QObject {
    Q_OBJECT
public:
    Worker()
        : m_currentPage(1)
    {
        m_page = new QWebPage(this);
        connect(m_page, SIGNAL(loadFinished(bool)), SLOT(loadFinished(bool)));
    }

    void start()
    {
        qWarning("Trying to download page %d from patchwork", m_currentPage);
        QUrl url("http://patchwork.openembedded.org/project/openembedded/list/?order=date&page=" + QByteArray::number(m_currentPage));
        m_page->mainFrame()->load(url);
    }

    void startNext()
    {
        ++m_currentPage;
        start();
    }

    void handleCurrentPatch(QWebElement patch)
    {
        QWebElement link = patch.findFirst("a");
        QList<QWebElement> table = patch.findAll("td").toList();
        QString date, author, state;

        if (table.size() == 5) {
            date = table[1].toPlainText();
            author = table[2].toPlainText();
            state = table[4].toPlainText();
        }

        qWarning("\tDate: %s Author: '%s' State: %s '%s'", qPrintable(date), qPrintable(author), qPrintable(state), qPrintable(link.toPlainText()));
    }

    // query for all patches..
    void handleCurrentPage()
    {
        QWebElementCollection patches = m_page->mainFrame()->findAllElements("tr[id*=patch_row]");
        foreach(QWebElement element, patches)
            handleCurrentPatch(element);
    }

public Q_SLOTS:
    void loadFinished(bool result)
    {
        // Verify that we got the page we wanted
        QWebElement currentPage = m_page->mainFrame()->findFirstElement("span[title='Current Page']");
        if (currentPage.isNull()) {
            qWarning("Failed to find the current page.");
            return QApplication::exit(-1);
        }
        int currentPageNo = currentPage.toPlainText().toInt();
        if (currentPageNo != m_currentPage) {
            qWarning("The end was reached.");
            return QApplication::exit(0);
        }

        qWarning("Finished the download of page %d with status: %d", m_currentPage, result);
        handleCurrentPage();

        startNext();
    }

private:
    QWebPage* m_page;
    int m_currentPage;
};

int main(int argc, char **argv)
{
    QApplication app(argc, argv);

    Worker worker;
    worker.start();
    app.exec();
}

#include "main.moc"

--Boundary-00=_sarWLFB0AT3MASW--
