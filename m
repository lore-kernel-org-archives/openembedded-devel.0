Return-Path: <martin.jansa@gmail.com>
Received: from mail-yb0-f193.google.com (mail-yb0-f193.google.com
	[209.85.213.193])
	by mail.openembedded.org (Postfix) with ESMTP id C184E78353
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 21:51:45 +0000 (UTC)
Received: by mail-yb0-f193.google.com with SMTP id v129so1169162ybv.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 14:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZnksdMZwyZjz7fxteSnuEvdtydYTwtNgC1MxFF7JDJU=;
	b=BoAjnKM50/FF63TUzdVixbwN9S3Y6V/EIK90KXxEMNeaWbJvjC1jXfkr4FsQjoeoGv
	YmhNlp1g4fhVlbfaTEWwuXsvBAKwAu+uxI+J8x5/g85XMfl1Gb9G3U5oFb0P8M5tMDFI
	zWHIpLcA7tOgWOBgyBrHSg2DaV4aqTnRixO07aztvD1VT7vmh2Ar2hCXme7SmAEGhMrN
	qgYjeP8sMwzeF2xJD1egzZvKxfGHdOYtzPC2vKrgQVnIbswlENLBsCu/Owtq2DYuiyd0
	szPSUTSNvKky10mYSkQOYnn8aS8n5AvkuQAFPSBUHsg45RhUOJ+dhjNEmn99NpdFeA8c
	l3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZnksdMZwyZjz7fxteSnuEvdtydYTwtNgC1MxFF7JDJU=;
	b=KatkldbJ+a/rzel5DvlAL4bRFYgUGPSJr/CiqFGkuBvtn8DEZsBcEqAqb2M0tYVfbp
	MtGIV5V/YxAkkQ7EH7BNXjYSxRg9HkGH0oUODaMAqbMgjmIrAREyRPY+QodCUUl8DB6d
	/E2fuBlu0/CLxdSvGsztdg5CZTViy3Oee8PC3S/FsqmXNe8M603txGT5JGZNyH+x0yjH
	9I2cZ7Gi+0fj/9fLh34sOvGHWmtHdGUS8kOUX29xOXetItK5vwnmxQwZcrr0iEXZoiyh
	6aOUgQL267FsieVCh5OQHtQCatUi8Fl+LDqZc98myTk+9TEnEkCGdRy25GCFdi8M777N
	Jq+g==
X-Gm-Message-State: AIVw113sleIcHi9dNaGHDAdY3goGvF5hHiLWn2G8rNUlmosALO5jfDRR
	lmq/qMXpEyc1T+B9msQ2qhB4DJqFtQ==
X-Received: by 10.37.0.195 with SMTP id 186mr4422109yba.46.1500587506651; Thu,
	20 Jul 2017 14:51:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.77.4 with HTTP; Thu, 20 Jul 2017 14:51:46 -0700 (PDT)
In-Reply-To: <6930f0a2-4d9e-a862-5184-e532435fc800@gmail.com>
References: <1500579093-29708-1-git-send-email-jason.liu@gumstix.com>
	<6930f0a2-4d9e-a862-5184-e532435fc800@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 20 Jul 2017 23:51:46 +0200
Message-ID: <CA+chaQcHLZmKtf+8GVnhnUwcL6ecHwU0FKW7brsrDe4D23Qrsg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Jason Liu <jason.liu@gumstix.com>
Subject: Re: [meta-oe][morty][PATCH] libvdpau: Add recipe
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
X-List-Received-Date: Thu, 20 Jul 2017 21:51:45 -0000
Content-Type: text/plain; charset="UTF-8"

Then maybe you shouldn't backport those changes which added dependency on
it.

I've fine with either adding it to resolve this mess or reverting those 2
backports (for vlc and mpv).

On Thu, Jul 20, 2017 at 11:24 PM, akuster808 <akuster808@gmail.com> wrote:

>
>
> On 07/20/2017 12:31 PM, Jason Liu wrote:
>
>> From: Koen Kooi <koen@dominion.thruhere.net>
>>
>> Needed for x86 machines
>>
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>
>
> Sorry, I am not going to a new package to a stable branch.
>
> - armin
>
> ---
>>   meta-oe/recipes-graphics/vdpau/libvdpau_git.bb | 23
>> +++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>   create mode 100644 meta-oe/recipes-graphics/vdpau/libvdpau_git.bb
>>
>> diff --git a/meta-oe/recipes-graphics/vdpau/libvdpau_git.bb
>> b/meta-oe/recipes-graphics/vdpau/libvdpau_git.bb
>> new file mode 100644
>> index 0000000..31f4df4
>> --- /dev/null
>> +++ b/meta-oe/recipes-graphics/vdpau/libvdpau_git.bb
>> @@ -0,0 +1,23 @@
>> +SUMMARY = "Video Decode and Presentation API for UNIX"
>> +
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=83af8811a28727a13f04132cc33b7f58"
>> +
>> +DEPENDS = "virtual/libx11 libxext dri2proto"
>> +
>> +PV = "1.1.1+git${SRCPV}"
>> +
>> +SRCREV = "a21bf7aa438f5dd40d0a300a3167aa3d6f26dccc"
>> +SRC_URI = "git://anongit.freedesktop.org/vdpau/libvdpau"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +inherit autotools pkgconfig
>> +
>> +do_install_append() {
>> +    rm -f ${D}${libdir}/*/*.la
>> +}
>> +
>> +FILES_${PN}-dbg += "${libdir}/vdpau/.debug"
>> +FILES_${PN}-dev += "${libdir}/vdpau/lib*${SOLIBSDEV}"
>> +FILES_${PN} += "${libdir}/vdpau/lib*${SOLIBS}"
>>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

