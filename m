Return-Path: <anders@chargestorm.se>
Received: from STOEXHUB02.domain01.net (STOEXHUB02.domain01.net
	[83.145.59.143])
	by mail.openembedded.org (Postfix) with ESMTP id 5D7716AC20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2014 06:32:38 +0000 (UTC)
Received: from localhost (81.232.163.241) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server id 8.3.279.1; Mon, 20 Oct 2014
	08:32:35 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 20 Oct 2014 08:32:02 +0200
Message-ID: <cover.1413786629.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [meta-qt5][PATCH v2 0/1] Enable nativesdk-qtbase to keep additional libraries
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
X-List-Received-Date: Mon, 20 Oct 2014 06:32:45 -0000
Content-Type: text/plain

We have a usecase where we need to run a tool to transform a protocol spec. to cpp (kdwsdl2cpp). That tool is built using Qt5, and requires a couple of extra Qt-libraries, among the libQt5Xml.so.*. Today the nativesdk-qtbase recipe just unconditionally removes every library, except for a couple hardcoded ones.

This patch add an extra variable, in which you can specify additional libraries to keep.

Changes:
	v2: 
	 	* Fix spelling mistake in a comment (net -> not)

The following changes since commit 2f1b8fe630ac76c8ff5d184f109449b10fde5a92:

  Fix SDK environment setting (2014-10-16 17:35:21 -0300)

are available in the git repository at:

  git://github.com/darander/meta-qt5 a29d8e60f63d6545ed84d6b72caf46bc0d1e7b78
  https://github.com/darander/meta-qt5/tree/nativesdk-qtbase

Anders Darander (1):
  nativesdk-qtbase: make it possible to keep additional libraries

 recipes-qt/qt5/nativesdk-qtbase.inc | 11 +++++++++++
 1 file changed, 11 insertions(+)

-- 
2.1.1


