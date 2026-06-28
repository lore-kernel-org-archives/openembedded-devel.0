Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15A93C44502
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:49 +0000 (UTC)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69155.1782634362883363854
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OVBPIZnT;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-30c965eab27so3695553eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634362; x=1783239162; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FL7OXhkBkebVnt0AouNoTB8HFHIV4ROWtY/cYqKQ/V4=;
        b=OVBPIZnT2snXd0bAvly4qcdUki3SS8Un4WHwqOGPB5fMIfXJGbgcAYDn/aOSV6bv4O
         GlCpQV5rggWhV73BF7mrXKAMGsR7WKavhLkHTXc42Lzgd9PtfUCkDVA2iAHtUcHrYfWd
         4HCosnDM0mVTn8LpXcc3if0OiTqXnYcmKM2VcFOK0Y8ie3Oj/+ARaeshCxKQHTfigV6W
         IKn1obrZeHchhGpb3WRG0eHFaU51WfWd4SOzvm1wXpzpz/F77NlQLQ7FrxTPbeoAi4uJ
         Y8W17EnhHj51GxTeoPkaASiuFy8+oSUv0jIz8tbLQ0gjpAKOOaRsO61jlt6RVlWGZLsI
         f67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634362; x=1783239162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FL7OXhkBkebVnt0AouNoTB8HFHIV4ROWtY/cYqKQ/V4=;
        b=J4MpAmu8kNwM0p9ADO/RxET+UnL6ozFmrRpc2RPtBkNJfYDTi+9zIlUNkb1bbea3rN
         Iq7d8HfSytigZej6sT63LcXpAD//hy5mXwUw4fZWk1wIj7buvt2QGpGV5ccA+SawrtKY
         9B0XvKRKUnouuLH2AqP0ZAD4XorhfgNtiJOPz9Ta7V5BwtXZ8v/SIPY7CElJgqOVzShY
         fGqRqZBatt+juxS8Nr66Wimgdl6z481n+tM9mHmIC8QOGQu8+RU6lVeZaUfe8PUoRfiO
         pZUXSHYOHIkMq5m9k1wtGaiWtZ5v7WCc4+/k0vDmze2sbzbrfN42AZtMGJx9cIsorges
         Z1jQ==
X-Gm-Message-State: AOJu0YyA5SFOJBI3getmQ+c3IY5r0i2unLl2Fm8hDbJ3xHC5PQi7vFPr
	5CX2rcHxN1CDPF+q2B+KtOV7V4m4laSy7fxrsQfDZzjsVnx1iN53wOU3FSQp7Lj5LYi1/A==
X-Gm-Gg: AfdE7ckxVdjSSyiQmgWRKgkfv0gWpmc+rLM47GdeKCs2n7WLrf2ee38ja9OST6pJvJX
	DQxznGJYm3ApAC+Fe9sbgGH1RMi9FAR/xJBNjevnk46KKs/wkDVmOsuUEnnecJ9cZAzyHBNcOmw
	xrkcYmYEnea97PhUiwA01PcfH9zMu+pdhjaBkEZWh5G8FTjoQ5BOPTZQ+jeyTX/og9/xdSMbRyo
	ry6jF7QmFfHNZrG4ROPBaRkE3nQNeD8Vyg6sgASxVV/U/cKMKSn8kra5uxHIkwJIxj8IycBq+01
	mFgfSsvq/Q/DNT8iKh1yt/E9E2OoJbiSEk+SfllCL7Usq4vsYbw6TqvUQcSkbkLdGAPCf/mgGHM
	XOlZAR3ioiT/rFH7cttqiyoMKKmHIQFzr0DbLLS4bEnOu/T+sLAf3YyEsusjMaHDZ2ztaHljFck
	ZEFk9nqL9l+PnRdjfQTgMTHSlCcW2cmhPPYXty53jkdACvUXwmzDEi/0a4M7zdi2J/1MsumR1tu
	gizKUyDEAxSzULuVs+CstK/3cTz2bkHaQBm12jtfRDDqBTzgn2ep+GILKY2uzJLjJUuo6l0Uo1Q
	ElENJSkThep0DINQQ2nUsgue/PnZUQ==
X-Received: by 2002:a05:7300:23cb:b0:2c5:b23e:48a6 with SMTP id 5a478bee46e88-30c84dfad18mr13732782eec.23.1782634362208;
        Sun, 28 Jun 2026 01:12:42 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 084/128] zabbix: upgrade 7.0.24 -> 7.0.27
Date: Sun, 28 Jun 2026 01:10:35 -0700
Message-ID: <20260628081122.178348-84-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127894

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../zabbix/{zabbix_7.0.24.bb => zabbix_7.0.27.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/zabbix/{zabbix_7.0.24.bb => zabbix_7.0.27.bb} (97%)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.24.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.27.bb
similarity index 97%
rename from meta-oe/recipes-connectivity/zabbix/zabbix_7.0.24.bb
rename to meta-oe/recipes-connectivity/zabbix/zabbix_7.0.27.bb
index 1ec159cdee..584dcf59dc 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.24.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.27.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/7.0/${BPN}-${PV}.tar.gz
     file://0001-Fix-configure.ac.patch \
     file://zabbix-agent.service \
 "
-SRC_URI[sha256sum] = "6f8ae990b9b25767e4fffbcb5cc7c455d674e2a392dc21478488a5d1c0e7d597"
+SRC_URI[sha256sum] = "15e4c233e65c87922824d01abad624f34128bbb4af021a75e38e89b68e13e851"
 
 inherit autotools-brokensep linux-kernel-base pkgconfig systemd useradd
 

