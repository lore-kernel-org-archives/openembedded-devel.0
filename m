Return-Path: <frederikbraendstrup@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC620D74EF4
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 15:49:19 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1207.1769183357226448080
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 07:49:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MYncoQds;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: frederikbraendstrup@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-652fdd043f9so4203162a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 07:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769183356; x=1769788156; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kvMe5GQn19rzrDEoHvoe3+D0tWj7o0+KwXKhuzUh9QY=;
        b=MYncoQdsSuiEOGjRA+VQznNsi8IPkaIq/HNBYa/XrhwIEKEXComGiWH4tzgSIxsDXT
         CcaFnBAA9Pp6RC+yNXAKlMua4axKMuqVSr0EBR2FUi6lKoMsy80roVXKpcaLUKo+7Ug5
         LZfnZqR8HqdkYl1rEE3+xQaqDsqV51XB0UYqBjdi3gsmRIT+y6Bvq58y3LUzh0wCaNxK
         kk1DJbFYGYM7vobziQeG8reFj7XBaFemosGZURiZ3ogUIlA+QUlonuuUc1Aj0YHNIHWA
         h49CMm15I0mTAcrDrsk33rjnTtyZJYEi5I2pFU+zlcv9yhLsS2fdYRFMfq1e4Hw94h0s
         Sd5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769183356; x=1769788156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kvMe5GQn19rzrDEoHvoe3+D0tWj7o0+KwXKhuzUh9QY=;
        b=JAZOZ9wLMauaAZD4UbqxJxpcFcEwQNfqOt82G6rBpUaH02AISPBi9nedNTaNRxrJIw
         0IOiftOBXa/k0iVLES2xmlb8JRwOZWo6yRdeli/VXT9BdaT+o3lynFisjn+RcDrzkcJd
         YumEgLJ5M3ggN3ZvObbfE6l0cWzTe7KWfiI94GD7CvU0lRuA40Vk9DMLZVhZf/1wonrM
         4/rmpH/xV2oDVgx5JbNR8WHEBLM5AzD5WElm4wcaRsny8joyCO9qu4RJJXAlEpq7HN9u
         YMdo2XnikOtQvd5FyK4Pt+WP0uUk+rcpjGM5x9Rfc8B4nsrWWTWJ5aizbu3NJ21S7cHF
         TwWw==
X-Gm-Message-State: AOJu0YyNnixPqBWaWNuLVYGfJ0n7bGNHczneUBmZw08KKc9cK/wKc+i5
	XBdYAfMH7xnvxVVd6Ud+a1MbKX8G8c6m9mUtOYS7a14wr/tv/X6dcyBuZ5L1kQ==
X-Gm-Gg: AZuq6aLgoD023cbb+Nnfm+IKPjn2/i0rCTenCiM1GLzdwMw4nEeg79C1YH8kXWJqGwg
	kTcGYva9taumoBlKpAiYhpJsTJa35X8rlwX0uarK+rPzpzF53JCTWJagbjJaAA5i67lUZ8tCNz9
	soBzLNGskCTHOvcZCPNet/xBL4pjpjWiBQjdQGZPvJkTQZjvacewbQ2a3JNHjglPMLhQ2kYygfW
	yWC9QfO0h8tqhMcS8k5FibE/tFmb1zoZy4wqjZeARVkn2e46dFMd64xrJP+/zQLoYxDYYkXHgI2
	60httSGtZ/bEwRvez3+kfXm3lBv/I2fXRJKSiITLhOcQ28cEPTiINs7YXtqigtOqpsXdalHOBTY
	+eL4/hyXL6TcBwImTc0z+M7El8TVgzPoEM/mEcqSkzN2TcGDIhjhPp/h96aHZefi/YWIhJSJNBA
	UovKabN1l7Yt7RsByrSp+lnoS7rFnvCkDqAFg4qSoCIQJLCUPCl1MMKTZvUoZ+EH33
X-Received: by 2002:a05:6402:2801:b0:658:322f:17c with SMTP id 4fb4d7f45d1cf-6584874e573mr2299022a12.3.1769183355438;
        Fri, 23 Jan 2026 07:49:15 -0800 (PST)
Received: from ws.taila4487.ts.net (77.241.136.110.bredband.3.dk. [77.241.136.110])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6584b96d6besm1077080a12.30.2026.01.23.07.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 07:49:15 -0800 (PST)
From: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
Subject: [PATCH v1 2/2] liboauth2: Add recipe at 2.2.0
Date: Fri, 23 Jan 2026 16:48:43 +0100
Message-ID: <20260123154842.1635662-4-frederikbraendstrup@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123154842.1635662-2-frederikbraendstrup@gmail.com>
References: <20260123154842.1635662-2-frederikbraendstrup@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 15:49:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123785

---
 .../liboauth2/liboauth2_2.2.0.bb              | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb

diff --git a/meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb b/meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb
new file mode 100644
index 0000000000..3067f7ea63
--- /dev/null
+++ b/meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "OAuth 2.x and OpenID Connect C library"
+HOMEPAGE = "https://github.com/OpenIDC/liboauth2"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
+
+SRC_URI = "git://github.com/OpenIDC/liboauth2;protocol=https;branch=master;tag=v${PV}"
+
+PV = "2.2.0"
+SRCREV = "12571b6d6568c2db7d5f080f60ecb55795c0db19"
+
+DEPENDS = "libpcre2 jansson libcheck curl openssl cjose apache2"
+
+inherit pkgconfig autotools-brokensep
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[memcache] = "--with-memcache,--without-memcache,libmemcached"
+PACKAGECONFIG[redis] = "--with-redis,--without-redis,hiredis"
+PACKAGECONFIG[jq] = "--with-jq,--without-jq,jq"
+PACKAGECONFIG[apache] = "--with-apache,--without-apache,apache2"
+
-- 
2.52.0


