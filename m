Return-Path: <schaefer.hutter@gmail.com>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id E42EE6018C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2016 09:47:46 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id d185so22260952vkg.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2016 02:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=jp6WX6xvsta2oLZxtbJUtg/f3hHbHvtIuq3n+vyuTys=;
	b=DE/hpuXcqTC2//ygVlmoHQG+MMKIapGcrx5pgxpePVKhs7Q78kvfK4msK6m+mYeIFh
	csbabpwPJhfeM0z9kiFO1U09E5ixrMIOCIYZBpy47sGiNH32T8x2PqLKudDJJiJ1NT2t
	L5viIGC03/FWdCb4E7//qWPubYEJMqORb02vY7ASWPqP1W9zHrOpcrj4plV6gBr2o4gX
	0rhV26egAddL+aJ7XghcqlPx3N35oHToz19iTpDiwRvR7MultnGhXLLzXju3n6XQXgd4
	PJtz1Dw+/osUzs2Gjl3xVUCoA/aOxxsqCwZm4BkP11CL7EgoIH/G2CvGpLMbL/sBVPmz
	/WbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=jp6WX6xvsta2oLZxtbJUtg/f3hHbHvtIuq3n+vyuTys=;
	b=dN5lyKKqeIHn+B13KBhB9ruwuVNlRHYfNyLCx/d4jU3SPLCykYGFA3PD9m9E2nmEEV
	lvJon1tTqYJLdKPX4A5K8NklS6go8Uj7CHJVdym6TJwmn3quj/DCArb+IZcvdiChAMIH
	W6+RYEc1zG4VjqUYq3c1sR+LQrl+1IaL7gxMUvwjmnPuBNLdHX0+CxhpP67HKp7lAmNb
	amLm8NA0gQcclePGVN6CunJLu1iy1LWM9zc4FjxGyBVNAZ4KQeqGpn5B+vVjb8zvU4OP
	1ElQXa81mxcu1xX3uCgdhPSHEBfB1o7uGgL48F0YfpaB8jHKA+4/T2WX0tsvfw0CF5UQ
	1/Gg==
X-Gm-Message-State: ALyK8tI1sVM+R8qyfW75LeRaKbXxqp54XlxT1yn3cCBqA2qNVTxcjsPHfjsnlWmBgYyoIeDhWHcLQ2a0snqwSA==
X-Received: by 10.176.69.141 with SMTP id u13mr11589687uau.133.1465984066943; 
	Wed, 15 Jun 2016 02:47:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.77 with HTTP; Wed, 15 Jun 2016 02:47:46 -0700 (PDT)
From: =?UTF-8?B?U2Now6RmZXItSHV0dGVy?= <schaefer.hutter@gmail.com>
Date: Wed, 15 Jun 2016 11:47:46 +0200
Message-ID: <CAK7uLydzisVkd4Tc+qNYZV3o1CeyXcbBjKpNu2eXE3TOANncEQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe] gpsd fails to compile due to scons-generated malformed command line
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
X-List-Received-Date: Wed, 15 Jun 2016 09:47:47 -0000
Content-Type: text/plain; charset=UTF-8

Hi there,

I'm getting the following error when trying to compile gpsd:

| arm-linux-gnueabihf-gcc -march=armv7-a -marm -mthumb-interwork
-mfloat-abi=hard -mfpu=neon -mtune=cortex-a15
--sysroot=/home/ashaepe/yocto/tmn2000/build/arago-tmp-external-linaro-toolchain/sysroots/k2l-evm
-o bits.os -c -isystem/opt/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabihf/include
-Wno-error=unused-value -fstack-protector -O2 -pipe -g
-feliminate-unused-debug-types -D_GNU_SOURCE
--sysroot=/home/ashaepe/yocto/tmn2000/build/arago-tmp-external-linaro-toolchain/sysroots/k2l-evm
-Wextra -Wall -Wno-uninitialized -Wno-missing-field-initializers
-Wcast-align -Wmissing-declarations -Wmissing-prototypes
-Wstrict-prototypes -Wpointer-arith -Wreturn-type -g -O0 -fPIC "
-isystem/opt/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabihf/include
-Wno-error=unused-value -fstack-protector" bits.c
| arm-linux-gnueabihf-gcc: error:
-isystem/opt/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabihf/include
-Wno-error=unused-value -fstack-protector: No such file or directory
| scons: *** [bits.os] Error 1

Obviously the command line part in double quotes ("
-isystem/opt/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabihf/include
-Wno-error=unused-value -fstack-protector") is wrongly placed/repeated
by SCons.

But I'm lost finding a reason for this behaviour? Any hint would be
appreciated greatly...

Regards,
  Peter

