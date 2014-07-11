Return-Path: <just4tech83@gmail.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id AB681701C5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 06:00:03 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id o8so306952qcw.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jul 2014 23:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=OGTyQV3Lqk2MLuZ0/Kyv/FTqFJN1N00JKD3zah10lIk=;
	b=gJ+XMbDDLK2aCQ0/YsH6wRwcPlxomAVqlwn9NweKo8m/+uHtM0yifTI8wHAXJ/ysyO
	/TtVZA7JIenxEhqaasH+HTbgS1zyw3yWWN5GokrcOgHKsfDpZUD+lpkRcSLvl4vsXRnM
	QkTItJq6fXfvUBMpQXwQgbl1o140jvWVWvL/Yv6c92fr0B0Cwx0v0UDGAf2lcIZmMpLq
	qRqDDp/MUfweDAE5sn8iR6Fk0xABZxp/gEkkXRGGq3abcbOp5tn2DMobIiw0U0ITPzbF
	u03KBxjMbCpXFlFiYm1Nyy9qp8OSAncFzDVQeqIs45PKML9D/gYC8uUVbJDK/I3HEGjo
	vfmg==
MIME-Version: 1.0
X-Received: by 10.140.95.215 with SMTP id i81mr81074287qge.6.1405058403754;
	Thu, 10 Jul 2014 23:00:03 -0700 (PDT)
Received: by 10.140.100.235 with HTTP; Thu, 10 Jul 2014 23:00:03 -0700 (PDT)
Received: by 10.140.100.235 with HTTP; Thu, 10 Jul 2014 23:00:03 -0700 (PDT)
In-Reply-To: <53BC1835.90204@balister.org>
References: <CAD2C2VT=3DipX=8chChc6_NefZSfs3jocmYxePJp5THxANiKVg@mail.gmail.com>
	<53BC1835.90204@balister.org>
Date: Fri, 11 Jul 2014 11:30:03 +0530
Message-ID: <CAD2C2VTnHrLsfhRXcUxpcpXgWK+LzxxD87XrvrN6wiiMK+CMUw@mail.gmail.com>
From: Bryan <just4tech83@gmail.com>
To: philip@balister.org, cbrake@bec-systems.com, 
	openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 11 Jul 2014 06:00:03 -0000
Content-Type: text/plain; charset=UTF-8

Hi,
     As per your suggestion we took oe-core and other packages from
followinf link:
-> http://git.openembedded.org/meta-openembedded

We are using bitbake version 1.23.1.

We have to build image for beagleboard so we find following to build image:

->
http://www.crashcourse.ca/wiki/index.php/Building_for_BBB_using_OpenEmbedded

While following steps from the above link we have done following settings
in local.conf  and bblayers.conf file.

MACHINE ??= "beaglebone"
BBLAYERS ?= " \
  /home/rpjday/oe/dist/layers/oe-core/meta \
  /home/rpjday/oe/dist/layers/meta-openembedded/meta-oe \
  /home/rpjday/oe/dist/layers/meta-beagleboard/common-bsp \
  "
Now while running "bitbake core-image-minimal" command we are getting
following issues :

chown: changing ownership of
`/home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/image/home/test/oe/oe-core/build/tmp-eglibc/sysroots/i686-linux/usr/share/doc/programmer_reference/intro_what.html':
Operation not permitted
chown: changing ownership of
`/home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/image/home/test/oe/oe-core/build/tmp-eglibc/sysroots/i686-linux/usr/share/doc/programmer_reference/program_ram.html':
Operation not permitted
chown: changing ownership of
`/home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/image/home/test/oe/oe-core/build/tmp-eglibc/sysroots/i686-linux/usr/share/doc/programmer_reference/arch_apis.html':
Operation not permitted
chown: changing ownership of
`/home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/image/home/test/oe/oe-core/build/tmp-eglibc/sysroots/i686-linux/usr/share/doc/programmer_reference/transapp_reclimit.html':
Operation not permitted
chown: changing ownership of
`/home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/image/home/test/oe/oe-core/build/tmp-eglibc/sysroots/i686-linux/usr/share/doc/programmer_reference/am_close.html':
Operation not permitted
chown: changing ownership of
`/home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/image/home/test/oe/oe-core/build/tmp-eglibc/sysroots/i686-linux/usr/share/doc/programmer_reference/lock_stdmode.html':
Operation not permitted
chown: changing ownership of
`/home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/image/home/test/oe/oe-core/build/tmp-eglibc/sysroots/i686-linux/usr/share/doc/programmer_reference/transapp_env_open.html':
Operation not permitted

WARNING:
/home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/temp/run.do_install.26236:1
exit 1 from
  chown -R root:root
/home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/image
ERROR: Function failed: do_install (log file is located at
/home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/temp/log.do_install.26236)

one more doubt about the code base which we should follow as we found one
other link which have oe-core code at "https://github.com/openembedded". We
have tried both and found seperate issues while using both.

Please suggest us how we can overcome these issues to get test image build
for beagleboard.

Thanks in advance
---------- Forwarded message ----------
From: "Philip Balister" <philip@balister.org>
Date: Jul 8, 2014 9:42 PM
Subject: Re: [oe] open embedded build issues with beagle board
To: <openembedded-devel@lists.openembedded.org>
Cc:

On 07/08/2014 02:54 AM, Bryan wrote:
> Hi All
>  I am trying to build  Openembeeded classic for Beagle board-XM but i am
> getting lot of broken link issues. I have  set DISTRO as angstrom-2010.x
in
> local.conf.   Is this approach  ok? or should i move to openembedded core
??
> Pls suggest.

Use the current Angstrom instructions, oe-classic is pretty much
completely unsupported now.

Philip

>
> Broken link e.g.
>
> Resolving www.angstrom-distribution.org (www.angstrom-distribution.org)...
> 140.211.169.177
>  Connecting to www.angstrom-distribution.org
> (www.angstrom-distribution.org)|140.211.169.177|:80...
> connected.
>  HTTP request sent, awaiting response...
> 404 Not Found  2014-07-08 10:13:43 ERROR 404: Not Found.
>
> Thanks in advance
>
--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

