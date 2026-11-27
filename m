Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11791.1795762944718339567
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:02:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=FrGEdPwi;
 spf=pass (domain: gmail.com, ip: 74.125.82.41, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-170135e43c7so12064946c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762944; x=1796367744; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PsLL8uqaVUjZAZlDqZAve9D/hDxE8KKS+aJ0BAk1h84=;
        b=FrGEdPwi2LCo6YzcirVtSLCHtZuphjGFNeeCxAQeR98qhSjEHnj8/K6dOnCmTEffxH
         29/Dq+HgBdPUzVSihYycyqcXPWEdROhRTJXY/TdpyrRT5ptF9bRMqDJTVvSqM1iA2NFO
         2cE0s0DWtUgYi0+GJ77LyYtJqAkc108vo4HGhP9U2Qr6oUNmrfFIbqz9yotjkY7t4G0r
         7CMkl2KHoqZtTpDCwJ0fHmuExn07IhZADn+atOuiSiECmWerYnK0nRSDNrMIEtQb+TBk
         IIkE/td2Br+l1VC/1a00tyZMsAWdHs+1EtS4m7Z42jo3lijO786h1MlFgnA2MeX9yAPR
         3pSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762944; x=1796367744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PsLL8uqaVUjZAZlDqZAve9D/hDxE8KKS+aJ0BAk1h84=;
        b=ZZvxFBtsVKrqjykFjc5Hq5kj/dRqGiXWjzDv4avK9Ki4mEv01yV/nhg9bf05jZHsH/
         hYlZGjow1vr04jjKgqOZJTbSmdpmjeSiq/Aoui1OuQTVRenzlDIjo9uXyCYG5L0VYfpH
         j/lwm7slvSplJIpRyP2QnCf86Lpk/6bOM/0/UDUFLIteE9vTNdp3zvyz8SItcWzG5d/h
         7j4A/4NrnI7x2ot9rRlzXz4iK1d8/0f2wuvIuu0ZrLUeIhUi/opV0bLzHBziaqv0CZKT
         tRLL31jfdxc0wlwBWUC/2ZrRobFctRLfdwXQo8xY3kc2cZBOIu8wEL/4r7L1Yk4xdkCQ
         d2nA==
X-Gm-Message-State: APuU4Z/Z44NPIYUtJO/y2U9AcaaJFBIBxACMK+Xis2wHrt+kl6Y4Ou6v
	1zxvMj8vf1DnvefDuT6ZFGxLd3OmPEr9u7y00m2qiYr9QmV4rEsTDXuoAtBiC2ao
X-Gm-Gg: AZFdTZfHrRR2e8FKPbo4o2kJmVKds9R5vrVVQ4nh6358beQz9lzlW2bgXBwGgZD02nY
	BK95Vkt0But5kPto41DWA67OHXj5C4qFR8CdeAFneP+06Rh6rMjastcS88tricpTtMpl78DjJ2f
	0tBEctYt+J17S30HSGcBYgn6PzykKfGm6846IpYWI4kBhEFpGdzYaGXF+ohznlt9yMANrV020Ah
	KXA/g7ZJxnrbNYuB1607zAVeXEiL0WvQK6iI12toxZ+XQ5psvpZSmbo8m7xoMUVl4Xcc2u+K8iq
	EmwPR2CTBmTpMPVp4QwZ6bV33euGqULLNtFuvxv91RJJLJ5Azgj/dzFvwzL14wolMqMkLPEAdNW
	gr3k4KnsmupjzygIfCQHyqOOqLBbEle0XLwK0LpL/fXrf2PCQtx65CxtPt8x+jpFwxLHptu1n+S
	b0EmERcrkHSfiwmj62AHNnpWU4C6LpXxUtfaPEk9iCe48OQqwU6bFkHVUYVQnRzRjllSd9UCSyk
	wsEgnCr+5mPbw56kjF+4dkVqaO1volG4y74iJC3hoq20Ro4G+pWyQiSXGXRuPvHt6JtYYTUi8ya
	JQUJMkrx+cLdIKqsaSiMIdlQExrbLT++urTWkYED8PAWNoVTKPBiIXDB6L2qrxAvZlZafF/QJDH
	6qE8T506xcqC5aU2bzK8D9wtLvfnJJ/iOlLCSOe6fm+iYa3sNo1g6/q7Kw6xG30duiulrZcI7JL
	IH3gCpnVK+52VY/tOVDO06DRwfPmL+4OM7QNto8fjzEa1u964t072HtwYkNVFJgEjXt83vVC8FQ
	Hn+KeEZL+TGraXyZpnsyW8wJwY83I5i2vzjHxGnwxHR0PrGymW9vtWtcB9XutVL1uj1KgmwCToz
	9SbN
X-Received: by 2002:a05:701b:2918:b0:192:e5a8:6bae with SMTP id a92af1059eb24-1b570d52afcmr14326228c88.40.1795762943994;
        Thu, 26 Nov 2026 23:02:23 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm53911395c88.1.2026.11.26.23.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:02:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 08/21] faenza-icon-theme: Mark upstream version as unknown
Date: Thu, 26 Nov 2026 23:01:56 -0800
Message-ID: <20261127070211.2329979-9-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
References: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133335
Content-Type: text/plain; charset="utf-8"

Google Code is shut down and its read-only archive bucket returns 403
for directory listings, so the check reported UNKNOWN_BROKEN.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb b/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb
index 922c93cc53..a889ef5f14 100644
--- a/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb
+++ b/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb
@@ -11,6 +11,9 @@ S = "${UNPACKDIR}"
 SRC_URI = "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/${BPN}/${BPN}_${PV}.zip"
 SRC_URI[sha256sum] = "d4486fda0413f8a81a87e0dd2329f50f2a8a7cb4147b48cf147f0160add8174a"
 
+# Google Code is shut down; the read-only archive has no listing to check
+UPSTREAM_VERSION_UNKNOWN = "1"
+
 do_install() {
     install -d ${D}${datadir}/icons
     for theme in `find -name 'Faenza*.tar.gz'`; do
