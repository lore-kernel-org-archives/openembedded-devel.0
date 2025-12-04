Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E98E1D1D892
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 07:56:53 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38417.1764835004700356616
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Dec 2025 23:56:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=no0quxBF;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42e2d44c727so312921f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 23:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764835003; x=1765439803; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZT3V+uuY65xeg+FijCHI2mGyXj4bKcWiqPh6E7vF1yY=;
        b=no0quxBFo10ceXIJw/RhFrLh8bf6Wc9cc46IJxN6ERG79iRyW2aiI6XEVkB/GOx4w7
         rU/oU00mSaLg4VAl3guiVtl6rBH/F6mySF+p9Pk3McOSVDnat+QVdi/XisSTh6KseEgd
         4InP83/mmid6hGT1lcQ9CJz2Y7CEuCmJA7fU3YncxOpIqaEAKhFGWf7BfEn55isATtvD
         E7BUUx0AKsXsy5KbShcg2QFqA8K/BFvXTFzvpE8fgxbMv3/+A2seLTfGp0qgL6wzn/X4
         2gDaaMl8fWKLdKFXld1WGU+vrmRcbC3qXGzkAjL6sW6saWUglBZyLyoUfshN1POD5eb5
         wdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764835003; x=1765439803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZT3V+uuY65xeg+FijCHI2mGyXj4bKcWiqPh6E7vF1yY=;
        b=tKegtd7rN8pps12JMsbHib9jVwqT0wIh2xR+Tf/tXspX9AEHDKH863O2APkTAp5WWA
         DpBY2LR2ayUJIi+F6Rb1qYHFlTbbjzF+JHSzxRLoD3E8dHmz2oKsTpJ6zCvr8MVv81Bz
         qsRvANmNtbHYUYOsEwdtO3gLT+3AtbGi4Pf7EsVJ09R8ltEKY4vtszfrIUHY+mO6k/Y9
         C9WCtK6xWNBo0mtHRSf5C4r68thyBVAHo0GeTUFB9bTOp2AE8TFq56cCNDkz43af/XL4
         ZFCdi3tumaYsgIB2X2Tk8zjVX1DnyZElv5EmmeFEsqIvpo1Y8hmH0+k0MetldfwvY2LA
         lhQw==
X-Gm-Message-State: AOJu0YxONYAn/eJxoRyc/pwOLsjoki2huV7En7U4lV76+rPH3Aty2eEg
	NZ1a0f4+2obG10DPNn9uE8wJewmm9z9WBUoW9FxkZxX9owLduIU78wZCJjqJbA==
X-Gm-Gg: ASbGncvj2JWFY8ZhgjROhRN1oN1wllFJRZQGRf/dW/dbT8DySF4G0A8CZrbJWjo+Nco
	CRncvat3y5EZPLivjOa065Y/9tLE/+NDdfGDhUb7Fp/8BK/ScqeyNqoqV2bd3RUGWBog/HrnFtF
	Y0v11VRqqzxahwYrqnzCKNXqezzPkxABsf4Yz7p98hwpFv3Am19PcWk5Y7fSomwezcFjh9ZI3Dg
	a42PoWMkkQkCJ3h9vkTq+45+9XILEbBwl+44M+/A+EdOkb17eYndQhi82ftHuf/dLEgCBOAUwTW
	IFxeEhI9hAasdcaZiia/5TmfpyKCZwCwrZcJQ3XMZUENd5T3UhOZImIuAUCNoYToRSaNy0X4m87
	ixUSERdqkhqVmhAo19Nsk0KaYVfH3GcGH/QiamJ+1QtsGTLTyNCBFHbrpIEpSxoCuayTMzpW3Za
	TVI4HqjhbT
X-Google-Smtp-Source: AGHT+IFxPRkHMVGAcv+n2H4uZwHLIt5YIltHG6Gnbaw12ZxycLzAoUYaCtywnHpeU8Wju3yXy0UvCg==
X-Received: by 2002:a05:6000:1846:b0:42b:496e:517c with SMTP id ffacd0b85a97d-42f7319655emr5247141f8f.13.1764835002984;
        Wed, 03 Dec 2025 23:56:42 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d331e29sm1730883f8f.32.2025.12.03.23.56.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 23:56:42 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH v2 11/12] xrdp: patch CVE-2023-40184
Date: Thu,  4 Dec 2025 08:56:34 +0100
Message-ID: <20251204075635.1088007-11-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251204075635.1088007-1-skandigraun@gmail.com>
References: <20251204075635.1088007-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 07:56:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122313

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-40184

Pick the patch that is associated with the github advisory[1], which is
a backported version of the patch that is referenced by the nvd report.

[1]: https://github.com/neutrinolabs/xrdp/security/advisories/GHSA-f489-557v-47jq
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: no change

 .../xrdp/xrdp/CVE-2023-40184.patch            | 73 +++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb   |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2023-40184.patch

diff --git a/meta-oe/recipes-support/xrdp/xrdp/CVE-2023-40184.patch b/meta-oe/recipes-support/xrdp/xrdp/CVE-2023-40184.patch
new file mode 100644
index 0000000000..c4a6a1b862
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/CVE-2023-40184.patch
@@ -0,0 +1,73 @@
+From 322d11b431e4773f77aaeb764571a3a8d60f9fca Mon Sep 17 00:00:00 2001
+From: matt335672 <30179339+matt335672@users.noreply.github.com>
+Date: Sat, 19 Aug 2023 13:26:44 +0100
+Subject: [PATCH] [v0.9] Check auth_start_session() result
+
+CVE: CVE-2023-40184
+Upstream-Status: Backport [https://github.com/neutrinolabs/xrdp/commit/8c5b7cdff3929dc59c5f13e33cec839ed45d1c34]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ sesman/session.c         |  7 ++++++-
+ sesman/verify_user_pam.c | 24 ++++++++++++++++++++++--
+ 2 files changed, 28 insertions(+), 3 deletions(-)
+
+diff --git a/sesman/session.c b/sesman/session.c
+index 441f8d3a60..d352f5e859 100644
+--- a/sesman/session.c
++++ b/sesman/session.c
+@@ -526,7 +526,12 @@ session_start_fork(tbus data, tui8 type, struct SCP_SESSION *s)
+         g_delete_wait_obj(g_sigchld_event);
+         g_delete_wait_obj(g_term_event);
+ 
+-        auth_start_session(data, display);
++        if (auth_start_session(data, display) != 0)
++        {
++            // Errors are logged by the auth module, as they are
++            // specific to that module
++            g_exit(1);
++        }
+         sesman_close_all();
+         g_sprintf(geometry, "%dx%d", s->width, s->height);
+         g_sprintf(depth, "%d", s->bpp);
+diff --git a/sesman/verify_user_pam.c b/sesman/verify_user_pam.c
+index a34d83cd7d..ed17397fc3 100644
+--- a/sesman/verify_user_pam.c
++++ b/sesman/verify_user_pam.c
+@@ -316,8 +316,8 @@ auth_userpass(const char *user, const char *pass, int *errorcode)
+ 
+ /******************************************************************************/
+ /* returns error */
+-int
+-auth_start_session(long in_val, int in_display)
++static int
++auth_start_session_private(long in_val, int in_display)
+ {
+     struct t_auth_info *auth_info;
+     int error;
+@@ -357,6 +357,26 @@ auth_start_session(long in_val, int in_display)
+     return 0;
+ }
+ 
++/******************************************************************************/
++/**
++ * Main routine to start a session
++ *
++ * Calls the private routine and logs an additional error if the private
++ * routine fails
++ */
++int
++auth_start_session(long in_val, int in_display)
++{
++    int result = auth_start_session_private(in_val, in_display);
++    if (result != 0)
++    {
++        LOG(LOG_LEVEL_ERROR,
++            "Can't start PAM session. See PAM logging for more info");
++    }
++
++    return result;
++}
++
+ /******************************************************************************/
+ /* returns error */
+ int
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
index f3d11522ac..5a1d904a15 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://CVE-2022-23483.patch \
            file://CVE-2022-23484.patch \
            file://CVE-2022-23493.patch \
+           file://CVE-2023-40184.patch \
            "
 
 SRC_URI[sha256sum] = "db693401da95b71b4d4e4c99aeb569a546dbdbde343f6d3302b0c47653277abb"

