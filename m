Received: from mail-ia0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TQEZW-0003lL-8M
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Oct 2012 11:45:22 +0200
Received: by mail-ia0-f175.google.com with SMTP id b35so1863180iac.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Oct 2012 02:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=dp3/2NO3HXoD9L8giODZH0CRxe07I/jSKHNrMutoSrU=;
	b=D7BJJN1p9LmfvpcyLQuM9Z/9w2DgvHobHIpduuvCwda3kc9Klm050k5/7WKAzxkoyG
	HZCuGUB9y3jYTBgrxQFzsvBE6Gsj/1X8aKfTk5qrlHSqYAsPEKfdyjVp5y0JA2AZuLXr
	as3hlZkFNHFuNS2YueBajUYJXd9N9atsFZ6SSfmbyZ2AWLBeSjVTLzKpRDIBlY1teVfH
	MnZSkfmJPu/KDc1/KbeyOXSND2qsXP5G4gQSpgVcn4mqhG77g82in7EAXdToBgYegL7M
	Vro8tHWwxKDKX9zqczInPUuvPZZfmk8kvzszL1nl9dAiHjn74vyM4f/M/5tpsa33tNyV
	it6w==
MIME-Version: 1.0
Received: by 10.50.236.6 with SMTP id uq6mr8488063igc.50.1350898317054; Mon,
	22 Oct 2012 02:31:57 -0700 (PDT)
Received: by 10.64.20.113 with HTTP; Mon, 22 Oct 2012 02:31:57 -0700 (PDT)
In-Reply-To: <CALbNGRQkhneW4PXcmXTObg_wkbtjBm3AEWrSr2nwT7MB+otbtg@mail.gmail.com>
References: <20121019164922.1E2EC103B4@opal>
	<CALbNGRQkhneW4PXcmXTObg_wkbtjBm3AEWrSr2nwT7MB+otbtg@mail.gmail.com>
Date: Mon, 22 Oct 2012 11:31:57 +0200
Message-ID: <CALbNGRTcv1gpbYSc5wCwYi5fwyZ2taWzyTwN3dumUvyTQTagOw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Richard Purdie : autotools: Use STAGING_DATADIR_NATIVE for config.rpath
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
X-List-Received-Date: Mon, 22 Oct 2012 09:45:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 22, 2012 at 11:29 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Fri, Oct 19, 2012 at 6:49 PM,  <git@git.openembedded.org> wrote:
>> Module: openembedded-core.git
>> Branch: master-next
>> Commit: 0ea24447842e6b76ccfee0881f557e1a82e89ef1
>> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommi=
t;h=3D0ea24447842e6b76ccfee0881f557e1a82e89ef1
>>
>> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Date:   Thu Oct 18 15:58:25 2012 +0000
>>
>> autotools: Use STAGING_DATADIR_NATIVE for config.rpath
>>
>> For builds that don't use gettext, config.rpath may not exist in the tar=
get
>> datadir. This change uses the native directory where it will always
>> be present due to gettext-minimal-native (which allows us to autoreconf
>> recipes using gettext even if we don't have gettext built).
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
> I think this causes here for shadow-native:
>
> ERROR: Function failed: do_configure (see
> /home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/shadow-native-4.1.4.3-=
r8/temp/log.do_configure.19593
> for further information)
> ERROR: Logfile of failure stored in:
> /home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/shadow-native-4.1.4.3-=
r8/temp/log.do_configure.19593
> Log data follows:
> | DEBUG: Executing python function sysroot_cleansstate
> | DEBUG: Python function sysroot_cleansstate finished
> | DEBUG: Executing shell function autotools_preconfigure
> | DEBUG: Shell function autotools_preconfigure finished
> | DEBUG: Executing shell function do_configure
> | automake (GNU automake) 1.12.3
> | Copyright (C) 2012 Free Software Foundation, Inc.
> | License GPLv2+: GNU GPL version 2 or later
> <http://gnu.org/licenses/gpl-2.0.html>
> | This is free software: you are free to change and redistribute it.
> | There is NO WARRANTY, to the extent permitted by law.
> |
> | Written by Tom Tromey <tromey@redhat.com>
> |        and Alexandre Duret-Lutz <adl@gnu.org>.
> | AUTOV is 1.12
> | cp: cannot stat
> `/home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/share/gettext=
/config.rpath':
> No such file or directory
> | ERROR: Function failed: do_configure (see
> /home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/shadow-native-4.1.4.3-=
r8/temp/log.do_configure.19593
> for further information)
>
> Maybe some PR bump here and there required?
>
After forcing rebuild gettext-minimal-native shadow-native builds fine.

Andreas


