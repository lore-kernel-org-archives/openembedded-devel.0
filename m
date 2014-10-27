Return-Path: <anders@chargestorm.se>
Received: from stoexhubfe01.domain01.net (STOEXHUBFE01.domain01.net
	[83.145.59.140])
	by mail.openembedded.org (Postfix) with ESMTP id D794670F06
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Oct 2014 11:32:13 +0000 (UTC)
Received: from localhost (83.252.255.124) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.279.1; Mon, 27 Oct 2014
	12:32:11 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 27 Oct 2014 12:31:31 +0100
Message-ID: <cover.1414409458.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [meta-qt5][PATCH 0/1] Add OE_QMAKE_INCDIR_QT
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
X-List-Received-Date: Mon, 27 Oct 2014 11:32:20 -0000
Content-Type: text/plain

This adds OE_QMAKE_INCDIR_QT to the variables in qmake5_base.bbclass.

Qt4 in oe-core exports this variables, both in their qt4 bbclasses as well
as in their SDK. As a result, recipes like e.g. qextserialport [1] in meta-oe, 
uses OE_QMAKE_INCDIR_QT in the generated extserialport.prf file, in order 
allow both bitbake build recipes and applications build using the SDK, 
find the header filer of qextserialport.

In Qt5, OE_QMAKE_INCDIR_QT is not set when building using bitbake, however, 
that variable is still set in the environment file for the generated SDK.

Thus, to make the use case in e.g. [1] work also for Qt5, we'll add this 
variable to qmake5_base.bbclass. This will sync up the two use-cases.

[1] http://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-qt/qextserialport/qextserialport_1.2rc.bb

The following changes since commit 9a4c0b393bf031acace5c2cc00d625a24c639d1c:

  maliit-framework-qt5: Update SRCREV (2014-10-21 15:33:05 +0200)

are available in the git repository at:

  git://github.com/darander/meta-qt5 9a0b3d2f7e1ac7e854430fe1e93271c71f574083
  https://github.com/darander/meta-qt5/tree/qtsdk

Anders Darander (1):
  qmake5: set OE_QMAKE_INCDIR_QT

 classes/qmake5_base.bbclass | 1 +
 1 file changed, 1 insertion(+)

-- 
2.1.1


