Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5705.1793253535903875404
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Oct 2026 22:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=jNgmovq1;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: ragaprasanth@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3514b90bb89so3293571eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 22:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793253535; x=1793858335; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jDRb2jgzX6lNJ17BCzo6xdWQ1tNGwCslkuuc4m2fV2o=;
        b=jNgmovq1TLr8mbh57cQIZM6lCrFTK6BC34BY3AFex1+5M3RpG0J/lKQtxnEKoSkFg/
         9FWWjyi6FHXzhT3ygS27jcN07rr8vmRQYkfyRkpDznVNkLkTyfAzJ9KJEAqMkogFw+LO
         I02PKJencZJJSzQe4Z9b2HlpktFOWl26t+aERp9W7XKz1U19KUyIR+98aC6SRg7XDMq8
         Nb+AiqEjMdNo9o+8gnS5I5QyQiZpYYxVe1YPTYyT0BFW9p5Qt9i30XovwzWI9irB5VAC
         ilcwhDeRVBJFSoLaMLpmFdl4CiF8IkYIeCoZJBMWPRpy7DgYuu3o+fSVqkk+db6heUO5
         Jecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793253535; x=1793858335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jDRb2jgzX6lNJ17BCzo6xdWQ1tNGwCslkuuc4m2fV2o=;
        b=GyyPqJaU1PFRgwvKaVhirS4LmMJVJDkQzgNuG9GtcSRi5fo27t7uEZohkUb/4xmP0w
         9eXWwWZxWhkXFqkImJvN7s8D27YY6cqeZPrZjIZP4cc9u29XE2STRTHvFw9V4h4fLWsN
         KKQJnQqDw5OItY9bxDCsW9rSLjsm9aK6R1I7TWWcTnkFi5bs1qMihzFhP0K+WznVK4rg
         QHO1Bbyr/yJ5xxgNeTXJa2GWz8fEnEvhw6PMK11ByFU90tqA1/OVPQtPukNrJYbE+eLr
         ugCF75/uIB15IS6wA26Cr8AUbsNGH1EpX6fZ7+73bJSN4qcKFmHJXz1go2VH8Sb8FGj7
         Eq0g==
X-Gm-Message-State: AFq9FYIo74pd5PZMUb3YzTXYMHh7d1zPpO7zwPIE+6EHa7+fCKy10bQi
	Ol5wMpN+NTAsmeMpMS3gjCfSOahM5jMIDy++pqEgE85I1lM7mlR+n5VjqOnslw==
X-Gm-Gg: AYBFou2vq8/y6pwEiFrZToAOw3uFPE8501Qbo6Ejfh918qOin2+E3onupPwqUTmmb6C
	CYN6Uj3YoABU0OayMh5Lus3bSoXTXZKazgFXA+0dmTmuNeQvQslJmVZhMi3G2UPQXK+7f9znj/9
	YoikmYF/4xH+lMtSuACFycGiJCp1XjNS87S4wLsXEEGL2LOM0ObtaHed+0Jmvae1RP8WurpYak4
	yoLSRXpCPXjaTGImvxuCVBGP8TgQRcbCUpCujDMM78wm7kC3VevB/5RdBwtxvs4LlalbHkiUQ/X
	ifJGaQasOYj64GoXbnfOcTdJXZ7k44LBLCVIFihSPcK9M614QNa0on2smNt3JaspYFG5KwQm3ux
	uNGfAslMp5uKeOHZjDP8dAdULjCyv2BXgGiI2MfBfFk+fVf21T8chV0pnGTdvheiyUuCF5uuPb1
	MrxtuQLgGvSS8hvc7p3owwL5wur434fuldIfZybNIVm6Ho9f5SUwNjcA3qtY5I+AVRIy8RK8c3z
	ciFPhSuSqxOz1s8FiICdOBM66E+PUl1wsQQfPVPo4/imlDINY/VemZSHxNPKjr6jigDcZgtM9pU
	yH5zNQNo8EZk7kOmnbU6HGpkMkEpr74+4dr7+8vLOw9VNBg8cHCsqtBb/r2LAyqDnDnPCxcEeuI
	nNlDgr07Erg==
X-Received: by 2002:a05:7301:710b:b0:358:dfed:d0fe with SMTP id 5a478bee46e88-36a1ff47343mr5437638eec.5.1793253535006;
        Wed, 28 Oct 2026 22:58:55 -0700 (PDT)
Return-Path: <ragaprasanth@gmail.com>
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239a56e9sm13388740eec.27.2026.10.28.22.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:58:54 -0700 (PDT)
From: Prasanth R <ragaprasanth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Prasanth R <ragaprasanth@gmail.com>
Subject: [meta-oe][PATCH] exiv2: upgrade 0.28.8 -> 0.28.9
Date: Thu, 29 Oct 2026 14:57:50 +0900
Message-Id: <20261029055750.1585940-1-ragaprasanth@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 05:58:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131638
Content-Type: text/plain; charset="utf-8"

Bug fix release.

Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 .../recipes-support/exiv2/{exiv2_0.28.8.bb => exiv2_0.28.9.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/exiv2/{exiv2_0.28.8.bb => exiv2_0.28.9.bb} (96%)

diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.28.8.bb b/meta-oe/recipes-support/exiv2/exiv2_0.28.9.bb
similarity index 96%
rename from meta-oe/recipes-support/exiv2/exiv2_0.28.8.bb
rename to meta-oe/recipes-support/exiv2/exiv2_0.28.9.bb
index 9369daa805..e2387eaeca 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.28.8.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.28.9.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/Exiv2/exiv2.git;protocol=https;branch=0.28.x;tag=v${
            file://0001-Use-automake-output-for-tests.patch \
            file://0001-Allow-test-data-path-configuration.patch \
            "
-SRCREV = "2cd987a731236037b6b78cbff897d08685a8ef49"
+SRCREV = "b0859fc61fea5dedfc898aece6b15893ddf4314e"
 
 inherit cmake gettext ptest
 
-- 
2.34.1

