Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id EE89F71633
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Nov 2015 10:15:03 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so8101371wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Nov 2015 02:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=sx5TssyWhpsdhcbg1LP3ZUpZBEQdfzyDnaNyW6KKnSQ=;
	b=fptHmwfbvixPuvyJE+IjIruTnnUpMN6PVgtiCO1MgINX0IoD5rjnamTyXXDN4vgpx/
	MfQZGF7krLS2k6Jv2hHMs2/Ai7Z3TJz5rNXMpaYNLH93a67fdGOpj6jG3zIRwsBRj+wf
	l0iGkjro+JHhGoiaclCS721awk1tVHFM6HDPzP5RMsdGBXfuRjI+/Q330mrnCEslq8Qm
	VRV8Ws1vARNJU9dpuDDUbNOa8wytKvt+CQPcQ2A6p02z+W0w6BBBmyyNQBvw1wDT2qBe
	K5gLlqPX8ERotXiOV8n810uChquB5WZevFFYDC8b/9uTchgcr/6bIpaSfDVzqPMYlvVk
	zymA==
X-Received: by 10.194.216.34 with SMTP id on2mr27179509wjc.109.1446545703336; 
	Tue, 03 Nov 2015 02:15:03 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	q1sm26723248wje.39.2015.11.03.02.15.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 03 Nov 2015 02:15:02 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <3F727BA6-C621-4D43-877C-2AF940A47CE0@gmail.com>
Date: Tue, 3 Nov 2015 11:15:01 +0100
To: OE-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: [meta-java][PATCH] cacao: fix configure error
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
X-List-Received-Date: Tue, 03 Nov 2015 10:15:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


This patch fixes the nowadays occuring configure error:
  rm: cannot remove 'src/mm/boehm-gc/ltmain.sh': No such file or =
directory

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 recipes-core/cacao/cacao_1.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/cacao/cacao_1.6.1.bb =
b/recipes-core/cacao/cacao_1.6.1.bb
index f88293b..8e212af 100644
--- a/recipes-core/cacao/cacao_1.6.1.bb
+++ b/recipes-core/cacao/cacao_1.6.1.bb
@@ -54,7 +54,7 @@ EXTRA_OECONF =3D "\
 do_configure_prepend () {
     # upgrade m4 macros in source tree
     libtoolize --force --copy --install
-    rm  src/mm/boehm-gc/ltmain.sh
+    rm  -f src/mm/boehm-gc/ltmain.sh
     mkdir -p src/mm/boehm-gc/m4
 }
=20
--=20
1.9.1

--=20
Jens Rehsack - rehsack@gmail.com


