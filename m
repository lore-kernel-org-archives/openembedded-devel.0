Return-Path: <alfonso@tames.com>
X-Greylist: delayed 315 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 14 Dec 2014 07:51:40 UTC
Received: from mail.tames.com (tames.com [72.2.119.182])
	by mail.openembedded.org (Postfix) with ESMTP id EC35A7113B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Dec 2014 07:51:40 +0000 (UTC)
Received: from [10.178.247.148] (unknown [187.189.165.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alfonso@tames.com)
	by mail.tames.com (Postfix) with ESMTPSA id 47D9B29969
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Dec 2014 07:46:17 +0000 (UTC)
Message-ID: <548D4051.5080504@tames.com>
Date: Sun, 14 Dec 2014 01:46:25 -0600
From: =?UTF-8?B?QWxmb25zbyBUYW3DqXM=?= <alfonso@tames.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Virus-Scanned: clamav-milter 0.98.1 at 56cb6755-5e21-c698-f8be-a3023abd5444
X-Virus-Status: Clean
Subject: Cross canadian gcc configuration
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 14 Dec 2014 07:51:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I just bitbaked an arm based (freescale) Yocto Master image and 
populated an sdk with -c populate_sdk.

When I try to compile a hello world program with the 
arm-poky-linux-gnueabi-gcc compiler, first I get an error not finding 
<stdio.h>, and when I pass the directory through the -I flag, I get the 
classic"stubs.h:7:29: fatal error: gnu/stubs-soft.h: No such file or 
directory" error which I supposed is being thrown since gcc cross 
canadian is not being configured by default (as my image) hard float.

I noticed in the gcc-cross-canadian.inc that the --with-gxx-include-dir 
and --with-sysroot in EXTRA_OECONF_PATHS have a "/not/exist" string:

EXTRA_OECONF_PATHS = "\
--with-gxx-include-dir=/not/exist${target_includedir}/c++/${BINV} \
--with-build-time-tools=${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin 
\
--with-sysroot=/not/exist \
--with-build-sysroot=${STAGING_DIR_TARGET} \
"

Shoudn't it be ${SDKPATH} instead of "/not/exist" ?

I think that would resolve not finding the include dirs. Now, for the 
environment not picking a hard float image and producing a 
gcc-cross-canadian accordingly, where should I be looking?

Thanks,

Alfonso



