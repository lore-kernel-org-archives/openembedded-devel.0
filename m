Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21905.1795538591290234132
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 08:43:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=LWk4+XK+;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-490f38e9688so3372925f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 08:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795538589; x=1796143389; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w4d+VvCvdqPhhu1ETLdslZK5bOYmGGj4vj+cmASOfrg=;
        b=LWk4+XK+JPOQMKWg17tGtofDgl0LL9p2MAMBfgEaVWXtVazT0iIi8RcncqSY1LDqUz
         Ra2zsWpXOmHfyl7J7KDCQhtLWBzRfXOihhS0MSrVlgMJFg1y4eYtROt/KPdjIxAstKMZ
         s3PTq4PFf8C7wnWjkTz2FelvYlLMReK8HBHDiR+Y8EidEsNgPL17q7/6FTWBPPKIYCVA
         wJ6k48WOW2uMHGw1xp8Asmac5qyP5O2bPfr5ruTP1oPBcK5Njx5QjBeBgfAnUS/aaX+5
         k8aTKR8E2hJETpjbFzjEtWtMqGcePhYohN7JgqyypEgx/UFAsCRJkDZMkMxwV5YpUDP9
         iYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538589; x=1796143389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w4d+VvCvdqPhhu1ETLdslZK5bOYmGGj4vj+cmASOfrg=;
        b=d7+vr8SaibCc0YLlZKDn1xVqMkHCi41znCOZSWUnswFBqUlyV4NzaFzMkvsm7Kc59i
         RqRw5IAriRLx3XztIKVG+MIYbiIR1yCydnyxtRYKTvwcjEPK/HbiQQ6/mRWYxD/rw5nj
         sd9C1wMmDmWEsYtUhDaoBB3ADYgljGGGLWKJIY5/MIQYc0nzt6Bvn35Ya1roe0v0Fuu1
         r/Afge2PKCYFSjc5U+5qpMGRnAGuhspbv0DvVuIwQdt1PKnYI8yUke29zc4I8u4e3g8I
         N20hxf6k0LQA0u2exePQ8enQ63UiDYHHSC3SWfWqVvpmcHOli/7CJgyI2Eim6QQLcHJI
         sKPA==
X-Gm-Message-State: APuU4Z9zqkJ9vzar9goEr8wRLKLyBmQFBu9nbOL7GipzEC+3W7YwzjvV
	8k+m3++ja0EPw1qQLXQbNIP/yBeGpHO/ZdyZYo5ehODjJeAZ+xwsSWyv8ulz8A==
X-Gm-Gg: AZFdTZfVuzjT5pA6GVGdipwrFZGAn+Xbus2aQjzDzfpkYl8TgsxH5uzLS4jvlxPnoE7
	cUaXXYUZbj8Co8Zyi7eMUJNaX5TAWX6ZlLudiYvDaI6W8jchvZGhSTq+J5t8fzSrcp0x+kCtCBh
	7WnRubRoHpStBSgo9AuNs1ZTLQMYtwRS+FWJkI8icqK1EUkZnL4Vki5EzjUrOOFV1rHLEzyYsHF
	s8xDnugQDot0z3+f4DIbqOdf5fvWpUSEX7HgocPC9CE0T30EIcibmHKKAYiztJ2+f8jBxoob3IW
	7hUMXbVQ0hWVjrvWCW+TfwHeFwVSasnm4drAoDXKUqwq9r9n03mG64FJeSLBhAOfv8Ehpo1CVM9
	hcz8gI6rIL4m3xhLr7zd0JpOJmchBXyHafi/Hk2u8nIcHWfdQtXht7l9jvvpaYBihXe86oMtyNQ
	gYv7bl+Ac6g5LSOCaCAV8zSaUeqLaHexu6ARYuPYUBU/Y2p1WWRfdzQ4twtItCWCpwe1bEn3nfq
	rx2HCLZXCMG+8wGVbDY1Gm1W4Eb6hDBkzdGLQ3Z1aSOgFcu71DznT5Zn8Gx9neExNxGx0TIoeAt
	b7Lbr1ggvmnJ0/8ReVnijq3NP3R4mk3UB2/TZtc65/2mOSsbdPBet0yq+XrxG6hEFOqbFOrHC5m
	fgBPjwcVAfn5eVg==
X-Received: by 2002:a5d:45c9:0:b0:49d:f98f:4666 with SMTP id ffacd0b85a97d-4abb0f3c85dmr23217339f8f.11.1795538589374;
        Tue, 24 Nov 2026 08:43:09 -0800 (PST)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f281sm27223198f8f.22.2026.11.24.08.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:43:08 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH 2/2] neatvnc: drop hogweed from the nettle PACKAGECONFIG
Date: Tue, 24 Nov 2026 16:42:44 +0000
Message-ID: <20261124164242.60688-4-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124164242.60688-2-alex.kiernan@gmail.com>
References: <20261124164242.60688-2-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 16:43:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132955
Content-Type: text/plain; charset="utf-8"

hogweed is a library the nettle recipe builds (libhogweed), not a recipe
of its own, so enabling the nettle PACKAGECONFIG failed with "Nothing
PROVIDES 'hogweed'". nettle already provides it. With the nettle 4 port
backported, neatvnc's nettle backend now builds and links against
libnettle and libhogweed.

Fixes: cd6cafd1040d ("neatvnc: add nettle PACKAGECONFIG, disabled by default")
AI-Generated: Claude Opus 5.5 (Claude Code)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta-oe/recipes-graphics/neatvnc/neatvnc_1.0.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/neatvnc/neatvnc_1.0.4.bb b/meta-oe/recipes-graphics/neatvnc/neatvnc_1.0.4.bb
index c341b21a6405..470a80f1152a 100644
--- a/meta-oe/recipes-graphics/neatvnc/neatvnc_1.0.4.bb
+++ b/meta-oe/recipes-graphics/neatvnc/neatvnc_1.0.4.bb
@@ -18,7 +18,7 @@ DEPENDS = "libdrm pixman aml zlib"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[tls] = "-Dtls=enabled,-Dtls=disabled,gnutls"
-PACKAGECONFIG[nettle] = "-Dnettle=enabled,-Dnettle=disabled,nettle hogweed gmp"
+PACKAGECONFIG[nettle] = "-Dnettle=enabled,-Dnettle=disabled,nettle gmp"
 PACKAGECONFIG[jpeg] = "-Djpeg=enabled,-Djpeg=disabled,libjpeg-turbo"
 PACKAGECONFIG[examples] = "-Dexamples=true,-Dexamples=false,libpng"
 PACKAGECONFIG[benchmarks] = "-Dbenchmarks=true,-Dbenchmarks=false,libpng"
