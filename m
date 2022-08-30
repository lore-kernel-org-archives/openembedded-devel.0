Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF132C0502A
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 07:14:22 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.8674.1661843660293711306
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kVrCe28F;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id o4so10264621pjp.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=/6tLNCNIQ0GEinAX5bJUC9sgs2NxwLQ1CLRZYqbe7RI=;
        b=kVrCe28FFo1uQbIRVNKJuTLqvEDfsK3CLnbv9PgVJ4SWpxyXXthVDVlwaKzYAqJrFb
         EOXgzVZjm+VLQTjUbd/UfTIit5ibVcAXt4fevgdgMoDnLrR3jUWOhFw+3J+bQuoe7S2i
         m2a3FlenjtkkjYulFKPGCKYDr3hIOGVPCWBGANgn/Yl4ptPH+TeiWH/CLwF31Bg0VynB
         dz5LPo0pjUFxbhR7rXXrCfT9Z0ZkrzHSXkss07vdXN67M2tGv1HsEw2kZCg4eE97pvnP
         KfgLw/BZdBH2cOInLKn6DlorEbuXAayHArGi37HYg9ENPpKnhKSl69CcnUkOkPtWg1re
         6yvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=/6tLNCNIQ0GEinAX5bJUC9sgs2NxwLQ1CLRZYqbe7RI=;
        b=YVKttDqD3jPTV6dgCsVPj1KCkFYGVoBedmlZYHhSn/W8OrZbR0n2lpX04ktQ0wyqcw
         vyKOtPFk/SZsSTInm+qIaNve5GXzxQnOJQGUErmox5QWzAKdu/A3ipU8od2RomrwwKvM
         9uHyEyfH5A5oMHN9Hfq6nTQ06wJyCgutOkmWGEDyZP6Ovd6mQ3hZWFbp6qYEN4ccxAvH
         ZkBU/2RdpbAXiVXcKAbDizwtL9+rlmiAZM6RXENh0Av93QE8e7sc6aYVsqjsi3XgNM3a
         H4E8TM0uy9qL6fn7BG524ugwfakauszTof5gL2fx/t4EhC7EkPW4lc6kiuxigkg3Coyp
         KNiQ==
X-Gm-Message-State: ACgBeo2MvIzG9uDQ/H5uqlX2cZtir8SJx2t075nbUyjgQA6LF8efuxYK
	lBkuWNVMDqKOhowl49CSwT9OryLRMyFETA==
X-Google-Smtp-Source: 
 AA6agR4vPTu8TuZ4tMqd3ODQ0i51SoS00uv8joAGH24GeAHabNJ4Z5dw9AGmuwtmxzy3PcwQcAfMHg==
X-Received: by 2002:a17:90a:e515:b0:1fd:6e58:40 with SMTP id
 t21-20020a17090ae51500b001fd6e580040mr19973294pjy.46.1661843659373;
        Tue, 30 Aug 2022 00:14:19 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 z24-20020aa79f98000000b00537f9e32b00sm6041616pfr.37.2022.08.30.00.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 00:14:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 05/21] dante: Upgrade to 1.4.3
Date: Tue, 30 Aug 2022 00:13:57 -0700
Message-Id: <20220830071413.3887189-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830071413.3887189-1-raj.khem@gmail.com>
References: <20220830071413.3887189-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Aug 2022 07:14:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98542

License-Update: Dates and address changed

Link with libtirpc for bindresvport() implementation
Drop krb5 packageconfig, its gone from this version

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../dante/{dante_1.4.1.bb => dante_1.4.3.bb}         | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename meta-networking/recipes-protocols/dante/{dante_1.4.1.bb => dante_1.4.3.bb} (82%)

diff --git a/meta-networking/recipes-protocols/dante/dante_1.4.1.bb b/meta-networking/recipes-protocols/dante/dante_1.4.3.bb
similarity index 82%
rename from meta-networking/recipes-protocols/dante/dante_1.4.1.bb
rename to meta-networking/recipes-protocols/dante/dante_1.4.3.bb
index 48f9708560..746c08be6e 100644
--- a/meta-networking/recipes-protocols/dante/dante_1.4.1.bb
+++ b/meta-networking/recipes-protocols/dante/dante_1.4.3.bb
@@ -9,12 +9,11 @@ what could be described as a non-transparent Layer 4 router."
 HOMEPAGE = "http://www.inet.no/dante/"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=221118dda731fe93a85d0ed973467249"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=edd508404db7339042dfc861a3a690ad"
 
 SRC_URI = "https://www.inet.no/dante/files/dante-${PV}.tar.gz \
           "
-SRC_URI[md5sum] = "68c2ce12119e12cea11a90c7a80efa8f"
-SRC_URI[sha256sum] = "b6d232bd6fefc87d14bf97e447e4fcdeef4b28b16b048d804b50b48f261c4f53"
+SRC_URI[sha256sum] = "418a065fe1a4b8ace8fbf77c2da269a98f376e7115902e76cda7e741e4846a5d"
 
 # without --without-gssapi, config.log will contain reference to /usr/lib
 # as a consequence of GSSAPI path being set to /usr by default.
@@ -23,16 +22,17 @@ SRC_URI[sha256sum] = "b6d232bd6fefc87d14bf97e447e4fcdeef4b28b16b048d804b50b48f26
 # --enable-release        build prerelease as full release
 EXTRA_OECONF += "--without-gssapi --sbindir=${bindir}"
 
-DEPENDS += "flex-native bison-native libpam"
-
+DEPENDS += "flex-native bison-native libpam libtirpc"
 inherit autotools-brokensep features_check
 
+CFLAGS += "-I${STAGING_INCDIR}/tirpc"
+LIBS += "-ltirpc"
+
 REQUIRED_DISTRO_FEATURES = "pam"
 
 EXTRA_AUTORECONF = "-I ${S}"
 
 PACKAGECONFIG[libwrap] = ",--disable-libwrap,tcp-wrappers,libwrap"
-PACKAGECONFIG[krb5] = ",--without-krb5,krb5"
 
 PACKAGECONFIG ??= ""
 
-- 
2.37.2


