Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4933.1795147170131791449
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 19:59:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=CUWkglQG;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-372bdb942dbso576884eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 19:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795147169; x=1795751969; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/fqfTiewW/gw0W3/7xbeyM5VOnVgkf5L37Iis0yWMig=;
        b=CUWkglQGVHUF7TGdemwMooH4nfC60VfM3KYIH3L+tDeJwcgq6QPFETovRq0dR0SoGY
         KG1XLESktxplLnGb6dUdvVVSOFATj9mncrKJttevGIcBu24y4g0VkDX+98+EGIrwO3V1
         CoDwsZjt+BvqnVWSpNb6yRz6i525ASw5+VYLibeSWUBpzSZzUx9OglFurKKy4N/Z+gtX
         6YCjpYZMML9DWT4szzYc5hkDZ5TnvF0C/vJT5/j68QChLLNjL67uyAdNWAtUWSNaL3Ox
         eRfYdpDIQXCjSKemWdfMtkgU+/ERqRDOblr8XhPZThGf6VE8qRG9VufurV++gjUnzs2+
         O/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795147169; x=1795751969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/fqfTiewW/gw0W3/7xbeyM5VOnVgkf5L37Iis0yWMig=;
        b=GDD4+9ARLJXWnBNVqua5NvZxahzgXx3OIQAg05fcaX0Y7XhwYL6zYA2nFbxVUvnPdh
         Qh1xZzrEPhwVy4eTmz6GPvM2ht+CLHKJ4XI6lTtE3VS4zJVMfxgJ2zM75KRhJjjOxKkh
         RIA3sGk9mgH9uhhSLRkcUzikpuh8hqKzE5KC5+ay+wClKd/JqeHVN8rgEQ0MnaeOTlO4
         2tkFEdsDfErh3o8Riq+pe4fzNrKnypBIvVddZxcf7GMcvvO8jBh3Wp49dzkMYsuSv6ok
         5mXon+Oo+KaIkraEk9AFNMbcDXtXW+tVVEtsFz+ocolSjuIdawro2dc4nfBtXkHXMiCu
         hgYQ==
X-Gm-Message-State: APuU4Z9s/7buyiPl7avc1h+C12cANd1QL4HD9BtUh/tnDMSpaiQFsx/T
	Z3gYIk01uuyGByjzub9Rh0V2hu2L9o7osRO41SFPHe1ATbvwPHrYjkCAkhm6um8J
X-Gm-Gg: AZFdTZdBhtg4KUVVkOR5IXHOYFnBb967WaaSoXLksyApRo6ecnQEGTR/WXuoIm6WTPc
	aXE3E/tzurKMDY2wpxSg4UjdXLYzZ1Vi0bYhxRkFWkr++BasU684CeB+7cjkVb3cvLeb6PVZ/QO
	196G37BlIUJOSesBZIenwMxpheciTaek20sgaAxS46RveyPy9G81Uc5+KgJOlLQj7VPojaHtr04
	pKYPjMnZJ3L1cHojeC79p+xbwC+3jKEqyyG1P6hvjR62t8Zs3tA7nj0FqwheII0UkmL6Eg4upDr
	SqjKjMoi+PDHNDTQdwIghu7ojZkKpj4T7NuFQp5UG6jIHx+dMBeBscUBcSKojBKUYw63riU2Yfo
	mddKLX50cnoemHt7LQMl3loa28ETRitd06KVaJs3Wkxshx+yL4vGgCTzUMT5LIyapfoU0C6SY/J
	QJ2zx0GaXHVJXQUpKzSdwr0hTnclxHJQw43f7DWpffDcb53kKQir44yg9tW/VSYDgBgXSGTuLZk
	Ye2CbQBEmkcFFZnwSaBe8Nk7BK9BVZhu71HSO2SrVeUG06ryYYyPUETLyr91IKyM2cCztj5Nye+
	+eKqwdYp0DhCGswoas9BJFXVzwCN7N7KESyEeCte/GiWxG2/rD2Jdw6VKBxUXPvsXe+THnEZYr8
	ZZEE/fCkOTsDDhSm2+MBQ9uxoAO3XD6DfdcM71Xs6oDvkqGi5YCeBLu5+ocwaG3+lzUik134ogP
	Umg1OnB6YrTkQtalXlHDck14hxDMp/m3t/YH5lfns3GyWm3q2/JNer+WSFrpUMZBUnWwcipNh4Z
	0B9AIBrwXvOAGUJKl/9dFlgQDt+0IA8PHR8lPZrj4n28hcgA+KfGgnbR84Oa/DaV//sHYhIO74O
	2g4y
X-Received: by 2002:a05:693c:4195:20b0:35e:2c6:d46c with SMTP id 5a478bee46e88-3856f0511fcmr1456016eec.10.1795147169413;
        Thu, 19 Nov 2026 19:59:29 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm3190201eec.23.2026.11.19.19.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:59:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 4/4] libldb, samba: Use exec_module() in cross module check
Date: Thu, 19 Nov 2026 19:59:22 -0800
Message-ID: <20261120035922.3013969-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120035922.3013969-1-khem.raj@oss.qualcomm.com>
References: <20261120035922.3013969-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 03:59:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132763
Content-Type: text/plain; charset="utf-8"

Python 3.15 removed the deprecated importlib Loader.load_module(), so the
CHECK_BUNDLED_SYSTEM_PYTHON change carried by the "do not import target
module while cross compile" patch fails at configure time:

  AttributeError: 'ExtensionFileLoader' object has no attribute
  'load_module'. Did you mean '.exec_module' instead of '.load_module'?

Call exec_module() on the module created by module_from_spec(), which is
the matching API and works with older Python versions too.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../0002-do-not-import-target-module-while-cross-compile.patch  | 2 +-
 .../0001-do-not-import-target-module-while-cross-compile.patch  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba/0002-do-not-import-target-module-while-cross-compile.patch b/meta-networking/recipes-connectivity/samba/samba/0002-do-not-import-target-module-while-cross-compile.patch
index b0ad5c4142..5138f01197 100644
--- a/meta-networking/recipes-connectivity/samba/samba/0002-do-not-import-target-module-while-cross-compile.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/0002-do-not-import-target-module-while-cross-compile.patch
@@ -44,7 +44,7 @@ index 2300565..26d9e8c 100644
 -            version = m.__version__
 -        except AttributeError:
 +            module = importlib.util.module_from_spec(spec)
-+            spec.loader.load_module(module)
++            spec.loader.exec_module(module)
 +        except ImportError:
              found = False
 +
diff --git a/meta-networking/recipes-support/libldb/libldb/0001-do-not-import-target-module-while-cross-compile.patch b/meta-networking/recipes-support/libldb/libldb/0001-do-not-import-target-module-while-cross-compile.patch
index 09c84b4405..011de2fd1e 100644
--- a/meta-networking/recipes-support/libldb/libldb/0001-do-not-import-target-module-while-cross-compile.patch
+++ b/meta-networking/recipes-support/libldb/libldb/0001-do-not-import-target-module-while-cross-compile.patch
@@ -46,7 +46,7 @@ index 2300565..26d9e8c 100644
 -            version = m.__version__
 -        except AttributeError:
 +            module = importlib.util.module_from_spec(spec)
-+            spec.loader.load_module(module)
++            spec.loader.exec_module(module)
 +        except ImportError:
              found = False
 +
