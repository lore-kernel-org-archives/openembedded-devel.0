Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28635CCF9EB
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 20:10:24 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.1237.1761595818906282314
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Oct 2025 13:10:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B51QxkK7;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-475dbb524e4so17309275e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 13:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761595817; x=1762200617; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EkkVPds+jIDa5heHB+SnWRcojWKkEv26k8P0jAqEWbg=;
        b=B51QxkK7eIYcaXaC6nIKN2sALiJQf0l8qy1HvTKZtJTkvmVExaOU4eTCi3SL+E7uc+
         /JV9Zg5vAXGdzij2d8cS1mWqbohIeGAi58DsFQ07C1bDTMsrULgOZ6uzAGnuqt+q4BXa
         t3KUAodeyr1S+Hq2dDFLAxILVbBII7PkLDhrcG+yfZh46nGlUGmLnvYfGAmwaO+b/ovs
         kONwSB/22AcgduqDodu5TO2Z102bVD5v+NC9ge209fobr0WJGzEZh2vfG4ygsCRgs+HI
         q9OzHHaRFM5Aa3n3aq+bAnL3CykX0lq+ppejaEAAfvcRMTMd3FCYPd2kYf1TivHjObFF
         c3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761595817; x=1762200617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EkkVPds+jIDa5heHB+SnWRcojWKkEv26k8P0jAqEWbg=;
        b=Ra1Pqm0i9xz9+3ji7UphCROaw0vEV2wvyLiYwFhMxNLqGkA7LgpjWgZaEgzAG34FHd
         fZ9gN5bxCtCwofUBQKWDQ8PNmegvusnrg4CHrMRqMUOkXcEB2YFQFtxfOoN16iwQjz3g
         SoLLgmJO9S4fhyp5WdkY1YbRmKGuLBcBxYITUyqybH7cAhMUCkYGEx5XjDQPTmNe/W3P
         k0Dtp3UJXbANCOW+85zWKMcSeFau+thZ6tGUTAXTYIK/gm28PVh6s4d8J4L8v/Hrh7z5
         LOQAphnYuHq/p3PrOG4ZX4FVu9OvQ8GqjjrtR80/fMDmyzX3XbtlKVOsjbhxBVv9zuaO
         hbhA==
X-Gm-Message-State: AOJu0YwUkAK0NlWi2VFhCU3Kd1QubqhCRuwNUfC8d8QymEr658qVpUQj
	MyWw9f0Z9aAeMGIukGr11ERLwDQ15ZqK2NNI37GNt9nDuMyTLOpZv6gV9wxSuA==
X-Gm-Gg: ASbGnct+WVPHNelBVtvJhkVa1Kkxyv8DTnqV0kTkyLL88Pl6Bs9TgFq2u7dQSFO5cAE
	LsZ1nbCUkXD41GZogr+YOrf4iodDP3A1vkfW4Hb3j5QDUdm9yk0sqCpxBJcu5w75HFEG/Ev+4Y1
	2plJ1iNqyT9aT3fKUUqzCOc4Feax8JkP/pW2BgQC4czr0E1NttpWV5VkJA7hh6NhNhQL2H1Vkfw
	hEAuOwynOoOrNslRsgFDr+HyrpUgclj07temxqhvMx9CLQ6quEp9mlQU1foGSedJClF6/R3ifEo
	D5zx73eTsYCsIUBpWr1136cRpvyvm18IxXl3d7yq+DK3uRjADFkphyyRHUcbzqrlFdbifNuQeCZ
	x6YVO1fK/1gsBNs4PnVFt+8Ox5s0Dvag5zQFnCu8FGlrc1E9DnDsARgI2KJOFI2bZmff7G4anwS
	mGm7+ROpsK
X-Google-Smtp-Source: AGHT+IFCvoOxGi3eI0GaJbkJ3Gixbvfq9+mGPHZC0Cjdbnbf+xOiVcyFCM2uFLFHLoR9inz/Y1EJIA==
X-Received: by 2002:a05:600c:37cd:b0:471:786:94d3 with SMTP id 5b1f17b1804b1-47717e4146fmr6551855e9.22.1761595817219;
        Mon, 27 Oct 2025 13:10:17 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd47853csm155508975e9.13.2025.10.27.13.10.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 13:10:16 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][kirkstone][PATCH 2/5] libunix-statgrab: fix ptests
Date: Mon, 27 Oct 2025 21:10:12 +0100
Message-ID: <20251027201015.4098472-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251027201015.4098472-1-skandigraun@gmail.com>
References: <20251027201015.4098472-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 20:10:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121057

Add missing argument to perl in run-ptest script - one of the tests require it.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
index 01261d547a..e533eb8c8a 100644
--- a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
+++ b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
@@ -35,4 +35,8 @@ S = "${WORKDIR}/Unix-Statgrab-${PV}"
 
 export LD = "${CCLD}"
 
+do_install_ptest_perl:append(){
+    sed -i 's/perl -I/perl -TI/g' ${D}${PTEST_PATH}/run-ptest
+}
+
 inherit cpan pkgconfig ptest-perl

