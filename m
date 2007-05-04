Received: from [66.249.82.235] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Hk0Vn-00089Z-PM
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 May 2007 18:20:06 +0200
Received: by wx-out-0506.google.com with SMTP id s14so185794wxc
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 May 2007 09:19:58 -0700 (PDT)
Received: by 10.90.28.12 with SMTP id b12mr3469314agb.1178295598385;
	Fri, 04 May 2007 09:19:58 -0700 (PDT)
Received: by 10.90.50.5 with HTTP; Fri, 4 May 2007 09:19:58 -0700 (PDT)
Message-ID: <c384c5ea0705040919u8bdafe9sa6abe0942ffe3fd8@mail.gmail.com>
Date: Fri, 4 May 2007 18:19:58 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: "Using the OpenEmbedded metadata to build Distributions"
	<openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
Subject: task-base dependencies and missing logging of failed providers
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 May 2007 16:20:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello,

just wanted to get this down for those not having followed the
discussion on IRC (and just for the record, not that the ideas are
still fresh).

My idea about a minimal image that OE should support (Goal: OE must be
scalable) is a linux kernel with a single init application
(helloworld).

Today on IRC we discussed two issues with BB/OE, indirectly blocking
the ability to build a minimal image using task-base, especially for
new users.

(1) task-base always wants *all* targets in task-* to be buildable,
regardless whether they are installed or not.

Example:

Take angstrom, strip {MACHINE,DISTRO}_FEATURES such that
COMBINED_FEATURES=3D"ext2" or something really basic.
Set USE_NLS=3D"no"

When now building angstrom-minimal-image, task-base wants bluetooth to
be buildable, thus bluez-utils, thus dbus, cups, glib-2.0, etc. etc.
Because glib-2.0 requires USE_NLS=3D"yes", the image build fails with "a
no providers for" message.

[10:34]=09<v8jlene>=09likewise: Yeah, that task-base one's a bit annoying.
I only had about 400 recipes symlinked in, now I have them all just to
make task-base happy. And as you say it's building lots of stuff that
you don't use.

Workarounds:
- USE_NLS_glib-2.0=3D"yes" (yes, at least makes image buildable, IFF the
other deps are met, everything is still built)

Suggested fixes:
- split task-base into seperate *.bb would work (koen, hrw), but this
is not the proper solution (RP, koen)
- do not use debian.bbclass (tried, but does not work for me)
- ...

(2) It's very hard to track down and I'm not alone:

[10:29]=09<v8jlene>=09likewise: Heh, I had that issue yesterday when
trying my uclibc builds with 1.8.2 ;) The error bitbake showed was
about bootstrap-image was unavailable (due to task-base pulling in
cups which pulled in dbus which pulled in glib-2.0). Took ages to
figure it all out...

New users won't find this, as bitbake -D -D -D -v does not provide this inf=
o.

2) bitbake will NOT report the above dependency
logging of failed providers

However, this one is hard to fix:

[10:31]=09<RP>=09likewise: There is a bitbake bug already open about the
logging of failed providers
[10:31]=09<RP>=09Its not as simple as it sounds though


Reproduce

taking the =C5ngstr=F6m distro as a base, I would like to strip it down a
bit. I stripped {MACHINE,DISTRO}_FEATURES such that:

COMBINED_FEATURES=3D"ext2"
DISTRO_EXTRA_RDEPENDS=3D"update-modules module-init-tools
modutils-initscripts sysvinit initscripts sysvinit-pidof netbase
dropbear ipkg ipkg-collateral util-linux-mount util-linux-umount"

As none of the selected package need NLS, I have disabled it.

USE_NLS =3D "no"

bitbake angstrom-minimal image
or
bitbake bootstrap-image


Regards,
--=20
Leon

The persons and animals named in this email are based on true
characters in real life.


