Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1SPr8Q-0003ed-BH
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 May 2012 10:11:34 +0200
Received: by pbbrq2 with SMTP id rq2so1855098pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 May 2012 01:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=LJnKcXGVow7ZYUK0OdQz+ER2lRgayTZVY9UAJJaU8+o=;
	b=WfWyqa1TrKsxm5yIqoV3iUbdqsFJhVChiEcB+6TukxdWITLihsH6sdwp7OsBFUpwGw
	nxEw3NOFK9yXnbE0K4JgweLgBWkCCsSJRMpuJOq+Y4aXsCsCwywTuPnAmMDYS4xG0uAD
	wRV1dkeoye2nNR8in3WTI1WYsGkp3x4eLsSXFLjzmUfKnL7norUWOEHN2ysbCsz3fznj
	2VYeDKwHYOiCxcunWkAKraKFX2W1C8IvhEY53ovwgoWP2baBl5XI3Sop+IlVGmAUnYW3
	p8KdMMcPhS4tldE51wRU6tj88ckoZw3+tuafaRPvqXyf7sxu8S6mXwzqfML8oCbEpVFE
	VDbQ==
MIME-Version: 1.0
Received: by 10.68.242.193 with SMTP id ws1mr4221930pbc.10.1336032108235; Thu,
	03 May 2012 01:01:48 -0700 (PDT)
Received: by 10.68.48.164 with HTTP; Thu, 3 May 2012 01:01:48 -0700 (PDT)
Date: Thu, 3 May 2012 10:01:48 +0200
Message-ID: <CACW_hTb5BO+mS07Xnd534N5V-ETtwrXc=NNo67kxcemQPGuJog@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: yocto@yoctoproject.org, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: yocto 1.2: 2nd experiences: image building problems
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
X-List-Received-Date: Thu, 03 May 2012 08:11:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear all,

I'm migrating a project from oe-classic to yocto 1.2.
This goes fairly smoothly. Got some warnings I reported before.

If I build my app it runs fine (with the uclibc from oe-classic that
is already on the board).
Next step was to try to build a complete image.

There I encountered two issues.
The first one was that my image recipe had a few SRC_URI += lines.
This to get the static device table I am using and two files I needed
in my IMAGE_POSTPRCESS_COMMAND.
However yocto immediately goes into do_rootfs, and does not have a
fetch/unpack step (as oe-classic used to have).

I have worked around this by adding

python do_get_src () {
    bb.build.exec_func('base_do_fetch', d)
    bb.build.exec_func('base_do_unpack', d)
}
addtask do_get_src before do_rootfs

to my image recipe. I think it would be nice to have this
automatically done if a non-empty SRC_URI is found (but unfortunately
I am not enough of a python wiz to provide a patch).
Anyway that kept me moving.

The second issue is probably lib related. As I need a small footprint
(not too much storage available) my project uses uclibc.
When building the image I get some 15 or so of these:
| 	rtld(GNU_HASH) is needed by busybox-1.19.4-r6.ppce300c3
| 	rtld(GNU_HASH) is needed by i2c-tools-3.0.3-r0.ppce300c3
| 	rtld(GNU_HASH) is needed by libz1-1.2.6-r1.ppce300c3
...

I noticed that eglibc has this:
meta/recipes-core/eglibc/eglibc-package.inc:RPROVIDES_${PN} =
"glibc${PKGSUFFIX} rtld(GNU_HASH)"

but I did not find a similar RPROVIDES for uclibc.
Not sure whether it is missing there, or whether the dependencies for
the packages like busybox and libz1 are wrong.
Anyone any advice ?

Thanks, Frans


