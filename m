Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B250C5B572
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 23:57:35 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2977.1787183845077742891
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 16:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QZ3Da76J;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cbee3777e1cso784462a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 16:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787183844; x=1787788644; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hqHISEwHjhGb6WmuglD21/W2rRNk8W7E/aeq8rirnL8=;
        b=QZ3Da76JJizeKdDF5J7UoB/QsT6gLj3MDBz5lVPIcRe8c1n9H8s+c2V83n9tanrxRs
         v4rNoMPbJJpfV0jhWQqxbhQ3kvZSu1RVe5sZsm+Zov+F3f7BRW9/VYEDRBOsIzJjZ9Hn
         NpJGZUM3BkmWnYrXh9OUDy+EqdF7MaBYopTYGlI9bsHJ9Y3NVGQRan+70Toakl1LI1Xr
         ceOkFUTwC9rF1yvVS1DhR826p9JiDK8m9stDjcgEzIlOat/2JBu+kmZ+GRnyu5Cy5E6I
         5TNhVsc+PVr0Zfm2XEU9XgMaK/j/YadgCTiRRdzmlTNPjFPbN2JxYphkG6lv2HtYv5TH
         JFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787183844; x=1787788644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hqHISEwHjhGb6WmuglD21/W2rRNk8W7E/aeq8rirnL8=;
        b=pHB4cgVPgbbHfiCTBw97ZpWRtsCKGwte4UNKzchzvgqGnyrpW/CRTN99MLyCWPMwUg
         gcd9vJ06cz3INmc2EhHdXUQC+D7KsqiJoVrB2mMH8+jr3SWOuKkehq2I7SmA7cW/cFW8
         7GjMOh03cg4rZ/7IX56HDXINdezczHS0w5MKlCJip1pf6oRPgCv1K3Uw0YwbwQd3GyJ1
         rwyTnLV/a7hia+fH2pfnVKIUQgCH8f8VlTpOuQ6YVpVG89GK9Yt3QPGqyTjMPGpsV8of
         M1oXXbTLU2qFoJ3lHjBz7aMX/VSwvt+7tZqtxzEjxR/045yjt40XkIn9UYdFib5XvS+W
         CEaA==
X-Gm-Message-State: AOJu0Yxk9DHPruUTfd80HoNgy8x59sCQ8B/U7hAFPFEJWTTGR+AD9foD
	NmEBcpEz7yjlZ/5D2/vc7S0saNxsvozH7erzSLY15nIlhgyTFxuzjjRU1E83UbJk
X-Gm-Gg: AR+sD12l3bRU4MNqKXZBBAJO/0NKmqe3QeMggN+sHFqoRP2CBRRzxW5uxFKSXxAMxZp
	24n39+weW3mjYJQjy0SqCnQ7hdlrdbCqB65liulXNAllvJiXl/NY9pfxoMRsKTXxKh+wIklKx0b
	5h6DsAazWY4TU5dhXZQdZZcKFhg3gop4PnKQnLlrm8u+Q58DoItD76JfhHxP/BUY1zjlGjF4VsB
	qfiQ5QuGRUAcDJRivTckC5m07RQ5r6Rm6+OkkcAJeBFVvDvdfIfslHn3PkDU/BtBYy+M9oQUlnb
	SnxpIpMQKAiDWc6xN+PrWZNqNJjmpX+P8BYr+E6JxvPRbeFPlBt839A6zU76S/CgovIcTFDzCi7
	JManRM+4V0I43koYsIhPvnc4Zz0hzBx24gZUIx7JAOa6K1Fq+9XI6WUTITewasSTBO1Licyyn0H
	SpX1e+0E3cIRQmyHuOEGuAFpFQ8Sl8xN+d268VPFph0nso3MOKV9fgnt/YcsVh+AEIK6JzY0Pu9
	aT+fC14uBSGrzKNDE9fnqst59h1jzo4WDkIgzYkwYkBC5we9ODGW/MtaQFQmZAcVJbV+/ducPQ6
	XIUG1GSFK/FJ1OVXkKCA2JZG4z65/IcvEDwrFRgr+MUnzo+rcyFWxFqnFlwREkx2YNU01KRugI9
	ecKzXDFProG5cr3Eig1/sULfiM4ikDH9gKZr1A8aIdDsd5A==
X-Received: by 2002:a05:6a20:c78e:b0:3bf:7bf7:7913 with SMTP id adf61e73a8af0-3cd0122509bmr19196708637.14.1787183844286;
        Wed, 19 Aug 2026 16:57:24 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf175399sm18411174eec.26.2026.08.19.16.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 16:57:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 3/3] python3-scapy: keep UTscapy failure diagnostics in the ptest output
Date: Wed, 19 Aug 2026 16:57:18 -0700
Message-ID: <20260819235718.3372843-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819235718.3372843-1-khem.raj@oss.qualcomm.com>
References: <20260819235718.3372843-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 23:57:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129370

From: Khem Raj <raj.khem@gmail.com>

UTscapy writes its detailed report, including the traceback of every
failing test, to a file under ${PTEST_PATH}. Under testimage that path
only exists inside the ephemeral image, which is discarded as soon as the
run finishes, so a failure left nothing behind but a bare

    FAIL: 000.01s Emulate interact()

line and diagnosing it required rebuilding the image by hand.

Pass -F so the report expands only the failed tests, and cat it to stdout
when there is one, where ptest-runner records it. A clean run is
unaffected.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-scapy/run-ptest                | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-devtools/python/python3-scapy/run-ptest b/meta-networking/recipes-devtools/python/python3-scapy/run-ptest
index 79e435a5ac..058bcea8a0 100644
--- a/meta-networking/recipes-devtools/python/python3-scapy/run-ptest
+++ b/meta-networking/recipes-devtools/python/python3-scapy/run-ptest
@@ -6,6 +6,17 @@ if ! nslookup example.com; then
   trap "mv /etc/resolv.conf.bak /etc/resolv.conf" INT EXIT
 fi

-python3 UTscapy.py -t regression.uts -f text -l -C -K skipped_ptest \
-    -o @PTEST_PATH@/scapy_ptest_$(date +%Y%m%d-%H%M%S).log \
+UTSCAPY_LOG=@PTEST_PATH@/scapy_ptest_$(date +%Y%m%d-%H%M%S).log
+
+# -F expands only the failed tests in the report, keeping it small while still
+# recording the traceback of anything that failed.
+python3 UTscapy.py -t regression.uts -f text -l -C -F -K skipped_ptest \
+    -o $UTSCAPY_LOG \
     2>&1 | sed -e 's/^passed None/PASS:/' -e 's/^failed None/FAIL:/'
+
+# The report only exists inside the ephemeral test image, so echo the details of
+# any failure to stdout, where ptest-runner records them.
+if grep -qE '^###.*=\[(failed|interrupted)\]' $UTSCAPY_LOG 2>/dev/null; then
+    echo "--- UTscapy failure details ---"
+    cat $UTSCAPY_LOG
+fi

