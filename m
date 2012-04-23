Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SMIpD-00088G-4P for openembedded-devel@lists.openembedded.org;
	Mon, 23 Apr 2012 14:57:03 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SMIfz-0003et-7H for openembedded-devel@lists.openembedded.org;
	Mon, 23 Apr 2012 14:47:31 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Apr 2012 14:47:31 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Apr 2012 14:47:31 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 23 Apr 2012 14:47:14 +0200
Message-ID: <jn3j0k$1h7$1@dough.gmane.org>
References: <CAGiJk9c8ThXrLqsrgYQb03hShObTJynt+fxsRxG9VzYOkOsyUg@mail.gmail.com>
	<jmmst9$r5o$1@dough.gmane.org>
	<CAGiJk9e4vZoO1d1cCbh8Lq26m6h3M5rrOOe40CS1ov2VHqh9eQ@mail.gmail.com>
	<jmomha$co7$1@dough.gmane.org>
	<CAGiJk9fy3p550fUxadQUYmahhx4DVRYeEt_GDYgjBhMVpHzBMw@mail.gmail.com>
	<jmpg5o$52s$1@dough.gmane.org> <jmqsdv$ic7$1@dough.gmane.org>
	<CAGiJk9eh0KqA-qE96uc5BwHOu9n7VmGuZzgWcAisa+HhjGagzQ@mail.gmail.com>
	<jmrdgc$cq4$1@dough.gmane.org>
	<CAGiJk9cexZwA0SY5gSfpbMctg4wzjxZ6BAUxZgkY6ApR93SuAg@mail.gmail.com>
	<jmrfan$q6g$1@dough.gmane.org>
	<CAGiJk9eBf_d5pOZtL_Vrmb7aisGBadSzA36yohZJbO7MTPPnFw@mail.gmail.com>
	<jms02o$577$1@dough.gmane.org>
	<CAGiJk9c8ZuD_+BpcJXDo2-f9Ra4NKeoGk-Mvm+VAGA5=w1payw@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
In-Reply-To: <CAGiJk9c8ZuD_+BpcJXDo2-f9Ra4NKeoGk-Mvm+VAGA5=w1payw@mail.gmail.com>
X-Enigmail-Version: 1.4
Subject: Re: [meta-kde] Test images (was: Re: [OE-core] RFC: Porting KDE Plasma Active (WIP))
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
X-List-Received-Date: Mon, 23 Apr 2012 12:57:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 23-04-12 09:17, Samuel Stirtzel schreef:
> 2012/4/20 Koen Kooi <koen@dominion.thruhere.net>:

> And do you have a bbappend for qt to enable GLES?
> 
>> The "recipes-misc-support/qt4-x11-free_4.8.0.bbappend" [1] enables GLES
>> for Qt on the soc family omap3.

Actually it doesn't :) That enables EGL mode, but 'desktop GL' as Qt calls it:

OpenGL support ......... yes (Desktop OpenGL)

So I did:

+++ b/recipes-misc-support/qt4-x11-free_4.8.0.bbappend
@@ -1,7 +1,7 @@
- -QT_GLFLAGS_omap3 = "-egl"
+QT_GLFLAGS_omap3 = "-opengl es2 "

And I get:

[koen@Angstrom-F16-vm-rpm qt4-x11-free-4.8.0-r43.1]$ grep OpenGL
temp/log.do_configure
OpenGL ES 2.x auto-detection... ()
OpenGL ES 2.x enabled.
OpenGL support ......... yes (OpenGL ES 2.x)

I'm going to see if that actually builds. If so, I'll send a patch to fix it
and add more TI opengl platforms. And I'll poke my ex coworkers about having
a bbappend in meta-ti to enable opengl for the respective platforms, doing
it in meta-kde feels wrong, but works for me at the moment.

regards,

Koen


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPlU9PAAoJEHZqAkdh1vT6k5EQAJY7nM5HKsP21hMPW5n/1DUg
tKddTM25pBFST+7CUfswt0iC12tLn2yAvzxKFlbq9cvvV2oBlVEdEGZJwEhCZW4y
f8x3kgwd6Q0T4qyzL0ZcqJEmX9e7nDRSKkcn7qnZLfZ5l00lnroOwUOwNWUD540l
X9EZiO7TsNITmVkJkvT18xIVwwg7cRgwMEp72pPYCA6YPhDLHNlAkKq9/nflUBW1
I6zaNIK23JS8EJmeRncQyINB0sefnsutKRTqo3Md74/qCYAD7pL5adSjn7YDwdcq
XDw9+FqaE5KHOMcECH4SsW2/sUwaX+PrsSuqgYr6deOKpJ4iXb9xaD1JMyk32GPt
OI98v3q8OCC4xQ9Ve4CbNNCvc9/qwqhcWwwwDs2v6kGkBCR4EKH0IBPJS1jIqVbz
kZtCP3d1ziCEK7dicR1qNiZSZWf8izMIRxLxVVCyaMEpmqXRSNohjpphkOxQ6VsD
K551C500Mu0PsJfMYDEvdS+cQ2gUjUkpaCjYbV/owYWz2YqTR/NnNXPafuuklnbY
XAa00gjBPX+yBYQmY9kMVOz5TEurgN12Kpu9X8SNCD8wGJHknPll1UhOpBJx7zVo
RiSAh0ctU2J6ftAdlsqFrA4RaISxqTq4YBMh0YJfZOU90pceMOr4lg3dhso6Hpnf
SanxQ3j15KLJPEpik9jy
=zVVi
-----END PGP SIGNATURE-----



