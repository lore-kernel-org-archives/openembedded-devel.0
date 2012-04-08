Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SGl9m-0005Nm-0D for openembedded-devel@lists.openembedded.org;
	Sun, 08 Apr 2012 07:59:22 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SGl0p-0002nF-3J for openembedded-devel@lists.openembedded.org;
	Sun, 08 Apr 2012 07:50:07 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Apr 2012 07:50:07 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Apr 2012 07:50:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 08 Apr 2012 07:50:06 +0200
Message-ID: <jlr8u5$ndo$1@dough.gmane.org>
References: <20120404091720.4b743c5b@eb-e6520> <jli1uf$7nt$1@dough.gmane.org>
	<CABcZANngH2BSmSdBPkaPyJcG1RFuKLxc9DnJWhe7_b9xcSGjxA@mail.gmail.com>
	<jllb47$64q$1@dough.gmane.org> <20120406091243.1f1969d2@eb-e6520>
	<CABcZANnkYkLQEtpem_-eHskm9VzECkKodZBHyJOwuReoA4DY-A@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
In-Reply-To: <CABcZANnkYkLQEtpem_-eHskm9VzECkKodZBHyJOwuReoA4DY-A@mail.gmail.com>
X-Enigmail-Version: 1.4
Subject: Re: build meta-oe without systemd
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
X-List-Received-Date: Sun, 08 Apr 2012 05:59:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 06-04-12 17:02, Chris Larson schreef:
> On Fri, Apr 6, 2012 at 12:12 AM, Eric Bénard <eric@eukrea.com> wrote:
>> Le Thu, 05 Apr 2012 16:50:32 -0700, Koen Kooi
>> <koen@dominion.thruhere.net> a écrit :
>>> I would appreciate people sending decent bugreports to the list,
>>> because it is *NOT* supposed to break this way. The breakage needs to
>>> get fixed before we merge it into oe-core.
>>> 
>> to reproduce the problem I met, simply add to a conf file : 
>> PREFERRED_VERSION_udev = "164"
>> 
>> and using oe-core + meta-oe try to build anything which has "inherit 
>> systemd" (even if in the end you don't install the corresponding 
>> ${PN}-systemd in the target's rootfs) : systemd's configure will fail 
>> because it requires a more recent udev.
> 
> In addition, for me, at least in the past, I hit an issue where systemd
> sucks in x11 bits, which means any DISTRO lacking the 'x11' distro
> feature fails miserably at even building busybox.

Patches to add the missing PACKAGECONFIG options will be greatly appreciated

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPgScMAAoJEHZqAkdh1vT6Z2wP/2/JQZUKy50rlwUBEOTojSBc
5kMpMxlmxvW34M7MBZJe0JJcTkAGQrzFy2r9moPW4HGgrTenn0OD7C6BuT5dFHOk
5l8XVot4IIUesECyFLr7zu7LP7zN5uHYhnx/xT3YO9Om9wHZRu7yVS0S4WiMy1OH
ceoCbkCQyBOcalngMi4lW7jMmumsfyZmrQOwQUX/dHRrCqr2Xd5yK5Dz1Kn7zWMb
NepVy0i3+aPQI6X7+X4uAsMekLxy8Zw7MjaegqMisHyw4kFzNE7CWPNnLNYi6cvf
vz7aMR0XjMOFZF6nTwNeyA939ijHsk3yd6G4L9J+H0YGvU9g+gEsMaeSenhuz7HT
fithzz6GYMo4hLTojBlMhU9gj+/wRDLesPvroNSCU9rSbyGc2hqKnjqXwnQMPIh7
+vLbhdgoQ7VGaUSCQv4Rd1YKn2Z/bTKQ05ZbESL1kQLlMhM5afsj+cPp37VLsNXu
jRGTeaC2wZFDezYlPa39xRLmev+OvIuhmrhqmLUaKwDIHYVkocvpUXEVMl/e7mZv
ll2UQmJDT5i/aMXb4iZVzvsLofjrAI6AAOWxpluG6OsWdkdHU9wyRSJtWhkYERFF
rQ+1kGxMtlIaGkYlX2c/l223QA6IcekpdFNxiFLx5WItR62ZjhtV46pzok28lyKH
otPwJ5SMif+RUUtLwIfG
=+G/Y
-----END PGP SIGNATURE-----



