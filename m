Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web12.8341.1598999787544578331
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2020 15:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=N7x1K4tK;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id n3so1238063pjq.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2020 15:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FqNea7nvthnkwQ9k/pFY56qRF0WQpwQ1uFbPmJr8csg=;
        b=N7x1K4tKm7e1LmpGMbhiC+HGcMvPFfYyrKxQwJ9yeF4LMXTA3lrBVdnfum4dwA+hY0
         7sHioxDmx8wcL97oAOVet1eotR6TmrQVKc/nvEQklxZUdHIWDgK5aIm7+ehWnXllxM0A
         1zQlEkD1kOB6Kpthor8TaEfTuAvYWnDuWt0Apd2NIUb1BFeY16TXI+PEsuQJekwFDCFW
         4oFAlY6pPz+sBucKYjLDmhrpwZzgY/BPI9uU5OKcwaeEdYXcUV7L0z1ZlhCdoBuJxvGr
         kcav4IvM239I6BhWapnPG0WUX7FJijo03HBqArkbODDo/7SWiUhroZt+gU4iDTUnj5HH
         7x6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FqNea7nvthnkwQ9k/pFY56qRF0WQpwQ1uFbPmJr8csg=;
        b=orsO7kB9kFIYyxp1Qa5GxT0YgGdiRvmTMVjHGA67PAc8+LORIljAohGNueCGVeL3kX
         sQDNHq06LC8xRlR+XHZTwNYfMkUsVL93fjSnebN9Buwqx4wdC6ouh+2Eh7uQwA1ZWyPw
         sO91o5zzU5827FgwMKX7hx+tqttkiFiLtPzZierhU5raMBPhmBkb6DrNlwBrPYEhiUlv
         g1essjT2Ze524RalCP6D1WPt9u2PR4FE4VgFO5fN0zg1Sizbv81F3xOTyfs21PbziOIR
         Dya+TX6F8AYrNvyVexHxYPkeskC4JiRoaJEN1KQNFo2lRZachlaAYOX4J660VeKpshva
         xOfA==
X-Gm-Message-State: AOAM532iibswxtqa5QrCobeDVtPvp25wWdIRjekIWRinqH0mgjSn4w0l
	J0PuIQfsfy001A6nh4IiA+ZkwMwH3bVZ0w==
X-Google-Smtp-Source: ABdhPJyaa7Wjm5H58sOwfqBtC5B9J8j2DEgQpfNA32GfzPSVPaQIvLT82qvegmz9bhPIpm55IumRDA==
X-Received: by 2002:a17:902:a58c:: with SMTP id az12mr3372529plb.109.1598999782458;
        Tue, 01 Sep 2020 15:36:22 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id q34sm3157964pgl.28.2020.09.01.15.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 15:36:21 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 07/10] ssmtp: Use update alternatives for conflicts with esmtp
Date: Tue,  1 Sep 2020 15:36:09 -0700
Message-Id: <20200901223612.1386026-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200901223612.1386026-1-raj.khem@gmail.com>
References: <20200901223612.1386026-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/ssmtp/ssmtp_2.64.bb           | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb b/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb
index 07e3ffed42..3739c496a5 100644
--- a/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb
+++ b/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb
@@ -12,7 +12,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/s/${BPN}/${BPN}_${PV}.orig.tar.bz2 \
 SRC_URI[md5sum] = "65b4e0df4934a6cd08c506cabcbe584f"
 SRC_URI[sha256sum] = "22c37dc90c871e8e052b2cab0ad219d010fa938608cd66b21c8f3c759046fa36"
 
-inherit autotools
+inherit autotools update-alternatives
 
 PACKAGECONFIG ?= "ssl ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 
@@ -33,3 +33,16 @@ do_install_append () {
     ln -s ssmtp ${D}${sbindir}/newaliases
     ln -s ssmtp ${D}${sbindir}/mailq
 }
+
+ALTERNATIVE_PRIORITY_${PN} = "100"
+
+ALTERNATIVE_${PN} = "mailq newalias sendmail"
+ALTERNATIVE_LINK_NAME[sendmail] = "${sbindir}/sendmail"
+ALTERNATIVE_LINK_NAME[newalias] = "${sbindir}/newalias"
+ALTERNATIVE_LINK_NAME[mailq] = "${sbindir}/mailq"
+
+ALTERNATIVE_PRIORITY_${PN}-doc = "100"
+ALTERNATIVE_${PN}-doc += "mailq.1 newaliases.1 sendmail.1"
+ALTERNATIVE_LINK_NAME[mailq.1] = "${mandir}/man1/mailq.1"
+ALTERNATIVE_LINK_NAME[newaliases.1] = "${mandir}/man1/newaliases.1"
+ALTERNATIVE_LINK_NAME[sendmail.1] = "${mandir}/man1/sendmail.1"
-- 
2.28.0

