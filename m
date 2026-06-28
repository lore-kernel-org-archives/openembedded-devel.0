Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B165C4450A
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:06 +0000 (UTC)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14733.1782634325616389373
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kgduCJq5;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30bf8b2bd20so4928805eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634325; x=1783239125; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2eK7DYBFQ/hSbt9sKbfVfNek2hAuaovISAIdUswZ2k=;
        b=kgduCJq53dvugKYGNmdu7abG/fENHuGPfq28kQ8ewx11ou0FOE7M4/7S5GtsSoMKST
         l0OrMPbE3Mng6uq1JA91kxfjN/Zilm50Fo6tPly0MjFSDfu0h0NEbcVr0QChKVk36taV
         y5biqua6/I7y4CrchoN2jEkz6UCXhJ4fNkPOu54z0e7lrB+Rh44OL0zBeFWKsDrJho6K
         tDRdqP+kWVnY9NGv796Y7jbIMBjIF3JAbw3QygFv4c1KYh8ioafda/uo/BfKJ8XGLrAJ
         mmJ7xX2dtPoxvp1WJD1kqLjljjgPbagQGdbg7Y978tKJbYKS5uY7iotvwPWZVk/yXibc
         L6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634325; x=1783239125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s2eK7DYBFQ/hSbt9sKbfVfNek2hAuaovISAIdUswZ2k=;
        b=hR0C6YG14gRofMD6QSgVHU7Lf4muxz6Ca883OhSPWuqN/mFMrh9O1m/wjcUYdDXGbz
         FdEHg+47Mll+ipksWaFt4FaObjrQOhs2acuBr0Q6gGvggVWIeq6E7vUwPkVxOx7mvxvJ
         taRn6tPOjAQcHHj9sZziVLi3rp+nr9u3uHmVMt3W7J0AYDjd7eXllx2NrOsW3gWg1WIb
         gzJh7l3G1cUXf1gSfEzsfHA0KEnrvqRPcJ3bpmDT/iHJt5eNe+8aGu+kZp6QhKs8ntC5
         21VcUj3EPo7c74SehMk82Yrc3jUFHVdVgTC/gfnDxx3sVp2fkqp6Waz/bnM9IN8kCXJ1
         aJFw==
X-Gm-Message-State: AOJu0YyHOLTQNQ0JRloPgHlnblIJmqo7DySSxAM3D4oRmp4GiIbNpb1T
	uVl2lQSiwydlS6QyTzlcb5bqliGG7hyzVIwDNPMoSSmfAVGrKcNUXp8nuxrqK0lBlzmeVQ==
X-Gm-Gg: AfdE7cnj5j7IXgUl67ieBJ42pbfVwb+Z06NC3pf13fwjo64QJ5us1E9VWFg0iz6ziEw
	cv0FmEeJd6lA6KOBo183dDvkOXHowBS04lu6DaO6f7RkzjcxH9vW4Vz+luI0lhWKgWuKWoXqga8
	nlkS1M+gIUdfLCcy1CMkzkeNEM1YTKXJyMYAp3w8RYJNTwDzDZk8/VuM08m7sBMRoCBRY0pvrgk
	cqv487Sky1vAydrHaTW1sN5hR27oJypISf0eBa2g0snF0ylMds2SbNUgzu+g51abV+bG99lvo8P
	EOOhGfe/INbdGg5rCu1dqt4TU+n9X1Gj9lcazsIff2CYdTD4oaz6oLSAip86vO+c5hsRRoFW5wG
	2wa/0Iy+DzJ/+TsIvqWpm59+D6emHJcn59vEOhLG5MJQ+jImNKAEM/5rQoeerH0nanDCR++8fn/
	SLbFFS9+EDGBjviF14s6PhUXOx2zdDDixvyWpwXwSam4zWZDNtdrLA4CisPZ8OlI2SLIxS6jYQx
	VUkODNymqY+1aCbBH8fYUSC9CkYrixIibOD4QE0lKPCAgXjwAbKvMkId2GhuUkSmZr0hu8PYw2w
	SZYnDAkyMjDWbivjl4oio9NwqZOvWw==
X-Received: by 2002:a05:7301:2a24:b0:30b:f73f:ff6e with SMTP id 5a478bee46e88-30cab06e5a1mr6586096eec.11.1782634324917;
        Sun, 28 Jun 2026 01:12:04 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 043/128] gnuplot: upgrade 6.0.3 -> 6.0.4
Date: Sun, 28 Jun 2026 01:09:54 -0700
Message-ID: <20260628081122.178348-43-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127853

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../gnuplot/{gnuplot_6.0.3.bb => gnuplot_6.0.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/gnuplot/{gnuplot_6.0.3.bb => gnuplot_6.0.4.bb} (96%)

diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_6.0.3.bb b/meta-oe/recipes-extended/gnuplot/gnuplot_6.0.4.bb
similarity index 96%
rename from meta-oe/recipes-extended/gnuplot/gnuplot_6.0.3.bb
rename to meta-oe/recipes-extended/gnuplot/gnuplot_6.0.4.bb
index 35c83fd23e..fce316a7dd 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot_6.0.3.bb
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot_6.0.4.bb
@@ -21,7 +21,7 @@ SRC_URI:append:class-target = " \
     file://0004-Add-configure-option-to-find-qt5-and-qt6-native-tools.patch \
 "
 
-SRC_URI[archive.sha256sum] = "ec52e3af8c4083d4538152b3f13db47f6d29929a3f6ecec5365c834e77f251ab"
+SRC_URI[archive.sha256sum] = "458d94769625e73d5f6232500f49cbadcb2b183380d43d2266a0f9701aeb9c5b"
 SRC_URI[qtplot.sha256sum] = "6df317183ff62cc82f3dcf88207a267cd6478cb5147f55d7530c94f1ad5f4132"
 
 # for building docs (they deserve it) we need *doc2* tools native

