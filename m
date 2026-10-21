Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7533.1792575034839059333
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:30:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=l+VvRgS5;
 spf=pass (domain: gmail.com, ip: 74.125.82.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1517bda04a0so522459c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792575034; x=1793179834; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7hjeCtskHSjIF9aPE/8nL6w960jXKHNYNGpyi4T+0cI=;
        b=l+VvRgS5N1rQtTJCavYQszOaLxLdlDC4pj2ui2aA1WRCP6hhprMVcky5+MHjYS6hX0
         QwTZiz8UizvCsRkSpvNYjcs1HOPC8LDoWsB2nGMiL24rwJAFnh2hyk9TxfsUIE8vvk0h
         47RvqGM9dvdbjk0R+J+rD1CgsjYWD0ofLCbDQGrfIh55F+2Teeflsc/9h9gkM+Ku23tg
         0XK9lVhrKbrNuN9ynHlZ64s7Om8uWrVj8+Q5bCNXtMgaUv2Adsr+dAm0rJ9Wo8RJKmK/
         FaIIGQBFiFzKFlWfnnwkjFAzPz2cMr9WzZnZ1aHpRN0zODbAzm0y4pzUiaOAl7vPwPJ+
         IR3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575034; x=1793179834;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7hjeCtskHSjIF9aPE/8nL6w960jXKHNYNGpyi4T+0cI=;
        b=z71/nsd8N+n4yIJPYitDtiz2UKQdiKxNksK/6xQUbjRPsDFvcggsPUdZLGhD2H4/Zp
         sRb1JtB3x5+0U6XiNnoPdmb1HLvu5Cr8noR5aHXKFGDCLye1dkS14iY2oVhNGOapQFbw
         QnAblD8jbwP0uNRj45MSxS962vMO3GdbBp560k20G2AaHQtkbf6+0x5Rwx4DSPRoTE9w
         CihbgCNhocscJpQmav2PPXNT/MRIQdVYMIe4QlzjmaXbOiI2OOPtzuUiIK2T7dNxAUJ1
         CsyDPsu37RgUqVautFOEguI2fQ7ur6nUOrMFD+SyR2ZSCQhKoh6c4ZHZcR5vvge9i+Dw
         2XDQ==
X-Gm-Message-State: AFq9FYJ9snX/EsBME2kIhH0dS1MnFyF35533YjZ8rpNiTjNslwwVg6bN
	G1bQWHY269tfrDvzfFfV/zU7RUgjeDke9/ynDosrJo0l/I8cvUsnIJwhbqvWQg==
X-Gm-Gg: AYBFou28MOFZMFd4PleP9m3ROzWscQby/rsmDQNxtQ77qgnTh+tmktdewu8+XG7tW6p
	LWIQjnnQLdMtYN2XCeVoQTRtRaw2dTEbyVj3l9MsE2mQmw2p8s/HUfar8w9d31tnbxl6QC67Jjz
	wcFnSM3oTSH/XDb+9GAfUzM5AgoU+L3FzlmNhRVXjRFgsNYQW/hIHj3nNIYYA6ur3qrHkAsajCJ
	YpwE4PtNtRex2/HhJ7W0j28B30oorVlWGqdxCtYjgAnLbhoXuACIEaRfFuCm+mZ5hKXXLHVXxVF
	veyrm96PDjzHOTH6TklyitVm65FUlR7Jbw3p8dnwUrYI8WwmXhZ9cCmEBMLprrVSkCYnhxZwsi0
	UG0eKw4lTxnpbwoaEH77QerUUWpANbAkFeQ3pKaSf0V+ajFF+Zkedod7BzLWTmKgvjNk9xh1E0D
	LmrHVlsudbN67HQ+UV3VJBuR1PW60JfacbOVbKpIBYbewuz/fsfoqK9oSjXCOU/endthXl7wcUO
	Sb1yitTdzUDXUuDS1jvcU8hYhlDanMv9ZfcHwocfX3c1Ll5Fdd8h2/tjm3kcmWde3Wck3Na8yf7
	U0mlpUOzwPt6OEcc72XCxeLzoIuDsm4dQtFFpD/R3hlzjgnQBmQF
X-Received: by 2002:a05:701b:2314:b0:151:2e62:fe4b with SMTP id a92af1059eb24-190a57ac854mr1763669c88.23.1792575033957;
        Wed, 21 Oct 2026 02:30:33 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:30:33 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][blacksail][PATCH 38/44] mtr: patch CVE-2026-14461
Date: Wed, 21 Oct 2026 22:28:51 +1300
Message-ID: <20261021092857.3585453-38-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:30:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131225
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-14461

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../mtr/mtr/CVE-2026-14461.patch              | 32 +++++++++++++++++++
 .../recipes-support/mtr/mtr_0.96.bb           |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/mtr/mtr/CVE-2026-14461.patch

diff --git a/meta-networking/recipes-support/mtr/mtr/CVE-2026-14461.patch b/meta-networking/recipes-support/mtr/mtr/CVE-2026-14461.patch
new file mode 100644
index 0000000000..6628d9d7be
--- /dev/null
+++ b/meta-networking/recipes-support/mtr/mtr/CVE-2026-14461.patch
@@ -0,0 +1,32 @@
+From 4c75fae93d9515f3ecdfecc966b8c6471efb7ea5 Mon Sep 17 00:00:00 2001
+From: "R.E. Wolff" <R.E.Wolff@BitWizard.nl>
+Date: Tue, 16 Jun 2026 11:03:39 +0200
+Subject: [PATCH] =?UTF-8?q?Fixed=20possible=20buffer=20overrun=20in=20asn?=
+ =?UTF-8?q?=20code--=20Micha=C5=82=20Majchrowicz?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+(cherry picked from commit 48e1794414d338ce47abc0f27c25ade8788af9c3)
+
+CVE: CVE-2026-14461
+Upstream-Status: Backport [https://github.com/traviscross/mtr/commit/48e1794414d338ce47abc0f27c25ade8788af9c3]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ ui/asn.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/ui/asn.c b/ui/asn.c
+index 111c394..487d9e8 100644
+--- a/ui/asn.c
++++ b/ui/asn.c
+@@ -94,6 +94,8 @@ static char *ipinfo_lookup(
+             DEB_syslog(LOG_INFO, "Malloc-txt: %s", UNKN);
+         return xstrdup(UNKN);
+     }
++    // Clip len to PACKETSZ. -- Michał Majchrowicz
++    if (len > PACKETSZ) len = PACKETSZ;
+ 
+     pt = answer + sizeof(HEADER);
+ 
diff --git a/meta-networking/recipes-support/mtr/mtr_0.96.bb b/meta-networking/recipes-support/mtr/mtr_0.96.bb
index 9008223264..2716ca92aa 100644
--- a/meta-networking/recipes-support/mtr/mtr_0.96.bb
+++ b/meta-networking/recipes-support/mtr/mtr_0.96.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://ui/mtr.c;beginline=5;endline=16;md5=00a894a39d53726a27386534d1c4e468"
 
 SRCREV = "f392168771570b0fdc104c38dea6bbc2ce585710"
-SRC_URI = "git://github.com/traviscross/mtr;branch=master;protocol=https;tag=v${PV}"
+SRC_URI = "git://github.com/traviscross/mtr;branch=master;protocol=https;tag=v${PV} \
+           file://CVE-2026-14461.patch \
+"
 
 
 inherit autotools pkgconfig
