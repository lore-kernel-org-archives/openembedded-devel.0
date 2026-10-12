Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 377CBCA9ED2
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:11:27 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5083.1791839486346820519
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:11:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YqDSc0pC;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-ccc7a6070b4so1009218a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839486; x=1792444286; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mJjzH92AJS/YH2ce8fGIUYLPv66ZYgIjH7lmFkApzEQ=;
        b=YqDSc0pCZla6NZSSYuHQgtLoIrnl2wgl3ILv9915lzTsKNRo+8b+A8is07UfzTNR4v
         IozMCzD7rr+wl3VrVfexe/Zv3Fg7LBK/OkMjNtcVQQQLy11fTK7onfozCrlKfJE0fHy7
         8uGKL3D0LMrtnqLined0xtryJW5hqQwsYJtEdELb9NfC7Atnmd5c5Vh57J4v9a58B8qA
         7kqYJRk9alL7Dn+IsQREbe0VdTs9ed6KHeUls8TIQ4d64eWw1Ndt9RpjFVsj0JydcVZu
         DI/PxM4fv86o28jLPo+ER15NbjhjT5uiVyVjWytcmI/zq/dWtmFhRdVwKcGER2dMnNMQ
         qecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839486; x=1792444286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mJjzH92AJS/YH2ce8fGIUYLPv66ZYgIjH7lmFkApzEQ=;
        b=tV4JsWo/DpaviqaVgaZ81bzjJO0Y/znPMX6OUmGgztA6WdnVDS1L7gvD3ebxfJyKJE
         zBsOwNXzLBRwIqr5+YSCYbDvoq9VN/t+IVpA60Mi/oGLnMZYtruyMAXJYxw15F1omNIT
         MY9IMFY/1cDGd25pNEAeRi7yYGMudl5ea/fY7CU8u3rVEprtanYUcjHMyJrAkwbkfhCy
         js5uKB/XaxZ9bz3KrbTW0KV+HHuacudJ1IV4mxgQyvbuh+jo1eiVG4tM2p+DOjsB8d6+
         9tjQn75oFVdNWrr8l/ryLwBFNGusJEoqHZeIxA0i1Abs0zrStaOl089JSdGFE0/xJDaf
         jwaw==
X-Gm-Message-State: AFq9FYLTpcA66jvWNtZecpUTnbQ2W8h4vmlQEBO9jJPxIFiNxlwZS8uA
	7BJqj0wFJCsdQzBOAcQq6sGeqbcxkH52EYmFbsMh3dnuCEUvyISB+wCxPRX8gUTP
X-Gm-Gg: AYBFou2h6qYk1SSZF6GMqRqRnfAmnnYCTPa2kVGLHebOqe8E5GNFvX00oFgqaZQOSwd
	C3PlkOPbmOzD8cJJyDC8HxpPx7BJnEkbZSTF283iDagZxHkkvgSYrxzTwYJlDO0tT4j+0RMsx+E
	88+5HhPhkhkDiFfLGeYIKHIRGLLEEoxyGJsr/Jzb5E9n/czFUsFELSZNm0DnT3moz8fBuaI79BJ
	hEwqNa4Ltk/Obpnmo/fbVlgAGNxSw2BGgtDxRYApqI7AyrnZ9vKkTIk2ehd+7JbEYqSI4JHLpVm
	9cOxCzgN3dXP8OtNcc/Z9xDsic/GJ1n1xwc0e+K2yIxjSfZ9Bc0TX6ObFFjh3qmT3fOEYzTDL4I
	EV2CKCgp1H/5JK8jriEaYdpS/vVFhzDrGyyTkVrug88Fy8Qq2mFfbGDcepsQpAVDUosRqRORAxY
	vc2961jiBgaJsJXHKJGTQQ15N3lFMpZQq4xILCoBWCKVwBaDTJ6i89m61FAuxtNhgukjgMmhlzh
	9YM/n29VX5xs6OduK6TT9s1W9AB/Qhw3X9LUnw=
X-Received: by 2002:a17:90a:51a7:b0:3ab:5832:72af with SMTP id 98e67ed59e1d1-3ab58327370mr5612857a91.32.1791839485708;
        Mon, 12 Oct 2026 14:11:25 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:11:25 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH 27/43] libssh: ignore CVE-2026-59851
Date: Tue, 13 Oct 2026 10:09:51 +1300
Message-ID: <20261012211009.3352822-27-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:11:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130797

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

GSSAPI Key Exchange was introduced in v0.12.0[1].
Debian also confirmed the same[2].

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-59851

[1]https://git.libssh.org/projects/libssh.git/tag/?h=libssh-0.12.0
[2]https://security-tracker.debian.org/tracker/CVE-2026-59851

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/libssh/libssh_0.11.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.5.bb b/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
index a99c4ee788..a67956df88 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
@@ -56,3 +56,4 @@ CVE_STATUS[CVE-2026-59845] = "fixed-version: fixed in v0.11.5"
 CVE_STATUS[CVE-2026-59846] = "fixed-version: fixed in v0.11.5"
 CVE_STATUS[CVE-2026-59848] = "fixed-version: fixed in v0.11.5"
 CVE_STATUS[CVE-2026-59850] = "fixed-version: fixed in v0.11.5"
+CVE_STATUS[CVE-2026-59851] = "cpe-incorrect: vulnerability doesn't exist in v0.11.5"

