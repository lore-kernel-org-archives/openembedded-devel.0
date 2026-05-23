Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91CE1CD5BB1
	for <webhook@archiver.kernel.org>; Sat, 23 May 2026 05:01:42 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3043.1779512492651658088
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2026 22:01:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=d5wEj7Fa;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-839dc688d6cso3644718b3a.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2026 22:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779512492; x=1780117292; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d1kvPAw5i9AGQgcoRTTVLxHyyzid7J5F5FShgtO8fjE=;
        b=d5wEj7FaKP04S0Bq1uG61UUbCgfRwc3keCC8spzabzR0QcdHAP2j6VjhimC6o0kpnu
         MFwnFaYzJ0ZHyY4MsehGt378xeBQ7ma1yrV/WmybFvBJT7t23f3YXnZDU54JdcfSR90U
         U5eZHxDOQoueGOTr7la0qWKmfahqhFkQck4wHrvyd6pJHTWQPStrRj31WBfQ4McjvkLf
         d53c2DGNo/rBUjrMVoxbX4zrsqWbYEKbGDgS1NyRA0JE90V/nrpfp4igggSPNvzc4L3b
         nUfogQR1X9lzoxVnAFfBdKO8VhUy/fX3lT4HDhmfUy3kpYXjDaN4BYKVqiIWXloEAwLu
         1xdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779512492; x=1780117292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d1kvPAw5i9AGQgcoRTTVLxHyyzid7J5F5FShgtO8fjE=;
        b=FpE6J6W8nnASao96eYv6Kwy57ebPmgmaGLEpITidQqsnSwRu+s5SgMadpYaYxAS4S3
         wBWduLG0iohZO6Au0enOsKlIbq8e69OSMo7RWtJeRL3Hy06QSbWH12Pn9MBAbgasgO6r
         rT1Sajw6YDZZkhMSMpmLWDy3/RKUXJmUz/WO+7GwTTnkzSMxkgEa5xt99LIUyRRA4MAw
         5DpQRbeYQj5INJMS7bqzn0Bb66WUq0gfYmZtkBf4fn8CsFL7PoIf4hZnvCDLB8EomJt0
         QIezbJniIUwXCSzIxM7a0osVc/AkvRGRkQXXV6/QhaemkrLfakINW8J4p9zTtBNwH87B
         /xvw==
X-Gm-Message-State: AOJu0YwCtUFOh7XWps5WH2EQ2yMFzt5uFYinRomLs50liOp03q+oiDZK
	+k2TslG6mRMhZ9mVk6eM9WawbfaBMtcjpsTgOAgJ3FHrzDtKGybmiCCyrUDKPYKA
X-Gm-Gg: Acq92OGbpQXxhJPXTbtVCDCp5goqvuS9y1RMwjj3+Ncdrxh1bPb53rzsQuxmhUYEd7H
	8vzjwoVqaM4QbPu+RULv2JOvaa/J0XnLxZeVouvvxmdnuMGtJyTbDkWWI2okdcGjW/ZBeWG2Drs
	3vhDXXLZOHHzYPTelaefOlbi3BK+tEsCNVeMujKYf3xgNM1Gdt7npsZNsz2s9vHI3iKpU+OPAMF
	LXHqBiELojEdOluKVZdt9aV9BlVqyACgMoRll3cxyj/9NC0l1ePVDBbhfBjVTZmN+OaSlgnD2le
	uiZu++Jtkd7kvhLZBOakDUpfoc3wNI9vjzs9BY5KDW9RjNVsJWeyqwULnMHAKJWtB5IxQ+Te1jh
	gwh/0EEFtlkzyyhIS9uu+HyVpZFdIWtI5Ih5XLljRu/PBxbhGRCUElOBczrUTBNGeRl0pIEwR+3
	07HxNCXaHx0IJwP1jQfUFhIg3hGuS+H1KMtm3a
X-Received: by 2002:a05:6a00:bd82:b0:820:2f9b:fe31 with SMTP id d2e1a72fcca58-8415f32e8bbmr6389432b3a.30.1779512491969;
        Fri, 22 May 2026 22:01:31 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ad2ca6sm3423107b3a.5.2026.05.22.22.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 22:01:31 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 18/25] dnsmasq: fix CVE-2026-4890
Date: Sat, 23 May 2026 17:00:20 +1200
Message-ID: <20260523050028.848327-18-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
References: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 May 2026 05:01:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127168

From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>

A Denial of Service (DoS) vulnerability in the DNSSEC
validation of dnsmasq allows remote attackers to cause
a denial of service via a crafted DNS packet.

Reference:
[ https://nvd.nist.gov/vuln/detail/CVE-2026-4890 ]

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 78162615f538ddfde6886f1dc2a8c7d3d944c79e)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-support/dnsmasq/dnsmasq_2.92.bb   |  1 +
 .../dnsmasq/files/CVE-2026-4890.patch         | 50 +++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-4890.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
index bef058aa3e..61cdccb241 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
            file://dnsmasq-noresolvconf.service \
            file://dnsmasq-resolved.conf \
            file://CVE-2026-2291.patch \
+           file://CVE-2026-4890.patch \
 "
 SRC_URI[sha256sum] = "fd908e79ff37f73234afcb6d3363f78353e768703d92abd8e3220ade6819b1e1"
 
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4890.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4890.patch
new file mode 100644
index 0000000000..4a7673817b
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4890.patch
@@ -0,0 +1,50 @@
+commit 4fdb707633afe8028118bcaf39b4882f634b5999
+Author: Simon Kelley <simon@thekelleys.org.uk>
+Date:   Fri Apr 10 16:24:02 2026 +0100
+
+Fix NSEC bitmap parsing infinite loop. CVE-2026-4890
+    
+Report from Royce M <royce@xchglabs.com>.
+    
+Location: dnssec.c:1290-1306, dnssec.c:1450-1463
+    
+The bitmap window iteration advances by p[1] instead of p[1]+2
+(missing the 2-byte window header). With bitmap_length=0, both rdlen and p are
+unchanged, causing an infinite loop and dnsmasq stops responding to all queries.
+    
+Reachable before RRSIG validation
+(confirmed by the source comment at line 2125), so no valid
+DNSSEC signatures are needed.
+
+CVE: CVE-2026-4890
+
+Upstream-Status: Backport [ https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=7b151eb60609a0139474918222806f9bcfb4fe71 ]
+
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+
+diff --git a/src/dnssec.c b/src/dnssec.c
+index 4bb0495..3951620 100644
+--- a/src/dnssec.c
++++ b/src/dnssec.c
+@@ -1348,8 +1348,8 @@ static int prove_non_existence_nsec(struct dns_header *header, size_t plen, unsi
+ 		  break; /* finished checking */
+ 		}
+ 	      
+-	      rdlen -= p[1];
+-	      p +=  p[1];
++	      rdlen -= p[1] + 2;
++	      p +=  p[1] + 2;
+ 	    }
+ 	  
+ 	  return 0;
+@@ -1512,8 +1512,8 @@ static int check_nsec3_coverage(struct dns_header *header, size_t plen, int dige
+ 			break; /* finished checking */
+ 		      }
+ 		    
+-		    rdlen -= p[1];
+-		    p +=  p[1];
++		    rdlen -= p[1] + 2;
++		    p +=  p[1] + 2;
+ 		  }
+ 		
+ 		return 1;

