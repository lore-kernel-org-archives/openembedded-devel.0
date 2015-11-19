Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id F3EB26057A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 19:43:45 +0000 (UTC)
Received: by wmww144 with SMTP id w144so252406065wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 11:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=fJ3N9FuJ5sCtHvqZf1SEkabP57JAsCrc/cRXIkq8FlE=;
	b=U5ScRUGoWHCulbVxwJS1YW29FqY+lLWK4SkL4EmPCS1nVVI/EyhxsOjwq1yPI4Q59b
	2tvxJWo2tlLGxHACCLTneovcY1DO3NssvBc7nWUC4C7fJ/9zYnIT6f6p9PEn7JAWc8R2
	RLOaG8pjX8i8mLU0Dm2vH2KU8JfUr700Fg/iXE/ZlG/KQXwFmuzi9o5G20Or5N0l3143
	LTFv5nITFkiOnmIelWTz/SH+cQOKVSz/UXf9hQYH+iUDeRNcKsyxEEPv/Ys/6pndfdBz
	AtWMZBRy6bqgjT0LsIndOh+f/lEjLzRvy3DC2xzfPh2VR96A/L9pDv6hwUfkV0UBW16E
	a5PA==
X-Received: by 10.28.170.19 with SMTP id t19mr11905415wme.65.1447962226006;
	Thu, 19 Nov 2015 11:43:46 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	d66sm35625971wma.21.2015.11.19.11.43.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Nov 2015 11:43:45 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <9A09B0E4-A746-48EA-9141-04BEFFBA8F15@gmail.com>
Date: Thu, 19 Nov 2015 20:43:44 +0100
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: [meta-oe][PATCH 1/6] waf-samba: enable parallel builds
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Nov 2015 19:43:46 -0000
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


