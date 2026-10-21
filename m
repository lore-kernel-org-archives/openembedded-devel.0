Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1141.1792543047332383291
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2026 17:37:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BXiM28EH;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso291340eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 17:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792543047; x=1793147847; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kKIt5u4dPIYaaaGJoQDumoQL/mnc8J8nK4LgOHps8ME=;
        b=BXiM28EHsTUGckJ+jcWhKE3Zpb6Qa7rtGV6QTG6JNZxPcho58QDDPjbX0aN+xv92lp
         fiaLbbSdqud2g9wTMGCtH1dVRIyYDaRQeoLCuXro4ZbI2xqPtTEqm3/ceen0CS+YqU53
         jIlS8/A+XeqQY3An6frHoEvq/SGI806Qi9zRdpvwKTDCyo8sEHV8jkL5dWjM6IR2bdPF
         rncdUMwrJYxbPhrb8l137NEgyxL7mmAwNaELAsw54lGwG4qs8u6xP5toSLzlOJKNArEF
         4R2nICIoOBjm/QhGpZFFkXYC6ul+2aYXYRGVIjdUFsc0ionc5NIG3Kxz2p0KQtpBvDzC
         1lkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792543047; x=1793147847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kKIt5u4dPIYaaaGJoQDumoQL/mnc8J8nK4LgOHps8ME=;
        b=T1UjBCpZYw8vdbV5g3ArjSh7/7z2CTHjrZKog2H8KxIWK7TlWQcMXL8r+T+VQlQhmF
         2oMv1qUBe7qqxEXunFmWcwl1IJAoFfaFZ2nu3JZuOB6hfxQagoNTo1ihas5mq1A3Sy/E
         58DuSFmSiOSQ4B9WX0ddpBzGBFDVM2YPY/JLSnQrX8o67Ty4DIVrFbtfCrTkZpRm4uSm
         8bWy3MMin1PggSQh+vxlV6UvIyZEwzOFssuumNpYD+aEILDvLJn1rMp5HLwE4y04Nk13
         ys0MDvEvIiYuM4fukDcJ9EkBC05rlvsl5cuBBVUOndzaAAJXh2rDIRNiH85iLt/06+Pq
         H4jw==
X-Gm-Message-State: AFq9FYLj8w9KwPoaiYgXve1zIpeChTHM+GeseC17qnYLicnN0BDvRMoc
	sdOjxMmy1K/029groiagEfvYZieJ3dYGjype8RivG09yxbw4kTrTeYnU367xdQ==
X-Gm-Gg: AYBFou2AR6nXESqEihD3wRSFBhWRq6bjBBuZhq4C3inVVfzdDD/OXDc/vdjNo0eeJlv
	NjoqktNs8y5jBsBRvrpSYm6mTwO+dCrxb668Exzmo9yJfJJ1LdcAg/s9x84RrDlVoXAQ/yRFeHu
	dHKN7bpcWGTv6k5Git7PB68BqVMzUAeerQ0slA1W1Pv4EMrXQd19AdlPCE6gH0klRGgYStEnDML
	DEhcyyVW89ceVS+3CaGa0fOX68yRss8uh4EPbtgg4EccYaDFt3MA5a0rmCLa0hsDxsiNJYm+HdA
	AnhSF0PeEvGRiZoZU/FLklj8MFsS8eG1lUvcq7gAAj3bneccpBo2Q2WuJkjL8a177/h0DBOZxLM
	cZmA2rbn3fo3Il05OmLD6R8jurFXTVJrCS+z4jP0F4HwJzRJ7zzarbqjkdxZ1LkN+bh42Eea0Z3
	GYjqYis82GRonRzoMOsbf8KHmC7PI1nH+XrGRof5nGGd3kT4Mtkps7GqRERuJWQFnpRedcPRcyB
	slWzBrhIAFgacUVCtpmr+Lpc9+sQnwcCjgGaiFYsohjxoiiK9meGzTb9uOiIGoRukMM4El7xg+q
	V4LcN7p2S72wAoUUvqJV3O/eDKll95GJJWpyGUU52x+p1AQ/osEF
X-Received: by 2002:a05:7022:2507:b0:151:ece6:b16b with SMTP id a92af1059eb24-190a4c1fa2emr798041c88.7.1792543046504;
        Tue, 20 Oct 2026 17:37:26 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035926fe9sm1648124c88.2.2026.10.20.17.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 17:37:26 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 3/5] multitail: upgrade 7.1.5 -> 7.1.6
Date: Wed, 21 Oct 2026 13:37:13 +1300
Message-ID: <20261021003715.2982979-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021003715.2982979-1-ankur.tyagi85@gmail.com>
References: <20261021003715.2982979-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 00:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131181
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Upstream commit[1] makes the conversion-scripts relocation unnecessary.

[1]https://github.com/folkertvanheusden/multitail/commit/c7282170317aea9f92b2b937691ac276d7a84cd7

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../multitail/{multitail_7.1.5.bb => multitail_7.1.6.bb}      | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-oe/recipes-extended/multitail/{multitail_7.1.5.bb => multitail_7.1.6.bb} (83%)

diff --git a/meta-oe/recipes-extended/multitail/multitail_7.1.5.bb b/meta-oe/recipes-extended/multitail/multitail_7.1.6.bb
similarity index 83%
rename from meta-oe/recipes-extended/multitail/multitail_7.1.5.bb
rename to meta-oe/recipes-extended/multitail/multitail_7.1.6.bb
index 0f441c6930..b16cfccd92 100644
--- a/meta-oe/recipes-extended/multitail/multitail_7.1.5.bb
+++ b/meta-oe/recipes-extended/multitail/multitail_7.1.6.bb
@@ -11,7 +11,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4d13123d158ecd203b5b9ffe50a0c76"
 
 SRC_URI = "git://github.com/folkertvanheusden/multitail.git;protocol=https;branch=master;tag=${PV}"
-SRCREV = "247e7ff727d9a8bed410f1bbf86f247c059546d9"
+SRCREV = "1bf273ec425a047d278023d6c197a939243a9eb3"
 
 DEPENDS = "ncurses"
 
@@ -32,6 +32,4 @@ PACKAGECONFIG[utf8] = "-DUTF8_SUPPORT=ON,-DUTF8_SUPPORT=OFF"
 do_install:append() {
     mv -v ${D}${prefix}/etc ${D}${sysconfdir}
     mv -v ${D}${sysconfdir}/multitail.conf.new ${D}${sysconfdir}/multitail.conf
-    # These are example files to illustrate input conversion
-    mv -v ${D}${sysconfdir}/multitail/conversion-scripts ${D}${docdir}/multitail-${PV}
 }
