Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.638.1794595811505344993
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Nov 2026 10:50:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=I/jSQv/q;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: philip.balister@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91c6ce60697so36052596d6.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 10:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794595810; x=1795200610; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2duldus6EnQy3UWegfoRZbCuf9u6sGlsgWwlHjlmUFg=;
        b=I/jSQv/q/WBVLHws6Vrf8LWVH3l8QoOSQFIn0USK/i7Si9GXmEEdLl042b5e6G/kUp
         GpzlHnFH5mNuo+ccnZM7f6Cvhh6tfHUnhyDq8A370roXBWkCEigziEO65jP2JsEqLMrG
         Dh40a9iBxD9na0BUPXVI6Ko9jsjVO3DAq03kc1I8tvL6SXNIA0XDr87E6S9c0OYD0uNS
         iHQslxKen86cx9ZQAthqYFonzRTVKswLWn0PME5m+zi3AB5bxuKyeH3wdLdoVqrfGZ/T
         xrZTfBYU4n6V26oBJ8AhIc3XDgkNtZYu/Pdw7wk1MsfhDtOGeOvGc38Oz6zg/zCzfGVi
         DRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595810; x=1795200610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2duldus6EnQy3UWegfoRZbCuf9u6sGlsgWwlHjlmUFg=;
        b=her6CXaGlZgt8buWuEMzA2Ie54NsMS3HsksGPoFj0yvlch2w33emp50Lz3pNgRZbiX
         GFkX2glrZNHgJUoq3TRWrg0wSBsFFubv190TJcx3uZLX5ktZdxVIcP5cY3Cbc9g2zLLh
         /oEUQhUxZEH6+PbdvvytbUjIJlGKQGHoDyEyooD414oXdXsq/2xi6m1s4DgKiwwlYoNP
         MnM+5erlQMZ78ftBW6RXxOMVKkjnn6vgu3/PD4JFKdg6qgfBT+gPMLBHUm9P0lDt7tTs
         Y8b7tvb7F0RTaZBOxp1Xjurps6FLq8A5t22QHwtXXrneIhWuwN1ee5JbensFcAZNmL5s
         S25A==
X-Gm-Message-State: APuU4Z+V+6v6IkpmAWvciiQlLRatfkWzIgFzToSZ1FIPtl4Sx0rJ/P26
	8/m+h/MP2gRGousfzJ0CyCfZBOGDr61SPNtL4T233i2tEqybN8GDA45XbDILUA==
X-Gm-Gg: AYBFou2G2/wk47vSZptpaLxLiev4JDSDybEjQfkjSn3s/5d6CYO0UMevA+LRNJm8aD8
	EL0Sp/yj9v3cOI9b03rRE9A7/V5SqYvgFXD048KmTPrswB4aqE3kcZ+W6jP8cj5ZynaWYQVP7a1
	CWBw/F1i0gqT0y5AIMJsn5xwS0Br6ebmstQWgvYFJna1o3rcT1BCHENrhLBAGDCqXaxqFbW40La
	5ceWhWjqFyrnf7zfzLFkWt9qjeOnSTZuZpVo7GMuhC0Idva9h1kTTBiGqYRXO0nFRjFhjNFjGXB
	LaUkQ1+Nkh5mUzGbGNRGaISJNY4lZfskrzJp42V7EEsEv3tcZ1LKZeMlj8cxbFJx0Xej2wpxNyA
	WiN1KT1+UkfOjQYy5PiQoM5VWq0Hg5OlNToTK4BNrYnjW4LcuAuXeVopPOK+95un2gI9BNbjHLY
	bD3ei86w8fomas4/r8hQARSsc/6RVyabjgO5u3CwDIfk2KmsCdo6QG746qaIkP24PQVAlnP2INy
	D/nCOuXF7Mtio1eJhTR3Ia8ODytWU70ayIVGlGpyVjS+BGbcWBGhOO9t2ZFouAM+CEnxmHga/20
	nCFzPTPh3oe0ln/X9vusuuX/TkkvZyhHJXvnXslMlJasX+64miiT
X-Received: by 2002:a05:6214:3211:b0:91e:ac55:fe72 with SMTP id 6a1803df08f44-91f24201eaamr56749216d6.36.1794595810189;
        Fri, 13 Nov 2026 10:50:10 -0800 (PST)
Return-Path: <philip.balister@gmail.com>
Received: from bushey.hsd1.va.comcast.net ([2601:5c0:c200:483f:8478:e47c:fbe6:4bdc])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm26051796d6.40.2026.11.13.10.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:50:09 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Cc: Philip Balister <philip@balister.org>,
	"Claude Opus 5.5" <noreply@anthropic.com>
Subject: [meta-python][PATCH] python3-pyzmq: Don't search the host's pkg-config directories
Date: Fri, 13 Nov 2026 13:50:05 -0500
Message-ID: <20261113185005.2307591-1-philip@balister.org>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 18:50:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132253
Content-Type: text/plain; charset="utf-8"

pyzmq's CMakeLists.txt appends the host's /usr (and /usr/local,
/opt/local, /opt/homebrew when present) to CMAKE_PREFIX_PATH. Since
PKG_CONFIG_USE_CMAKE_PREFIX_PATH defaults to on, pkg_check_modules()
turns that into PKG_CONFIG_PATH=/usr/lib64/pkgconfig:/usr/share/pkgconfig,
which pkg-config searches before PKG_CONFIG_LIBDIR, i.e. before the
sysroot.

On a build host with the zeromq development package installed, pyzmq
then reads the host's libzmq.pc instead of the target's. Fedora's
libzmq.pc carries -DZMQ_BUILD_DRAFT_API=1 in Cflags, so pyzmq is built
against the libzmq draft API, but the target libzmq is built without
it. The module then fails to import on the target:

  ImportError: .../zmq/backend/cython/_zmq.cpython-314-aarch64-linux-gnu.so:
  undefined symbol: zmq_poller_destroy

Set PKG_CONFIG_USE_CMAKE_PREFIX_PATH=OFF so pkg-config only sees the
sysroot.

Tested on a Fedora 43 host with zeromq-devel installed, building for
qemuarm64: before, _zmq.so referenced zmq_poller_{new,add,fd,destroy}
and "import zmq" failed on the target; after, it references none of
them and the gnuradio gr-zeromq ptests that import zmq pass.

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-python/recipes-devtools/python/python3-pyzmq_27.2.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_27.2.0.bb b/meta-python/recipes-devtools/python/python3-pyzmq_27.2.0.bb
index 4cbf46cf0a..c2230a49b4 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_27.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_27.2.0.bb
@@ -22,6 +22,7 @@ PEP517_BUILD_OPTS = "--skip-dependency-check \
                      -Ccmake.define.CMAKE_FIND_ROOT_PATH_MODE_LIBRARY=ONLY \
                      -Ccmake.define.CMAKE_FIND_ROOT_PATH_MODE_INCLUDE=ONLY \
                      -Ccmake.define.CMAKE_FIND_ROOT_PATH="${STAGING_DIR_NATIVE}" \
+                     -Ccmake.define.PKG_CONFIG_USE_CMAKE_PREFIX_PATH=OFF \
                      -Ccmake.build-type="RelWithDebInfo" \
                      -Cbuild-dir="${B}" \
 "
-- 
2.56.0

