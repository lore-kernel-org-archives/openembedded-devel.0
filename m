Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14679.1793092893825713211
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=sthK3RVz;
 spf=pass (domain: konsulko.com, ip: 209.85.128.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so22120885e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092892; x=1793697692; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q9Qi1U8SRkseUIV0ajstvJ+EyJo1/fyqFoqrmKpJBaQ=;
        b=sthK3RVzCBNXrsSs2Pz/Q8PgE9Q2INncRQRRx85BnKXarLLPFi9DubqtBeePqfH52h
         nMJ8RlcZLgHzDd2+i/ftRKUR6STwlgmC6qu5l8dyXj4KbWeeI4SgsTWk2Is+XZ1KJG9N
         XsLV9m6JPte1sBHmw8xB9MzS1fdnmhNksmlps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092892; x=1793697692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q9Qi1U8SRkseUIV0ajstvJ+EyJo1/fyqFoqrmKpJBaQ=;
        b=K9TBc1HH8y0cFQTBXNtPKSx0FA6I+JPEPuFPSmyzAuyr3ANg19I/XYcv//kM5C0eQh
         YEJTAoEdtgAc3S5AEcDBPoYOdOvbn03t0p4ZzVeGcXXWzcYqXYTfOn7TZH/YXcyJCGiI
         OZ8NXhP9qkp7aK0bm/2/WPO//kuLi5c+XkIWxKwGepX18OYixllpBOf4FUsWt9Nm0otg
         ovX/RnAWHB+Ej8zxYFQnBN7MSJbnTxbYXTsSoXj7QY3tJosrlZGufy1umbVY/jR2dwhu
         reY+fAQwAc7zNaUlQ791aqzr274aD1QfJASS4EpUJDZ/2OUzz3LAtYGq1USqqcGEwuSR
         MMUw==
X-Gm-Message-State: AFq9FYKCxb4S0vzdqoEBHfMRfMbRyFx1Iuq3TIBXwvNrVCIJm908PxfM
	PP2g1O5zbUDXFbrDnE1C/B4kwGRV9+glZODxkSXyXm/EcApAAV4znPdEQNjrO71gzm3BwUO+pTK
	zTmyU
X-Gm-Gg: AYBFou1uKVEliaeqXnpYpPp9aE+81r+muYxhwXJvW1XtkP9Ue98k4ssMP1Tp7LQJ7fQ
	ROm1U9LRle3kLGmKmWWUVuCE4xLAxQFbJywPi8hHdvVgAGUDNgvXiCWWVs9A3FR0XJ3Pb+5ySG0
	Of7UiLvAP6u6/AgqBIihQ0kgpB1ZWTWwj7MKfxr9k2lu4unDAR+ZPo/gqEjwhnYgLuEA6ddYQ6+
	NJpRq6BrdtmhhwXEM4hyCtLWwUlyEQbVSpJDLzUiy1YUsRh/8ebSiQpsim9YOJX6bh+ACDZUqPp
	CIC2wjwvSInj1Ey8IzVFXRcuoqS8QmJirSIFiKJpY/TJYBQLwyBfnYJvZ7j3QQtGtoYm3yKtGYV
	0ipPeogE47zTe7Dx/eQW+zV8yOu4fqK3UdFnouMloOWhEFRgV138G8ozOGDlKXhR9svA18gTpvb
	NEFW3y5siCapofP4CsAVdY7T/th4RZlHQvDkNZdedgxJWt7OmmbenHxOuj+uJPz2sWhcR7jS9tB
	zTReBOI5TFCKc4RpMsiraDA6OlnLOOyVjDVUsGZfLTcNBoy3alDV6PoeVAXDwlZsmxXv1NWXWff
	lzbZe+0GURRxnprxVabNOjbMexwhNsLAtmVP5+7qH8EcPOSNRAevmUEYdsftgh9NNAF7Lpp+vEA
	VHGffqlLGXhkbpHbLYueKGQpXkQ==
X-Received: by 2002:a05:600c:4746:b0:4a0:1c10:1372 with SMTP id 5b1f17b1804b1-4a35acafcbemr160519525e9.27.1793092892158;
        Tue, 27 Oct 2026 02:21:32 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:21:31 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 51/61] python3-traitlets: Upgrade 5.15.1 -> 5.16.1
Date: Tue, 27 Oct 2026 11:20:18 +0200
Message-ID: <20261027092028.782979-51-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131515
Content-Type: text/plain; charset="utf-8"

Upgrade to release 5.16.1:

Merged PRs:

- Re-add _merge to un-break spyder temporarily.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-traitlets_5.15.1.bb => python3-traitlets_5.16.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-traitlets_5.15.1.bb => python3-traitlets_5.16.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.15.1.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.16.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-traitlets_5.15.1.bb
rename to meta-python/recipes-devtools/python/python3-traitlets_5.16.1.bb
index 2bb28a589c..349db5aa02 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.15.1.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.16.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ipython/traitlets"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=13bed0ee6f46a6f6dbf1f9f9572f250a"
 
-SRC_URI[sha256sum] = "7b1c07854fe25acb39e009bae49f11b79ff6cbb2f27999104e9110e7a6b53722"
+SRC_URI[sha256sum] = "ed900c2b631aa3a112811139fa97b8d2c3bad5e989656bba4b7e52c7852c18c1"
 
 inherit pypi python_hatchling ptest
 
-- 
2.47.3

