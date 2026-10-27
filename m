Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14843.1793092858478508046
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=cliqq/yh;
 spf=pass (domain: konsulko.com, ip: 209.85.128.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso20883775e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092857; x=1793697657; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KHcmIvgBSKbxqFyl3IyyesGDMxrr7erRdHChvFzWbes=;
        b=cliqq/yhvc5niUkyhtmRX8X9mdSf7eVKrJyrYa15R/VhzOZmXZc82w8YDgCwtHe/ZK
         njfbeoEgqgdaQMlLxFKRJlrlra/GIqEYJPpRF0uF6kVDZTN8YkobSOKKUV9XpDotviPy
         InZhaae7JzDi9WR1c96yNNSZEZHFjZoSo6ew8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092857; x=1793697657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KHcmIvgBSKbxqFyl3IyyesGDMxrr7erRdHChvFzWbes=;
        b=vsojNw2d6bvPI+qmw9R0w8voYcBWz/07hF30LhmskbaA1K5NwLW62aNIKr7zgFf1ly
         xm1I8CfpbC4hObnNFWhNDSty9VZ0dnhQrgn5+ddokADUJII2nlYPi1iQdJ4fD9/s3GJQ
         XRK1jAWBSHrVzxwX1bEoQPt4rqQ9j3NjY9Qvb8xDoLbCzVefVjVs7oDemFrcGCfOgTpz
         gMKlOv+j9HUq3M9MVYcu6oGa5xJtQH2BcbBMAgpuxt/kkqmMQQxlkm0R8hIXEY/6H1Eq
         LHGR0XIJxyzkkGzWIMdZnGF53Rl3M1yrbLkxPmz0Y7YtWIc3jrWEbwctn03PzxEUkt5R
         eMsA==
X-Gm-Message-State: AFq9FYKvsJQ0ZCIttrDPLv4j3mpRH7ZqtURUQR/HI8QVDwVJ2p/1Dfgl
	6p5fV7EVBT6Elhdd3kZm41xm5L2lXfl72JKKFeNNhFrmafxCiNw8j2M1WyL3aFJ2GvQEo4k67IS
	gvXWG
X-Gm-Gg: AYBFou0o5z1gG/n91XVsTHmJXjdm5WIhEgAb6fvmuTX/Eu2kxC/t/dmrQ/JJMBmXuRK
	ZvVNw87zD3noVNHOrsA7m+PDT8dQQdKZVQfLMJRpuJk3IFzVqknzCbRHa8BsIFrI2bLwt0nutB0
	CxclsMuggwTHP2iaZ8dVXDNtKV+gSOf0T+R064RgYaJ1u3i/DlVRSKB2p+CVIY3dertnLDbon1J
	zGh5gh9FUfz653WwOXR0W/r7Vcq4Zwnv4DijxUj63a/jaZpmdrx4oQrUrZBoSJ6bNcLA+HaaAS3
	EaPiJ4aLXBp90OuFktKgz/Ul3IA6NVsS80hZGXDfU4q8w0r2D/94bDEn30J4lopITSUu9q421ym
	CBIcnXYie5rLWa7xVZ/0+s9IvAo4uONhs334wU7yPo+E0ZYyUxfo1NNqIixzb42A90kiOPxu4Po
	CdWppEVrZIaM83ZQchK4ncjae1JRJ5oTpa+B1qlQ/RYNYpKN/2wkdJhkEwTXCTb5eW8GSv0jD6Y
	wEK7ooV/JyCSPYM2PCQrrKu3qrAgkaLBKVJjnK3oDTxtT9ikDlSb2Bcy0rLzvEvDG0z97ChOk8W
	WBDf0bqXVYZBooGgbrGkvpb0mKQy+fxV85fzAWhSnYHqfUAMcZyj+uT0LGG7043XNlDAbZBcczQ
	HVTyIpQPjINLyrSP5Qixpj4r+aw==
X-Received: by 2002:a05:600c:474a:b0:4a2:d99:3171 with SMTP id 5b1f17b1804b1-4a35acb586cmr179324885e9.23.1793092856743;
        Tue, 27 Oct 2026 02:20:56 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:20:56 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 23/61] python3-pymongo: Upgrade 4.17.0 -> 4.19.0
Date: Tue, 27 Oct 2026 11:19:50 +0200
Message-ID: <20261027092028.782979-23-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131487
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.19.0:

- Added support for Python 3.15.
- Dropped support for Python 3.9 and 3.10.
- Removed support for PyPy.
- Removed the deprecated Algorithm.RANGEPREVIEW and
  QueryType.RANGEPREVIEW members (PYTHON-6009).
- Added support for running the synchronous and asynchronous
  clients in subinterpreters, including inside
  concurrent.futures.InterpreterPoolExecutor (Python 3.14+). Only
  in subinterpreters, which do not allow daemon threads, the
  synchronous client's monitor threads now start as non-daemon
  threads and are stopped and joined when the interpreter is torn
  down. Monitor threads in the main interpreter remain daemon
  threads and shutdown behavior is unchanged. Note that because
  these threads are non-daemon, a subinterpreter may block on
  teardown until any in-flight monitor work completes.
- Added support for routing Key Management Service (KMS) requests
  for Client-Side Field Level Encryption and Queryable Encryption
  through an HTTP proxy, using the new kms_connect_callback option
  on AutoEncryptionOpts, ClientEncryption, and AsyncClientEncryption.
  The callback opens the connection and the driver performs the KMS
  TLS handshake over it, so verification still targets the KMS host
  rather than the proxy. For an ordinary HTTP proxy, pass
  HTTPProxyKMSConnect or AsyncHTTPProxyKMSConnect instead of writing
  a callback. Both helpers accept custom CONNECT headers, e.g.
  Proxy-Authorization for proxies that require authentication.
- Added the srv_host_validator keyword argument to MongoClient and
  AsyncMongoClient, an alternative to srvAllowedHostsSuffix for
  deployments whose acceptable SRV hosts cannot be expressed as a
  single suffix. The callback is invoked once per SRV-returned host
  and must return a boolean: True to accept the host and False to
  reject it. During initial DNS discovery a non-boolean return
  raises an error; during SRV polling it is treated as a rejection.
  It is mutually exclusive with srvAllowedHostsSuffix and, because
  it takes a callable, cannot be set in a connection string. See
  the MongoClient and AsyncMongoClient documentation for security
  considerations.
- srvAllowedHostsSuffix may now be set to a single label reserved
  for private or special use, such as localhost, test, or internal.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pymongo_4.17.0.bb => python3-pymongo_4.19.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.17.0.bb => python3-pymongo_4.19.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.17.0.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.19.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.17.0.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.19.0.bb
index 4255650834..820dc4bc14 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.19.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "70ffa08ba641468cc068cf46c06b34f01a8ce3489f6411309fcb5ceabe6b2fc0"
+SRC_URI[sha256sum] = "3c510dd3c5d9b392d3b33bb5d2a594758acfe8f026fca654253f947ce0af9d40"
 
 CVE_PRODUCT = "mongodb:python_driver mongodb:pymongo"
 
-- 
2.47.3

