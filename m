Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 757E3C4453A
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 18:49:52 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7381.1784746184847449600
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 11:49:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Xe51REQ7;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso144792825ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 11:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784746184; x=1785350984; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6MZzUfbWDw7z3bVpEj2jX7cj+j5gJQxNT5nTfecyYvM=;
        b=Xe51REQ7qrabpGmMalL8ZadLudu2NRoLHnWspyYR569dLUpfyqsQaJd42Fnmp96n1v
         Om1WDNHtNNgT8PH6O3gITcaVpLIjSPxNlVQrutNgyhxfog7aXDZAmsyl7XIaJLbDJ6In
         qcJbHF5dEDqdh8n/lJqs6P07MgFgxS8KAxdaZGMJNo64R43Yg/yFSR3BPnEnmyl3AH7Y
         MCK9RZDflUXd5toPqb3dPvLMdenZImc8mc5YN9HY2G4MGHklYglXriBBmhuqzb+ZoVnQ
         NmmH894FjZXkJHxDc+U5//q8t1hQicnfNscIVBwoI7LXBpVbqCYWwMtCCFGxVPby9jmX
         Wxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784746184; x=1785350984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6MZzUfbWDw7z3bVpEj2jX7cj+j5gJQxNT5nTfecyYvM=;
        b=TkzY6N+rBEJGtE6bkC0IpBI8HngAURqF7YqiLNExSUUnsnWFXJlfEz+o2/m3NpyRDZ
         YRXjozxCx606f53lGiPgk7r1A5tLmT8ue6GxV137wiy2N5xH3pfZWKi42WzimEOtYplU
         Ot/HyWR7ZMyPYx8IaRHii2cuJsE/CrMWcaI14AfUPk95ExCFg/K7lF4//upnRvEc9XgK
         KgWcC5FNfpUz1FUV7M61wnb+/SO+LqdnikDWFSELChbNjQ1v07FcqxmN0dgSWoVMHE7r
         c2VGOkb7qIpq11aBj54FWVSeI00Kjv2qj/tRHcOtemajnDU9aaSo7K3B53qNx26FQV2O
         VxaA==
X-Gm-Message-State: AOJu0YzLOzODR98mAJH/yik5jcbvuGpyGAXTq+BPYRB/UCks7vGsYMyz
	zlb5SHmCQryZvq9ckh5S2swX7kH71LbeMH4jJt5wQehzgX9yhOcSw+x2pX7/og==
X-Gm-Gg: AR+sD11VSND31TjtfR9a6HUtPcDQgGonTmZqRgDHVEan182kcANmr8U5w12LOQYaRlB
	Id9/pPiU2gkUPjmLu4GHo4b7NN45dW7z+JZWHDIEdVELIHcWmlNGAmVWuUfDVTpJ1Woc9xqjVWv
	HqiqVew6btKtQnzKecKMLYFu4VfpPXP8d+rG82m0/KfE7R0EenNt3MOST8iZQFHmPl5OL6JbXjp
	tLY5xDBPiCEz/vA70XJK5zorra1FP0nSNB6TE9KeqyV+rfrDXbzQkQMl1Vzv6N4yjFyH8gjF1DA
	RfktN7y4yg77XUssnDud1B3xMvwYO0fdq7QeIYomikyf7kfVeVY1ca+pb8BMDdFUR2qdBZBKb0v
	w8YygcAmMt1jEFefhzDocT83YtztPc3oTvg6D2U8uqP2iv+1sLzQIt7KJ7rH5t1997UP9GVxl5p
	s+FU2rej3jtxy7Qs3vW7C/GjFt2EQ5dKw0vtoB999RKYhAIMUJjRBO6DB38fcRp5xKi4Dtiwo3q
	xpWFjAd8i4o3X/clt51waR/KfUGzRhcTTfxv42d04pDn7jSM5wsuoToY1+Y/To/pbFzOZL5XbNP
	QE4A99wSvv1K/EK6Ivc=
X-Received: by 2002:a17:903:238b:b0:2cc:df15:91de with SMTP id d9443c01a7336-2cfa752f053mr288455ad.42.1784746183988;
        Wed, 22 Jul 2026 11:49:43 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1bc886sm11115841eec.26.2026.07.22.11.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 11:49:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 1/5] ufw: make usrmerge setup.py sed idempotent
Date: Wed, 22 Jul 2026 11:49:35 -0700
Message-ID: <20260722184939.495321-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 18:49:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128408

do_package failed with a fatal QA error:

  QA Issue: ufw: Files/directories were installed but not shipped in
  any package: /usr/usr/lib/ufw/... (and on repeated rebuilds
  /usr/usr/usr/lib/ufw/...) [installed-vs-shipped]

Under the usrmerge DISTRO_FEATURE, do_configure:prepend rewrites the
single os.path.join('/lib', 'ufw') in setup.py to nonarch_base_libdir
(/usr/lib) with an in-place sed. The pattern '/lib' is not anchored, so
when do_configure re-runs against an already-patched ${S} (cached
unpack/patch, as happens on world rebuilds) it matches the '/lib' inside
the previously substituted '/usr/lib' and prepends another /usr, giving
/usr/usr/lib and then /usr/usr/usr/lib. FILES:${PN} ships
${nonarch_base_libdir}/ufw (/usr/lib/ufw), so the doubled paths are
unshipped and QA fails.

Anchor the substitution to the quoted literal '/lib'. After the first
run the text is '/usr/lib', which no longer contains '/lib', so
re-running do_configure is a no-op. Verified two forced do_configure
runs leave os.path.join('/usr/lib', 'ufw') and do_package succeeds.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-connectivity/ufw/ufw_0.36.2.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/ufw/ufw_0.36.2.bb b/meta-networking/recipes-connectivity/ufw/ufw_0.36.2.bb
index 171d0f6285..c6e106f934 100644
--- a/meta-networking/recipes-connectivity/ufw/ufw_0.36.2.bb
+++ b/meta-networking/recipes-connectivity/ufw/ufw_0.36.2.bb
@@ -41,7 +41,11 @@ RRECOMMENDS:${PN} = " \

 do_configure:prepend() {
     if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','true','false',d)}; then
-        sed -i -e 's|/lib|${nonarch_base_libdir}|' ${S}/setup.py
+        # setup.py has a single os.path.join('/lib', 'ufw'); anchor the match to
+        # the quoted literal so re-running do_configure on an already-patched
+        # ${S} (cached unpack/patch) is a no-op instead of prepending another
+        # /usr each time (which produced /usr/usr/lib/ufw and QA failures).
+        sed -i -e "s|'/lib'|'${nonarch_base_libdir}'|" ${S}/setup.py
     fi
 }


