Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TQEz2-00050T-F6
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Oct 2012 12:11:44 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so3218059ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Oct 2012 02:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=aZK6Yemq4ZwspVGZwX6wJ/iksCcpo6go28IHjw2OCZw=;
	b=AzRu/0nFbineUmBXaCU3Z0Oz1oMQaRyt9P+b5QNPk22OfCtZUrZI3XSlFBhVFIfJJW
	VCgP6xcM7HuFszmfD6NlhN5jPKQ6bdUh5YtDg0w2LqPoFnmJRBKDPg5XZA80aBXRy2Zn
	WQPkAX9L+dbKR+4FhuF7SJu4d9HHLuOxTKQPKbmQ/rs4AvkeTpGGezIvzyvXmi1ntWU4
	OjT/6zYa0iOTOWcITQVKGbPbdrxLfegvlvDkXkjtN4xpKLBYaCXKtBR0CSRp+AFX8pja
	nU1dvAP0K4Yeq3mn3lD2Ztz8H+9u6gI5prnHSY+Q892sBja3ZySd0OPc+w0HTJ+GYfVE
	pIOg==
MIME-Version: 1.0
Received: by 10.50.214.10 with SMTP id nw10mr8619230igc.31.1350899899429; Mon,
	22 Oct 2012 02:58:19 -0700 (PDT)
Received: by 10.64.20.113 with HTTP; Mon, 22 Oct 2012 02:58:19 -0700 (PDT)
In-Reply-To: <20121022094143.GC3269@jama.jama.net>
References: <20121019164922.1E2EC103B4@opal>
	<CALbNGRQkhneW4PXcmXTObg_wkbtjBm3AEWrSr2nwT7MB+otbtg@mail.gmail.com>
	<CALbNGRTcv1gpbYSc5wCwYi5fwyZ2taWzyTwN3dumUvyTQTagOw@mail.gmail.com>
	<20121022094143.GC3269@jama.jama.net>
Date: Mon, 22 Oct 2012 11:58:19 +0200
Message-ID: <CALbNGRQy2TsP8-=6W7rGv8s1wW53h5e7RjNjhZSSmRQ35y1LeA@mail.gmail.com>
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
X-List-Received-Date: Mon, 22 Oct 2012 10:11:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 22, 2012 at 11:41 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Mon, Oct 22, 2012 at 11:31:57AM +0200, Andreas M=C3=BCller wrote:
>> On Mon, Oct 22, 2012 at 11:29 AM, Andreas M=C3=BCller
>> <schnitzeltony@googlemail.com> wrote:
>> > On Fri, Oct 19, 2012 at 6:49 PM,  <git@git.openembedded.org> wrote:
>> >> Module: openembedded-core.git
>> >> Branch: master-next
>> >> Commit: 0ea24447842e6b76ccfee0881f557e1a82e89ef1
>> >> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dco=
mmit;h=3D0ea24447842e6b76ccfee0881f557e1a82e89ef1
>> >>
>> >> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
>> >> Date:   Thu Oct 18 15:58:25 2012 +0000
>> >>
>> >> autotools: Use STAGING_DATADIR_NATIVE for config.rpath
>> >>
>> >> For builds that don't use gettext, config.rpath may not exist in the =
target
>> >> datadir. This change uses the native directory where it will always
>> >> be present due to gettext-minimal-native (which allows us to autoreco=
nf
>> >> recipes using gettext even if we don't have gettext built).
>> >>
>> >> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> >>
>> > I think this causes here for shadow-native:
>> >
>> > ERROR: Function failed: do_configure (see
>> > /home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/shadow-native-4.1.4=
.3-r8/temp/log.do_configure.19593
>> > for further information)
>> > ERROR: Logfile of failure stored in:
>> > /home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/shadow-native-4.1.4=
.3-r8/temp/log.do_configure.19593
>> > Log data follows:
>> > | DEBUG: Executing python function sysroot_cleansstate
>> > | DEBUG: Python function sysroot_cleansstate finished
>> > | DEBUG: Executing shell function autotools_preconfigure
>> > | DEBUG: Shell function autotools_preconfigure finished
>> > | DEBUG: Executing shell function do_configure
>> > | automake (GNU automake) 1.12.3
>> > | Copyright (C) 2012 Free Software Foundation, Inc.
>> > | License GPLv2+: GNU GPL version 2 or later
>> > <http://gnu.org/licenses/gpl-2.0.html>
>> > | This is free software: you are free to change and redistribute it.
>> > | There is NO WARRANTY, to the extent permitted by law.
>> > |
>> > | Written by Tom Tromey <tromey@redhat.com>
>> > |        and Alexandre Duret-Lutz <adl@gnu.org>.
>> > | AUTOV is 1.12
>> > | cp: cannot stat
>> > `/home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/share/gett=
ext/config.rpath':
>> > No such file or directory
>> > | ERROR: Function failed: do_configure (see
>> > /home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/shadow-native-4.1.4=
.3-r8/temp/log.do_configure.19593
>> > for further information)
>> >
>> > Maybe some PR bump here and there required?
>> >
>> After forcing rebuild gettext-minimal-native shadow-native builds fine.
>
> yes, see
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-October/03111=
9.html
>
Thanks for enlightenment

another victim was [1]. I love undiscussed and breaking patches at
very central classes before weekend. Long live the community :)

Andreas

[1] http://patches.openembedded.org/patch/38379/


