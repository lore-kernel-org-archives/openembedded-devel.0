Return-Path: <anders@chargestorm.se>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id DCDDE607A4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2015 13:37:16 +0000 (UTC)
Received: by lbbck17 with SMTP id ck17so20393408lbb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2015 06:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Wrj03qCOZkJ8Om9sz7ZXHZg0x3Rqkl/Q9KD4S5vmu4U=;
	b=ld5osYK+zzQCLn0G2KXVib9ud3i43+U+k+d3hzgGXL7AV1AEJasK3fuzTpx7vCjgmo
	xKHd4U61aDxerVb51zpyOaGHD/0iMrVPrnc/aOhcA77dp6CWqWJ+cwy4OJzRHnc7S5ip
	cR2Hu+U/xifVeaJ8pLGpWsugVtpmXLRFZlx76p1MciqDxXxayvcKhEkTxR0ogfrxu4HF
	jRKHIhcNGhmV1eN0zEEgyOW9uE3NmLlwbxWKyMZssr1bs2mOknSLF3S6LWlIGBdv79v1
	a++q/ZcX4Bjuj21Yfbk8SbANRvLzlwBxH8uXfay5adCjTxoiIdYW1Wudv4xVhPS26j3N
	SaHg==
X-Gm-Message-State: ALoCoQnGp7EtCl43RzphXDpjUOOgc8xGJ31qrQJQdNo2Amkz+ucF2SkJuh+ugYVgEshZKA3KRwyf
X-Received: by 10.112.146.231 with SMTP id tf7mr6025333lbb.103.1444743436384; 
	Tue, 13 Oct 2015 06:37:16 -0700 (PDT)
Received: from localhost (h83-209-191-235.dynamic.se.alltele.net.
	[83.209.191.235])
	by smtp.gmail.com with ESMTPSA id q1sm535458lbb.5.2015.10.13.06.37.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Oct 2015 06:37:15 -0700 (PDT)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Oct 2015 15:37:13 +0200
Message-Id: <47f04c557e86a0c4dc5c115559a74000799d5ba9.1444743350.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <cover.1444743350.git.anders@chargestorm.se>
References: <cover.1444743350.git.anders@chargestorm.se>
Cc: Anders Darander <anders@chargestorm.se>
Subject: [meta-webserver][PATCH 1/1] webmin: fix QA host-user-contaminated
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
X-List-Received-Date: Tue, 13 Oct 2015 13:37:17 -0000

Due to the way most files were installed, using cp ..., during packaging we got spammed
with messages like:

WARNING: QA Issue: webmin: /webmin-module-fail2ban/usr/lib/webmin/webmin/fail2ban/lang/no is owned by gid 100, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
WARNING: QA Issue: webmin: /webmin-module-system-status/usr/lib/webmin/webmin/system-status/lang/no is owned by gid 100, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]

Do the install in a similar way as is done in bin_package.bbclass.
By doing that, we're not getting any QA-errors from host-user-contaminated.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta-webserver/recipes-webadmin/webmin/webmin_1.750.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_1.750.bb b/meta-webserver/recipes-webadmin/webmin/webmin_1.750.bb
index b6fbb0a..ca09ecf 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_1.750.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_1.750.bb
@@ -80,7 +80,10 @@ do_install() {
     install -d ${D}${localstatedir}/webmin
 
     install -d ${D}${libexecdir}/webmin
-    cp -pPR ${S}/* ${D}${libexecdir}/webmin
+    cd ${S} || exit 1
+    tar --no-same-owner --exclude='./patches' --exclude='./.pc' -cpf - . \
+        | tar --no-same-owner -xpf - -C ${D}${libexecdir}/webmin
+
     rm -f ${D}${libexecdir}/webmin/webmin-init
     rm -f ${D}${libexecdir}/webmin/ajaxterm/ajaxterm/configure.initd.gentoo
     rm -rf ${D}${libexecdir}/webmin/patches
-- 
2.6.1


