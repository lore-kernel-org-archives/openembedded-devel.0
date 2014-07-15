Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 98AFD701C2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 06:04:10 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id u57so2800244wes.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 23:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=inapFUhj2MDaXeVWlRiv8DxcbOgp5d7cdW2yUMdN6Ms=;
	b=XaOjzzcom0UPxuse5sFEiU/myHKlhrK7SQ0T+kq8Frd8iCfPe9imScelcKYpI2KAiB
	31iP3UFUiqg+prCeb4TEpJOI5MZ3ZmHxnygC3R4EM6F/8VI+uw0V5vRtUK1G4LckbyPC
	rq/spbP8bCE+S0y5OaAMcj/fOL31YT0rJskaE23dgwbvX8CH9UaiPFgkluk65WOeeZo0
	m21vN+EB8OaKOk/2yO5NSg/3zK1rSIQdmfooLQrvURU0MVUBYsQkOB2fkI1fVez6O5km
	/eBlzzhAKgq06vjL7T5XOgHxsNZ0NSUNzMg+k9V9zcBXAaI0NeUf5mv/+CmkLeAYGey8
	y7AQ==
MIME-Version: 1.0
X-Received: by 10.180.210.165 with SMTP id mv5mr2883017wic.70.1405404251737;
	Mon, 14 Jul 2014 23:04:11 -0700 (PDT)
Received: by 10.194.18.114 with HTTP; Mon, 14 Jul 2014 23:04:11 -0700 (PDT)
In-Reply-To: <CAD2C2VSTKS+NX=0CAwh1PAtkKgcHh+mpwMMVmh_b4dw9GeaABw@mail.gmail.com>
References: <CAD2C2VT=3DipX=8chChc6_NefZSfs3jocmYxePJp5THxANiKVg@mail.gmail.com>
	<53BC1835.90204@balister.org>
	<CAD2C2VTnHrLsfhRXcUxpcpXgWK+LzxxD87XrvrN6wiiMK+CMUw@mail.gmail.com>
	<CAD2C2VSTKS+NX=0CAwh1PAtkKgcHh+mpwMMVmh_b4dw9GeaABw@mail.gmail.com>
Date: Mon, 14 Jul 2014 23:04:11 -0700
Message-ID: <CAOLEWZXeTqQ6GQYtK2861V4qSdO7s--UnS3vrE-cc0kLCf4ChA@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: open embedded build issues with beagle board
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
X-List-Received-Date: Tue, 15 Jul 2014 06:04:14 -0000
Content-Type: text/plain; charset=UTF-8

Just add meta-ti to your bblayers and set your machine.  The latest kernel
*should* support video; there's also the LinuxOnArm wiki with a working
kernel.

Steve


On Mon, Jul 14, 2014 at 9:29 PM, Bryan <just4tech83@gmail.com> wrote:

> Hi Cliff,
>          thanks for your suggestion, i tried links which you mentioned in
> your mail. Now i am able to build minimal image for MACHINE = qmux6.
> Can you please tell us how can we make it for beagleboard omap 3530.
> Where can we find support layer for beagleboard.
>
> Thanks a lot in advance !
> On Jul 11, 2014 11:30 AM, "Bryan" <just4tech83@gmail.com> wrote:
>
> > Hi,
> >      As per your suggestion we took oe-core and other packages from
> > followinf link:
> > -> http://git.openembedded.org/meta-openembedded
> >
> > We are using bitbake version 1.23.1.
> >
> > We have to build image for beagleboard so we find following to build
> image:
> >
> > ->
> >
> http://www.crashcourse.ca/wiki/index.php/Building_for_BBB_using_OpenEmbedded
> >
> > While following steps from the above link we have done following settings
> > in local.conf  and bblayers.conf file.
> >
> > MACHINE ??= "beaglebone"
> > BBLAYERS ?= " \
> >   /home/rpjday/oe/dist/layers/oe-core/meta \
> >   /home/rpjday/oe/dist/layers/meta-openembedded/meta-oe \
> >   /home/rpjday/oe/dist/layers/meta-beagleboard/common-bsp \
> >   "
> > Now while running "bitbake core-image-minimal" command we are getting
> > following issues :
> >
> > chown: changing ownership of
> >
> `/home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/image/home/test/oe/oe-core/build/tmp-eglibc/sysroots/i686-linux/usr/share/doc/programmer_reference/intro_what.html':
> > Operation not permitted
> > chown: changing ownership of
> >
> `/home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/image/home/test/oe/oe-core/build/tmp-eglibc/sysroots/i686-linux/usr/share/doc/programmer_reference/program_ram.html':
> > Operation not permitted
> > chown: changing ownership of
> >
> `/home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/image/home/test/oe/oe-core/build/tmp-eglibc/sysroots/i686-linux/usr/share/doc/programmer_reference/arch_apis.html':
> > Operation not permitted
> > chown: changing ownership of
> >
> `/home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/image/home/test/oe/oe-core/build/tmp-eglibc/sysroots/i686-linux/usr/share/doc/programmer_reference/transapp_reclimit.html':
> > Operation not permitted
> > chown: changing ownership of
> >
> `/home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/image/home/test/oe/oe-core/build/tmp-eglibc/sysroots/i686-linux/usr/share/doc/programmer_reference/am_close.html':
> > Operation not permitted
> > chown: changing ownership of
> >
> `/home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/image/home/test/oe/oe-core/build/tmp-eglibc/sysroots/i686-linux/usr/share/doc/programmer_reference/lock_stdmode.html':
> > Operation not permitted
> > chown: changing ownership of
> >
> `/home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/image/home/test/oe/oe-core/build/tmp-eglibc/sysroots/i686-linux/usr/share/doc/programmer_reference/transapp_env_open.html':
> > Operation not permitted
> >
> > WARNING:
> >
> /home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/temp/run.do_install.26236:1
> > exit 1 from
> >   chown -R root:root
> >
> /home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/image
> > ERROR: Function failed: do_install (log file is located at
> >
> /home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/temp/log.do_install.26236)
> >
> > one more doubt about the code base which we should follow as we found one
> > other link which have oe-core code at "https://github.com/openembedded".
> > We have tried both and found seperate issues while using both.
> >
> > Please suggest us how we can overcome these issues to get test image
> build
> > for beagleboard.
> >
> > Thanks in advance
> > ---------- Forwarded message ----------
> > From: "Philip Balister" <philip@balister.org>
> > Date: Jul 8, 2014 9:42 PM
> > Subject: Re: [oe] open embedded build issues with beagle board
> > To: <openembedded-devel@lists.openembedded.org>
> > Cc:
> >
> > On 07/08/2014 02:54 AM, Bryan wrote:
> > > Hi All
> > >  I am trying to build  Openembeeded classic for Beagle board-XM but i
> am
> > > getting lot of broken link issues. I have  set DISTRO as
> angstrom-2010.x
> > in
> > > local.conf.   Is this approach  ok? or should i move to openembedded
> > core ??
> > > Pls suggest.
> >
> > Use the current Angstrom instructions, oe-classic is pretty much
> > completely unsupported now.
> >
> > Philip
> >
> > >
> > > Broken link e.g.
> > >
> > > Resolving www.angstrom-distribution.org (www.angstrom-distribution.org
> > )...
> > > 140.211.169.177
> > >  Connecting to www.angstrom-distribution.org
> > > (www.angstrom-distribution.org)|140.211.169.177|:80...
> > > connected.
> > >  HTTP request sent, awaiting response...
> > > 404 Not Found  2014-07-08 10:13:43 ERROR 404: Not Found.
> > >
> > > Thanks in advance
> > >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

