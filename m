Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37921.1795594060337057547
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:07:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=aKQFifDr;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-386c336eab8so1828472eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594060; x=1796198860; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fqIPJNO0rXKHxAeXpNkgvM9Ezt7XGcqsApfMJKfUT/c=;
        b=aKQFifDrq5CLRhhxVjKsto6Aip5Z6LBKWMQ3OKEJncil4NZqxz9smxf5Q5jx9YQogv
         k48o4or0oaDgvJrOa96LoLkHtGzLOf8dc2Nh1G6Pl89LJsoHCYdTAw/nzmTfj1Bj+iEy
         cZmFiemPC8I6gIqGRaP7DgM1YmBEoX9/rGvasgUumO7P1T3Ecxroeldy638rq/NJueiK
         T3lwIA2Rn8T2mPFdJmooC+JdiGXe0Zvx52FcdE1PMpB4dt0lhcWtBpZEsVioIjeVa1dj
         Oq1cgl1jjAvDOtFJc2jDawzXeQdUyHoWNRgzfo3Ggr9aF4zOzgdzH2EX0uARtOgKNL2/
         P3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594060; x=1796198860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fqIPJNO0rXKHxAeXpNkgvM9Ezt7XGcqsApfMJKfUT/c=;
        b=xr3Pm36VT9fNl8dDzN8/gXB+peFHo8Aoc5AWu72unoMRMEI4/dwrfHPeka407hVgTb
         BBTqJYomwz+Ir6T1jE83skFqKWkARyjSlY1cu/chHBn/pKeeiphMlkkgFrypVmiYvvdT
         fBqgA12j1j+al+TCy1W+W92XOOm9VveKLswyBEfY3EOgKxJ5FareqDLn1lX7P69wAKM1
         pbntnR3/lHHTtjsMZ4PJnQJD1vb7MhD8IHkMqVS/iv3nCCzPuJQOZ82h4kU2j8+RkHLj
         xVoj+eHQDfho/NIuW6ZCN8k0u94OdBYvSTLN5/EwDRjSvzjYp9a/GawfaPk5MoRthlsE
         HL2Q==
X-Gm-Message-State: APuU4Z8joTbcz1SpcUgylUiU1E4tfqtsDlPIe3EIBi4CoBvQiLdTHK8L
	qCqc8rGbOnb8rHEWPTddgUW7VvEbbaH06ATZ4MDcQha1KkonErmABF1aavdY9lQk
X-Gm-Gg: AZFdTZeqUjK4v7L7Ivm4QpdtaKB6z216Byph+EKBnqTdBIi619aH+LUh7s+Qh0ODL1l
	TydAjK6+T996vRy8XyNqgGIsBKc5tHAfBjUKSOooLFWUzLHFSRPrgn7q1txUZCJk07fPIpEP4gP
	JugQ8gxk5q6t+K7eHlEfoEqdh4GxPoDOX0X9XvkiaAqMEee7wQOWYz7WOLBFUPJpLfWpyN34l60
	6olZgZESqXlt3NRnYhvPENGq//hoPaCAq3ZHzH8x/i8a3SiQi0pCFRuJOK5aNjcocUTa/JLtgOG
	uHGNRDiF8X+9uGH0zAeC/y1IR/npKGmB/Ia4jNWYlvA6otEJa/1C5DLOg3kwi72e8J0AipNYTHN
	gsVyP+TbSKJuEOQgN1EYawZBWltxbg5r6QgIxY5RvqqwtLCPkMD4S9vNtvibHdIR/suVluAnJRA
	1fCC1qbi2BzkVWozeXL6NNUVo/6J6BZh1crhnXj+k9aAqqfzs7HVLBRb68FohPcKDKVTDf/Xv4M
	vemqhPjt1pBrWffkUy+Bnf3FGhl4yF+hgtHJ/cmoDJw28/O82QzoeHUc8/3WzvBoVmztrN2j1oj
	PRDNTARPO23Q92YLga5w8lWTJWW3waE9XOpmw85fCJpN6gprLA06PL8RK7wi0fRrIXoqsa2V1T5
	MaCltMSax+lNJVzyG+ZyHEtXPiFPi3CTHzeopcNNoH68ZW8y3CGGIOxn27k8i1V6HyE8vT6st+n
	V2pF6Y/CdCrETNDXkIcekdLQiRdOcbvtHXzfwrlSx5WN6jz+iuLs0FxhLe/LS8s+0XWuA6Y9FKT
	Jv+mJEayOVrAyqhqa2r7A7fsgazE/yTpnh9DUrmXrklypkYZYeLI14B5Wcn6Q8PTfZ8hFcxbD2q
	Ffx0
X-Received: by 2002:a05:7301:6490:b0:386:9618:309c with SMTP id 5a478bee46e88-386961832eamr16444519eec.22.1795594059483;
        Wed, 25 Nov 2026 00:07:39 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:07:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 1/5] wolfssl: Restrict upstream check to stable release tags
Date: Wed, 25 Nov 2026 00:06:12 -0800
Message-ID: <20261125080732.2419614-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132999
Content-Type: text/plain; charset="utf-8"

The repository also carries wolfEntropy and wolfRand tags; the version
check reported wolfEntropyv7.0.0 as a wolfssl 7.0.0 release.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.4.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.4.bb
index a2b41b2d3c..0259115bc8 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.4.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.4.bb
@@ -19,6 +19,8 @@ SRC_URI = " \
 
 SRCREV = "3c5eead44904df64e6a5a1f4ebdce377d35a849a"
 
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)-stable"
+
 
 inherit autotools ptest
 
