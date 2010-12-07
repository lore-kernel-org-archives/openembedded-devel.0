Received: from mail-gx0-f179.google.com ([209.85.161.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matthewbot@gmail.com>) id 1PQ3ck-0003vr-Uc
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Dec 2010 20:54:55 +0100
Received: by gxk21 with SMTP id 21so267044gxk.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Dec 2010 11:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=FDpOPAJSzDZHEbQhVIlg7OmkpFasKRu/uuOwCiEL/Nk=;
	b=QnvqGOnf/4xov67V4RzoiT8b5H/nUif1XhNCtEXNeEVZ78TfjfZLAIg/QdmRZWNCXj
	Vs3VmwTfS1WLtfoGxIe8hLOpmaK68S+Wl6xl1LFdkxcnJCqZTfelmjtek+QkSEo/3SSi
	UsFCM6BwBlhFQeIlIDQe3VO9ntqQL5prKLrXo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=V4AGb0s4gwfeCwpK2fdnaHctEbieoUJERxHlipMJ0lgDgMseupXgDXm1xlyTEfT48W
	/JWpyAlEX30xBOBOcJ/ogLxPPBbAd4YVznU/SlqMZGWz5A178st86/Kw/od48a82OvoV
	zZhUORYBLUxLbCwiHV88Au9MGylqEJENLoRVI=
Received: by 10.151.78.11 with SMTP id f11mr2498162ybl.305.1291751603964;
	Tue, 07 Dec 2010 11:53:23 -0800 (PST)
Received: from localhost.localdomain (n128-227-87-212.xlate.ufl.edu
	[128.227.87.212])
	by mx.google.com with ESMTPS id p1sm4211041ybn.17.2010.12.07.11.53.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 07 Dec 2010 11:53:23 -0800 (PST)
From: Matt Thompson <matthewbot@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Dec 2010 14:52:20 -0500
Message-Id: <1291751540-2372-1-git-send-email-matthewbot@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.161.179
X-SA-Exim-Mail-From: matthewbot@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCHv2] wxwidgets: added libxinerama to DEPENDS
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
X-List-Received-Date: Tue, 07 Dec 2010 19:54:56 -0000

| ./src/unix/displayx11.cpp:49:41: error: X11/extensions/Xinerama.h: No such file or directory
| ./src/unix/displayx11.cpp:72: warning: ISO C++ forbids declaration of 'type name' with no type
| ./src/unix/displayx11.cpp:72: error: 'operator const int' does not name a type
| ./src/unix/displayx11.cpp:77: warning: ISO C++ forbids declaration of 'XineramaScreenInfo' with no type
| ./src/unix/displayx11.cpp:77: error: expected ';' before '*' token

Signed-off-by: Matt Thompson <matthewbot@gmail.com>
---
 recipes/wxwidgets/wxwidgets.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/wxwidgets/wxwidgets.inc b/recipes/wxwidgets/wxwidgets.inc
index 2fb2bef..4c4f77f 100644
--- a/recipes/wxwidgets/wxwidgets.inc
+++ b/recipes/wxwidgets/wxwidgets.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "wxWidgets is a cross platform application framework utilizing nat
 HOMEPAGE = "http://www.wxwidgets.org"
 SECTION = "x11/libs"
 LICENSE = "wxWindows"
-DEPENDS = "gtk+ jpeg tiff libpng zlib expat"
+DEPENDS = "gtk+ jpeg tiff libpng zlib expat libxinerama"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/wxwindows/wxWidgets-${PV}.tar.bz2"
 
-- 
1.7.1



