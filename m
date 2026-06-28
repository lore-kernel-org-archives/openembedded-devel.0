Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E93C44506
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 16:22:40 +0000 (UTC)
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75147.1782663749269060563
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 09:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RxMsR0FV;
 spf=pass (domain: gmail.com, ip: 74.125.82.42, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-137335bc3caso5037352c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 09:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782663749; x=1783268549; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=en5U3YBN8iRhVYJX2s6fP25XxZXOTSafCkH/Ij3yRUs=;
        b=RxMsR0FVUmCROKlTnI4XOQv6Y81xIOyXHLcCBrNqWfhKW7aNhu4qXoLiQ+2Fl9CMWt
         hjzNrg6xm0aL7zvT8fBoWyIgOEiBqg4PbDPWfk+D6E/wtHoCTBOb9njtWSLNgPUgncmB
         NgFj9jG/FTUREqfhiwxVFojt0ddVmEnu2eYM8tiHfI8AMPG35sKwk+1wFvYZKw8m8nVx
         /dDgnLQBx/FBSwfU0fNdop8carHjHBtwlj+KzQ+IesaX/NMLOF153+Jei95FVVYFboBF
         sZfxnIXZtHBIZABYWY+Wq9H9BZxQ579msuentUn+l2fFlg79GuBTH9gusChThmaCTeYr
         Vbdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782663749; x=1783268549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=en5U3YBN8iRhVYJX2s6fP25XxZXOTSafCkH/Ij3yRUs=;
        b=AcanofUl+e1UNV0vdWBYs8dUjK8jn4e7fGmbtv/SBxubHQ7vlTOKhBj0V7bf5w43hh
         FSGPjH6cfjrKiHe3lAwF6vfUsy+xgmA4fJQjxWettJeEoPsRUcBnKSCQ+joi3thy93+Z
         IkZ+y5QHPVoDggg4txuJBymRqB8v3EOhANIFfKayb9M4g7OGeR1DK8GyPBZWd7SYeJp8
         ErUs8jKxo30rOnFylT76116sKvUCJYi639k3kq0R39jWPdPWCnNHXTBVoy0fWNy/fjJn
         xdJZ1KFpDVyvffBQTxEKQqFPSz4zat5DSzvPW63lb1hw3xkQs+YMcf619SPxsCwtnunT
         XcDQ==
X-Gm-Message-State: AOJu0Yx4duQxUh0G8759ri19iQvizYRdkz0oS79f/eKY/GUjpXn08gdC
	bRQswIVj4qwRMFuApDpjPN/rVgA8GjjqzB8+b6zfiOk5Wbl0a+or/jMDUkc1eoaa1qw3wQ==
X-Gm-Gg: AfdE7cm+yJMLW7lSKujhtb6JIuH0D1yVhuv9gPfJZRBooGDHE7XlSK23j4idleJy6eR
	vloua1l4I0BcwToMFjxqKgFfFCRc6YffzV5J6Il1cexqe4c2/3vAuh/FmRybwQ/HwJTGeKgO9dx
	oLOe4p0TNwKHVkDL1qA+rdujDaTsSzzjldZgUCC3qCBI5qjI2+6G8Pnac0ALRjOy+weoyjba1QA
	3jRAJRRR0ZMy+75FQ/qlQ39VrkaO7+ociXBGIJeGa3Uj4e7aky127kWgVvZdArIHypOUqB/bIDZ
	0Ax8mU8DTWiM1Bvi8BwU4P/5Le1VdTmiquu6731HtYiflx+JgFOFBtLa5ttT19dP1mJCm9e4p2S
	b+kEHT49YAipvOl/wqj4g8Ah4el/OEVYd5AU7XC/Rj+JueK9D9LSBPF3PcFC8nsF/ojA8e1nHM2
	Ykwbppu8Nq+KJUOnlF48ils5KZUQiJxhQBT+J6/4E/IOtTNj7+oBkBAE/0mFqTsxGyJjn6Tzmay
	No2rK7lMHkvEgHfoBA3PoowJQPPKOx3Jqi0mysZLiXuGKjZGbv6FxZYP3x6RxnotvXoV2b6GWut
	kjyPF0rp689GoFMQ6+3HEmnJv/cnKg==
X-Received: by 2002:a05:7300:7643:b0:304:6448:dfd7 with SMTP id 5a478bee46e88-30c84f42aadmr14127608eec.18.1782663748504;
        Sun, 28 Jun 2026 09:22:28 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm49849445eec.7.2026.06.28.09.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 09:22:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 102/128] weechat: fix cross Python detection
Date: Sun, 28 Jun 2026 09:21:56 -0700
Message-ID: <20260628162222.4081517-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
References: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 16:22:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127912

Inherit python3targetconfig

point CMake's FindPython at the target sysroot libpython/headers
so Embed component resolves when cross compiling.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-irc/weechat/weechat_4.9.2.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-irc/weechat/weechat_4.9.2.bb b/meta-networking/recipes-irc/weechat/weechat_4.9.2.bb
index b01f3c6c0b..9f9962455e 100644
--- a/meta-networking/recipes-irc/weechat/weechat_4.9.2.bb
+++ b/meta-networking/recipes-irc/weechat/weechat_4.9.2.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://weechat.org/files/src/weechat-${PV}.tar.xz"
 
 SRC_URI[sha256sum] = "d1389a9e521bda0c4ebfa108e2abf885ee6c5150c385299f5dca0181a43a0914"
 
-inherit cmake pkgconfig
+inherit cmake pkgconfig python3targetconfig
 
 PACKAGECONFIG ??= " ncurses python"
 PACKAGECONFIG[ncurses] = "-DENABLE_NCURSES=ON,-DENABLE_NCURSES=OFF,ncurses"
@@ -21,6 +21,14 @@ EXTRA_OECMAKE:append = " -DENABLE_PHP=OFF -DENABLE_TCL=OFF -DENABLE_LUA=OFF \
                          -DENABLE_GUILE=OFF -DENABLE_PERL=OFF -DENABLE_ASPELL=ON \
                          -DLIBDIR=${libdir}"
 
+# CMake's FindPython queries the (native) interpreter for the Development.Embed
+# component, which then fails to locate the cross (target) libpython/headers.
+# Point it explicitly at the target sysroot library and include directory.
+EXTRA_OECMAKE:append = " \
+    -DPython_INCLUDE_DIR=${STAGING_INCDIR}/python${PYTHON_BASEVERSION} \
+    -DPython_LIBRARY=${STAGING_LIBDIR}/libpython${PYTHON_BASEVERSION}.so \
+"
+
 do_configure:prepend(){
     #  Make sure we get dependencies from recipe-sysroot
     sed -i -e 's# /usr/bin# ${RECIPE_SYSROOT}/${bindir}/#g' ${S}/cmake/FindPerl.cmake

