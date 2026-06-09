Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD0FCCD8CA4
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 14:21:27 +0000 (UTC)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81024.1781014877833426882
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 07:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=N5P+WWH9;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-304ec41197bso5350122eec.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 07:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781014877; x=1781619677; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNglT2gQP/6Gf7aoU09sTSAVLIiLYo3ZnbK9yRtL39Q=;
        b=N5P+WWH9Sd3y5fbdQy4EfCOHqGgDxQgFWL+/sIvcKTd2gkJXbkNosjs1PGjsoPIMK9
         BZUkjvBpJMHKXbO+HAp1t3Dm4y55ED30AjDdnVTLuIHq7VjTtD3pWlYzbER7S+d+1sdQ
         1/u/gVZZUL/T7AMdWMZVDvjdvMhdPfSPB4jA9RrC82epWXd0+sJSr0Nw9uBOjdinl1Ns
         E4TFPfvcw6sboSvflEAONsESVgTdXW5zK5d8hYAlFlLFguKha3pZG/CgboicbahxOJCY
         FwUFEaVZLpg2E/ytXknuj1GTfrBeeyjyp4JJfkCF1Bncs5IV02hO9zl/MkaQumfazp0S
         IGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014877; x=1781619677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xNglT2gQP/6Gf7aoU09sTSAVLIiLYo3ZnbK9yRtL39Q=;
        b=hOO6aqKIr0hggpFWyawiQRYhRlNqSR3vNji3KXD7s/xHA8n7s8labsCLzuCcZFR8zN
         FaetUsEuwXeI2J4N9VBzjlgZxx7PQjD5uhIMdVxRoDlCoTyGkNgt436NKMwPb5ffGwit
         Aihzobf3wMzh3IRcPgnQSUEy1GfdD1RRNsI01mE7Ew2RaUyyQq2MFLpu3cAxk3FTWlcl
         Cl8Bl+mJwCthG4k79iRnEluoxACLQqw+q1Ft7V0KW6fUZcBPKNsw+9i0R2wG148PTkfJ
         8EqtgyimnZ2Vs/+UDud7REBLxUjGLKDcy607ev4shKok+iFAlRbnnRZBDhXmvwgz/+Om
         itvg==
X-Gm-Message-State: AOJu0YycbiisIp/8Hk7ueVQeCLbt+r43RkqSzvpTHJ/zs3ARYBpU1Vx0
	flOC+yamhURGgeJU3I7M+ZeE7tov6n7/C6GnHyyd2G02v6Mmrp++GvXQnQ0bYlPCAjpbIA==
X-Gm-Gg: Acq92OGXZumnBRUCdA+xFvg/1y/DDVPDzccqVUVUCue87UOo5CV8danxgdeQg4w4wxh
	1MNMHzUZkPtAx0CPpkpf4IWWCvsPNQsXmS2UoaD1wNqTt34UusJuzS/1o6gjSSF+IVrOIB3Ryis
	jfGnD7A7dufTCd7sdvfcyfNkaWJ7/muDFeOitiOR6Cn7VOppjEpLCOogsx5F5hpqi6R7OZtJYmJ
	8AQiBvyjScpk6mQcmupgPWPJeaceVHEqeG9LvXKbE71rBSErQ/6ouiENGCHbOEzqhjtQABk/ktk
	GohlloqgdxzJaQdmj66fsz4vttRwrp0knTyCi5WMFUU6Jq8kajTe9/7uWFBb3jcWGOniYiqfjkh
	JycgbfBkGsa5xt4salUptc/5pg/MExQIjnlBdBC5xoQsyYsPw7y8khrG+0JK/aQyTXMUvWJKXoN
	jblhFYyZvZjcwAfavCdmxasKP/tZMod+wOisQ1rIeoeVnDwbtNHGTz2Fql3nkI7poxU4IpO0kkX
	r6EbyQr1DKOeiLOOYyc8YBXfQUpzosf2u25piyU4XWzDR1siL4gzbX7oS/V9jTP0grFc6jTVtsT
	hcjKpeN2gD/efyWrfrJm3l356ko6tPfznXP/SsjG40It+XmZ2Oc=
X-Received: by 2002:a05:7300:cd97:b0:304:997c:d4b6 with SMTP id 5a478bee46e88-3077b721517mr12166584eec.17.1781014877128;
        Tue, 09 Jun 2026 07:21:17 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df3b234sm27099386eec.23.2026.06.09.07.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:21:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 09/11] libextutils-config-perl: upgrade 0.008 -> 0.010
Date: Tue,  9 Jun 2026 07:21:03 -0700
Message-ID: <20260609142105.1439225-9-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609142105.1439225-1-khem.raj@oss.qualcomm.com>
References: <20260609142105.1439225-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 14:21:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127496

Refresh LIC_FILES_CHKSUM: upstream reformatted the bundled Artistic
license text ("Artistic License 1.0" -> "Perl Artistic License 1.0");
the licensing (Artistic-1.0 | GPL-1.0-or-later) is unchanged.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...onfig-perl_0.008.bb => libextutils-config-perl_0.010.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libextutils/{libextutils-config-perl_0.008.bb => libextutils-config-perl_0.010.bb} (74%)

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb b/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.010.bb
similarity index 74%
rename from meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb
rename to meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.010.bb
index 401f607571..b40e0ffc5b 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.010.bb
@@ -4,11 +4,11 @@ SECTION = "libs"

 HOMEPAGE = "https://metacpan.org/dist/ExtUtils-Config"

-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1932ab4d8b84c25fd7967aa18088e57e"
+LICENSE = "Artistic-1.0-Perl | GPL-1.0-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ddb4d526cd95b017e23486893490883e"

 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/ExtUtils-Config-${PV}.tar.gz"
-SRC_URI[sha256sum] = "ae5104f634650dce8a79b7ed13fb59d67a39c213a6776cfdaa3ee749e62f1a8c"
+SRC_URI[sha256sum] = "82e7e4e90cbe380e152f5de6e3e403746982d502dd30197a123652e46610c66d"

 S = "${UNPACKDIR}/ExtUtils-Config-${PV}"


