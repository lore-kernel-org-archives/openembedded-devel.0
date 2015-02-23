Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (down.free-electrons.com
	[37.187.137.238])
	by mail.openembedded.org (Postfix) with ESMTP id 1D379706B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Feb 2015 12:51:58 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id 156A74B7; Mon, 23 Feb 2015 13:52:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (smb-alys-01.wifihubtelecom.net [94.199.127.57])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 5C9C876
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Feb 2015 13:52:02 +0100 (CET)
Date: Mon, 23 Feb 2015 13:51:54 +0100
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150223125154.GA3630@piout.net>
References: <1424293077-4542-1-git-send-email-alexandre.belloni@free-electrons.com>
	<CAP9ODKpDUaOjV=qMHzDUgZ4aiCgV2iPs0rWYzSGFTdQ1Jj1gOA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpDUaOjV=qMHzDUgZ4aiCgV2iPs0rWYzSGFTdQ1Jj1gOA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][dizzy][PATCH] qmake5: don't always look in directories recursively
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Feb 2015 12:52:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

(I was not in copy of your reply)

On 19/02/2015 at 17:07:43 -0200, Otavio Salvador wrote :
> > diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
> > index bb0bcdcac0af..22f0d30e0298 100644
> > --- a/recipes-qt/qt5/qt5.inc
> > +++ b/recipes-qt/qt5/qt5.inc
> > @@ -18,6 +18,8 @@ OE_QMAKE_PATH_SETTINGS = "${OE_QMAKE_PATH_QT_SETTINGS}"
> >  OE_QMAKE_PATH_EXAMPLES = "${OE_QMAKE_PATH_QT_EXAMPLES}"
> >  OE_QMAKE_PATH_TESTS = "${OE_QMAKE_PATH_QT_TESTS}"
> >
> > +OE_QMAKE_RECURSIVE = ""
> 
> Shouldn't this to be done for qtbase only?

No, this has to be done for all the qt packages. The packages exhibiting
the problem are qtdeclarative and qt3d.
That fix is coming from a discussion I had with people from the QT
Company.

Actually, I think -r shouldn't be the default but let's not break
current users of the qmake5 class.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

