Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08124106B51C
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 12:21:23 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21200.1774441276668085662
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2026 05:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GoEm32VJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-486fda2a389so41093255e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 05:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774441275; x=1775046075; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QA8zqd9G1esbIW9z/gMFRHgoOvHWm6KPvTyhC7emVf8=;
        b=GoEm32VJEtWhas9bLL6bUBqlAJam2BJEeN6bOozTbx1Eld1PFoRDhpWfYhwBl+5H3K
         MuMk+qTiind2QnlTD49Q1YxsrZ+Xtm4d3hOKR2iN/OQ7phlL3cFWncVwRrFpr+klbW6R
         BMx0a1AdfRzxW0tHLblkcaAj8cOPvtH8pJo33tOEc2yZWKXyLuvCC/sld1ePidW+dmbg
         nSCR3p7sClZkW3g44vMe2Y8KZN4BbMqqyuJeXnlU/a7VDvL7Vq/Mrker+avLi+/uvQJ1
         6jD2TFSmt8YuICz8b0Tgy3i8PlIeocwHmlXtHfy7fNMX15WI/VWIaemIXGiZXyMxbHSc
         IzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441275; x=1775046075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QA8zqd9G1esbIW9z/gMFRHgoOvHWm6KPvTyhC7emVf8=;
        b=IDnNIybEpBv/miaebpy95mHcZr5oeLyHqnSqQ0b8RveiX48CnprQe3S+jLKBZC19Tb
         dbirO/mCSAfivmgQWFyQNVv8Pcwch6exnkT8hT5OZLQet8dvk7yDsB/wNFvNojNm72Vg
         zqC67a+xcURm5oVpevcVR/4GqeR05lrzKv/ZQfOtY4b1PpxjwI02E7xPAVbJ3ZWD2dPW
         ICzI8LvZZerRAJFp48bkYF016gVsWUtjnmTbC7SkSa4H9fYOZ2kxYdCIhL7yFwpvcCsx
         N7wtDM4tjiFCCD19FqVgkdnygtHHJPLTQdJi7NN4yme5u2Olkm8FNAGTymzOfsPxicTr
         Z5+Q==
X-Gm-Message-State: AOJu0YxsHjHGQUu12QT+txMi6GiPPMFkDL8x9oN0cmbbFnTLBeoNFID3
	mBVeEfeYAsyyvp5XGx4ZnG7FjIfjfChbr1BwiYWQry4PavLaWl0pDXYHT3SYTQ==
X-Gm-Gg: ATEYQzytVUcpMnr6xsorceeWctbXEkcO409vgmEf3638FL73YUUDkwy4DNQ2MpaaQJv
	v8PnVDvDGwQnITe3Qebw7I0bvdCB+J0H8FI+FUGpBTLAwyAUEz9oWKvgt+2jcWczdqQN7P2eewH
	W1xrZwGSW4Ag6joVPZxy/NcMTgyHx4CcsXe/NSn3FyeaJNjZBmAcVUjJE/wqj7OPG66lgwgOapd
	CtiX9Jj34CqQZO7NP69bU9uBBL2LIz/j6FYVv4fGgdEsZguflCNNEPaYAH1emRXYcSAjJiXKm2m
	22rWkwIbuDmLt+K0SEyCDbsm3Os9jwF+GRQGpKxLjrIWpS9pqhRBiUKTo1TuxD2mWC+xiEOuuNM
	ORlfviUZ9jHBiY3zXKi8R6wWB7r8JIl0XloeFV+p3TMVuYkSLl1KqUqblrKrV+mX1I2mhjgjKeT
	oyX1JBFgQObHG+cA==
X-Received: by 2002:a05:600c:3b22:b0:485:35a4:939c with SMTP id 5b1f17b1804b1-4871608dca6mr45798795e9.29.1774441274703;
        Wed, 25 Mar 2026 05:21:14 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487165feea6sm40257885e9.2.2026.03.25.05.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:21:13 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH 10/15] rrdtool: Support Python freethreading
Date: Wed, 25 Mar 2026 13:19:36 +0100
Message-ID: <20260325122046.1211090-11-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325122046.1211090-1-zboszor@gmail.com>
References: <20260325122046.1211090-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 12:21:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125617

PYTHON_DIR now contains PYTHON_ABI. Use it for the correct
library path, include and site-packages locations.

Fixed runtime dependency for PACKAGECONFIG[python].

Note that there is an issue with the python module:

ERROR: rrdtool-1.9.0-r0 do_package_qa: QA Issue:
File /usr/lib/python3.14t/site-packages/rrdtool.cpython-314t-x86_64-linux-gnu.so
in package rrdtool-python contains reference to TMPDIR [buildpaths]

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/recipes-extended/rrdtool/rrdtool_1.9.0.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.9.0.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.9.0.bb
index 752ecc6c48..23b38182be 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.9.0.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.9.0.bb
@@ -32,9 +32,9 @@ PACKAGECONFIG ??= " \
 "
 
 PACKAGECONFIG[python] = "--enable-python=yes \
-am_cv_python_pythondir=${STAGING_LIBDIR}/python${PYTHON_BASEVERSION}/site-packages \
-am_cv_python_pyexecdir=${STAGING_LIBDIR}/python${PYTHON_BASEVERSION}/site-packages,\
---disable-python,python,"
+am_cv_python_pythondir=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages \
+am_cv_python_pyexecdir=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages,\
+--disable-python,python3,"
 
 PACKAGECONFIG[perl] = \
 "--enable-perl=yes --with-perl-options='INSTALLDIRS="vendor" CCFLAGS="${CFLAGS}" NO_PACKLIST=1 NO_PERLLOCAL=1' \
@@ -80,7 +80,7 @@ do_configure() {
 
     #python
     sed -i -e '/PYTHON_INCLUDES="-I${/c \
-    PYTHON_INCLUDES="-I=/usr/include/python${PYTHON_BASEVERSION}"' \
+    PYTHON_INCLUDES="-I=/usr/include/${PYTHON_DIR}"' \
         ${S}/m4/acinclude.m4
     #remove the useless RPATH from the rrdtool.so
     sed -i -e 's|LD_RUN_PATH=$(libdir)||g' ${S}/bindings/Makefile.am
-- 
2.53.0


