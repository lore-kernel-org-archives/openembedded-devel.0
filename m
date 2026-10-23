Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1644.1792738441654316128
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 23:54:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rQ3dGtI6;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso222822a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 23:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738441; x=1793343241; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DrlRb7UOiEUtDi+kCrP4a/5P9StNy3eUIR60BrSM4ek=;
        b=rQ3dGtI6hq77cFrSMvjx18Ijp1NdDIHgWNYdNUyZdYaeGmq9DXmDnmCt5uVX4Krhj9
         pvz05iGcKVdUSwJ8EWerdV72k4OBg2+YaRVReeOMOllzWQiEj6rJhFHqZwvYtSw8RcPE
         QvMHrgk3WYIytVkJoOWc6UD3hq8RcxdXBM4y3YihY0oFiQ5ZZDufMBw+WcbxbxGfaJWg
         Xt+E82swtAp5AZT5fnUjNm9EhTT2Zoqa40D4LgDtR6852J9J4KVys61KJRw5O9u502zW
         zqSRDIuKvRUno10cYkJPR6CTyuA7cvbLSfo5Px/IrtYKRuF+mz5k5DTzWbrh4OQh4cCq
         tXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738441; x=1793343241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DrlRb7UOiEUtDi+kCrP4a/5P9StNy3eUIR60BrSM4ek=;
        b=nMFgfJd34+dwRm7YMGlKuIe6RELc1kNVFOIgZBMJ50MwuFjUAI1QrLspXdLZx3xyVF
         hy1iAx926BGEWsIc6aLOtFbXUDvTyBnzy6DFOtUMvMpJKMPcOj+aXKHPziHrmfGFRuHR
         0GaBkkfxvcJF9Zl4+qK6rP5IytPQan1h0RaQUvqpURRelg1Xa8oCtl3xu0J6dEgXgVhg
         SNklwgOxmgOpc9SZPtkjeC5Uor/pPkBwXwN+RFL1JiRI6STlj/T3vvOJH3IXZBVS8FeB
         xIrY4hBa0iTxjCcTrypGhq4AHAriFH7bNY+PC2XdEJJFHEHe+FQGq6v0DgsVw1v8RBgn
         A/GA==
X-Gm-Message-State: AFq9FYJYF2Nj5n1NmK5k/s8XBai7oH0Fm/jNZb0se/WlN+/Vpl63eZ9k
	K0xHE6UdR8btSOFxS87OB66gzdRxAyxO3Q5wcR7KFRN7l7RHBcXGuv8EMqGEO6amvv4=
X-Gm-Gg: AYBFou1xvXQ73J1fWWoRdgiq6w0a6bnQr9G/IvfzjovswE4izjYVwmi3F9/C1eMFZHk
	6/aX72l5y4RMYvVZrQ1Ua416BOOPED88/8AAPUGyFcF/ehv1bLoIISc1ExfFAQKVf6ncXWpI+dY
	jge2Cey4exkSeuEnor2STmaVczKm5Oh5pvHHJsgJPvqIGUC9OArGJyHhsj5UqQngNK4Wfa94cta
	l+uNuS8UVGguvkQ+gBrzewWdXz9SnXW2mTjmQfxw4N5vitzzMlUcbzKKVe0+TSoybzdjxVwi8Gh
	gk1yMN8b0vpqb6Zk5YcwfzvMsISSDyZyXMn9RQDw2aD4TWpABRMoodQRjX2mMr2c7JN/b+3glQ5
	abQA73glRdkvgFvT7LdzoiPO25uFVJOgKCg5mEdvchXqnP0Gk0Y2pFXcKfuFhYIsZJb2MHfHQZq
	1fbQZEt6QDD4zFgTLmwIgRGtX23WS2jcCvN1kzJNx/aBS2PC+37pcw2M2pmH8zhBt4YzagRiaDN
	1j0kvU0wDZDvC3a0/7jJaGw6SbSnr3d0zk5EQDbCv1mJrMpMbY49xIEl+QW2JCk0SBWOsAjuYxc
	BVaDWx5yJFOcoBOGR7Y8+yWS+6RxG40MisYDeOqMU8wg2aqcVBegCTsKqd3tLOQExatB7rVoreh
	fOpqJiyg90/wX4cEYcypZiAjDm865w/0f5BF5Y6SlbT67bf9ydAC8CpD3WzhKLKIvGUdPxPKR8i
	tiZRmlQHPxToTEnnchVkB1OCS2e9HrLX4Afu+jerdCwO1J5EYYY28tDWb2ON7nb2Sz7Zefwt6Er
	CNixrLAAoglqNfVBDQxOLaJ/fNgFkMaBu5WF4eoRnStuxZhnQENGQ==
X-Received: by 2002:a05:6a21:7084:b0:3e1:af52:6d06 with SMTP id adf61e73a8af0-3e37672bf25mr979058637.52.1792738440675;
        Thu, 22 Oct 2026 23:54:00 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c92f7bd8sm384769b3a.50.2026.10.22.23.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:54:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 06/29] fio: Link with libatomic when 64-bit atomics need it
Date: Thu, 22 Oct 2026 23:53:27 -0700
Message-ID: <20261023065350.3228996-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
References: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 06:54:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131330
Content-Type: text/plain; charset="utf-8"

fio uses 64-bit C11 atomics, which riscv32 lowers to
__atomic_load_8/__atomic_store_8 libcalls, so linking fio fails:

  ld.lld: error: undefined symbol: __atomic_load_8
  ld.lld: error: undefined symbol: __atomic_store_8

Add a patch that makes configure check whether 64-bit atomics need
libatomic and add it to LIBS only in that case.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ith-libatomic-when-64-bit-atomics-ne.patch | 56 +++++++++++++++++++
 meta-oe/recipes-benchmark/fio/fio_3.43.bb     |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/fio/fio/0001-configure-Link-with-libatomic-when-64-bit-atomics-ne.patch

diff --git a/meta-oe/recipes-benchmark/fio/fio/0001-configure-Link-with-libatomic-when-64-bit-atomics-ne.patch b/meta-oe/recipes-benchmark/fio/fio/0001-configure-Link-with-libatomic-when-64-bit-atomics-ne.patch
new file mode 100644
index 0000000000..7f6c115ae0
--- /dev/null
+++ b/meta-oe/recipes-benchmark/fio/fio/0001-configure-Link-with-libatomic-when-64-bit-atomics-ne.patch
@@ -0,0 +1,56 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Wed, 21 Oct 2026 00:10:00 -0700
+Subject: [PATCH] configure: Link with libatomic when 64-bit atomics need it
+
+fio uses 64-bit C11 atomics, e.g. atomic_load_acquire() and
+atomic_store_release() on the uint64_t inflight_issued and
+inflight_numberio fields. On 32-bit targets without native 64-bit
+atomic instructions, such as riscv32, the compiler lowers these to
+__atomic_load_8/__atomic_store_8 libcalls, and linking fio fails:
+
+  ld.lld: error: undefined symbol: __atomic_load_8
+  ld.lld: error: undefined symbol: __atomic_store_8
+
+Check whether a 64-bit atomic load/store links on its own, and if not,
+whether it links with -latomic, and add libatomic to LIBS only in that
+case. The test variable is global and the stored value depends on argc,
+so the compiler cannot optimize the atomic operations away.
+
+Upstream-Status: Submitted [https://github.com/axboe/fio/pull/2163]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ configure | 23 +++++++++++++++++++++++
+ 1 file changed, 23 insertions(+)
+
+--- a/configure
++++ b/configure
+@@ -667,6 +667,29 @@
+   fatal "C11 atomics support not found"
+ fi
+
++##########################################
++# check if 64-bit atomics need libatomic
++# The variable is global and the stored value depends on argc so that the
++# compiler cannot optimize the atomic operations away.
++cat > $TMPC <<EOF
++#include <stdatomic.h>
++#include <stdint.h>
++_Atomic uint64_t v;
++int main(int argc, char **argv)
++{
++  atomic_store_explicit(&v, (uint64_t)argc, memory_order_release);
++  return (int)atomic_load_explicit(&v, memory_order_acquire);
++}
++EOF
++libatomic="no"
++if ! compile_prog "" "" "64-bit atomics"; then
++  if compile_prog "" "-latomic" "64-bit atomics with libatomic"; then
++    libatomic="yes"
++    LIBS="-latomic $LIBS"
++  fi
++fi
++print_config "libatomic for 64-bit atomics" "$libatomic"
++
+
+ ##########################################
+ # check for wordsize
diff --git a/meta-oe/recipes-benchmark/fio/fio_3.43.bb b/meta-oe/recipes-benchmark/fio/fio_3.43.bb
index 928b31ff3d..e6445c2bfb 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.43.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.43.bb
@@ -24,6 +24,7 @@ PACKAGECONFIG[numa] = ",--disable-numa,numactl"

 SRC_URI = " \
     git://git.kernel.dk/fio.git;branch=master;tag=${BP} \
+    file://0001-configure-Link-with-libatomic-when-64-bit-atomics-ne.patch \
 "
 SRCREV = "d2dcd7e053d1902d2420f151c83990e6acdd9f8c"

