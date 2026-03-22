Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B9AFC72D8
	for <webhook@archiver.kernel.org>; Sun, 22 Mar 2026 18:26:57 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.741.1774204015781459696
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Mar 2026 11:26:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lqvIvpoi;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso2029595eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 11:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774204015; x=1774808815; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z6iP9ie9jnSRTnRcJWxJOaj+UTD/q/L0472twFGycB4=;
        b=lqvIvpoiS7AA8YbOH1O21Tt5RcRitRSXl+i13ummE3zWOzKiLmHaADCnesys+pQtXR
         pl0+qv4ZxtHt75VLS+ebuAJJau5HRtOEBbJv87CqfPyX+dvSls6OT5RQm0GCCvkJJCoI
         nPiw/8CUqQDTjQrWKXIKH+cTDFTqK2Eg488ABVh+MW9JwG9x9qRZGU2okXD1zEdMpXG+
         3rF21vEM2AqVRWVyX2cCqlUZlPd4fReiCpds3d475hFd7rFeYTdY0NiTUsb2ZcFnW3t+
         Yn/fchr+sS92qeGH3lc/WlKROQ5sgTDMDXO87PicLTTvcW+YOdTWI2t9sfChpNQUOE/4
         q0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774204015; x=1774808815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6iP9ie9jnSRTnRcJWxJOaj+UTD/q/L0472twFGycB4=;
        b=OIStswockT9dmqENnRN7z4Fkm+IxOBtQzWeexEXaL9k3390IigahRgpQNM+YJ8K65z
         7EyWuw1rfq0mEJdJTW7c2qyCSuzX+3B/SFTZ3kc5LWGNC4D4u21btalgVE9NCZGOkx8+
         uj/miaVX0AKg3JjG1DUXS9gWnGXWzrvab/TypD59IhTsHiqyYEJTSxSFLekTsnuCXeB/
         hyCZVHwWTsmyb3fq2PXz8NNE0kTapDGLtIO7ZsRBP4B9n8XDY2jpDQI/7QeOh2TBxe4/
         73QvJB5ZDzlJdlF5UWZXQkbK1YpHyicND4H97V3EMRe4ejvf1XmFOsT0xw3a9f+88crd
         ma7g==
X-Gm-Message-State: AOJu0YxZQ/IIekznUXv5H2B6d4VCK//Yp38Bu0sDZucmAS1yRHdiL5v4
	od3yXMk/7B7Q12vxxcCCvjJx7VoBhTOIrPbrNZXrjh22IbjkRzclxtbY2k30P+6W3hhhFA==
X-Gm-Gg: ATEYQzwZemnGW4UTiCwR17ZHzt33yk/mNNxxbQ6v6+o3puzU2/akh7In0pZphBQPafv
	lYrx3Q6HNqmVIabqwJg/U63ZmtBGi1BUwg7IW8v13pAmLqUWVHzExgRnJNSRUQ9xE73hTI3onrw
	QJfQUhGZs1J4PKSO22CsE0SPTIHis0xJbzU92xyO8XHmf9uqllnJYtDsPDUAPsL7ihjq+EGvXeP
	QkbKATQIuAGkEEHbY5LaltYeeFtD/EGbrxRPkWG5Z62i+27Luds0EC8GAfr5S9Uhte5miA6iaLS
	y8ySv5Yf7h8a5EOpS6iJSWkUgDFdXqyzkrosRKUgCoVbd7OeMQo4/pP1EEIDmOtZzvIEYiEO/5s
	L4drI+MQtz5z/HpBHAEJ3+AMezkMAaMqxrHqywAzrUhsXpQedGi0s03mgnrni/+KjB3HHlFkEKq
	AiqvTPdQpY6kF2dE1JMNWKezo2C98T7e5wIbKCH3qppB6LMHewR1I7zu40Ghzg1euuldvdDB+lq
	15mHWFYZu/l5bUAdLqXQMWbBOk5i7qKd5I5r5oPez9QgbZRKms5bhME4tST
X-Received: by 2002:a05:7300:818c:b0:2c1:27c:75d2 with SMTP id 5a478bee46e88-2c109752926mr3886834eec.17.1774204014739;
        Sun, 22 Mar 2026 11:26:54 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14c985sm10212316eec.2.2026.03.22.11.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 11:26:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 1/2] gnulib: Copy hidden files to staging area as well
Date: Sun, 22 Mar 2026 11:26:50 -0700
Message-ID: <20260322182651.4090587-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 18:26:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125488

newer gnulib-tool wrappers try to run a sibling Python
launcher file, .gnulib-tool.py, when Python 3 is available.
In current gnulib, that file is a real part of the tree,
and gnulib-tool will exec "$prog.py" in that mode

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/gnulib/gnulib_202601.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/gnulib/gnulib_202601.bb b/meta-oe/recipes-support/gnulib/gnulib_202601.bb
index d3ebdca8dd..763be6c11a 100644
--- a/meta-oe/recipes-support/gnulib/gnulib_202601.bb
+++ b/meta-oe/recipes-support/gnulib/gnulib_202601.bb
@@ -20,6 +20,7 @@ SRC_URI = "git://git.savannah.gnu.org/git/gnulib.git;branch=stable-${PV};protoco
 do_install () {
     install -d ${D}/${datadir}/gnulib
     cp --no-preserve=ownership --recursive ${S}/* ${D}/${datadir}/gnulib/
+    cp --no-preserve=ownership --recursive ${S}/.gnulib-tool.py ${D}/${datadir}/gnulib/
     cp --no-preserve=ownership --recursive ${S}/.git ${D}/${datadir}/gnulib/
 }


