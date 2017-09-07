Return-Path: <athoik@gmail.com>
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com
	[209.85.161.178])
	by mail.openembedded.org (Postfix) with ESMTP id B0871780B8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Sep 2017 16:33:54 +0000 (UTC)
Received: by mail-yw0-f178.google.com with SMTP id s62so770381ywg.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Sep 2017 09:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=yk1sSK7JQtGw+WUnK1bojvjgi7srSvAgv3esp2Tss6E=;
	b=ZEPf9ChGrabxMl4c9U4VnciJNb3F4ynscz0e+7e3j4RqHQCeSUhoqpRDILgSSjniv4
	nJtqj0bv1y8Mtmta5C0ZTyZEmfaiSnvJfTcVil8dx9xR5oIvLXdwT2AxpJ8dM84D0iB0
	3PeDtzHfkflOVOfPaRF4bAGPTfupefsPwk2AdPeTTQGObRn88lWBKBaSR8+HeyIJSDhw
	vnAstJZOmYFTi5zIOzYTsIrxV8YNhs4VrBxhM7ZduXJhqztw2lSuhJ2IK5Uq3/bt/NV2
	mO/KW1sfDZwqGIG44PA6lvF2o34zwRwwbqt5LneDNZ93s3eBQQBHqAqgm3zzOqSvo+X+
	0Wqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=yk1sSK7JQtGw+WUnK1bojvjgi7srSvAgv3esp2Tss6E=;
	b=qdFZp29IxHYXXyvJHrV+mLycvuxyjnrVryYcKdJHJXWOekkJMW9lhcCMJwWMzZTU2D
	BHWjbQSdRGAwFnjrQyhITLH2YoTyFYLVIY0oJYosJoCZbxw+ZZM6bkXqflwXiyA2hlzX
	eeedKbKrRk7s0iLfzzsKWkStInYaZGXSRudALAcSVqzYCG+F4Sh7pZDL5bV5oInyxNT1
	i9HZuz8nASf7EdKOpzvt0uw64bwl7bkofNAV6Wm0nGi4CxGEtNObRwthxeEyDCoXYv/e
	HkAYfvuHkMwxH2t9llusID/eaUMwc9/zCrJs0OeVxhxpDfEhmwdkxWAthikboBEJscAR
	ppkw==
X-Gm-Message-State: AHPjjUiY8TpiDGtx0TsNtadiBFxeFTuTaKFhtJD64dECkdUqnP9zSrRK
	zCWhfA1MOyxNroz8l0Ts4A27NWD8Jqev
X-Google-Smtp-Source: ADKCNb73UGiNKsbYUNjqHTVJykc4a8wwNvtStUHCdeSayrxZZ79cIDXPPlVUZVe6Tidwr1SzXi6TvHUkU/rEfCYh+yI=
X-Received: by 10.37.111.84 with SMTP id k81mr2747747ybc.105.1504802035118;
	Thu, 07 Sep 2017 09:33:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.190.82 with HTTP; Thu, 7 Sep 2017 09:33:54 -0700 (PDT)
From: =?UTF-8?B?zpHOuM6xzr3OrM+DzrnOv8+CIM6fzrnOus6/zr3PjM68zr/PhQ==?=
	<athoik@gmail.com>
Date: Thu, 7 Sep 2017 19:33:54 +0300
Message-ID: <CANDbA3cAg=63EdcOxQsqGemMdjv2jtd19Oig-zQtFqSUAuT8Ow@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: v4l-utils build failure
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
X-List-Received-Date: Thu, 07 Sep 2017 16:33:54 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

I am having troubles building v4l-utils using master branch of poky.

| Making all in cec-ctl
| make[3]: Entering directory
'/opt/openpli/openpli7/build/tmp/work/mips32el-oe-linux/v4l-utils/1.12.3-r0/build/utils/cec-ctl'
| ../../../v4l-utils-1.12.3/utils/cec-ctl/msg2ctl.pl 0
../../../v4l-utils-1.12.3/include/linux/cec.h
../../../v4l-utils-1.12.3/include/linux/cec-funcs.h >cec-ctl-gen.h
| mipsel-oe-linux-g++  -mel -mabi=32 -mhard-float -march=mips32
--sysroot=/opt/openpli/openpli7/build/tmp/work/mips32el-oe-linux/v4l-utils/1.12.3-r0/recipe-sysroot
-DHAVE_CONFIG_H -I. -I../../../v4l-utils-1.12.3/utils/cec-ctl -I../..
 -I../../../v4l-utils-1.12.3/lib/include -Wall -Wpointer-arith
-D_GNU_SOURCE -I../../../v4l-utils-1.12.3/include   -Os -pipe -g
-feliminate-unused-debug-types
-fdebug-prefix-map=/opt/openpli/openpli7/build/tmp/work/mips32el-oe-linux/v4l-utils/1.12.3-r0=/usr/src/debug/v4l-utils/1.12.3-r0
-fdebug-prefix-map=/opt/openpli/openpli7/build/tmp/work/mips32el-oe-linux/v4l-utils/1.12.3-r0/recipe-sysroot-native=
-fdebug-prefix-map=/opt/openpli/openpli7/build/tmp/work/mips32el-oe-linux/v4l-utils/1.12.3-r0/recipe-sysroot=
 -fvisibility-inlines-hidden -c -o cec-ctl.o cec-ctl.cpp
| ERROR: oe_runmake failed
| mipsel-oe-linux-g++: error: cec-ctl.cpp: No such file or directory
| mipsel-oe-linux-g++: fatal error: no input files
| compilation terminated.
| Makefile:531: recipe for target 'cec-ctl.o' failed
| make[3]: *** [cec-ctl.o] Error 1

Changing the inherit autotools to autotools-brokensep everything works fine.

Can somebody confirm the issue as well?

I can send a PR that changes to autotools-brokensep, unless there is a
better solution.

Thanks,
Athanasios

