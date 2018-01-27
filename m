Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id CA0D778864
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 03:25:01 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id k68so1381094pga.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 19:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=kVq4sFJGYL87bzacd/veODRhUL2vPI7ycOkDHQ/6vME=;
	b=kd1xLk/Vri4MFfCqYEG9U5LASpP4du9QbC49drZF3gX/LtNx6r48laKNEae4Utsygj
	81C0VD9ycNoC+DvSz+cZZ22ILjIY9UqfNBrrdQ37p/CFkejSvGmd1F120imB0v1e7ffK
	fFjxvbOaorrFL7Wyq48gXkMXEu8H4/gCy4VavF+j6Smkp1sqaxtsHG8CoVYvKji+6/95
	N0IH9U6nRNnmECWkTcTJPgNReOS0Uqcx2xDI/9oHFJz9NAQVn+pl0ES031HGZOF2NiV6
	cq2cq9oRKvjzzg/7K9M26cZWcDIQkGJuPMVwWkWj/c8OdbX/46dfnwA/MQlqw0593nJL
	JnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kVq4sFJGYL87bzacd/veODRhUL2vPI7ycOkDHQ/6vME=;
	b=j/Q+V1qyKboO74A65SlfUWTjNF7Gx2c7A3pIt6vk22kmPEMD4LqHAUqOtQt3YlwPGS
	wOuRmOciZrTARz5q6YI45jwH0SBI/rJOD/3EyjLrIiDOKI0JZ5nmcKzql+T8Ld/AVxRk
	Bxbb1QaJNpnPYlZALi9+BKyC6AX5BFlvQpXatUytx6yfRJk0N9SQQ+bH1YLKftMFnA+Q
	gxi7IwG8idANDyjyTiAyALT0NsJdvDqD5OlJ0Goeh+j07S36lcCjbPznl/TEWLfozMso
	P0DQp2jmQXPZ8hHvQmQ0TE+bhba/gLrt5MQXzV1G5JTpz5Z/9tFhi/tzoN1xYYDUzr/q
	E78g==
X-Gm-Message-State: AKwxytdC1PKygBZtQP10RUse8VMWjps+wd6quuvKTT9e3p2POv/tbF/2
	/PCKDQCPJweFbSgcH1/LXTA=
X-Google-Smtp-Source: AH8x224afYFGwQc1UWnmI0qyxGuYIeifXIWuYwUUsxGLa56ilkSESxoSUoOLNhW1Gxo5M8MmDGhXGw==
X-Received: by 10.101.83.133 with SMTP id x5mr16812293pgq.244.1517023502976;
	Fri, 26 Jan 2018 19:25:02 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:2999:2a82:b9b6:e74c])
	by smtp.gmail.com with ESMTPSA id
	v22sm6692206pfa.158.2018.01.26.19.25.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 19:25:02 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 19:24:24 -0800
Message-Id: <1d89597ff5015ca171f6a76c59f77f8cdf7d13bc.1517023286.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517023286.git.akuster808@gmail.com>
References: <cover.1517023286.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 24/36] fltk: remove fltk-native from DEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 27 Jan 2018 03:25:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

This depemdency is a pre recipe specific sysroot remnant.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 5a7a0abb179d0418475ca0f491cd1250ac728e44)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/fltk/fltk.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/fltk/fltk.bb b/meta-oe/recipes-support/fltk/fltk.bb
index 542fd66..619d142 100644
--- a/meta-oe/recipes-support/fltk/fltk.bb
+++ b/meta-oe/recipes-support/fltk/fltk.bb
@@ -1,6 +1,6 @@
 require ${BPN}.inc
 
-DEPENDS = "alsa-lib zlib jpeg libpng libxext libxft  ${BPN}-native"
+DEPENDS = "alsa-lib zlib jpeg libpng libxext libxft"
 
 inherit binconfig lib_package gtk-icon-cache mime
 
-- 
2.7.4


