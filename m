Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14862.1793092890964668289
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=iZza2pIi;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a208d93758so44640745e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092889; x=1793697689; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sMJED2GCql5Iz2FsqCEp/IcyLnzNg+YDezbFqhYDQhI=;
        b=iZza2pIi3a76OCDQqw1meZa1F/VghZfTdvCwHSwCXluGRXuHrAYN4LcN+oxuuFsOkZ
         h+AhTxhDh1/Tqi4NVFrEsysPvfdwXGb4SZPYBq3WjwvToGgGRfkZDlBFbvILMPFil2rS
         0+lrCSJuUHXKojAUpO758bpaP5qXIgxsJhr58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092889; x=1793697689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sMJED2GCql5Iz2FsqCEp/IcyLnzNg+YDezbFqhYDQhI=;
        b=0E6d8SNm5UkmsGgs8sWCa8RYoA52hU2xK9vRl7boxUb5tIT9KdaUTmxCizRbRopATo
         dMNZiqQsZCSopABpam8SEIAdTnZWaoM6z+EE0OyPT4OCILy2GgWeP7BF79eLOcPVNT9a
         FZMWnANtLTpx0j0NB77Yao3CmwNp9XOjAwrkfz1TKDo2wVRsiyXyIOhGCvv8Psz3gIT1
         OiBK7QinZ2YNxwID6WeiWDMX15q4sUd/q1Z7jk8SE4lIMRcbeuUIBWGkcJ9fhf7Tb7cf
         IdIlwsytHB6XtU0Bcm/hDX006K/C7cqSKXH4inYlUsk1H+VNGjIsY6EDMLGMJ6yeEWAb
         cK9A==
X-Gm-Message-State: AFq9FYJUVkoHF1yBLHNV0clW+fdDzqUqwI/itepVpDJFcefIlpc++PVg
	LyCfUPMBfXTcOcVItTjqpWynpehA+u6p2o7UM8mVOu9eaA77Hihc0mcidg2LQvMnRNIgrMB3DFt
	PmFYI
X-Gm-Gg: AYBFou2B7c70XbDLiDycdKi4gxyfFtBWBG/nPtN8pgMe0vGw1QcVbl9kiqRs6fq5MGr
	2ULDLyPcW0PQn2hJvvWW8QG18Fi+7u6FytiFWqZ6dxgz1fLTJS4pzJEKb21iK62mJYjsimv+BXg
	Ge0lIVmk6KmwY3YsQdmhqwi4BxVfd7LA6XzCo9R8Vy7ztr5iHidpnUbjkp4bk8EakswSQYeyxmo
	0r49fFN8SkSpzAR4Xq+BGTiqjfdIUD2dHD90Xc11i4zonSwylNOgCn92LS4ISHqKb8gOoU9YcIY
	cp3JdHHJYs2ypHcfKXR2oONR2j3Yc0vv6eJt3MJeSg4J+0suwU7DGPpFuYWQ7JkqXoc863c870o
	wKUWk7sEcfeBtPzhNwSyIng2FQEPOyewgx6hNa7uHXZYXyaJm8rdlzVvttMkwWzJVsVZTKy2+ts
	3mvcU4fyNgJoNXwKri5AxvgIzr0pYRfphlmoLcOJSQrk8hSES3sdZMT+jAl2YlYaWKRh0pHYSBM
	Xw5f13xAsIgBGevVPFu9kPnNONGlkmu+w+EaPDJXz/uxh/j+mK3kEm77Zt++ajTm3dIQIkriKHe
	3qTLN+YmYPL4Eyt5LvUMdRI4UdVXCfW6Ul8oI9W62W4QGK8iXefMbYZ42vWE4SvEz9s2SReMy4M
	6NPR1
X-Received: by 2002:a05:600c:4e47:b0:4a1:fb2f:eff with SMTP id 5b1f17b1804b1-4a772d05e3emr48840795e9.18.1793092889308;
        Tue, 27 Oct 2026 02:21:29 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:21:28 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 49/61] python3-tox: Upgrade 4.61.2 -> 4.67.1
Date: Tue, 27 Oct 2026 11:20:16 +0200
Message-ID: <20261027092028.782979-49-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131513
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.67.1:

- Preserve ignore (-) and invert (!) exit code prefixes on commands
  when referenced via TOML { replace = "ref", ... }.
- Installing from a pylock.toml with no dependency_groups selected
  now uses the lock file's default-groups, as 751 specifies.
  Previously packages marked 'default' in dependency_groups (as
  written by pdm export -f pylock) were skipped - by
  pcbeingused333.
- A positional {factor:N} label in an env_base now resolves against
  that table's own factors, so with several env_base tables or an
  env_list product it no longer expands to an empty string.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-tox_4.61.2.bb => python3-tox_4.67.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.61.2.bb => python3-tox_4.67.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.61.2.bb b/meta-python/recipes-devtools/python/python3-tox_4.67.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-tox_4.61.2.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.67.1.bb
index 45584298b5..f6c33af82e 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.61.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.67.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "463b6eeaaf0929d60b4f7a87b26f4a7a764fe9832a74bf50b4e9d259b6a8e905"
+SRC_URI[sha256sum] = "a68602f64421b199016127364ee47347b958391d19c2b2e53fe95673a8fe98e9"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.47.3

