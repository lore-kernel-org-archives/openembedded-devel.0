Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA5BD4335D
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 22:36:23 +0000 (UTC)
Received: from mail-yx1-f67.google.com (mail-yx1-f67.google.com [74.125.224.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.523.1765492575069789794
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Dec 2025 14:36:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FZsqQqf7;
 spf=pass (domain: gmail.com, ip: 74.125.224.67, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f67.google.com with SMTP id 956f58d0204a3-6442e2dd8bbso755841d50.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Dec 2025 14:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765492574; x=1766097374; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qRhOxq+SZBJDogIj30N6V0p6Gv+R24m0yyPGgVFID4M=;
        b=FZsqQqf7SpZYb6cX8ESg4+p/LLR8c8103dkAox+eK06wv/qrMZUZNwwEA8kH5FpoWp
         mWyVTbXN3TcmIke9ZsqSKAovt3dHyAxTg7wNz25VD4a+INWkeC5YqSQWSm3iHfXTZFTY
         pEFssfS5QO9qgXqIpBNLHBHgdCBkGaovwXmT99XTksojVmYx6oiw5qT5fCHrCG9qV9EE
         wUhey+RWxcgHtR6AC9PwfmNNrV/IZqjTm5TIeDYORyCCFmpW7wT7lxgN+WsTD5KZW9xA
         M4C+KUOca4VbychRrJhWu3sLMD6BKqKvnG0aOg9MkpHlJuqV55Fa5s2a8/yXOABm1MBX
         B7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765492574; x=1766097374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRhOxq+SZBJDogIj30N6V0p6Gv+R24m0yyPGgVFID4M=;
        b=SieC32Wxn1xjL4jh8Wc39/i0KVfIGPP2kxUUtjUGS8UP5ywyUhNBIDuI1wCrwUHERY
         bGLM2+N0JOKUNlratW2Iy9UDKUSqMRLYHTvOIRUQXFaP3VmY50Ay1WgfqPdAMpcACwN1
         8aCXVX+ckNOpMAGe5DiOQzUecIJMhyzOKjbHK5ScH4sQajoG1yhg2hdA3fhsCHf0Uire
         m2s0Op6OvX4r8Vqy8zhsHKtP4TN+ZyigKaUvLlIRvqCRUDIbMI1A1wmYldWdmDqgJIgv
         biAePRV0j6+wjruS2O3inJytNeRCAsAguRYDK6wR9vY70Q2ispjSTHTaHwf8ssoXiigX
         bb0w==
X-Gm-Message-State: AOJu0YzJX1AXDTJb/5YeCjB75MDcF7QcQJ6hGppPwZR68D56pNDlOIm/
	BJY/Eqp4BVklh1bvBLjCcCQQRsCkaUlNRRhVGWCLL2P33convTK2qhkLorSPGYbFZ6U=
X-Gm-Gg: AY/fxX7I97jB/nzVl8zG+AgMqB0jMm3MSai0wg/N8mJjhXM0b0OPzeryUnBVOOEhh56
	xSAFyeZ+uR38qvqrceksF5++GnY88PHhpDlXSDEo/AucCwEDYelgkihUaBcVB9ednDQ/7oazVKI
	AaqUueolCw4UK3xFvsxehdD5C26IddaK9Z1kxE8JYMv1Wq+mv3ujyBIL2+HHZh2kGU/n36kEm7N
	TQuZVIinG/M7xxNz6ZJjPFvCxkFHnb3qSC+Dac2tG0+AXptyCk4IB9tU1jGJWNADYlMf7uWbP6B
	0Ek3ohqiWe9CKAPCdxvDoUj6x0B53CehHYn3PRfFhfgy79mi31tnj2bwWmUz7uBecvNjPOlIUYc
	k47TCHS9SsaJHiodv8Bxr6Q9dR7wi+n4YszZwbsT4BiSwZabTcRhoDbq6fXSs4PTI0SvqUlKE6A
	Gbpe2B6G4b2naB69puoD7y4r7R4cCUL/J/vNapkvy8wOnVgGCeRtkBaYBoTdkaPvYGYcnuYKyRP
	RZzMJF4Rjw5lCovjLGOJxh16tFK4RaGAB/sevB7Bv8pK/fTOheqdo//FIqvgVFp9g==
X-Google-Smtp-Source: AGHT+IEHInp0jleVCmnF1H4GoD2PMjciU9Rn8ffc10l1D2WXvp8y6t4bwRB/rJLkd3GyY4n1jUs5YQ==
X-Received: by 2002:a05:690e:14c7:b0:644:472d:daf8 with SMTP id 956f58d0204a3-6446e84f6f7mr6320489d50.0.1765492573630;
        Thu, 11 Dec 2025 14:36:13 -0800 (PST)
Received: from localhost.localdomain (71-208-12-78.ftmy.qwest.net. [71.208.12.78])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64477dc65ffsm1701406d50.24.2025.12.11.14.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 14:36:13 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-webserver][PATCH] cockpit: upgrade 349 -> 352
Date: Thu, 11 Dec 2025 17:35:20 -0500
Message-ID: <20251211223520.22085-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Dec 2025 22:36:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122588

352
    Shown a warning if the last shutdown/reboot was unclean
    Bug fixes and translation updates

351
    Firewall ports can be deleted individually

350
    networking: fix renaming of bridges and other groups (RHEL-117883)
    bridge: fix OpenSSH_10.2p1 host key detection

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-webadmin/cockpit/{cockpit_349.bb => cockpit_352.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-webadmin/cockpit/{cockpit_349.bb => cockpit_352.bb} (98%)

diff --git a/meta-webserver/recipes-webadmin/cockpit/cockpit_349.bb b/meta-webserver/recipes-webadmin/cockpit/cockpit_352.bb
similarity index 98%
rename from meta-webserver/recipes-webadmin/cockpit/cockpit_349.bb
rename to meta-webserver/recipes-webadmin/cockpit/cockpit_352.bb
index f84b1c4c34..6b1fdcaeb1 100644
--- a/meta-webserver/recipes-webadmin/cockpit/cockpit_349.bb
+++ b/meta-webserver/recipes-webadmin/cockpit/cockpit_352.bb
@@ -9,7 +9,7 @@ SRC_URI += " \
     file://0001-Warn-not-error-if-xsltproc-is-not-found.patch \
     file://cockpit.pam \
     "
-SRC_URI[sha256sum] = "2fa8eef40968135fb6df866a415eba8d4d5adbf4d44f293f28d4f3c841b301bb"
+SRC_URI[sha256sum] = "72098a51f85c4a63f2e276af119920a5faca978b57652df562b409b5941b5146"
 
 inherit gettext pkgconfig autotools systemd features_check python3targetconfig
 
-- 
2.43.0


