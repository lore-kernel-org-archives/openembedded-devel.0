Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC7E9C5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 10:03:58 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.2614.1749113008204486276
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Jun 2025 01:43:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MQ+mpJNn;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: ivitro@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so5189695e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Jun 2025 01:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749113006; x=1749717806; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PaKyCqc35DH7BiNsccyquwptu0eam5aXQIDIlFq5UR0=;
        b=MQ+mpJNnrhlzb6fzpW4xdBfu+dm2mNn32XBxx+hlmuRA6GJynQnb65NjUYbS1ABkoB
         41LWyKvPxvUNdkTjmiD96LYTVZbshWMg5C3LXIDGEGb9R4YJWnQBeEnSSPhn0y4MHtNG
         9Ixa6jOfqfn4H4MH3+x4co/pkSV2sCD+kszCfJGG6R8SV4EvZpMLvjoUh9pM2N+XAghD
         aWjGw5Uu9tV5uwmSMVi7FsYnBLa7G3X+8oU5CSnbXVO8ARGEZBEXDPLoJJNUA3XBvg3H
         ga+CT3yamJfc54LQcaQf8Wt6kxfdT/atgfHig9luj2LXd/C8sFpoi4j+RiqcUESwvHsQ
         tPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749113006; x=1749717806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PaKyCqc35DH7BiNsccyquwptu0eam5aXQIDIlFq5UR0=;
        b=Pq732jJzokVDPYmPjqEdimH6MshsQKfR3/T0iniEOyx5pWYLt4CWj6PsdXfQ6artDG
         mVsP+KVF8oKIyDsErfdil5PtcGH4IgwJ+ErYWeVXwuZPwuwpDShIW0B6TL/si3zZy8J1
         tIAddPDFfiqgKnQkUBdclaPJlIXvEfST0RjFenIjytLun/SZ4jfRV9FVsMJYLlaV3NW6
         kdRlwurMpvggdbyE/kAkIEHcZAQqBKhX2o/baNRiwKPTVQioq+j65vraivkON7b10thR
         DxARuCQiVFcd39ei2F5x3jezb9gLLEQvBLSMYYs+Z75rG0DPvVEDmeXHv+EgMvhA2I9p
         vHgw==
X-Gm-Message-State: AOJu0YwpHe0ReDPRLsAmLAYmBy4sL6/SD4of2JU+b13+RrJ7W8VJv7Nf
	3x5q21tc82h/Y0WPTn7WqNsSZWXyJe2gLU4CA5ROahWQ3w7XqupBfwNQGL1FQfmC
X-Gm-Gg: ASbGnctz8m6pCMrd8aEc8btc58chnsnyrf/YRwqtAO+CS0ZKLebtYdzGQwQfwK26avZ
	3UlrilwBIc8z2WdMjmwExhbr5V0bAokmv/vtUwAknmHxSKOwhodHF0ku43PS2p5JRNcn3RMF4qW
	Rf2Li5Rq3yvbSXyCSw3VFjNDh2SVNi2071DokSuEdAQoW3W04AFS8fD4IZlQDfr6LRTISjAj19E
	0mA2gYk72sZCJ4dDhXhExoI4oz+4+aJ/Qwi3V+FNSZ6tqjKtuk6SrZ1NxTIRMElFXWYhIVZyPCE
	1BexVuLJ/mKe/f8KILKDb0bQXvH0P/SP64sdUEAF8L28jAMbltCV5bXF7KaN4ntEGp2Ot+kWid5
	VNBc=
X-Google-Smtp-Source: AGHT+IF78NSmHR7QT01ZBjf/40GGRZPomUliyz6gtQ2ZGr8oNxEPetqFPu17SpvgvLmcWKlwdpScRA==
X-Received: by 2002:a05:600c:6086:b0:43c:f513:958a with SMTP id 5b1f17b1804b1-451f0a7728fmr58255635e9.13.1749113006268;
        Thu, 05 Jun 2025 01:43:26 -0700 (PDT)
Received: from vitor-nb.. (bl21-87-120.dsl.telepac.pt. [2.82.87.120])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b89dsm24165668f8f.19.2025.06.05.01.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 01:43:25 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vitor Soares <vitor.soares@toradex.com>,
	raj.khem@gmail.com,
	ivitro@gmail.com
Subject: [meta-oe][PATCH] hostapd: enable SAE support
Date: Thu,  5 Jun 2025 09:43:23 +0100
Message-Id: <20250605084323.878533-1-ivitro@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Jun 2025 10:03:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117749

From: Vitor Soares <vitor.soares@toradex.com>

Enable Simultaneous Authentication of Equals (SAE) in defconfig
to support WPA3-Personal authentication method. Required for
modern wireless security standards.

This is build-time only change with no runtime impact - SAE requires
explicit configuration to activate. Existing WPA2 setups remain
unaffected.

Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 meta-oe/recipes-connectivity/hostapd/hostapd/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/defconfig b/meta-oe/recipes-connectivity/hostapd/hostapd/defconfig
index a62bec4034a1..7f8e0b9eaafa 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd/defconfig
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd/defconfig
@@ -142,6 +142,9 @@ CONFIG_IEEE80211N=y
 # IEEE 802.11ac (Very High Throughput) support
 CONFIG_IEEE80211AC=y
 
+# Simultaneous Authentication of Equals (SAE), WPA3-Personal
+CONFIG_SAE=y
+
 # Remove debugging code that is printing out debug messages to stdout.
 # This can be used to reduce the size of the hostapd considerably if debugging
 # code is not needed.
-- 
2.34.1


