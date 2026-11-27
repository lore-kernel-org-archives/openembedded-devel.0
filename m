Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10350.1795753045438001323
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:17:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=S04trKSQ;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b589050416so1676717c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753045; x=1796357845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jtyDWUhKCE9kQnQiN62iAaq6en7wgWyme0dD0JNHe1g=;
        b=S04trKSQhqyC1v79ZoK/fHm6QHlCzSyCe+9a/V2EPxDXK8gg7SFzI9uXbqn9s1kshf
         eubTe3kjm2PAwFv0bUQgIu2JuEpoXNPTBsli3zZTDMSvawYLJD2TS6UzRG12GSUh9av4
         C/gDRq6N7FZ78yZ5wjPAFvkMqiI+hp57VanQXvSKnoTzfCOixl1A6hnqyF3v2i17HkUV
         k6FmEPK7r1gUg8DvqXL+6nu93nvBEJ+Fl9Dv5GxGDp7z9EGOv+KlAvv4GIAFmE8BaaMR
         7zx6zhJL+06BoQh8jIlmCWPD+PPHrq9JL4GajaxSiLVFGNekvpz9IhyJoWNp0CyFaW0j
         yOwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753045; x=1796357845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jtyDWUhKCE9kQnQiN62iAaq6en7wgWyme0dD0JNHe1g=;
        b=AZ+vb9XFAv/C0nuenRGb0vcxhLA9PhN/+DBizocv2yc/786H8iTKFX5mEaoEjP7oWO
         koV4kGnfO1LchOGQY3Le2nvkBTkf6xFs34MfoJ5Z25+eNNC8cv3Zv+PYB5ui/Gb7zf3n
         wbLB9Pf+VW5EbOR/V9RoTwa81oBBFuFTbK1mbVlkkvKCmk1j2Xu3Q+NIpaWNROW8yRed
         e0Z9KtREoBI18aKfn/maEV4FOfR1akRxObxoPfY647Mj2AJc5VKSPB4wWAOBJZx79pTw
         emwhAFXDBxj7c9cIchDoUqMFEn+cOtW6hVRlBVIYShFS/+kbNqdS1qisXt4b1eHVio9i
         fH9A==
X-Gm-Message-State: APuU4Z+2C7hwY69RKxF6+NCWR1iJjRIepVUGwJwCwNL6Pwuqm9G2VMSh
	XzdP+7N5wMcfJaPwhHVPaXV8HVwCs31P7SnIs1gppuPGB3e3RU6oGXlWBVxONW2h
X-Gm-Gg: AZFdTZd1PqVOj1dTgLAesDJ63hOq3qr9HnsQTKek/D6Dk/eL61c+4OQQj/Nz/S6JK2n
	jcDzkUnpk9rtdqCHEr1rEsyKIHHA6DIUBgs/N+glVCbSq26JPtMMK6/3tn1LtsmiGiu+YcO3aKg
	MHn+AM3b8t/WjoHthOlMEqH/+PvtxSVQSoKYG7t7AdTIS7rpVhV7xChll/4XZwI+xCw7u6PpQPZ
	xOaZuMw3+TcXqKqe4xCJFd0PmXkwqA+iA+1RjtX/QHJ7mAzddJ9ftj6CdF2H+cvzxd5FpCmJPbU
	gz41QsqCw/ENHmc4peLgg1SKb+GAnsRtwxmjOjn75SZd6RcvHT2gzx9SQHiMwzRZm5k0S76o9+8
	LlvL5UNEB0WxmtOvjdUcjX4OpHPQ5cbAp9BWGkDCM2BAouAkmliRGkyIa0HWXRaN13UUcsFoe0e
	xdTFfn30mehbr5uI5jxT9ZM+5k1WjA7qNibGBWa/YfBvPoh2rXik5gxsUHUtTGZBsmyAnUC2GCA
	CgQE0gDEzqn7qGMLsBn1kEVZqpPtzqUibbFws+TVqoGnYy0xV95GJ+rH53iEyyogP/GCbc9K86d
	uxsM7jea3GCnBveMHdOrNE4x0igbz2FVOSxSm/I6xQrQlbtcveb/QJ0xqOIDtwzNcL1hQEth57g
	8GINiM4j8WNaCh4MucoQIp3u6BACFgV82tSaN2O7VE1qBCv0pNWQOqhJSs4km7n4/ROnWqHdq+G
	XCtN1XjxgpXktC3owOvThI9ob5pvQWASC1X2KsCMY8i3SHVwLKAI4jcVdXE4AeZ2gn4XAqyjJlK
	uit4PNL5VfAJieMegDN1UxDjNF4+kE2LucYrWWFrkrR6eTuBgeqE0UCmqfxGoTk7e/EW8Prm3aD
	7j1H
X-Received: by 2002:a05:7022:3b8e:b0:1b5:10cf:c402 with SMTP id a92af1059eb24-1b5568a17d9mr24936853c88.10.1795753044697;
        Thu, 26 Nov 2026 20:17:24 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm53880225c88.12.2026.11.26.20.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:17:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 06/35] networkmanager: Fix upstream version check
Date: Thu, 26 Nov 2026 20:16:46 -0800
Message-ID: <20261127041715.1776485-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
References: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:17:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133258
Content-Type: text/plain; charset="utf-8"

The check reported the 1.59.1-dev development tag. NetworkManager uses odd
minor versions for development releases, so only match X.even.Z tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../networkmanager/networkmanager_1.58.1.bb                    | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.58.1.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.58.1.bb
index 88bc301ef2..1ee23b5839 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.58.1.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.58.1.bb
@@ -47,6 +47,9 @@ SRC_URI:append:libc-musl = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld',
 
 SRCREV = "7406dfbcc35beed79bf2734e3e7376ead320bd99"
 
+# Odd minor versions are development releases
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+\.\d*[02468]\.\d+)$"
+
 # ['auto', 'symlink', 'file', 'netconfig', 'resolvconf']
 NETWORKMANAGER_DNS_RC_MANAGER_DEFAULT ??= "auto"
 
