Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36189.1793161449907858924
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:24:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=HN1G+iom;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3aded3c6103so291352a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161449; x=1793766249; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dcDQN3b53a6MHz1FFFFYGmijN0jK+jJ9QC8CTjP1Sus=;
        b=HN1G+iomlnJUuzt+QqkCE93tBtjnzrmZg26OLTh2Z1YBk0BjKSps3dFE3YlM/EeTUg
         J11QJ5jh0eG+v2nAqbXHQajBe2LvNIpY9B4MIlUrVpEho9gLhpt2rU+OXe9yUA0NMMEN
         ty3PsUcSkZVgykNz9pnyfX/YJAo5IYuYIMF6O5RsFLo2aFKl6DmtwZsVMXFPY1YCh2T/
         YW27ZJJUuLFTuxRlNT2y6AzWSXKHkCRZUrhR3HUxjQ0HMxDjwYKxFE+Xoh3QvM9DK175
         nu2l7kFslIwRSyoImpbKMhaJYhCn2OIiqH3NOcuvytCP33Wo1Yx36DOGcdzSgWxx5uhp
         i3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161449; x=1793766249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dcDQN3b53a6MHz1FFFFYGmijN0jK+jJ9QC8CTjP1Sus=;
        b=rfRsgzTR0f2jc2UmTrjeNNSa+BnRmRFAU3kyCk+PxN5Admtk3mbfpC7VA48rx4r9fa
         XNHRqVSccsMpwJ+pldKOEWayhVWF+ryvSJXpRFR1tLxJNe0KkcxnH6p4NOyAt4HPeH0S
         lzg6AFSgIoOX+6tjmWYJ6nE2IaDzQiRrIG4cO0lIjHz3+PTgHPtOM1g8FxGPWmi44Cbg
         9FdeaDSomzdXJ3Q0wzDbiAzADT6Z+xRk1uaFdAJdOE1P9jq8WK4zswcnqqwPlrYpN1Ge
         43yieZTrCL1SYVfP3bsspQoKh3rpNY4Oyi3wybigdhzjlCIXjdIV0Er34PB/eB3qbKKi
         MkFA==
X-Gm-Message-State: AFq9FYL8/aeCcm+fTblNllcCm6Ze57VJRgzkxynUuZQ+HxVgg2R8JGGv
	iMTV+cPSDOQi3tSp24us1W0pGluzttgZK06d/KlbGD+DI/ezqWCxXax+eP9ioQ==
X-Gm-Gg: AYBFou1qHOY4sies5s4RDzKgZesOVHzuMq0MCFVbnUZobJgFS5mbVti26aAINfz1G+C
	Rz3U5+SGvw4X4HYVUfyudWiFjTGlO3ZPxq6/5UpoIh1WQqsyrOG+Cy2O1sVJ1XwsQ1xENMnG3mY
	hE227ArY7p93aFwP1KIOqwTmHKeY/nYfghpazsqvqr08iR6HQasZXkPF7uDtSvFtQrkazUkl9I/
	jLpfNy04cxBtOzDxUYtzskmkeOSUTq0ol/2QNk9+Wm43B4UZTxtBRSV54r0qhfm/tJr/e115ja7
	2uVfFvztYj3djLV800ooO43kAB+ZJtGI3/KnFIXrDVViVJiHy9CTPc8WrlsnLFajfVfqn9vb52g
	nG47IKn42nrhE9Rj1xYGR2OKEGN33Zt5Tk3lBGeK/2WuDO1hRBpyyRKEpuBHEWkh3NfBoDrrkMB
	8LrmL0RqYd5BkR1jLoXpPFoMYy080xlwvybBJNbaxofttCms4MFc5hFlJT+2WrZiEaoVyod+fA7
	kqFXbHjJFnzqZQb2DHTG7/bnzxlKHk3FrJqvSqxAb6yUt1XY50whMMxQ6gV3TK2iExjt0qRdf39
	KYNIrj6lUdOTPB/2Yk1e0JzQrMa2K1j/RJ7YjRIGZ494+raupVpWxdWJvYSdVw==
X-Received: by 2002:a17:90b:4f49:b0:3ab:b39f:41da with SMTP id 98e67ed59e1d1-3ae580ae572mr790470a91.11.1793161449238;
        Tue, 27 Oct 2026 21:24:09 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:24:08 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 01/60] zeroconf: ignore CVEs
Date: Wed, 28 Oct 2026 17:22:59 +1300
Message-ID: <975c06326df9fb94ce6ecedd3408a45ce55eb736.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131553
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-47180
https://nvd.nist.gov/vuln/detail/cve-2026-47183
https://nvd.nist.gov/vuln/detail/cve-2026-47184
https://nvd.nist.gov/vuln/detail/cve-2026-48045
https://nvd.nist.gov/vuln/detail/cve-2026-48487

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb b/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
index cb26699212..a9c19cb38f 100644
--- a/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
+++ b/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
@@ -35,3 +35,9 @@ do_install () {
     install -c -m 755 ${UNPACKDIR}/debian-zeroconf ${D}${sysconfdir}/network/if-up.d/zeroconf
     install -c ${UNPACKDIR}/zeroconf-default ${D}${sysconfdir}/default/zeroconf
 }
+
+CVE_STATUS[CVE-2026-47180] = "cpe-incorrect: this vulnerability is for Python Zeroconf library"
+CVE_STATUS[CVE-2026-47183] = "cpe-incorrect: this vulnerability is for Python Zeroconf library"
+CVE_STATUS[CVE-2026-47184] = "cpe-incorrect: this vulnerability is for Python Zeroconf library"
+CVE_STATUS[CVE-2026-48045] = "cpe-incorrect: this vulnerability is for Python Zeroconf library"
+CVE_STATUS[CVE-2026-48487] = "cpe-incorrect: this vulnerability is for Python Zeroconf library"
