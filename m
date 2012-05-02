Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SPb84-0000NL-7j for openembedded-devel@lists.openembedded.org;
	Wed, 02 May 2012 17:06:08 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SPayd-0005vz-FG for openembedded-devel@lists.openembedded.org;
	Wed, 02 May 2012 16:56:23 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 May 2012 16:56:23 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 May 2012 16:56:23 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 02 May 2012 16:55:53 +0200
Message-ID: <jnrhu6$cgo$1@dough.gmane.org>
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
	<jn3j0k$1h7$1@dough.gmane.org>
	<CAGiJk9e+V8jZWaDR092pTYcC2FJWxKcOsoGzXX5F777gC3yW=g@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
In-Reply-To: <CAGiJk9e+V8jZWaDR092pTYcC2FJWxKcOsoGzXX5F777gC3yW=g@mail.gmail.com>
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
X-List-Received-Date: Wed, 02 May 2012 15:06:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 23-04-12 15:49, Samuel Stirtzel schreef:
> 2012/4/23 Koen Kooi <koen@dominion.thruhere.net>:
>> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
>> 
>> Op 23-04-12 09:17, Samuel Stirtzel schreef:
>>> 2012/4/20 Koen Kooi <koen@dominion.thruhere.net>:
>> 
>>> And do you have a bbappend for qt to enable GLES?
>>> 
>>>> The "recipes-misc-support/qt4-x11-free_4.8.0.bbappend" [1] enables
>>>> GLES for Qt on the soc family omap3.
>> 
>> Actually it doesn't :) That enables EGL mode, but 'desktop GL' as Qt
>> calls it:
>> 
>> OpenGL support ......... yes (Desktop OpenGL)
>> 
>> So I did:
>> 
>> +++ b/recipes-misc-support/qt4-x11-free_4.8.0.bbappend @@ -1,7 +1,7 @@ 
>> - -QT_GLFLAGS_omap3 = "-egl" +QT_GLFLAGS_omap3 = "-opengl es2 "
>> 
>> And I get:
>> 
>> [koen@Angstrom-F16-vm-rpm qt4-x11-free-4.8.0-r43.1]$ grep OpenGL 
>> temp/log.do_configure OpenGL ES 2.x auto-detection... () OpenGL ES 2.x
>> enabled. OpenGL support ......... yes (OpenGL ES 2.x)
> 
> Interesting, seems like I have been fooled by Qt:
> 
> OpenGL support ......... yes (Desktop OpenGL) EGL support ............
> yes <EGL/egl.h>
> 
> For me this sounded as if it was configured right, so "EGL support" is a
> bit misleading..
> 
>> 
>> I'm going to see if that actually builds. If so, I'll send a patch to
>> fix it and add more TI opengl platforms. And I'll poke my ex coworkers
>> about having a bbappend in meta-ti to enable opengl for the respective
>> platforms, doing it in meta-kde feels wrong, but works for me at the
>> moment.
> 
> TBH it wasn't properly tested yet. On my Overo every time I start any EGL
> application all I get is just EGL_BAD_ALLOC 0x3003 ...

That turned out to be a bug in opkg :( With the latest patchset I posted to
meta-ti the bug should be gone.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPoUr3AAoJEHZqAkdh1vT6iTkP+QG4MWihg/A1/QGEWLlLMJXD
OYaP1QOMLyQrmaN72p8sH8AInL3z8jEOC3+FXLDN/tn71qJVRuwwKHYUh0vEcR8N
X285jnArDnuHGgGkUZyMPGeniZHlBIBAuBvvFveZR371OEOKaVHZRcA7gm2Pl7D/
FgRG/jInNXxcwkkKgx28z34C9mQLwsLEAlzbVPvolzufFg9ggK3fQ7cT0OjNOc84
cPZjyuVEpuZqB/Ie4DQ7JcY9sI7Sp3s54+j0LcRF6dpXsqALYlNx+0khz94wdhVt
1uOBucVSQwRBuDbhzcnMNN9768wHa/lAEQXJflUL2N8B/doh5kA+b7Fqk+e1xwn/
PuAdNEMUaL/ywhFumatVqo1hjrGLGRm6+oymGdKGtWjaBDcbsQb7bOlR7z/NghVS
K4OVjqZiCkThihd22Nu7deSaQg3mZ7oowkAOALSDR80IJjSwmt08iRFV2szan7OU
z9l1xe3eVwlsbMFuoYwn37wlRpiUa9Sp1sZE9NfLL4E1ssV/nKFDwQz1Qo8YNq8q
5/Hh4UzaIlW7FhVQf+/YD3rFjNrpRTbKKuoRzBzXLjL3Q+mnbzKDW/e/Aqvm3lQn
h5bRECO45VanBFHoN9QQPD2MtGrsm/NoavDYvSsxk14Q5ePDkTwqrMIbrGKAaMQF
AAW1YHfhbUe7l/UqvvwY
=9qq6
-----END PGP SIGNATURE-----



