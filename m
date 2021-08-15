Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web08.11467.1629036402984751727
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Aug 2021 07:06:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mkmrqsbD;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d17so17821110plr.12
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Aug 2021 07:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=z842DE+rfL5XAqjuykeEhwdq7FdKREiRdnE31wUjAQw=;
        b=mkmrqsbDht6/OLlxnEr6ioWtLcweYKKGl6OZ43JFjEq1rl2vvARKxAYwxm3IBSqn2i
         TdtO6LXlB84EoYBdeXZKVommJLf6OP91SjmlwSUVmN3SRvhUEylXzHjqjVxwWYMqvaZx
         OCToQQkrrFMbCl4TgTbYTAOuPREJhjnT+HwHTqoKBNkodqLTEkkJCmFwM8cmYbtoK7Wo
         7AwEb4zTdcTUunutGQBwKJGJjeHUZbLq44w42QrU0SbjChPGL9ln6lNn2+8r8um+zXo5
         RUicji5iJ205vYgoQpgPtaISMZ+C7gHhgegHAunCuHGa0MWa+N5/3HXF8smV9qIlu7Wl
         zY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z842DE+rfL5XAqjuykeEhwdq7FdKREiRdnE31wUjAQw=;
        b=YYwQGu8Sm+SY0c/66M09beVm+C31Y/YvMyPD0xjBoHne0mc3dgkuZdKegZJhTU7J0R
         SZMOmV9YUuSA1lClvAec9P/Ee0cpPLmoFRr7S2Uf8iEGGUWZF6aoWQy3CWWJVoQCa8tH
         tFIGimo3YD87YpQF0gX1NS6PBTSaoxpfIYb+me5qXj3n278X+VNMaavc0ISkIAu88+t0
         /wYtAK78UZmBWhi9J1NgJ5BRLvMDRU0iOUuU12TIn/S4G/dzNnNXnyZ4LMIRNx43Qg54
         oiErIbb0LWvHIsgAqS6Fewkqttwy4PHXgmVpePYYCzdINBWKejwYOeXyDNuDe7Tnec4N
         mlWg==
X-Gm-Message-State: AOAM533IZw5zf+egaxLHfsxLRgDsm4ToweMhzFZVTpbeyD+AJc9bSQij
	qrwxjRr46fWMwz3Uw9klSK5XfHKRxdCWDw==
X-Google-Smtp-Source: ABdhPJyCMXwF3U5hW660RXBrIsfmdacvOhwIuAkeCk27y1LAzCv6mWwQHnEWRo1ssCsc1pvcWUO/rw==
X-Received: by 2002:a63:e841:: with SMTP id a1mr11326183pgk.197.1629036402427;
        Sun, 15 Aug 2021 07:06:42 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:162c:344d:280d:4a4c])
        by smtp.gmail.com with ESMTPSA id y67sm8332901pfg.218.2021.08.15.07.06.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 07:06:42 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 02/18] nghttp2: upgrade 1.43.0 -> 1.44.0
Date: Sun, 15 Aug 2021 07:06:14 -0700
Message-Id: <cfbf2182a715d185262f2c5f00b8866084f6f078.1629036279.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629036279.git.akuster808@gmail.com>
References: <cover.1629036279.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: wangmy <wangmy@fujitsu.com>

v1.44.0 changelog:

lib: Port new ngtcp2 map implementation
doc: Replace master with main
build: Add precious variables for libev and jemalloc and use JEMALLOC_CFLAGS
build: Add more --with-* configure flags
build: Add LIBTOOL_LDFLAGS configure variable
third-party: Bump llhttp to 6.0.2
src: Replace black-list with block-list
nghttpx: Fix max distance in weight group/address cycle comparison
nghttpx: Set connect_blocker and live_check after shuffling addresses
nghttpx: Replace master with main
nghttpx: Remove trailing white space after $method log variable
(https://github.com/nghttp2/nghttp2/pull/1553)
h2load: Add --rps option
(https://github.com/nghttp2/nghttp2/pull/1559)
h2load: Allow unit in -D option
asio: fix some typos (Patch from Jan Kundrát)
(https://github.com/nghttp2/nghttp2/pull/1550)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b767b37e3aabc3c9e95adb7eb469bd6d32979fb8)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../nghttp2/{nghttp2_1.43.0.bb => nghttp2_1.44.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nghttp2/{nghttp2_1.43.0.bb => nghttp2_1.44.0.bb} (93%)

diff --git a/meta-networking/recipes-support/nghttp2/nghttp2_1.43.0.bb b/meta-networking/recipes-support/nghttp2/nghttp2_1.44.0.bb
similarity index 93%
rename from meta-networking/recipes-support/nghttp2/nghttp2_1.43.0.bb
rename to meta-networking/recipes-support/nghttp2/nghttp2_1.44.0.bb
index 959cccf357..32a9307c3f 100644
--- a/meta-networking/recipes-support/nghttp2/nghttp2_1.43.0.bb
+++ b/meta-networking/recipes-support/nghttp2/nghttp2_1.44.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "\
     https://github.com/nghttp2/nghttp2/releases/download/v${PV}/nghttp2-${PV}.tar.xz \
     file://0001-fetch-ocsp-response-use-python3.patch \
 "
-SRC_URI[sha256sum] = "f7d54fa6f8aed29f695ca44612136fa2359013547394d5dffeffca9e01a26b0f"
+SRC_URI[sha256sum] = "5699473b29941e8dafed10de5c8cb37a3581edf62ba7d04b911ca247d4de3c5d"
 
 inherit cmake manpages python3native
 PACKAGECONFIG[manpages] = ""
-- 
2.25.1

