Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3852.1794729097733339860
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:51:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=WIL3K4cS;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so3168617eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729097; x=1795333897; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PrpCCuaFaCHjQTpVv7OU/uwvTjq0c5c31a/uDizmcSU=;
        b=WIL3K4cSxJjCPaFdbOUQEr4KcqSYZaqa6Tr1GX2Oe53LjfSvo4Q+ZnzqnVJKbJmzue
         jqko1gv6+g5IDvrWXd2BCdwa5xmit0QijRl11r/4G/+yJ+HL8lnYwNEgezQYCkWqx2gp
         1LBHitX91EQ6aIuNjS2ykybqUtOpobFqSIed1sPHeVjaufFxGjpq6XJyuY2UQz25FiPe
         OGB3EqtbQIVe33wSbH7m60p7j8ev3J0mQKJWW8j8++ymO9B1htPkHudm62+rlriwCnIT
         HuVS8+f+QeGlnGWSBy8cvGmp7kqWw2y4VZTJZ+B+OL0JX31PknbtNu3xUHH5fRKoO/VF
         +GUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729097; x=1795333897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PrpCCuaFaCHjQTpVv7OU/uwvTjq0c5c31a/uDizmcSU=;
        b=lG0SACBhVxrTKLEDZrtGTVv4+IOTl7VzPlRhHmXeuOtASTxM3mJJJ6JrlFe7Q67zeZ
         hnH46JKx4oSZQeiMpUY9nG+697OQZUbrPJSmIAScnzlcOTNWUb37sghmbOJse8PhMusd
         ZSNKS2mxb/hnz22LIWaki1q4u8b5DP4oBsFXBSkLgZjifT3Wd+On8nAjqy3qJPWhALqq
         zHa8vZexrqV5e3iblgH5+5KCqCkRNEL90+n/tWlohELcq/YqR8YgU2dbB0Wau93jhrXP
         59GGSWFu1qItzD1ecBcby4uye0N8LRNcWMCJMjQSKPKjwMyd2U68cVe8VnkDIfP6lLCQ
         MP6w==
X-Gm-Message-State: APuU4Z//kNS3OpkD+N8Ov/jlpvt+f8TofennqykJWvEmoUtRWL/42tKZ
	P+M3+ToKm4p0f0F3JWJCU7piDQ3aYU6qC7SMZZnoE5LwjVtgWzy1g6bEFS+J0l9W
X-Gm-Gg: AYBFou2mm2mePIi51a1qwJvFRWG1ovgAbL1iJ9aZ1VWQdzYM4e7OgeFSMTRQcwQwVeE
	Kd74wAtQulrxeQAgQViH1n7WzhLYYBj11hwcOaGWWX5l82zEFURag6GhVD276VwUGJhIXeZXRBS
	p9ueL87rgbP3TqSXEwafyNOa1uKaGFLo6QQSqzZ8EL7xWfpKhAXw0hrdyeRGTuHbPMzsFrdvSwq
	RhhVGrcIDy9ZRxv7siZE8LUhEMei07oLO79hgyt/l9jJMTFyxw18t7kZB5wF91wA5Br6sHEm8fe
	fDQo5R/YTIXGfQTyQRTur5a9RJG0XF61W+GhAsomaOhPfMcB8tAa8q7CRSlqOLoz4n0KcJyoFVo
	E9bMw2O1vyGkpEDzGmYCiGPhxIKZYZG7ibJXtE3LRtFnVSoSjmgu9RcTY6Bqte6BNnBjTGt8RsV
	ToSKqkLGYwLzHQmUJFxFPJLLPrOrEITO+LzTQ6/3ayqA7v+t1Ov/nW86eYQdBMfjRWlcBMDi8uA
	iY/MF+710HjOyB4OnZX7hGTyfzErc1eOfCCLHGnDLVHqRr08/lyLAnEZPSh0h1D0zT8W0dhqmvV
	kgViNhIAsVkPyH62Qpm4cdTz0/IW1Y32mKXotPCBPzPtB5FVC27gBmOrVNgaNHCpalNny+mkeLm
	Ig2Js5MuleG4KYtL34LVXuiHo3lgi9gvnxX7hvj3LHGlZRV/BuA1DJot+y8v+5aCR9q3HHeDTh6
	x7vyaQ3J2DIsHcZSs5x4odJTFOJnkADcBcJTj9S44GM7kVb3Vng5vdfGY7KRs+li4WIPBpXqUD1
	EX2UqySD9fsYztCk+mqDSshHEoNy3l+ytYB+JntXVkCukYh2va9LDCmDQTEDsAv8jc0L41PclgV
	EA/JZ1d/ltCcneLIMJ/2aciqLg==
X-Received: by 2002:a05:7301:b06:b0:376:13e5:e8fe with SMTP id 5a478bee46e88-37964b08f4cmr6577190eec.3.1794729097087;
        Sat, 14 Nov 2026 23:51:37 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:51:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 83/96] kmscon: install the PAM service file to /etc/pam.d
Date: Sat, 14 Nov 2026 23:49:01 -0800
Message-ID: <20261115074918.2932593-83-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132353
Content-Type: text/plain; charset="utf-8"

From: Markus Volk <f_l_k@t-online.de>

Since 10.1.0 kmscon installs its PAM service file to ${libdir}/pam.d.
libpam in oe-core is built with -Dvendordir=${sysconfdir}, so it reads
service files from /etc/pam.d only. The kmscon file in /usr/lib/pam.d
is never read and PAM falls back to /etc/pam.d/other, which denies
everything. Move the file back to ${sysconfdir}/pam.d when kmscon is
built with libseat, the only case in which it is installed. Tested by
building kmscon with libseat for corei7-64.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/kmscon/kmscon_10.1.1.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-graphics/kmscon/kmscon_10.1.1.bb b/meta-oe/recipes-graphics/kmscon/kmscon_10.1.1.bb
index 65db5115ca..d498c39d20 100644
--- a/meta-oe/recipes-graphics/kmscon/kmscon_10.1.1.bb
+++ b/meta-oe/recipes-graphics/kmscon/kmscon_10.1.1.bb
@@ -60,6 +60,12 @@ do_install:append() {
         rm -rf ${D}${libdir}/systemd
     fi
 
+    if ${@bb.utils.contains('PACKAGECONFIG', 'libseat', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/pam.d
+        mv ${D}${libdir}/pam.d/kmscon ${D}${sysconfdir}/pam.d/kmscon
+        rmdir ${D}${libdir}/pam.d
+    fi
+
     if ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'true', 'false', d)}; then
         mv ${D}${sysconfdir}/kmscon/kmscon.conf.example ${D}${sysconfdir}/kmscon/kmscon.conf
         sed -e "s@#drm@drm@g" \
