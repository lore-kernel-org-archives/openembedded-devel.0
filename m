Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 09C8177115
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 23:44:33 +0000 (UTC)
Received: by wmnn186 with SMTP id n186so243388wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 15:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=/iFdVPifoa9v5/KbIDrw+zX8lSY6Ju7vi4khD4dKPoU=;
	b=V6dQTBTybaLvjAT4uy6n9s0hGP+g3AP4/ziIuRfDfHtQCegqhUk5vashwQt02hCuJ0
	ORdV5OUwkQszzkUInz3GaDJNvyXl2kU2MhsU5f3CGTkxyJQ63iy/LHdwpOhSUAbpRORf
	o2bgRqjzpngA9sRpkTt42rOnJbumTlORHIOqOpSPjztv7zTxkhXXHYd7Jcqs+Rq+JasU
	BpoD8Y51XGXJhGrF/J2f7z/PBbQaYG0xV0iVhakzr5rnY6WamCSfp0WhuFOQhoaZC7MK
	5n1qnsFYvbJwNePuN9PoBJlXEU16rPfEsNkln7oD3vgb/cbnjoSD46RyGV6tCPBb6PJr
	3u0w==
X-Received: by 10.28.18.11 with SMTP id 11mr27921773wms.68.1446680673502;
	Wed, 04 Nov 2015 15:44:33 -0800 (PST)
Received: from localhost.localdomain (p5B0A127D.dip0.t-ipconnect.de.
	[91.10.18.125]) by smtp.googlemail.com with ESMTPSA id
	184sm5390014wmk.10.2015.11.04.15.44.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Nov 2015 15:44:33 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Nov 2015 00:43:59 +0100
Message-Id: <1446680640-31722-18-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1446680640-31722-1-git-send-email-schnitzeltony@googlemail.com>
References: <1446680640-31722-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 17/18] samba: add cups to DEPENDS
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
X-List-Received-Date: Wed, 04 Nov 2015 23:44:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

| /home/superandy/tmp/oe-core-glibc/sysroots/x86_64-linux/usr/libexec/arm-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/5.2.0/ld: error: cannot find -lcups
| collect2: error: ld returned 1 exit status

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-connectivity/samba/samba_4.1.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb b/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb
index 22c2bb4..03b4f75 100644
--- a/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb
+++ b/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb
@@ -40,7 +40,7 @@ SRC_URI[sha256sum] = "033604674936bf5c77d7df299b0626052b84a41505a6a6afe902f6274f
 
 inherit systemd waf-samba
 
-DEPENDS += "readline virtual/libiconv zlib popt talloc libtdb libtevent libldb krb5 ctdb"
+DEPENDS += "readline virtual/libiconv zlib popt talloc libtdb libtevent libldb krb5 ctdb cups"
 RDEPENDS_${PN} += "openldap"
 
 PACKAGECONFIG = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
-- 
2.1.0


