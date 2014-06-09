Return-Path: <kapare@rogue-research.com>
X-Greylist: delayed 333 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 09 Jun 2014 18:32:33 UTC
Received: from mail.rogue-research.com (mail.rogue-research.com [68.67.54.10])
	by mail.openembedded.org (Postfix) with ESMTP id 93C96660EF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jun 2014 18:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.rogue-research.com (Postfix) with ESMTP id 7B9E5398AAF9
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jun 2014 14:27:01 -0400 (EDT)
X-Virus-Scanned: amavisd-new at rogue-research.com
Received: from mail.rogue-research.com ([127.0.0.1])
	by localhost (kingu.rogue-research.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id EmeF06OCHOxp
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jun 2014 14:26:54 -0400 (EDT)
Received: from mail-ve0-f177.google.com (mail-ve0-f177.google.com
	[209.85.128.177])
	by mail.rogue-research.com (Postfix) with ESMTPSA id 1985D398AADF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jun 2014 14:26:54 -0400 (EDT)
Received: by mail-ve0-f177.google.com with SMTP id oz11so2269860veb.22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jun 2014 11:26:53 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.58.126.4 with SMTP id mu4mr28548258veb.0.1402338413458; Mon,
	09 Jun 2014 11:26:53 -0700 (PDT)
Received: by 10.58.46.129 with HTTP; Mon, 9 Jun 2014 11:26:53 -0700 (PDT)
Date: Mon, 9 Jun 2014 14:26:53 -0400
Message-ID: <CACgAsMdmdZO6-jePAyHJVSFJg6ntXDzSr2xmx6OqHh5qvVcB-g@mail.gmail.com>
From: =?UTF-8?Q?Kevyn=2DAlexandre_Par=C3=A9?= <kapare@rogue-research.com>
To: openembedded-devel@lists.openembedded.org
Subject: [Yocto] How to add the same recipe twice?
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
X-List-Received-Date: Mon, 09 Jun 2014 18:32:41 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Here what I want to do:
- Have 2 different psplash in my image.

Here what I have done:
- Copy and rename the psplash recipe to psplash-desktop and modify
couple of things.


Here the warning I'm having:
WARNING: The recipe psplash-desktop is trying to install files into a
shared area when those files already exist. Those files and their
manifest location are:
   /home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/sysroots/overo/pkgdata/runtime/psplash-default
   Matched in manifest-overo-psplash.packagedata
manifest-overo-psplash-second.packagedata
   /home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/sysroots/overo/pkgdata/runtime/psplash-default.packaged
   Matched in manifest-overo-psplash.packagedata
   /home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/sysroots/overo/pkgdata/runtime-reverse/psplash-default
   Matched in manifest-overo-psplash.packagedata
manifest-overo-psplash-second.packagedata
Please verify which package should provide the above files.
WARNING: The recipe psplash-desktop is trying to install files into a
shared area when those files already exist. Those files and their
manifest location are:
   /home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_build/src/build/tmp/deploy/rpm/armv7a_vfp_neon/psplash-default-0.1+git0+afd4e228c6-r15.armv7a_vfp_neon.rpm
   Matched in manifest-armv7a-vfp-neon-psplash.package_write_rpm
Please verify which package should provide the above files.

Here the error:
http://pastebin.com/t2gYs3WT

Here the diff of my psplash recipe compare to psplash original:
http://pastebin.com/8TrQRFkQ

In the chat sgw_ recommended my to use:...
sgw_> kapare, now that I better understand, you want to mv your binary
in the do_install_append(), and keep the update-alternative code and
FILES_${PN} bin, but use the renamed binary in the
ALTERNATIVE_LINK_NAME, but you also need ALTNATIVE_TARGET[psplash] =
${bindir}/psplash-default

There is something that I'm missing...

Any idea what?

BR,

-KA

