Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00FACC9832F
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 20:51:44 +0000 (UTC)
Received: from mail-dy2-f14.google.com (mail-dy2-f14.google.com [74.125.229.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44732.1790542298090950145
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 13:51:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oO8HPSHg;
 spf=pass (domain: gmail.com, ip: 74.125.229.14, mailfrom: raj.khem@gmail.com)
Received: by mail-dy2-f14.google.com with SMTP id 5a478bee46e88-328664b7528so2292269eec.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 13:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790542297; x=1791147097; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hn3YGuPuyVlscWmLOhT1X8eTjpTC1qtcYLoJtefXtH0=;
        b=oO8HPSHgaAvwChXbGavZKmvZ35QuMsVFPEalzqnWdBwvtm9YxhQKOglbshGUtYswQa
         P3xHFM2E2RL0KrZTOHQ7n/mtkLt+z1GwiTxCtYZMgrcXn2miH6k388Ibq/vQfGiJRUvq
         +GrepgO8swC2p23i0oksL4bhXM7ANtNQpeMVWWT4NdnrUc0B94J7zuof97if77ipKGDo
         B+v96HKD9D0ekkzuvSacJzCUQp1aeHwD0GnnM1A2mKHbGYKV09HaJjNf67fPSyTRBATv
         MCGES/fnWzq4fpCrfocbfkd63oVdqh4gJVDD1LTYE1dkfkh9nMHjdMlCQfoKBNDpRf3w
         4FSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790542297; x=1791147097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hn3YGuPuyVlscWmLOhT1X8eTjpTC1qtcYLoJtefXtH0=;
        b=vdcyLJmn9dFnjHRvgKO7OFyrsOtPwTXvaiZN1YQ8JPrJyOw45NiVbOBdeYtMZJz+EL
         RfCn+I0AbIDnfMq6ALyrlkHFIjtLa4nNNw6RNzg6ZC2StDpA/8UMeLkYr48AbsJLvYsg
         ewud3PnD7bf5uZx/7I1sjSJCLQeAEc1sb3W9G/DK/RTmIWHemXn/aVlSj2nPkpmeJV2u
         9vKxrKjvcQ0Yq2mreuWCCd9c/Y2yIZbAfhYEoZHK5BK7mBj7gRjmZZnqVmAX1BF7qtvx
         +xFFx5FDt/43NmKdtQwxDJ3+3V7QqFu8MVu1I+bitRHP0Hih3PGLnEY3/Ca38JxBkKsq
         jnIA==
X-Gm-Message-State: AFq9FYIgBrr5q6QlJjk4n/o2QlmOnf0XQl9YZOO/OF85gQw4Mg67DeHn
	tKzE4ehTt54YFoe4Bokaj2v3WRag0wagzMuudaRQHjfwSdDNIjkEvIs26jnZuUDa
X-Gm-Gg: AYBFou3rc7V2C4SMupwSWqaFTI63Z1QQqyKcyw4x+gbtiuChmWVKB6DcsuxqpeZ1x9B
	b6ywCywruv+nP/SNwm/Hkq4CRq0R+2XX2rFW1yr0ZFYq8ZH+vFxWM6T83+DDv0/Am2mK/5KUyRm
	VE57pVeV7r23wnjVR69Be7CbfkOMaVTVVZLNtNGkAPfg9VA+0EobQFd92oroElmt3qKl41ltCx7
	0pni6ncUB8WNdmlliF6QpCbNJi6wagE1zZ4djWWXykppEPaC25hteX984Ec0tDXPBI57dDPnZkG
	hnNkGSgUrIxvjmiiNF8hPIScjA9HaLUXrRSW+2zgoSMAWmdnDND7qUFc8YY3BNDblTBpRsfr1dZ
	UqyVR0fYGdLy55aRzGaecB4EIuCKhznTEh2udhaIfAuKnlR2hk5KvJSrLC9zKjwmGt8SqHQ/h8f
	T44YtmciK0iP+zsOtx2kV16iQIygdYGg+CeB/xw6UylMc+EhtPCriYHEuwM9XYj7Oq26WfZ8irB
	p3NT/JnWklozKK39ydlOQbC+rLFuktTDRx7eTbPv/ayyQwLgkwHkIx4JAytR+Wa/DYjXc/MnJ1X
	JDuqU2/6zzJx2f8IZd43NzjfTLVyljX2MQ7OZCa2KQ/s+y8DvgMrAnxPQRaLk9PZiYMjKGD/aNs
	5Q78AHYVQllhEHF9qDiEGNbDwYAcznYBGbIVP45G8qqak9RPwONs6I37/m+tNCDATYq8ijbhTJI
	WmZiBlGA+L+Zf0XbOvQus6D9okCiw7fDqx0VG3Tw==
X-Received: by 2002:a05:693c:2a02:b0:339:794b:c068 with SMTP id 5a478bee46e88-3427354e265mr6917837eec.40.1790542297033;
        Sun, 27 Sep 2026 13:51:37 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3444fd04d93sm5674189eec.12.2026.09.27.13.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:51:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 2/2] conserver: depend on virtual/crypt instead of libxcrypt
Date: Sun, 27 Sep 2026 13:51:31 -0700
Message-ID: <20260927205131.233612-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927205131.233612-1-khem.raj@oss.qualcomm.com>
References: <20260927205131.233612-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 20:51:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130384

conserver only needs crypt(). Depending on libxcrypt directly pulls it
in even on musl, whose libc already provides crypt(). Use virtual/crypt
so the libc's preferred provider is used: libxcrypt on glibc, musl
itself on musl.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-connectivity/conserver/conserver_8.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/conserver/conserver_8.3.0.bb b/meta-oe/recipes-connectivity/conserver/conserver_8.3.0.bb
index c32d6f9646..8ca5d9c95d 100644
--- a/meta-oe/recipes-connectivity/conserver/conserver_8.3.0.bb
+++ b/meta-oe/recipes-connectivity/conserver/conserver_8.3.0.bb
@@ -15,7 +15,7 @@ SECTION = "console/network"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b28513e7b696027d3d2b8dbf117f9fe5"
 
-DEPENDS = "libxcrypt"
+DEPENDS = "virtual/crypt"
 
 inherit autotools ptest systemd useradd
 

