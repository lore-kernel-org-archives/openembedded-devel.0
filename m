Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.47583.1598851865722201667
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Aug 2020 22:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q0BILf4a;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d22so3933150pfn.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Aug 2020 22:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sopWEdNzdkH5wVRAmqS1iTtMs0VbQU+ENdJD5lAfiBY=;
        b=q0BILf4ayN3O+tgD7LogrqTi148nkFk4L6F+TN7Brdq/2evEfT6Xt/Bx5mY4osJb9Y
         bcEvwBP4M2CeZWMWLXKrSlTx3fOz6EOzv7MQbRY0c3xMFvECV0/ReZEiycIAyfzARcoF
         fg50uReCttkIDXNkIePmmnsZO92jGzR7R8AhzNKUlMD/mV9MBFSn3W3UrSulxgTCWjcx
         b8W/lrSCq3r2fZ5yEg5D4hBcqLWPgqPz9qTccKlCCRCEsL0CvWjDzbpv/aB50ppXvNA1
         USrH4Fd6IyxqAMYpHZYCOYmZE3eo6kMFTzpS6ouVl9Kp7D78qvG92SFb8l+uADHNWF7q
         tV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sopWEdNzdkH5wVRAmqS1iTtMs0VbQU+ENdJD5lAfiBY=;
        b=fE1ZLTEzZGapnSNjR9HfUB/RiEA7Go1oR7qxe2/0K/pvZphxLbVGSK5Gf7SFq4xc0E
         AlkeDhMWX2OV7yWJ5q8jOZkFO4moPP32zxoZtkH2c315mCqEMCQ8K/u9k7brH5kDw31N
         fPgmGw79vauzRxAit8J5fkRy+4reMIwW57n+CuLl/G/i4Gh0GMl0tsl3ZBpugUgpevNb
         d7nSWLowT/llMFeBRfSeLTtwtqndEfYpEz/bvoWVXSMPqReFtdt+qhgf8ji9ZWkH8BZY
         emecF44B5R82p32mlBeAhM2QxtEVuYrt1AZ6E5nQKo/0lTAX9sXGUM74KrmiUoosUPNU
         dPwg==
X-Gm-Message-State: AOAM533mPBhpIn2JsuYjzTkKjdCAVSC9il/K+RhgjzsoaCuRBs/Yd1zh
	xysX9Z7ogQE47hVw+kI3q/0df03jXLSuVw==
X-Google-Smtp-Source: ABdhPJxvtya/YM1DIiAByWCgEB/vr0TAv7n28wcfwLCgGqePbUWgSMUeohgHz+l1p7KuJCEtWOZhfw==
X-Received: by 2002:a63:fc4b:: with SMTP id r11mr34988pgk.342.1598851865008;
        Sun, 30 Aug 2020 22:31:05 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id y9sm1568350pfn.85.2020.08.30.22.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 22:31:04 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/8] mime-support: Use update-alternatives
Date: Sun, 30 Aug 2020 22:30:51 -0700
Message-Id: <20200831053057.1541321-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200831053057.1541321-1-raj.khem@gmail.com>
References: <20200831053057.1541321-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mime.types is also provided by mailcap so use update-alternatives to
install is policy when both are added into image

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/mailcap/mailcap_2.1.49.bb         | 5 +++++
 meta-oe/recipes-support/mime-support/mime-support_3.48.bb | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/meta-oe/recipes-support/mailcap/mailcap_2.1.49.bb b/meta-oe/recipes-support/mailcap/mailcap_2.1.49.bb
index ff3047f325..537c458747 100644
--- a/meta-oe/recipes-support/mailcap/mailcap_2.1.49.bb
+++ b/meta-oe/recipes-support/mailcap/mailcap_2.1.49.bb
@@ -21,6 +21,11 @@ SRC_URI = "https://releases.pagure.org/${BPN}/${BP}.tar.xz"
 SRC_URI[md5sum] = "d5701a1a541383c0eda328f4a6518751"
 SRC_URI[sha256sum] = "f7381516bc1a937348efd1d0e14618e0a2afc5d59fe821dd248632d5601b59b5"
 
+inherit update-alternatives
+
 do_install() {
     oe_runmake install DESTDIR=${D} sysconfdir=${sysconfdir} mandir=${mandir}
 }
+
+ALTERNATIVE_${PN} = "mime.types"
+ALTERNATIVE_LINK_NAME[mime.types] = "${sysconfdir}/mime.types"
diff --git a/meta-oe/recipes-support/mime-support/mime-support_3.48.bb b/meta-oe/recipes-support/mime-support/mime-support_3.48.bb
index d617b6620c..1137f5012a 100644
--- a/meta-oe/recipes-support/mime-support/mime-support_3.48.bb
+++ b/meta-oe/recipes-support/mime-support/mime-support_3.48.bb
@@ -10,6 +10,8 @@ RRECOMMENDS_${PN} = "file"
 SRC_URI = "${DEBIAN_MIRROR}/main/m/mime-support/mime-support_${PV}-1.tar.gz"
 S = "${WORKDIR}/${BPN}"
 
+inherit update-alternatives
+
 FILES_${PN} += " ${libdir}/mime"
 
 docdir_append = "/${BPN}"
@@ -56,3 +58,7 @@ do_install () {
 
 SRC_URI[md5sum] = "d6e5d715e331147352c50c158dbdec6d"
 SRC_URI[sha256sum] = "a529c7892cb786f514af71f4ca5a4c3ebc58b538a49ff959c0d97592d38f040a"
+
+ALTERNATIVE_PRIORITY = "90"
+ALTERNATIVE_${PN} = "mime.types"
+ALTERNATIVE_LINK_NAME[mime.types] = "${sysconfdir}/mime.types"
-- 
2.28.0

