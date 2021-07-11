Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web09.2453.1625965735426783125
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Jul 2021 18:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LWFof6fA;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id a14so7108112pls.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Jul 2021 18:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6lLJQ71ohjshNRDXPs0yph9/1O3Bh+93Vgslt8w+Tpk=;
        b=LWFof6fAYTZ+oFyjKSFSKSK9/X/hPCt6/XSA1c8IEjAPxyL9FrWj5x2sSy5riuRquw
         q9ah0hX2tNBHe88G5YMicgL8d9fGwBs0yX6WbKH6kUSoc61R1BdinpraVh/c8hAybBGS
         3Rwst+mt7C4wQgUi6KJ1EM0hyO1bFxUmYBaAFHjan+4WD6OIH89l6BmAv2OJoq1Z/Nkf
         2BHbEf6LeQIPDYtQuex59wci12evw8/u755eY0dkAEENegSfTYGYkt5L8FMULn+ruhPb
         fMdh62nJzQ4+mj1YCO0/62bNXPesedXP43MLxHJ4OcsUWxnobnd20LEve4zMT40QRRqO
         aPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6lLJQ71ohjshNRDXPs0yph9/1O3Bh+93Vgslt8w+Tpk=;
        b=J6ocDmo2Jee4BtV9Fy8GqDhpIhfk8dMRUMcGvhXVSoMN8CHJWMI8MwfwvsGMg4l7fI
         Wsi/BmouSblUuDXarDPLHq/vcdyxAOBy/n4LsXXlVVLC39vll+8RDR4PxaXo03yGRTSS
         fPNWWLPKDPmEVCHIeRhauNRI/l1eP3D1mPZ3c947sHf8SsXgzAKcUlPwCT10SgGbAZc6
         UaDdLDw3oBTB/41ItyFN49UNlPntiEHOwqeNc0L5v7xlJNtWa0Eg6k3ZQ5WmJBdiWGtm
         FSh9HJhMnMqpW635D1bbI4VfVJdMaXtwiSRNFCVDMHvSreTydzm9/zN//XJNkW77G8OY
         ziPg==
X-Gm-Message-State: AOAM5338SZIwKH+0LjAyOOu55N/iGT71JjFAPkm2r9yoxvo8bK2blp1s
	IQWTh3D5NvbGT707FrdeRW+mzoJqjKanrQ==
X-Google-Smtp-Source: ABdhPJy7IG6QtpIqKG6YTajnnr6lq0XtF/4udwkPtayy/E7W4Y3FIMjY3U4jnM5j7wgBDDfn0FPYXQ==
X-Received: by 2002:a17:90a:4884:: with SMTP id b4mr6730062pjh.173.1625965734760;
        Sat, 10 Jul 2021 18:08:54 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:1830::7ed6])
        by smtp.gmail.com with ESMTPSA id z3sm12199024pgl.77.2021.07.10.18.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jul 2021 18:08:54 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [meta-perl][PATCH 8/8] logcheck: upgrade 1.3.20 -> 1.3.23
Date: Sun, 11 Jul 2021 01:08:04 +0000
Message-Id: <7cc34f85fd28835e04870f422bfe71a087ab3ac2.1625965484.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1625965484.git.timothy.t.orling@intel.com>
References: <cover.1625965484.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

logcheck (1.3.23) unstable; urgency=medium

  * v.i.d/logcheck-sudo: adjust 'session opened' rule to match uid, thanks to
    Marco d'Itri  for the patch (closes: #985166)
  * v.i.d/logcheck-su: allow 'none' as pseudo terminal, thanks to Marco d'Itri
    for the patch

 -- Hannes von Haugwitz <hannes@vonhaugwitz.com>  Thu, 01 Apr 2021 21:19:39 +0200

logcheck (1.3.22) unstable; urgency=medium

  * d/t/01-logcheck: use temporary log file

 -- Hannes von Haugwitz <hannes@vonhaugwitz.com>  Mon, 01 Feb 2021 22:28:20 +0100

logcheck (1.3.21) unstable; urgency=medium

  [ Debian Janitor ]
  * Set debhelper-compat version in Build-Depends.
  * Fix day-of-week for changelog entries 1.2.23, 1.2.17, 1.1.1-7.3, 1.1.1-7.
  * Update standards version to 4.4.1, no changes needed.

  [ Simó Albert i Beltran ]
  * ignore.d.server/ssh:
    - match port
    - match more variants of 'Disconnected from' message
    - match 'Connection reset' message

  [ Ville Salomäki ]
  * v.i.d/logcheck-su, v.i.d/logcheck-sudo: allow '.' and '_' in usernames

  [Lee Maguire]
  * src/logcheck: support systemd journal as log source (closes: #876420)

  [ Hannes von Haugwitz ]
  * Switch to debhelper 13
  * Update standards version to 4.5.1, no changes needed.
  * Update debian/copyright
  * Set Rules-Requires-Root to no
  * Add autopkgtest
  * Adjust rules for PAM open session messages to match new format
  * Update 'su' rules to match changed format (closes: #931770)
  * i.d.s/dnsmasq: allow '.' in interface names, thanks to Craig Small for the
    patch (closes: #732655)
  * i.d.s/openvpn: match 'VERIFY X509NAME OK' message (closes: #751292)
  * i.d.s/spamd:
    - match autolearn_force field
    - properly match IPv6 addresses
    thanks to Craig Small for the patch (closes: #755374)
  * i.d.s/postfix: match sasl_sender field (closes: #700851)
  * i.d.s/su, v.i.d/logcheck-su:
    - match 'su-l:session'
    - match '(to <substitute-user>) <user>' message
  * i.d.s/systemd-logind: new
    - match logind session messages
  * i.d.s/systemd: match some Succeeded/Finished messages
  * i.d.s/dhclient: adjust 'DHCPREQUEST' rule

 -- Hannes von Haugwitz <hannes@vonhaugwitz.com>  Sun, 31 Jan 2021 23:01:29 +0100

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 .../logcheck/{logcheck_1.3.20.bb => logcheck_1.3.23.bb}        | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-perl/recipes-extended/logcheck/{logcheck_1.3.20.bb => logcheck_1.3.23.bb} (95%)

diff --git a/meta-perl/recipes-extended/logcheck/logcheck_1.3.20.bb b/meta-perl/recipes-extended/logcheck/logcheck_1.3.23.bb
similarity index 95%
rename from meta-perl/recipes-extended/logcheck/logcheck_1.3.20.bb
rename to meta-perl/recipes-extended/logcheck/logcheck_1.3.23.bb
index 10b281a66b..bb9faa2c05 100644
--- a/meta-perl/recipes-extended/logcheck/logcheck_1.3.20.bb
+++ b/meta-perl/recipes-extended/logcheck/logcheck_1.3.23.bb
@@ -14,8 +14,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c93c0550bd3173f4504b2cbd8991e50b"
 SRC_URI = "${DEBIAN_MIRROR}/main/l/${BPN}/${BPN}_${PV}.tar.xz \
            file://99_logcheck \
 "
-SRC_URI[md5sum] = "1c6e9a97f9cc485353c25147cb99fb25"
-SRC_URI[sha256sum] = "9fb6d02b933470d0b1d1efb54ea186e0d0d27336f9d146be592f65ce60dfb3e6"
+SRC_URI[sha256sum] = "a2188ba549fff4412c82074b271884ff66d25f3fdb2a41916e817ce676855b29"
 
 S = "${WORKDIR}/${BPN}"
 
-- 
2.30.2

