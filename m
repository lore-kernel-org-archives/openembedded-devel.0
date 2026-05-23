Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2B08CD5BC4
	for <webhook@archiver.kernel.org>; Sat, 23 May 2026 05:01:42 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3047.1779512495657346141
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2026 22:01:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BLMDRT/6;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-841513664bbso1437946b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2026 22:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779512495; x=1780117295; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DLo+vCOZ6y5jJdU09iERlJUFMQqbsKhIPhcAkRGWmnM=;
        b=BLMDRT/6xBslrmmVFjBXrCOkQKru3KM6CUENPO8xr8JLbPXgvAZtNiEQ/4Li3RyTyg
         sbzKxmjzF9IectIaNld57SO8vbLxoDFTQ98C6t1WEBV5D/unROultDmmanxpkzngkBMl
         D34pICYNK7lkElESJNP5VrgnvDu5q+HAm291oYqfEf5UNEimM3bEjaaf1jVUOSQpS1J1
         5CQU9B2+sSGzjbuOHyYAByzMqRdyRa0pxAUxHq0wFkjPdaV0S+EjJcPAjsLSTAGXmevH
         2NddOrOMc/Z4uchYMNDVHUAzAThwHL5T1bAXSU7ZCNMmifpDvJSyNz5ZzL+iz7CrOIHu
         WsLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779512495; x=1780117295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DLo+vCOZ6y5jJdU09iERlJUFMQqbsKhIPhcAkRGWmnM=;
        b=mFCh5oTnq3HcakL6ED73kmE2kTDiN/rsg2r+ESxny33o5+w2ydYW7plrajgGOtvb2w
         uzmLr7DdjHqyoYJ/clNHoL4pzX/KgU7bAmW99IB9BaaDVXrDo5qy/6nQOEerAjexnbfm
         ATjfjbDCnb5kTSOFJjBmcBMmPzhHd+Qj9azbM0LfXW4IZOlf4EdWyQgx64FerCO7Jx64
         KnEL1CHxY821EgxZgdFqUiSa0Y80J2BT7nX9TTIM1EMl5N2nW8dCCUA0UqVJzo1u9+ia
         PJOHEh0B2Futr8J1jmZIZyHXyWKJ3ZFAVqKwo5c9Nj+I8AwHmPJLeZIC4FK2ulYkETR4
         xqXg==
X-Gm-Message-State: AOJu0Yz1MOLNv8GJkX9FvK49SkA26gCjyyZv+7P42hM62SL/3K2ABpb0
	GN2R0qpOzOU49GS2WY/53GtIUiXHvHDgjKA7WlJwpAOHa0LLnLATxezjgo0PTval
X-Gm-Gg: Acq92OHY6W1ig3zQIoBVImTsJdMMVfBZQPsKpB8ZMg50aG31VcCksWdREDVzFMfCi5h
	Zis8nV4NfaG6JQpkQL72IFGtyCe93bJnQAlthpN0/azW66jFkrvoNCg/TR1R2UMYQESR9Y087tB
	TeSMitpgdNGB3IygdJNpA78RvpGZ0cbHtuskSWzrZtxRPO7o+WNoHMDl6gfQfOIUsYc6hXNPY5e
	KeLXYhx+nue0a0odHgCMQaUw/qf4peFklWjx00RezwbZGXHAgNwIzBPYyhxr/05bcO6u8MRt5nX
	Yp3euZQcYAEYsxoDLwhvzfiJ+SWE3WLrRv8szoIpLbfargE4JeEuHpdNIbmUwkil9t3vIasP8i1
	PmjsODOHaMCsGBqF4l4GuMbUkdXiFY8FTp8bR7ulqp4knns/F7yrRZiCoKJNOlUT5ez1/6seRkr
	GiufIn7Gs1Kk81NqcRyhFZFOYLILPQWE9Ru5qiRwYq8m+1+0Q=
X-Received: by 2002:a05:6a00:bd08:b0:824:b304:2d1e with SMTP id d2e1a72fcca58-84160c0d30dmr5167120b3a.8.1779512495042;
        Fri, 22 May 2026 22:01:35 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ad2ca6sm3423107b3a.5.2026.05.22.22.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 22:01:34 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 19/25] dnsmasq: fix CVE-2026-4891
Date: Sat, 23 May 2026 17:00:21 +1200
Message-ID: <20260523050028.848327-19-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
References: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 May 2026 05:01:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127169

From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>

A heap-based out-of-bounds read vulnerability in the
DNSSEC validation of dnsmasq allows remote attackers
to cause a denial of service via a crafted DNS packet.

Reference:
[ https://nvd.nist.gov/vuln/detail/CVE-2026-4891 ]

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit a9de48a9fa55a254c0bf2eb528c81bd90e015c03)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-support/dnsmasq/dnsmasq_2.92.bb   |  1 +
 .../dnsmasq/files/CVE-2026-4891.patch         | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-4891.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
index 61cdccb241..850bfd2657 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
            file://dnsmasq-resolved.conf \
            file://CVE-2026-2291.patch \
            file://CVE-2026-4890.patch \
+           file://CVE-2026-4891.patch \
 "
 SRC_URI[sha256sum] = "fd908e79ff37f73234afcb6d3363f78353e768703d92abd8e3220ade6819b1e1"
 
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4891.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4891.patch
new file mode 100644
index 0000000000..e721f5ec0b
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4891.patch
@@ -0,0 +1,40 @@
+commit 2cacea42e4d45717bd0ce3ccfe8e78960245e5da
+Author: Simon Kelley <simon@thekelleys.org.uk>
+Date:   Wed Mar 25 23:04:08 2026 +0000
+
+Verify rdlen field in RRSIG packets. CVE-2026-4891
+    
+Bug report from Royce M <royce@xchglabs.com>
+    
+This avoids crafted packets which give a value for rdlen _less_
+then the space taken up by the fixed data and the signer's name
+and engender a negative calculated length for the signature.
+
+CVE: CVE-2026-4891
+
+Upstream-Status: Backport [ https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=788b4e0f6c05217981b512bed4e5fea6f8855d01 ]
+
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+
+diff --git a/src/dnssec.c b/src/dnssec.c
+index 0860daa..4bb0495 100644
+--- a/src/dnssec.c
++++ b/src/dnssec.c
+@@ -546,10 +546,14 @@ static int validate_rrset(time_t now, struct dns_header *header, size_t plen, in
+ 
+ 	   *ttl_out = ttl;
+ 	 }
+-       
++
++      /* Don't trust rdlen not to be too small and give us a negative sig_len
++	 It has already been checked that it doesn't run us off the end
++	 of the packet. */
++      if ((sig_len = rdlen - (p - psav)) <= 0)
++	return STAT_BOGUS;
++
+       sig = p;
+-      sig_len = rdlen - (p - psav);
+-              
+       nsigttl = htonl(orig_ttl);
+       
+       hash->update(ctx, 18, psav);

