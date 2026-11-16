Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22044.1794808949896106872
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 22:02:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=bPLUh1rd;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3704d30b84fso3565344eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 22:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808949; x=1795413749; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nIcDn2UMXrlcPrTJILV4nEbpwicN4WtyH4bhfa08bdg=;
        b=bPLUh1rdy2l7aqRod/7v7zldGBwx+i/fOlHhyWaIe4nIpT2UiEJE/dacAs3hZSZSc/
         WXrfOc7Vz+bcBo9WgzwW6jRQlL+oDuNzmQbY4KiMTzqBQo3SqzSBwJfsMWfOyNmChnD3
         ylxxWM9eC2jThn2g3g+vZytLnUwespvNCjYEV2Pj+PqyfN+AhGk8nmwsrGKeHIHXRan+
         KDRravzTVXoDFs2r8VhX1CrRUOYJOWCG3xdZygbyThnGIIaK/QZ0UG1DJl1mibMYqFlC
         pFthAvBOl4wILsr9WX3qcf6mbeX1RNpeVTDOlpbpn06Xf43FNSyCFMvqNfrRd9HF1Ftc
         kgvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808949; x=1795413749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nIcDn2UMXrlcPrTJILV4nEbpwicN4WtyH4bhfa08bdg=;
        b=vUDkYLI+i8z56/cmBPOGOmI3NlSKqolAnJU6pmbD6WPT4P5FbZY2qTIQ8cfczNyf8E
         ZjZtHDofm8Oykp8XN85ZKStb4eDsqmseSgBMGi0TvElvUIY5q/ugSqL00ZIIv7+UP4a/
         91Tp0ODIbPZxiuf5VvW/eUTlCVd5GaySam+Yk+nlJsxjgWQRlGOt1urLa0ULFOESbg2F
         zmtapntJaOnNJ3MicgWZT2G4jcfLlSJCkM1BHxJy/kOve+F1UryFfNMAqOr4dNinQgYx
         ou5VUldsJZXNxBba75nkRl1yDJmP106oJe/NALrUsS1zpjvhJesXMR5RKFBhMGnbgZ10
         8tWw==
X-Gm-Message-State: APuU4Z+K+F7YtfYesvQYilZFrrR47mD5IjRByJsqTpmWv+yHdtyi6W56
	t3Z4uit76qY+4HCLkBnhFOaKG9OdsNFHeTQrD4YRGSTB0HmGEcVXvgFY7yR7O5qb
X-Gm-Gg: AYBFou3JWdIfa8bUxx/DQkNtgvQ3UpD6tUF+oBSGvVQztfFhJoXybAkgntN+bdE7U2C
	5ALxTnsimUvI7AnOun8sUCV/4IA/78m3i8+gyqi9GW/j+YBklgCt5yaGs2JbueIk/DZMiefGOwZ
	MHpSs1idvuCHrhdqotfunSeO2pW96gsO+wyL+l+nKiAL55ghCEnsmsrhE1PipweFI+8NBwMbKrh
	mUNgwXsyLt0+P7U83QBJuhna1e5Fx9rlqqTbsrulGLMQcoWos2Ue/tnYhjPma3o00r/qvoNdRjA
	JdRMHpuxYH5HA8qVX54aNpTIEdqP5lcZRbSg9Z2HFBfHU0zW8xhiCJUT1/AQvf1VnuUVYqS6Sfk
	YVfoWYl/seRSO1HNS02TQCJCY3tRHaM1p6QzO2hopfmw1ICVbTUczEa3BeuOmEZx9JNl9SPsxnx
	iHrEJ3HIpGdzyKd36dLb9BA4C7ftu88/WKKMzVmPLykDvDzbKw0WTku9/cSX6Ngw2HbZ8X293Xj
	RiBy3z6roCXcyf5svCnCcDORoN2gecHeU8J40Bzh+LXwq+SwLBq45KlNrf8dBRKo75jVQ6eKbYk
	xvGo0Z3hwoEUo6yxDtW8HZBLw/KqYT7glyXukfU08FPQThmNWNCTS9U3pPxqkE8fmFTP6gCDwNv
	/Vb5ocEdOgkCE0hLueW8WeZkIFJLXjLPpCjkj7Bgw0om2ywwnanvwdSctZUEKrEWeinFLIqL5Mu
	NICJTieGXdzqB9cjp/ZCuRkVBjNYgxpMfi4uX3DoEqRgthESm1QNJDnKZ7d2idwGaWSbmcLbMF0
	pLfoc+1hk0nh3f74DoOwSOPUyw55vwM1/n4Te4Xd7Of3Vv7X3/39ICXwvRBG5QXIlVlAFCYB3kT
	Somp
X-Received: by 2002:a05:7300:e0a8:b0:36d:2704:6adf with SMTP id 5a478bee46e88-37966c48b6emr9955596eec.11.1794808949232;
        Sun, 15 Nov 2026 22:02:29 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm31410262eec.5.2026.11.15.22.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:02:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 16/30] libmozilla-ca-perl: upgrade 20261020 -> 20261105
Date: Sun, 15 Nov 2026 22:01:54 -0800
Message-ID: <20261116060209.2916444-16-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
References: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 06:02:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132414
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...zilla-ca-perl_20261020.bb => libmozilla-ca-perl_20261105.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libmozilla/{libmozilla-ca-perl_20261020.bb => libmozilla-ca-perl_20261105.bb} (88%)

diff --git a/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20261020.bb b/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20261105.bb
similarity index 88%
rename from meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20261020.bb
rename to meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20261105.bb
index 7a37f9567d..186ae18a9c 100644
--- a/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20261020.bb
+++ b/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20261105.bb
@@ -10,7 +10,7 @@ LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://README;beginline=32;endline=39;md5=51e666dce556490a1132e937ad3f8729"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LW/LWP/Mozilla-CA-${PV}.tar.gz"
-SRC_URI[sha256sum] = "1aeed97a463389e582e085e82de03ae0bffae74d46cf8ee4c511341e5508c21d"
+SRC_URI[sha256sum] = "b29dfd05d0f0038091fab9d7a184e8e476bc24fb5de5963cd23d21d262e0be10"
 
 S = "${UNPACKDIR}/Mozilla-CA-${PV}"
 
