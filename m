Return-Path: <daniel@zonque.org>
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
	by mail.openembedded.org (Postfix) with ESMTP id 472EE6E660
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Jun 2017 07:30:05 +0000 (UTC)
Received: from [192.168.178.170] (p5DDC6523.dip0.t-ipconnect.de
	[93.220.101.35])
	by mail.bugwerft.de (Postfix) with ESMTPSA id E56B528001B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Jun 2017 07:29:30 +0000 (UTC)
To: openembedded-devel@lists.openembedded.org
References: <1496212846-21304-1-git-send-email-samuli.piippo@qt.io>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <6780201c-a87e-730f-4cb2-9545d6ffe782@zonque.org>
Date: Thu, 1 Jun 2017 09:30:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <1496212846-21304-1-git-send-email-samuli.piippo@qt.io>
Subject: Re: [meta-qt5][PATCH] Upgrade to Qt 5.9.0
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
X-List-Received-Date: Thu, 01 Jun 2017 07:30:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/31/2017 08:40 AM, Samuli Piippo wrote:
> * adapt QtWebEngine recipe to use GN instead of GYP
> * add QtRemoteObjects as a new Qt module
> * update available QtBase configure arguments
> * remove obsolete patches
> * patch all .pc files to remove build paths
> * include generated QML cache files in packages
> * the patch "configure paths for target qmake properly" could not
>   be applied anymore and support must be done differently

When trying to build qtwebengine, I get the following:

| [1/330] CC base/third_party/libevent/buffer.o
| FAILED: base/third_party/libevent/buffer.o
| cc -MMD -MF base/third_party/libevent/buffer.o.d
-I/home/daniel/src/poky/build/tmp-glibc/work/aarch64-nepos-linux/qtwebengine/5.9.0+gitAUTOINC+73f7be5b2a_aa2fdd6be3-r0/build/src/3rdparty/chromium/tools/gn/out/Release/gen
-I/home/daniel/src/poky/build/tmp-glibc/work/aarch64-nepos-linux/qtwebengine/5.9.0+gitAUTOINC+73f7be5b2a_aa2fdd6be3-r0/git/src/3rdparty/chromium
-I/home/daniel/src/poky/build/tmp-glibc/work/aarch64-nepos-linux/qtwebengine/5.9.0+gitAUTOINC+73f7be5b2a_aa2fdd6be3-r0/git/src/3rdparty/chromium/base/third_party/libevent/linux
-DNO_TCMALLOC -D__STDC_FORMAT_MACROS -O2 -g0 -D_FILE_OFFSET_BITS=64
-D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -pthread -pipe
-fno-exceptions -D__STDC_FORMAT_MACROS -DNO_TCMALLOC
-D__STDC_FORMAT_MACROS -O2 -g0 -D_FILE_OFFSET_BITS=64
-D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -pthread -pipe
-fno-exceptions -D__STDC_FORMAT_MACROS -DHAVE_CONFIG_H  -c
/home/daniel/src/poky/build/tmp-glibc/work/aarch64-nepos-linux/qtwebengine/5.9.0+gitAUTOINC+73f7be5b2a_aa2fdd6be3-r0/git/src/3rdparty/chromium/base/third_party/libevent/buffer.c
-o base/third_party/libevent/buffer.o
| /bin/sh: cc: command not found


Any idea?


Thanks,
Daniel

