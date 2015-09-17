Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5E4AB76DF8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 00:41:55 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so96410055wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 17:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=YzJz/2fdRc75uwguP0UhoIJwYEFi3/pSk1C3X0u+FWU=;
	b=tHie7KLBlzJwcPdEYAvUNieTdgk04FvGM/GdVkZondOcP6Mr3x1HN9m7cXUM6mgC9E
	JWTxSuVSDYcxYzXPVEoKNUZJ6NP2S6pmCbB8sXclOFGhRCernl59lcJ+kbQ6mRIkEmpN
	77VH2P4snjkeYr2EHuCjJoPadZgMjtYO6NAOnSt2KimYrAv9ymlFdSt5IycXI4uhi2fp
	3HzmUdLouPa2sFi4wharUyjNFY6J54FsrMVyBywuPeu8+p5VegZCFB2bIpnkYSV8h+kt
	J0swj5Ok2n4hDm+2CBfJfuiC9bSSzHy6Z1CE6FNjKkCAKFb7rTcMf+/5shfJC+KjIlfr
	MaPw==
X-Received: by 10.194.77.4 with SMTP id o4mr28790737wjw.4.1442450515413;
	Wed, 16 Sep 2015 17:41:55 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0F55.dip0.t-ipconnect.de.
	[79.223.15.85]) by smtp.googlemail.com with ESMTPSA id
	sd14sm393216wjb.36.2015.09.16.17.41.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Sep 2015 17:41:54 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Sep 2015 02:41:26 +0200
Message-Id: <1442450491-14912-15-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
References: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 14/19] gimp: fix compile in latest environment
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
X-List-Received-Date: Thu, 17 Sep 2015 00:41:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fixes:
ld: error: file_ico-ico-load.o: requires unsupported dynamic reloc R_ARM_THM_MOVW_ABS_NC; recompile with -fPIC
ld: error: file_ico-ico-save.o: requires unsupported dynamic reloc R_ARM_THM_MOVW_ABS_NC; recompile with -fPIC

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb b/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb
index efeb575..b897816 100644
--- a/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb
+++ b/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb
@@ -25,5 +25,7 @@ do_configure_append() {
     find ${B} -name Makefile | xargs sed -i s:'-I/usr/include':'-I${STAGING_INCDIR}':g
 }
 
+CFLAGS += "-fPIC"
+
 FILES_${PN}-dbg += "${libdir}/gimp/2.0/*/.debug"
 FILES_${PN}  += "${datadir}/appdata"
-- 
2.1.0


