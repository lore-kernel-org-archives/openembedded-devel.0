Received: from mail-ia0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TQEWy-0003cE-QO
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Oct 2012 11:42:44 +0200
Received: by mail-ia0-f175.google.com with SMTP id b35so1861908iac.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Oct 2012 02:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Sd1U3MS51QSZc23Sz1qWXxj8tAeksXgthmjSyWpMg+4=;
	b=vm2RkkrqYBWv44Q+sGGePGxiSgHpuRr4SP/6YoSCKYKnJRG9vsJoqSWOHpi7yv7VsO
	hgCkxyq1JDVSHWvPq1dPKho5aysZfgGLwK2ASaSn2LTQ5WuGdJg/YUkA4UM5I0B1ufER
	jGxAlt2taM3yfGaV1LZgzI1lZAozk6Lj8H1OLoJ2+T6YPDEX2leWDyGjew81T9F0alYy
	CjoTHqI2vIxqwTw7/6vs8XoTnJMVQkbrteqgULdEI/XGxY7gfOg2i/+6Nl10plgKIT6f
	6uyaMMJUQ0uRTcR9HiI2C6X2TsODMID/4TuLl8bQtOH8tQ/WXVzuYfod8DfxaeQLEJDu
	5zrQ==
MIME-Version: 1.0
Received: by 10.50.104.232 with SMTP id gh8mr4974444igb.45.1350898159447; Mon,
	22 Oct 2012 02:29:19 -0700 (PDT)
Received: by 10.64.20.113 with HTTP; Mon, 22 Oct 2012 02:29:19 -0700 (PDT)
In-Reply-To: <20121019164922.1E2EC103B4@opal>
References: <20121019164922.1E2EC103B4@opal>
Date: Mon, 22 Oct 2012 11:29:19 +0200
Message-ID: <CALbNGRQkhneW4PXcmXTObg_wkbtjBm3AEWrSr2nwT7MB+otbtg@mail.gmail.com>
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
X-List-Received-Date: Mon, 22 Oct 2012 09:42:45 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 19, 2012 at 6:49 PM,  <git@git.openembedded.org> wrote:
> Module: openembedded-core.git
> Branch: master-next
> Commit: 0ea24447842e6b76ccfee0881f557e1a82e89ef1
> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=0ea24447842e6b76ccfee0881f557e1a82e89ef1
>
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Thu Oct 18 15:58:25 2012 +0000
>
> autotools: Use STAGING_DATADIR_NATIVE for config.rpath
>
> For builds that don't use gettext, config.rpath may not exist in the target
> datadir. This change uses the native directory where it will always
> be present due to gettext-minimal-native (which allows us to autoreconf
> recipes using gettext even if we don't have gettext built).
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
I think this causes here for shadow-native:

ERROR: Function failed: do_configure (see
/home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/shadow-native-4.1.4.3-r8/temp/log.do_configure.19593
for further information)
ERROR: Logfile of failure stored in:
/home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/shadow-native-4.1.4.3-r8/temp/log.do_configure.19593
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing shell function do_configure
| automake (GNU automake) 1.12.3
| Copyright (C) 2012 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later
<http://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
|
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.12
| cp: cannot stat
`/home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/share/gettext/config.rpath':
No such file or directory
| ERROR: Function failed: do_configure (see
/home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/shadow-native-4.1.4.3-r8/temp/log.do_configure.19593
for further information)

Maybe some PR bump here and there required?

Andreas


