Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.117.1624402950795319776
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Jun 2021 16:02:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZtkcRJQc;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id c5so736547pfv.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jun 2021 16:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l7MqL9ncBg2Turs0w+t9Jb8fHV8WtG/9VOVhlDWipQg=;
        b=ZtkcRJQcrWWumuHH68+/OALpqX0LCwcsvlAt01l8AvkraZFi9qQDzEuvopc1UackVG
         PqYFgU6ANhNLI14t5fxMQ3QPUk4rDVQoqTRTTH4AKQx8kayw8d41uTX6Sd6DrboT6nD6
         tCemXflHphk4kpUzaq8QwlsdcuMWceRD4QjgFJWmiY/5CLdh8UlHPZC1hHy6lRb0jw4J
         vXDNzMx1gkyoqxhBtpQm/JSRdoqKVV5BHFWZWLmLwKN0SIUdNeTC7pzRsJt/Bsvgdw+C
         VKUQ7MpxZBew55YPC/t9FqcqfRioJYpYaLQAm23lc6A7ju074fT1dNGMnNm6nhOOKrhP
         KH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l7MqL9ncBg2Turs0w+t9Jb8fHV8WtG/9VOVhlDWipQg=;
        b=CuGXzsaJi50+8Pm7VO37nDWv0TCghMLHBdtwBDMR/RNre0NaUiKPv+UG4i/Fp2nNDB
         QNcYSBgaTjyAK7P2+wMtDqHRPErOnntNx5s0Xf+vyjn22xslAO5785InIOhrG1ypULCO
         bETTJJjVsnA6PTsWObu2AUpyOJnFgsHeM2xbfn864bj9Up+4F6yjSAmPeQYv0OqOFqvw
         rPtB5lHIld85AchI6HkkSBKJ4mA211p28cyZh85+n0KzcATH3ZFBK8lKdA6mzD2ls3So
         GGWZzc6NLjWLbLf88WS23vTXSWv53jZh5CAVEkrFC9Qul2ZEP3aQHpNoOr5LM0E298J6
         estQ==
X-Gm-Message-State: AOAM532TWtVO//eOAc7hsG4EMW9wdC/NpYtt3eTCraVb+4qzxMlyvRt2
	nU0I7v6S+Wl17QJvuHKFAcdM0FjOvDdTjg==
X-Google-Smtp-Source: ABdhPJy7hO1ZecDpF5kOgQVdhZHBTrfov+xIE4SFQCfqZmtOq9VDAxpJMnpggwTeHQrwLTEXSvk2+A==
X-Received: by 2002:a65:67d4:: with SMTP id b20mr902027pgs.93.1624402950086;
        Tue, 22 Jun 2021 16:02:30 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bfd0])
        by smtp.gmail.com with ESMTPSA id r134sm332240pfc.68.2021.06.22.16.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 16:02:29 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] packagegroup-meta-python: Add newly added recipes
Date: Tue, 22 Jun 2021 16:02:22 -0700
Message-Id: <20210622230222.1754031-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210622230222.1754031-1-raj.khem@gmail.com>
References: <20210622230222.1754031-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 9f3d48253d..090b9802db 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -34,6 +34,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-arpeggio \
     python3-asciitree \
     python3-asn1crypto \
+    python3-aspectlib \
     python3-astor \
     python3-astroid \
     python3-asttokens \
@@ -114,10 +115,13 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-engineio \
     python3-et-xmlfile \
     python3-evdev \
+    python3-execnet \
     python3-fann2 \
     python3-fasteners \
+    python3-fastjsonschema \
     python3-fastnumbers \
     python3-feedformatter \
+    python3-fields \
     python3-flask \
     python3-flask-babel \
     python3-flask-bootstrap \
@@ -280,6 +284,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-psutil \
     python3-ptyprocess \
     python3-pulsectl \
+    python3-py-cpuinfo \
     python3-py-ubjson \
     python3-pyalsaaudio \
     python3-pyasn1 \
@@ -332,6 +337,8 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-pystache \
     python3-pystemd \
     python3-pytest-asyncio \
+    python3-pytest-benchmark \
+    python3-pytest-cache \
     python3-pytest-helpers-namespace \
     python3-pytest-html \
     python3-pytest-metadata \
-- 
2.32.0

