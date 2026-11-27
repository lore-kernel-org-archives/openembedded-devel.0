Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17900.1795793635611676272
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2026 07:33:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=OlEaTYsI;
 spf=pass (domain: konsulko.com, ip: 209.85.221.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-492f0a1b685so5894752f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795793634; x=1796398434; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jjdVFsjIj2xbS/plfUPc308zlvTZCP2xfistP64bTGA=;
        b=OlEaTYsIzHaIyq4rP3k82uZEJZb/7DjRq7BCobavyD7+Lq5n1Zscyi3YKOv8L66R7p
         RAv7EUgH03IyGtSUKnDW/Q7nLXaSF7M0leB2k3Oen5pgwbI7L48fvQZ5mRtXfcowjKT0
         vI09RNmW7lm3NDCt+7VYrr/zKkQAkI0hONxfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795793634; x=1796398434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jjdVFsjIj2xbS/plfUPc308zlvTZCP2xfistP64bTGA=;
        b=MT3JtyG3h4Zin/C/ZTjfVvO5e33nK2yCbsS1uyGv8GvnJnL7rYvUXdMdQdCLeOM/pl
         DgqaQ6xy50GpU+Kn4UNqrs6yX3ppyacgWBF1DuufePgHW7cwCP3+V2TGyUV7i1prcB7a
         QtFG+sNUwjoL5iKeCIVEROlt72Fbht4oUY6XcIubT2mWkZg3ZOf4IvLxl7+XYJTwMrDK
         ih1kJNSqFwmx5AcweVhcPiHuZxFwtJpEVYjggz8mafmV1ItjHdxVmkWFMj1z8EwT9o0g
         LbF2OTqGvYy55aI5eamKuPXqd9G+4X/XIQcoHQBT97TNqFdQJymIUrkHQDdRDYc+2Q9W
         djAA==
X-Gm-Message-State: APuU4Z+F+anInLIUYwqWx6DhGFLH6ne8xjqOM0emWV3lLZEp/DaNPUdA
	mFC1dpSGs98OFEvCAfk1B/RdvBOWS34eGJpGwigyNMQFPParHeYKN5/CAdZcU9O8s0yWfOs7qXW
	oXIlg
X-Gm-Gg: AZFdTZd+8XkB3fNJAutD6w6U4g3YkWDj9hAmYEudzdTVXrB8xuyWN1Dbtwphp9xxOAH
	L5djL3wcq4I7b/nBCrITCR7fo9C+uEA2fUTr41FJO+ue5rIe1BeDipvrEY6rhch0dH3qrOqgAWk
	ftGTItuOrx8KmwQSG3hczkAs+qFZc+BjvIk6ekgwuVD2xQriLp0EWs9Ol68NBKYUJ9SZa9Bvph8
	WD1VyaK+b6G1hpTMbGUnChQkM7oqnIK1IFk5bo/istGrCVm7fXELbe+ykCsVnZMqXPoVVhViduW
	drXrVhvZ8BaJrxWngN5duW04doW1Z7+xgFhtvoBd7lmfYdydAk7QhreqaqnORUZ/rqZtQEZtVf4
	02u6TQLr6Nkd/oSlAjYLFVESbeXeM5Ap1ryNDukH9qD9xE78v0eAjNlWm7RsbfABuSAJKDZ1WEN
	UylKfFQelWYYHV2dL6ZENtSG97MN7eXWBwYv9pwwl8xVm9gZrMRjrGFlCJ44QtSg2ZPVR2m6rXi
	7Chy58rI/Sf7KpXN6Mox3rHjiaYanasnWMk6JFpiKvEriwnHKY+BDSDRZWd/H0/iX9ve9TbvPS4
	/9spnFDNWJ3LJyhrZ70RB+0KfWXyNmanEj4FuXNnUmyK85SrAcLpyGZo0FcNDJ0/RDn8fThqPo/
	KbP2io/wddV22jxFg4ryp5JxFRAJ7wKHmxf2YfDYxiwqQ158Y90KYMg==
X-Received: by 2002:a05:6000:290b:b0:4b7:8363:682 with SMTP id ffacd0b85a97d-4b7836306d3mr25138152f8f.16.1795793633985;
        Fri, 27 Nov 2026 07:33:53 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b3415763f7sm24174207f8f.9.2026.11.27.07.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:33:53 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/6] python3-reedsolo: Upgrade 2.1.0b1 -> 2.1.1b1
Date: Fri, 27 Nov 2026 17:33:46 +0200
Message-ID: <20261127153348.2880928-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127153348.2880928-1-leon.anavi@konsulko.com>
References: <20261127153348.2880928-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 15:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133379
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.1.1b1:

- Adjusted test_multiple_RSCodec to catch regression
- Fixed: using multiple instances of RSCodec fails

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-reedsolo_2.1.0b1.bb => python3-reedsolo_2.1.1b1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-reedsolo/{python3-reedsolo_2.1.0b1.bb => python3-reedsolo_2.1.1b1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.1.0b1.bb b/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.1.1b1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.1.0b1.bb
rename to meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.1.1b1.bb
index 1c7d1b1356..a35efa6905 100644
--- a/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.1.0b1.bb
+++ b/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.1.1b1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/tomerfiliba/reedsolomon"
 LICENSE = "MIT-0 OR Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ffde61aeb8917e70e0257e0a4b6d103c"
 
-SRC_URI[sha256sum] = "e11528d63e75461d45b86c23f9db8260303d6ab6cae075fa9eddb44527ad8ece"
+SRC_URI[sha256sum] = "5659d59208af96fe5abf07e72b49c17a1788d4d2962292268a3080ddb39085c4"
 
 inherit pypi python_setuptools_build_meta cython
 
-- 
2.47.3

