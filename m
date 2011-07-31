Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josua.mayer97@googlemail.com>) id 1QnVOa-0004Gm-0l
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Jul 2011 14:45:29 +0200
Received: by fxg11 with SMTP id 11so4152241fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Jul 2011 05:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type;
	bh=U1Ydda5UAGZKFDUmbim3vtePrBx3LcM4kMV1N/B5Cdk=;
	b=e19hChyBzlLy4kyH9EJSEVHKDWnDSFlNlpDuq3r/iX5ZZp07BTCHFV8L7BzBeInoNC
	2s0LCyT6klR/buaZIqW4Tz6mtwE9DBmnFulKenBKRHvxpXLiBrYut7/jxE4yqsX4vl8Y
	9iWU/t7B5X7Qe2wOUElq9NSPMqHjE6Btqn+ww=
Received: by 10.223.59.17 with SMTP id j17mr4748428fah.120.1312116069163;
	Sun, 31 Jul 2011 05:41:09 -0700 (PDT)
Received: from [192.168.0.7] (pD957C863.dip.t-dialin.net [217.87.200.99])
	by mx.google.com with ESMTPS id c28sm2250633fam.40.2011.07.31.05.41.07
	(version=SSLv3 cipher=OTHER); Sun, 31 Jul 2011 05:41:08 -0700 (PDT)
Message-ID: <4E354D62.103@googlemail.com>
Date: Sun, 31 Jul 2011 14:41:06 +0200
From: Josua Mayer <josua.mayer97@googlemail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; de;
	rv:1.9.2.18) Gecko/20110616 SUSE/3.1.11 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1312042461-5212-1-git-send-email-user@server.WORKGROUP>
	<1312062322.3650.64.camel@mattotaupa>
In-Reply-To: <1312062322.3650.64.camel@mattotaupa>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [?PATCH] mplayer: fix linker error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 31 Jul 2011 12:45:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Am 30.07.2011 23:45, schrieb Paul Menzel:
> Dear Josua,
>
>
> thank you for your patch. A couple of remarks.
>
> Am Samstag, den 30.07.2011, 18:14 +0200 schrieb Josua Mayer:
>> From: = <=>
> 1. Please fix this line above.
> 2. If there are several recipe versions, also note in the commit summary
> which version you changed.
>
> 	mplayer_git: fix linker error
>
>> * use already existing patch fix-emu_qtx_api.diff
> 3. Your Signed-off-by line is missing. Please read our commit policy
> [1]. Please also read the other policies and howtos [3][4].
> 4. Somehow a question mark slipped into the patch tag in the
> subject/commit summary: `[?PATCH]`. Please resend your patch with a
> correct line, so that our patch queue can pick your patch up [2].
> 5. One question regarding your patch. What build configuration do you
> use? With `angstrom-2010.x` for `MACHINE = "beagleboard"` it works fine.
> For `minimal` with the same machine it fails with the following error.
>
> | Checking for LIVE555 Streaming Media libraries ... yes
> | Checking for FFmpeg (libavutil libavcodec libavformat libswscale libpostproc) ...
> | Error: Unable to find development files for some of the FFmpeg libraries above. Aborting. If you really mean to compile without FFmpeg support use --disable-ffmpeg.
> |
> | Check "config.log" if you do not understand why it failed.
>
> So I am wondering why you experience this error.
>
>> ---
>>  recipes/mplayer/mplayer_git.bb |    1 +
>>  1 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/recipes/mplayer/mplayer_git.bb b/recipes/mplayer/mplayer_git.bb
>> index 259ce99..5f15618 100644
>> --- a/recipes/mplayer/mplayer_git.bb
>> +++ b/recipes/mplayer/mplayer_git.bb
>> @@ -8,6 +8,7 @@ DEPENDS = "libvpx live555 libdvdread libtheora virtual/libsdl ffmpeg xsp zlib li
>>  RDEPENDS_${PN} = "mplayer-common"
>>  LICENSE = "GPL"
>>  SRC_URI = "git://repo.or.cz/mplayer/glamo.git;protocol=git;branch=mplayer2 \
>> +	file://fix-emu_qtx_api.diff \
>>     "
>>  
>>  SRC_URI_append_armv7a = " \
>
> Thanks,
>
> Paul
>
>
> [1] http://openembedded.org/index.php/Commit_Policy
> [2] http://patches.openembedded.org/project/oe/list/
> [3] http://openembedded.org/index.php/How_to_submit_a_patch_to_OpenEmbedded
> [4] http://openembedded.org/index.php/Commit_Patch_Message_Guidelines
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
Thank you for these advices.
1.-4.: I will resend the patch once my current build finishes(might take
a day or so)
5.: I was building shr for a modified version of the ion machine
configuration and mplayer produced these linker errors:
| loader/module.o: In function `MODULE_GetProcAddress':
| module.c:(.text+0x125): undefined reference to `report_entry'
| module.c:(.text+0x12f): undefined reference to `report_ret'
| module.c:(.text+0x139): undefined reference to `wrapper_target'
| module.c:(.text+0x13e): undefined reference to `wrapper'
| loader/module.o: In function `LoadLibraryExA':
| module.c:(.text+0x10d4): undefined reference to `report_entry'
| module.c:(.text+0x10de): undefined reference to `report_ret'
| module.c:(.text+0x10ea): undefined reference to `wrapper_target'
| module.c:(.text+0x10f0): undefined reference to `wrapper'
| collect2: ld returned 1 exit status
so I looked at the patches in the files subfolder and found
fix-emu_qtx_api.diff which fixed these errors for me.

