Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.5526.1608703267527792126
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Dec 2020 22:01:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ow+BlkzI;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2so9764066pfq.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Dec 2020 22:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5OOfTL+Z+QSyS9WKEMaJ303l+L/OtmEhOaUdPeDs91o=;
        b=Ow+BlkzIfG8lljVJGTMBi20NkpzWJnwI2FU78Fl50muxOx/h4n0kp3vWNxginI2gje
         9VD9I0cJqVCnZ3IlClhmfMXwd62OlXMUZnHHXKpk89Fc7OhV+aMXGsSxaZ90M+knsHXL
         VcVSNbgqbLpvhyv3B2w9K/I//TJIx/JgEEIaOfg6FpA74QSameiTBr3Ui8CByGYPq2z8
         9I7vFZFDHOKTrt/83wyeKlWFaS58kjwJchg+VVvryDJKRrDB58ZgRyx53/eE406r6ZWi
         JrKJ0eVxGyVshXO85Bd6yNcxMc8ZSz20UJFiwt+rqXjTg5t+tL6CHQkF6e70lQq8aQb/
         qJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5OOfTL+Z+QSyS9WKEMaJ303l+L/OtmEhOaUdPeDs91o=;
        b=gO7erS3uY8cXIY+lCjtuFoRc2BC3+darbU6fbwTm8z+vwQxZ3/pT0rqmY+lDU1qBP+
         YTOrZDvlNFrha61qqpvx1enhF6wJsk1ttIY/F35ytkxQRmsnc/+o0/sEH0g/tjHBAlhk
         jh3P7aAdtd6QRj4XGGHDgbnkvcVqVJVWXbWCP4/xRMa9oirU7ae95od0vac+TTPFvzdc
         0YiCSkTk/+5kD/vKu12FYKUWASkGDnpHIP3NoHvoMKJrAr62+FjY1rJmmZH+w48+7otT
         crkcAeSMl53xAQmNkpImbyM4zj9BWTOXOVIlJvnYFntwjb+8RZuVKz4np4LHtKI8qH43
         gIRA==
X-Gm-Message-State: AOAM5316xonu9uxJjRHaau6GBKhRpGgTIAboDU2ijCLOnCzYgAvvaeEf
	oWLrxJ2jZ1Q8XZ1Dat8Pj6f4XNLzYHUamQ==
X-Google-Smtp-Source: ABdhPJxm/rTqGbymlAwPbmMhIQpPqCEQc5jgm1Txx/eZ9AJJjj0jzpmpmtuCC7yHR6/ta1WjZyHdYg==
X-Received: by 2002:a63:3049:: with SMTP id w70mr21018715pgw.224.1608703266780;
        Tue, 22 Dec 2020 22:01:06 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a8e7])
        by smtp.gmail.com with ESMTPSA id k11sm23325675pgt.83.2020.12.22.22.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 22:01:06 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] xrdp: Upgrade to 0.9.14
Date: Tue, 22 Dec 2020 22:01:02 -0800
Message-Id: <20201223060102.3211143-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201223060102.3211143-1-raj.khem@gmail.com>
References: <20201223060102.3211143-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop redundant setting of PV in recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../xrdp/{xrdp_0.9.11.bb => xrdp_0.9.14.bb}       | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-support/xrdp/{xrdp_0.9.11.bb => xrdp_0.9.14.bb} (94%)

diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.11.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.14.bb
similarity index 94%
rename from meta-oe/recipes-support/xrdp/xrdp_0.9.11.bb
rename to meta-oe/recipes-support/xrdp/xrdp_0.9.14.bb
index deda0fd1b5..0ab698b2eb 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.11.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.14.bb
@@ -10,15 +10,12 @@ DEPENDS = "openssl virtual/libx11 libxfixes libxrandr libpam nasm-native"
 
 REQUIRED_DISTRO_FEATURES = "x11 pam"
 
-SRC_URI = "git://github.com/neutrinolabs/xrdp.git \
+SRC_URI = "git://github.com/neutrinolabs/xrdp.git;branch=devel \
            file://xrdp.sysconfig \
            file://0001-Added-req_distinguished_name-in-etc-xrdp-openssl.con.patch \
            file://0001-Fix-the-compile-error.patch \
            "
-
-SRCREV = "1e4b03eb3c9aa7173de251a328c93c073dcc0fca"
-
-PV = "0.9.11"
+SRCREV = "1469d659dbccd6d042ac44f0afc4e1309788dc9d"
 
 S = "${WORKDIR}/git"
 
@@ -52,15 +49,15 @@ do_compile_prepend() {
 
 
 do_install_append() {
-	install -d ${D}${sysconfdir} 
+	install -d ${D}${sysconfdir}
 	install -d ${D}${sysconfdir}/xrdp
 	install -d ${D}${sysconfdir}/xrdp/pam.d
 	install -d ${D}${sysconfdir}/sysconfig/xrdp
-   
+
 	# deal with systemd unit files
 	install -d ${D}${systemd_unitdir}/system
 	install -m 0644 ${S}/instfiles/xrdp.service.in ${D}${systemd_unitdir}/system/xrdp.service
-	install -m 0644 ${S}/instfiles/xrdp-sesman.service.in ${D}${systemd_unitdir}/system/xrdp-sesman.service 
+	install -m 0644 ${S}/instfiles/xrdp-sesman.service.in ${D}${systemd_unitdir}/system/xrdp-sesman.service
 	sed -i -e 's,@localstatedir@,${localstatedir},g' ${D}${systemd_unitdir}/system/xrdp.service ${D}${systemd_unitdir}/system/xrdp-sesman.service
 	sed -i -e 's,@sysconfdir@,${sysconfdir},g' ${D}${systemd_unitdir}/system/xrdp.service ${D}${systemd_unitdir}/system/xrdp-sesman.service
 	sed -i -e 's,@sbindir@,${sbindir},g' ${D}${systemd_unitdir}/system/xrdp.service ${D}${systemd_unitdir}/system/xrdp-sesman.service
@@ -92,6 +89,6 @@ pkg_postinst_${PN}() {
 			-out ${sysconfdir}/xrdp/cert.pem \
 			-config ${sysconfdir}/xrdp/openssl.conf >/dev/null 2>&1
 			chmod 400 ${sysconfdir}/xrdp/key.pem
-		fi			
+		fi
         fi
 }
-- 
2.29.2

