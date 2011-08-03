Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josua.mayer97@googlemail.com>) id 1QoamN-0000tY-3I
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Aug 2011 14:42:31 +0200
Received: by eyh6 with SMTP id 6so193723eyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Aug 2011 05:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type;
	bh=/YZZ9fwH8ilgEMKX6KAptHlAq6zAv0p7LinciR1QbuI=;
	b=XOqy3jIu3VQCVGx1j9V3mZOdOZy+IF+Y6Y+0m+kLLpxTIGSikya9CYQnkdkqU/P53x
	hMjeB7b33c+tMeCP11MHiHyr2zeQp2yUo6Gmk17ttapdiBdgEsMMAz87kTmcs9ufd5DQ
	SGrs/3jkhSl4fFq0Z8UaPkO8tqt2COoj704oA=
Received: by 10.204.152.147 with SMTP id g19mr2276433bkw.237.1312375088557;
	Wed, 03 Aug 2011 05:38:08 -0700 (PDT)
Received: from [192.168.0.7] (pD957CCD0.dip.t-dialin.net [217.87.204.208])
	by mx.google.com with ESMTPS id x1sm2483497fah.0.2011.08.03.05.38.06
	(version=SSLv3 cipher=OTHER); Wed, 03 Aug 2011 05:38:07 -0700 (PDT)
Message-ID: <4E39412E.8030507@googlemail.com>
Date: Wed, 03 Aug 2011 14:38:06 +0200
From: Josua Mayer <josua.mayer97@googlemail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; de;
	rv:1.9.2.18) Gecko/20110616 SUSE/3.1.11 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1312311949-3788-1-git-send-email-josua.mayer97@googlemail.com>
	<1312370150.19311.163.camel@mattotaupa>
In-Reply-To: <1312370150.19311.163.camel@mattotaupa>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH v2] mplayer_git: Fix linker error on x86 machines
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
X-List-Received-Date: Wed, 03 Aug 2011 12:42:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Am 03.08.2011 13:15, schrieb Paul Menzel:
> Dear Josua,
>
>
> thank you for sending a patch iteration with my comments addressed. Just
> a side note, you can use `git commit --amend` to edit the commit message
> of the last commit. I do not know if you used that since the date looks
> different from your initial patch.
>
> Am Dienstag, den 02.08.2011, 21:05 +0200 schrieb Josua Mayer:
>> * fix undefined references  in loader/module.o:
>>   module.c:(.text+0xd60): undefined reference to `report_entry'
>>   module.c:(.text+0xd6a): undefined reference to `report_ret'
>>   module.c:(.text+0xd74): undefined reference to `wrapper_target'
>>   module.c:(.text+0xd7a): undefined reference to `wrapper'
>>   and more of these
>> * Apply already existing patch fix-emu_qtx_api.diff
>>   This patch was already used in mplayer_svn but is needed
>>   for the git version too.
>>
>> Signed-off-by: Josua Mayer <josua.mayer97@googlemail.com>
>> ---
>>  recipes/mplayer/mplayer_git.bb |    3 ++-
>>  1 files changed, 2 insertions(+), 1 deletions(-)
>>
>> diff --git a/recipes/mplayer/mplayer_git.bb b/recipes/mplayer/mplayer_git.bb
>> index 259ce99..995884b 100644
>> --- a/recipes/mplayer/mplayer_git.bb
>> +++ b/recipes/mplayer/mplayer_git.bb
>> @@ -8,7 +8,8 @@ DEPENDS = "libvpx live555 libdvdread libtheora virtual/libsdl ffmpeg xsp zlib li
>>  RDEPENDS_${PN} = "mplayer-common"
>>  LICENSE = "GPL"
>>  SRC_URI = "git://repo.or.cz/mplayer/glamo.git;protocol=git;branch=mplayer2 \
>> -   "
>> +           file://fix-emu_qtx_api.diff \
>> +          "
>>  
>>  SRC_URI_append_armv7a = " \
>>  	   file://0001-video-out-for-omapfb-support.patch \
> Long story short I should have looked right away at the commit log for
> the patch file [1]. Reading that it would have been clear that this is
> needed for x86 targets which the ION seems to be. I thought SHR is
> primarily used for ARM mobile devices [2].
>
> Therefore I always want to have the build configuration output from
> BitBake pasted in messages and commit messages.
>
> It would be great if you could bring that patch upstream somehow.
>
> I committed your patch with an improved commit message and a `PR` bump
> (I hope done correctly) in 1a91fc4b [3].
>
> Unfortunately I could not test this because using `DISTRO = "shr"` and
> `MACHINE = "ion"` fails with the following error message.
>
>         Error, Your PACKAGE_ARCHS field contains duplicates. Perhaps you set PACKAGE_EXTRA_ARCHS twice accidently through some tune file?
>
> So please remember to be as elaborate as possible and to provide all
> files for others to reproduce your problem. I know looking at the
> archive and commit log not everyone follows this rule but it would have
> saved me quite some time.
>
>
> Thanks,
>
> Paul
>
>
> [1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=ff57f14c99a6ff61ffb7f1c533523e3e934f96e5
> [2] http://shr-project.org/trac
> [3] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=1a91fc4b705b0c4f45eb088a2f7aea01ebc9c98e
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
In fact I did not use amend but reverted the commit and made a new one.
I wasn't sure if a PR bump was needed as the patch does not change
mplayer in a way that would require people to update it, it only matters
to platforms where it didnt compile before so it wasnt available anyway.
The bitbake error comes from tune-atom.inc:
PACKAGE_EXTRA_ARCHS += "x86 i386 i486 i586 i686"
I removed the i696 there and it would work. I cant send a patch for this
as I do not know whats the correct way to fix this problem.

