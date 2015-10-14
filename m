Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id D2A9D76E3F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 18:50:53 +0000 (UTC)
Received: by wijq8 with SMTP id q8so95343709wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 11:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=EwY+Ucpo06hJ2wWWopweqWvqWq6Pl+flwfpmhgMCrMQ=;
	b=Yb1jfAtdlmph5rzAxTF4oFTJpcvGHmfER7gkeA8TJC69kXouXJLNWvpVMNSdo8YKlf
	bPCZ61e+QINuG7oJJ6Ml3J5hWCalhtHHZH+3rAVHQEQ5MDFLvHem63n9tdR/DwT3iqHX
	tJavZ1NWB/DC7e+/QSp+ZLCTRMPGFmZTGgt4f9R/v83Ihr06CKpjNRLXNulQ0mq8n5JK
	M+vhKSgP+qj/BGOqUGQ4ZwU/oB3jD2UbTQS7pFlcPcd0fkJD5gaxKkZhIoRJAtYbMdVc
	u/e6U3yNAf5Hvy3keCRJXbyy9JfYyDh95CpcCn/AMgOzvkrQmSs4Xs5QlNsExCA5jnPs
	rztQ==
X-Received: by 10.194.172.1 with SMTP id ay1mr5870012wjc.101.1444848653279;
	Wed, 14 Oct 2015 11:50:53 -0700 (PDT)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id h8sm8219673wib.21.2015.10.14.11.50.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Oct 2015 11:50:52 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <9127B69A-79B9-4A6D-A76C-5E01509977DF@gmail.com>
Date: Wed, 14 Oct 2015 20:50:51 +0200
To: OE-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: [meta-webserver][PATCH 3/6] nginx: fix broken proxy_pass feature
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
X-List-Received-Date: Wed, 14 Oct 2015 18:50:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

[NGINX ticket #748 - https://trac.nginx.org/nginx/ticket/748]

Accoriding to #748 or =
https://github.com/archlinuxarm/PKGBUILDs/issues/1161,
respectively, proxy_pass is broken on some architectures without =
position
independent code.

The solution is adding -fPIE -pie as build flags.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.4.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.4.4.bb =
b/meta-webserver/recipes-httpd/nginx/nginx_1.4.4.bb
index 0dfdb5b..27e4749 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.4.4.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.4.4.bb
@@ -24,6 +24,9 @@ SRC_URI[sha256sum] =3D =
"7c989a58e5408c9593da0bebcd0e4ffc3d892d1316ba5042ddb0be5b0b
=20
 inherit update-rc.d useradd
=20
+CFLAGS_append =3D " -fPIE -pie"
+CXXFLAGS_append =3D " -fPIE -pie"
+
 do_configure () {
 	if [ "${SITEINFO_BITS}" =3D "64" ]; then
 		PTRSIZE=3D8
--=20
1.9.1

--=20
Jens Rehsack - rehsack@gmail.com


