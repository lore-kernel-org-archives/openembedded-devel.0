Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1FB09766B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 21:22:49 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so89039980wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 13:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:cc:to:mime-version;
	bh=fJ3N9FuJ5sCtHvqZf1SEkabP57JAsCrc/cRXIkq8FlE=;
	b=pHIu5I18X1pEqmdBIhLtlCxp3mmJpN7vCzh7Tpd3Tw0K2f+dggEG9jkymYkRXsobLb
	mRZQGEkguXosHqi+Iv6569O851BWAurg4i3/3945elRxB1uw36JPsCFSCQysEh29tT7j
	ew9P4DvE4qxnysty/RbX9f8hKIYfUqCuiqDE0fh9S+hBgIQ7IKJTRRZF1zbadO+QGHIF
	1gmu9pKGUvY1tQoyapkyR7V8JzkjdVl5DybVRy7wUji5v/Ew5ewk3bmogOgzKxgqILpC
	IKeNIhMbjEyWNhtnroAMVCG8g/m0NRJK7+4dwz2KjTrmajl7+2OctgfE5iHaAIi4xrdt
	mGxw==
X-Received: by 10.28.218.72 with SMTP id r69mr7320040wmg.98.1447190569417;
	Tue, 10 Nov 2015 13:22:49 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id v9sm5526291wjv.45.2015.11.10.13.22.48
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 10 Nov 2015 13:22:48 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
Date: Tue, 10 Nov 2015 22:22:48 +0100
Message-Id: <7B0F2A2C-8C94-459C-AC98-108DB0CDDE95@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Cc: =?utf-8?Q?Volker_M=C3=B6sker?= <volker.moesker@rademacher.de>,
	Tobias Theophile <Tobias.Theophile@rademacher.de>
Subject: [meta-oe][PATCH 2/3] waf-samba: enable parallel builds
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
X-List-Received-Date: Tue, 10 Nov 2015 21:22:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Instead of relying on sequencial waf build invoked by make,
invoke waf as documented with default switch for building in
parallel.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta-oe/classes/waf-samba.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/classes/waf-samba.bbclass =
b/meta-oe/classes/waf-samba.bbclass
index b5b85e6..a8b3b95 100644
--- a/meta-oe/classes/waf-samba.bbclass
+++ b/meta-oe/classes/waf-samba.bbclass
@@ -45,6 +45,10 @@ do_configure() {
     ./configure ${CONFIGUREOPTS} ${EXTRA_OECONF} --cross-compile =
--cross-execute=3D"${CROSS_EXEC}"
 }
=20
+do_compile () {
+    python ./buildtools/bin/waf ${PARALLEL_MAKE}
+}
+
 do_install() {
     oe_runmake install DESTDIR=3D${D}
 }
--=20
1.9.1

--=20
Jens Rehsack - rehsack@gmail.com


