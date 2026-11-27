Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10281.1795753060928361917
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:17:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=lQZ9PY++;
 spf=pass (domain: gmail.com, ip: 74.125.82.41, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15dd124bbe7so11214683c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753060; x=1796357860; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ROKsBv1/nKojAbEHiVG7upzwbFrfSlbJMJV9OuZ4r9E=;
        b=lQZ9PY++lbvMROkqh0260r/YTIlCO/pkuOMiEO+oefZvJ6XcwKVl3kl31pkG+ey0fA
         0whO2Rq/uvO0lXk+3CXNFmlprg5LdoLLrUcfWpzcA8EogIZraQkyYQGYbi7F/Av9MPvp
         GVhBzTecQkin/3G+M6PpRdwua05V/Bf4MfvqNvDlkuQ+B2e0kT0Sl5+g3S0Tya3ZO/4U
         u9zzC69oLST4oGyKpDiJy2fTEWXYAP5zBR5MAvpGsgrXQ+iOXfCcpZ2/0SE+mA/qj4JZ
         5zJ/Auc8zjnqxjKR43nJ4Z4+iBrsZR9H9I8Qh60OZ73FMuP3pdJqHoFocyY4QGyioppe
         A57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753060; x=1796357860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ROKsBv1/nKojAbEHiVG7upzwbFrfSlbJMJV9OuZ4r9E=;
        b=gZXAIW0/v/eUWmNhVJHH67orxaYpwAoTTcRRQQL1K4THO8+SODXx0yx1hprJHAlgXg
         ggXB/4jmF8TBzOHeSxgEtq2wmo5e4VLlIoEr5QHCb76nZ30/mYcDYfXDAzjF5kb8NazQ
         EdBlPHbQ7Pw4h0AHVNUsSNpi0NpiYyTNm9l12UX+EC5hvOwNiyl0/pSuqkh0RRwt7m7U
         r7SjKSAxVRmZw+nrsNdgxIRr+DClIJ6UU+HRIdiVexajcQuHnAs1CdJB1k+DGTdupvNK
         cRtIDgnfNCkNYQhYlEvfRXbV7URhq9DJCxkJnMVcL0Kg7OrAMCNny2RO5irDNLw3Vj8S
         0dzg==
X-Gm-Message-State: APuU4Z8KbfJGZYIXWWcOm7hb8E8r+Pko0BtWDpC6QWM3/0dVhr2YqM9Z
	MxrlqiiZpJE3gcv5cWuesjVv058kdpAGNGixWDqsPBN3NhsxOdf2V8MfF7JB1q8D
X-Gm-Gg: AZFdTZcQnooaJ+udtVMU1dSdzqqu8Hw9eSmk3pP9IotAAeATbEEGYOnQldaVxLna8mu
	/nk7UryruTtgOOhqdDM2ByOBDazingkbNLxDhGTSFObOYxAIrYHzgoZ8kiSDaGt+bZ10zNQyCdB
	Q4GGCjsDH9jPebDAcVFSkrPB/f+cFLxp3uO005Kcb6XtLNa0UH72VELmAa/xP1TUrcMHhKoHHYs
	qqtkEbP6JbdM/yrifCdSsoKKQoaAvPa1THqtuGZrzDj/qtwSFUuLEEPfWMcantJpRn4Nb8NKHcD
	THTxM3fiZ8X4FFiwZ0ZGT4N0Lpdyo8myouqzQa8X8PWVG6t9MBXGPpMMvDm17Ounh+7HsRqDiAW
	lcF7NoJVYHgKpjLffe7NAiHEh0aqBnhFBKxRNEyfQEU0ERJkMPr7AiBij7NEulH6j7iIDlhuTsV
	wk0PgV+4lnL51uEp8xUWrnsF0JofqoXBpDx6nazKXAiwLV+8zcPzPEVv1o0lxws67SYjYVGSZUi
	3d6g3+U5vYJdHxkECIflekh83PdLp+2e8Ljr5fzgG5Uj5aoWRTAV8kvfD0Jsa2N3Rg7KEk1Ritj
	cd8dGeR/0hy8731uUMKnk8BpUUeFBCk/phd/fAQ2M4XQnIOapsyKqXvnrelip2Ixhzcc90ajPP3
	N7+8GnJ+7yjY32f0B7wEpM340ldIsnC8zmrU9wOD/fC6eqCXnqpKiGbbbXRQJghmfzLvyLJCfNR
	3QF/UPXSMmuq8O/+XFjrkN+HCpcpM6iAP8ots0Nq2Fo5i419aoUs0SkdYirKrNPxQMu1CVHM9GQ
	WWIGPEYknrZuXQSDcrJzL0SVoOfedS5SBPVk8w3+4a6+zGTJCQ5B6UYDMl85uSd/2dZOrBEtptN
	j6v4
X-Received: by 2002:a05:701b:2814:b0:1b5:1a5a:1dc with SMTP id a92af1059eb24-1b5568bcbb3mr26650972c88.12.1795753060253;
        Thu, 26 Nov 2026 20:17:40 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm53880225c88.12.2026.11.26.20.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:17:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 20/35] pptp-linux: Fix upstream version check
Date: Thu, 26 Nov 2026 20:17:00 -0800
Message-ID: <20261127041715.1776485-21-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
References: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133272
Content-Type: text/plain; charset="utf-8"

The downloads.sourceforge.net directory is not a listing, so nothing was
found. Check the pptp folder of the pptpclient SourceForge project.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-protocols/pptp-linux/pptp-linux_1.10.0.bb          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.10.0.bb b/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.10.0.bb
index a19b313cc3..b92594e6e3 100644
--- a/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.10.0.bb
+++ b/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.10.0.bb
@@ -18,6 +18,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/sourceforge/pptpclient/pptp-${PV}.tar.gz \
 SRC_URI[md5sum] = "8d25341352fdae5ad5b36b9f18254908"
 SRC_URI[sha256sum] = "82492db8e487ce73b182ee7f444251d20c44f5c26d6e96c553ec7093aefb5af4"
 
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/pptpclient/files/pptp/"
+UPSTREAM_CHECK_REGEX = "/pptp/pptp-(?P<pver>\d+(\.\d+)+)/"
+
 S = "${UNPACKDIR}/pptp-${PV}"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
