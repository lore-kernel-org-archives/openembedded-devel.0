Return-Path: <anders@chargestorm.se>
Received: from stoexhub03.domain01.net (STOEXHUB03.domain01.net
	[83.145.59.144])
	by mail.openembedded.org (Postfix) with ESMTP id 30DEC60DD7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Oct 2014 09:07:59 +0000 (UTC)
Received: from localhost (217.6.91.17) by stoexhub03.domain01.net (10.12.10.3)
	with Microsoft SMTP Server id 8.3.279.1;
	Thu, 16 Oct 2014 11:07:56 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Oct 2014 11:07:20 +0200
Message-ID: <cover.1413449871.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [meta-qt5][PATCH 0/1] Enable nativesdk-qtbase to keep additional libraries
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
X-List-Received-Date: Thu, 16 Oct 2014 09:08:03 -0000
Content-Type: text/plain

We have a usecase where we need to run a tool to transform a protocol spec. to cpp (kdwsdl2cpp). That tool is built using Qt5, and requires a couple of extra Qt-libraries, among the libQt5Xml.so.*. Today the nativesdk-qtbase recipe just unconditionally removes every library, except for a couple hardcoded ones.

This patch add an extra variable, in which you can specify additional libraries to keep.

The following changes since commit 478fe949a957471a4d20450f6e9375fe1d628591:

  qtbase: don't stage the fonts directory (2014-10-08 17:52:08 +0200)

are available in the git repository at:

  git://github.com/darander/meta-qt5 nativesdk-qtbase
  https://github.com/darander/meta-qt5/tree/nativesdk-qtbase

Anders Darander (1):
  nativesdk-qtbase: make it possible to keep additional libraries

 recipes-qt/qt5/nativesdk-qtbase.inc | 11 +++++++++++
 1 file changed, 11 insertions(+)

-- 
1.8.4.5


