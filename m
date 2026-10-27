Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14845.1793092863774157973
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=BPAHYLW+;
 spf=pass (domain: konsulko.com, ip: 209.85.128.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso40319725e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092862; x=1793697662; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PesXJ9eo3/ybY+lAHAX6D4F1XPP9wv6eNjO+m3/Pc5w=;
        b=BPAHYLW+qBByEzQ2dIaO1uOOVJAqw+GLAUAPxWhiSwpSEURRBXyIDJLZMxxLQ6Wirs
         6NaF5//K1CbJwsPQZoPVPYaaEeeNwQE/SgEghQteh5vH3Ei9vuB7TcuZpPg/8bwMVjww
         Ix448217FWByEAdLafkYcioDTQmlKd/wPy0mg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092862; x=1793697662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PesXJ9eo3/ybY+lAHAX6D4F1XPP9wv6eNjO+m3/Pc5w=;
        b=0o8GJqvvzgQ5tN8zYM7+v8YZd4hQBeLzLIK5tB0FolIHQebdB1ozni40Q3nEoINPwo
         ztm1dby7FtWeiFuPVWifC7KjVnC97gF5/NWP0Y9Kt2LmuQIyeV4KNBhDgBMNBIgFLxPC
         /skus1nLg33mZaQT6Y7cHmqi+p8zfq+Yk/wK4bgeDLZI6o/LiUQpvVL04xApYKjsaPm0
         ghWXede2127ibKkRYAGrMa9VUdbhcNT9y3WJO8CoxuRY4jbnWhtdh6EBnrnKB25NBrg6
         HNzRpxuCJA6R33oM0F4vmZJXHk0DilwjzzvQJYdY8/RGt3nCOhdet80m2bTUleHuKdJl
         Ofdg==
X-Gm-Message-State: AFq9FYKQ+LLfFuKw7k8U7qge3Z9dS859rsj3ZgfD7pz619xppXDt/b6Q
	0OUDMqRqgulAM0kv3rDq35XAnSAmDVdnnHUn6F5wTpGN5Wa+6k9gMs3f6mrhgvr8nFA2427aXpn
	pVsmv
X-Gm-Gg: AYBFou3ouC8IuNU7o60xq+1qhI5wQHQaoJWic4lQPTi9z/yzf1LO5jGOmPU3RepeAV9
	LdzlYjvw9RDs44AqDv7nUpGPBwwr2ZXERrKqZmCx/mA3TZfOgP0rVYaVWVqvkVE1uVqNrd0t95h
	KmrznT1QiiVDhCMxTnRS7N6ijD7q1aF3WWvXaqGOsni5kd5m5YIVw/d5lJ7kCl3Pmkglmpk4ZYA
	Lafa5oZFAO5OiZ2H+oOh7VMHk5Ub7Od370zkWqlxMUgOMKDNwSowbwQuNF/s/syGz/kO1MVjIRV
	Ytj/mCww1ufKMsF0cI3Txf3LzWHj6G0/FgQusrzYgikYl+5++sBoAk2J7oEwxT4lScOJfSqGQXw
	AKHmJMG/DeXpDaVLuGroqKAvdWa6nVcYeG5gkqM8ZyHZv8cs6jlym4IlO2wWeXseEzlNOsp5Sgv
	Z3yhQ9nFT5o57EsUaLczvmUSwNDQN6sE2pEtkIbKmYx5ugJO5UUL63Kg8NZf2hbb2XhescffAUe
	wlrrUWtGE5BBB5Q+mJ0VnjE4WIh4aR74x7B9JmrSqakjk+PNMEGmZ3eInpMVDmeR5IVKEe8eLQ7
	lyApcX9rkZRus4GR4hYQ8FvVx+ao4+2P3YCjQlYe2bQ6HKBpR2gxaL9r8SEQzDsgpOl8ApkQAm+
	Jug8XZfR+NyGWrorW2Mkgkk81Xw==
X-Received: by 2002:a05:600c:b86:b0:4a1:7ec7:a479 with SMTP id 5b1f17b1804b1-4a35acc1129mr170457635e9.33.1793092862041;
        Tue, 27 Oct 2026 02:21:02 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:21:01 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 28/61] python3-pyroute2: Upgrade 0.9.6 -> 0.9.7
Date: Tue, 27 Oct 2026 11:19:55 +0200
Message-ID: <20261027092028.782979-28-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131492
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.9.7:

- ndb: basic support for XFRM interfaces
- ndb: basic support for object preload hooks
- ndb: basic support for prometheus metrics
- taskstats: fix name unregister_mask() -> deregister_mask()
- plan9: fids per session & inodes per FS
- ethtool: fix the off flags
- dhcp: support option 41 NIS servers
- wirouting: link features
- rtnl: support RTAX_CC_ALGO on route metrics
- rtnl: add missing NFT flags

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pyroute2_0.9.6.bb => python3-pyroute2_0.9.7.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyroute2_0.9.6.bb => python3-pyroute2_0.9.7.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.9.6.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.9.7.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-pyroute2_0.9.6.bb
rename to meta-python/recipes-devtools/python/python3-pyroute2_0.9.7.bb
index ec72b450ee..10e227926f 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.9.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.9.7.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=dccbff78d7d79ae7e53953d43445c6e6 \
                     file://LICENSE.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.Apache-2.0;md5=34281e312165f843a2b7d1f114fe65ce"
 
-SRC_URI[sha256sum] = "6bc5e2ea9a372ded682b4ede4028ba00236bd6e35b42d833f39a96b219ef1db2"
+SRC_URI[sha256sum] = "a678b098478c46ec51d6bf9a03c3cd2ac0172dffa590e9e8c1eeab633d0c17c6"
 
 inherit python_setuptools_build_meta pypi ptest-python-pytest
 
-- 
2.47.3

