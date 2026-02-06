Return-Path: <frederikbraendstrup@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E832AEB28EE
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 08:37:20 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7074.1770367032074877496
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Feb 2026 00:37:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SB6x7qdM;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: frederikbraendstrup@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so233046266b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Feb 2026 00:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770367030; x=1770971830; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBUpqtAmv+PDorsFJgaipRAKdWlXo6XjgdzlSLe9/Z4=;
        b=SB6x7qdMk5oCy1KHH2MiV4KueSP/vdHjUV713OpWUwAeTjQRYJWkm96WcCpfcsO8UR
         oIsuRsSA3AIw3uiBg8T9JO1gQH6o5tfD3v9LyJm6l5fRBDeoO8Ip+rpOWHKdRILcuBBC
         LQdKi+lHWOPgJWXLtIIcczvINKY6FCV260xv6tftxDuZgadvYqynE7Ny1PLs0qsnSqoh
         /duorNrvF+eS4HjIR4HVkYrPfOV5lIbp2Hy6w+puwWhJwOX7cl/2sgfr3CcRPBQueriu
         POS5qnFqP4p/GaM+aLUGL1koeXuw6HrH2N6ylsPRGPhAh9ZbNLkbBe4ujb2mMkp3Mn0C
         3axA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770367030; x=1770971830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nBUpqtAmv+PDorsFJgaipRAKdWlXo6XjgdzlSLe9/Z4=;
        b=ZEYAnzi/O29qZn8Zx1yFb4BCAb0IFziZOCV7Gmuh20vm2TA4e2ZYFRnXzwmwsuW/sA
         jrABDwc488TQw2Br7/fK0LZZipwTTdxa6RIStlfJTOedApTgn5Rj5yxk9weIGdchQRcH
         AB+vvWFGgkSUVSA3Vuy4Oatp10iCMK4KrE0HWxe0midQZkBgVYnTgb4HamWukZoWm7FC
         uiW9197hsFqzMOdeHm79UHvvcuN1Vu9Qh8sHAo0L9h543qZPqumry9n55lB3GjzssnEq
         8TeDfRCYLIINTIwPXodMiLAkguh+lR1d1UknH76SPnNQvdGeM4i0DbNondfqYo4UygH9
         YmVg==
X-Gm-Message-State: AOJu0YziFnzS2Z1/AhWF7MifcC/zfSmGUoUxPN27IEKH2eo1H9BL0nhc
	GJ4psYFPktBpP1GfG8RjmR8VO/nkbNrQ62e9rS3MEqLj+bQBMto+x4gNpilfhgIP
X-Gm-Gg: AZuq6aJNpVkei61meFSpL8BINep0TnrxvyKXhP0oRNWNYmZScXFNwBASjwvxOCAZ1o1
	uJptzl9gzqq+s/u7hH1CBMXlBdLaQPyzSPr6y9UAJ1g6pl/wAOgd4GGkEX/JgIghZGMKyIiupBo
	+I3daRFafx8c44HwFwV+Wv0zc9cz+Mltdxih1FUQXNcc4kBRXrQDu+6F7QcnFsW81zBhOJkQwo0
	JBenZ2JxFQN1mNCVtrPmuogZu5POA8bbhJAOqp+AQwkdOvM5H8vsNN4hVyCQ2RrH6VGVPHl6MyX
	lRhAp1bVnuwSBLxV6wMQdMtfuaKLsLTrNHoAks7IWMWD/DTmvlU2W/4Rw8H2JQGEz8BTVa+/ImV
	0irwmfclXZJOUn3x2hmdm+qHG52ArpyWcWzJO/bl34uFCmQFWqC6AiyHnqpbXmESexZQUEtFdK8
	3NFgIrN52nL2Ve1r6sI3BO+P//wsh+3vozJ2l7BJLmiYaRTS4e1IhUekJAxbE=
X-Received: by 2002:a17:906:c141:b0:b8e:a179:9f8a with SMTP id a640c23a62f3a-b8edf37d981mr85383166b.44.1770367030192;
        Fri, 06 Feb 2026 00:37:10 -0800 (PST)
Received: from ws.taila4487.ts.net (77.241.128.38.mobile.3.dk. [77.241.128.38])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7c310bsm64503766b.26.2026.02.06.00.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 00:37:09 -0800 (PST)
From: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
Subject: [meta-oe][PATCH v3 0/1] include glaze cmake files
Date: Fri,  6 Feb 2026 09:36:01 +0100
Message-ID: <20260206083559.471695-4-frederikbraendstrup@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206073208.340688-2-frederikbraendstrup@gmail.com>
References: <20260206073208.340688-2-frederikbraendstrup@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Feb 2026 08:37:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124239

v1 moved cmake files to where glaze originally installs cmake files
(/usr/share/glaze/*.cmake)

v2 reverts v1 and adds the cmake files to FILES:${PN}-dev

v3 reverts v2, going back to v1 and adds cmake files to FILES:${PN}-dev

Thanks to Peter Kjellerstedt for his insights here

Frede Hoey Braendstrup (1):
  glaze: include cmake files in glaze-dev package

 meta-oe/recipes-support/glaze/glaze_7.0.1.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

-- 


