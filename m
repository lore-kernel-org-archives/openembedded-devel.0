Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2218.1794083303765526502
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Nov 2026 12:28:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=N8kGO9fL;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6798af41644so8587d50.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 12:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794083303; x=1794688103; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PiBcUdF2PF9cVsZnI809ztj95PSWSxodQclIU6sOJHc=;
        b=N8kGO9fL015DIunDbyV3kqQ+3G24IuMIoDX16I41b8FpaWvc/TGJDspZrdROugHEA6
         RF400B5E6pvh5k9tg329ASLR8HJOR/RIZ9YASbuU3Jg33cW/s9vb3DcT0WV8ItNNfge4
         6DFJZ91HLqSmQwpx0Zb5AX0b2LuM2iIbb0XgdmIP/0aZZ8/RwbpU9HjUtkmNbp04tgFs
         Bmf1+2nqZo6Js/fGzvTz2+K/lkfHTMqLv9fJGmPClK45uTJLqBVwPNWF8RAs8eot0vf5
         Rup/E4tO2oDJDVJSnlhk39Kpybn2EFZMeZhy4k6JG4WzqKrIoBCKk96uRmWQVfCg9fSR
         v4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794083303; x=1794688103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PiBcUdF2PF9cVsZnI809ztj95PSWSxodQclIU6sOJHc=;
        b=bG94J4+6V+X73zR/nCa9z+sJgdQngaKigXyffeqiS9loDmaHGekZw2R9ySixXX6rOy
         Wcw5K46p8JPotzyk1ybvgxrW96QFp/hmz8SPw752gIAWTz6m2n2VnTR4Xg3IeojaLND7
         Sk51Ty30tkTK2+obmGZfnwBaJFQLjThFCf9XYBGLZsv3Vu+JuvWjFErEW9tcwrjRYBdY
         6qrkdDf1t4jwZ6rtxLXBf2ZGBGHmPGXQjH0mEFFKHbzvZEMLsvVv0NWBavYM5d30GTA6
         XyAgN0JjTl3tx95tDB83LuF2wJ5+LHQSM1gjjTfL+rJqjY8feAbuif5lKOBSvc7GEy/9
         M5Kw==
X-Gm-Message-State: APuU4Z+3E0iiIRqJziELw9rE8VZYEbMb5K2ByZTinQ+X7w7LTXHoaFUM
	n45JMQoR9YAw4c60TSBYd4Pjfkrj+bYE4UipQaZmSkwfcaraRUus/WHaWhPqGH+FP1g=
X-Gm-Gg: AYBFou1ckpg/y6JZhaoWPaFUTkTQDxSxlOq0L7FT2YqYnt3NuGVShB9ILRdsyekeagj
	KAlyfl4GgDOFdkV8IGqgSLGElzaxxyUZFNAVcJfVMvpzWBe/w+/CALa8vH0NcvxR4PbLea2tywL
	nWh7SKxwMgLdcvw6YwYkUH6bbRddlf+C4RGySXupHV72fNJ2igbHo6BNboXKWMQTKQ+Rm0Sd2hc
	gX0dQZC4p0fprm1KCuujLvuxm7PN60jkWJAZD9fFy2iRcdyf8J0iS5raqank5/hA6fLAisHuiMt
	pRwKFa0GtBMQMa0td8dlaloJQaDJ+uUmmJfd47XAKvmvZ+T4vS8tbjkBV8SvMSaHBDEu2g9lNwi
	/ek2tmQHuDkzFdaiLuW0Z6OdyYqo69g4wek5svS5f9xsvc+50z8PE9lf94AxaKB5/El8B8cJXmi
	8vB/IECSVq63l51JqKZLGA7y0p8zBiKDVOjcJylVMigdfqsjoijZePeLf0GYTuqW5+y5DyqUo0n
	6BiDL/qVpjYXCcpSIkvq4v4J5Ve0w+K7PdOOn+pQEOLr4YUWiIIWLXiu5KBTJm0V5Uc7cy/GyWG
	a4lbLV1KpOgG6GofpotUEghApu+Hzqow4IVi6k51JtdNn5d88PUxznM6o3YBnzeKdBoPpI+RUbG
	sfR2d5X4gVIR6cqj9ha5X/k4eCTjfcsGDPVPd/3jXcby+gIwICZFR
X-Received: by 2002:a05:690e:1918:b0:67c:63b:2a09 with SMTP id 956f58d0204a3-67c14418f69mr4111663d50.44.1794083302445;
        Sat, 07 Nov 2026 12:28:22 -0800 (PST)
Return-Path: <schonm@gmail.com>
Received: from localhost.localdomain ([71.3.193.106])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c3b83e8bdsm262044d50.1.2026.11.07.12.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:28:22 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 2/2] libmozilla-ca-perl: upgrade 20260813 -> 20261020
Date: Sat,  7 Nov 2026 15:27:53 -0500
Message-ID: <20261107202753.16734-2-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107202753.16734-1-schonm@gmail.com>
References: <20261107202753.16734-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 20:28:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132009
Content-Type: text/plain; charset="utf-8"

Changelog
---------
Changes for version 20261020

    Update from Mozilla repository to 2026-10-20
    Denylisted certificates:
        emSign ECC Root CA - G3

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...zilla-ca-perl_20260813.bb => libmozilla-ca-perl_20261020.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libmozilla/{libmozilla-ca-perl_20260813.bb => libmozilla-ca-perl_20261020.bb} (88%)

diff --git a/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20260813.bb b/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20261020.bb
similarity index 88%
rename from meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20260813.bb
rename to meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20261020.bb
index 45eea1db89..7a37f9567d 100644
--- a/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20260813.bb
+++ b/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20261020.bb
@@ -10,7 +10,7 @@ LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://README;beginline=32;endline=39;md5=51e666dce556490a1132e937ad3f8729"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LW/LWP/Mozilla-CA-${PV}.tar.gz"
-SRC_URI[sha256sum] = "81f0bd9665eacbb6feef13b0fa16fbb30162c09292542b1206434e569196dd9b"
+SRC_URI[sha256sum] = "1aeed97a463389e582e085e82de03ae0bffae74d46cf8ee4c511341e5508c21d"
 
 S = "${UNPACKDIR}/Mozilla-CA-${PV}"
 
-- 
2.43.0

