Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PiX79-0003HL-8B
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Jan 2011 20:02:39 +0100
Received: by yxd5 with SMTP id 5so730862yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jan 2011 11:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=xfv8uGB/EaAO5xU4r+vbbwnQjdFamiQbevt5NhEkctc=;
	b=VuxXzieb4LBFjOYpA2jCGHr+u/5Wm9Hm9Ef4taUrX2CzND8nrX5sgghrMwAr6/2laU
	4TqONkM0In06URPeivKQv1KOaDWss2nomAz9ZGtY4yGiI/k7rFYSkefxRtumWWXki+BQ
	rUC115UI115oPDzk5eBR/lHO9Nmz1RJBBk+60=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=uiRwK1fhTvSPOWmwJcdhGBvqqQEJG3gh7NjEeHengbS9/Pi4ecJIEA5ZirYcFzDZpx
	vR/MEJ3NHUFYg1uWrNmET6srHSuceo1j3QVVbRTv7jzydd4oKj0BK2izLAWBLGlXzh2s
	4X1bO6Rk+ApDaJ2xbpPKLRiqONAQkVJP4cA1k=
Received: by 10.91.160.30 with SMTP id m30mr3523338ago.61.1296154906945; Thu,
	27 Jan 2011 11:01:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.32.12 with HTTP; Thu, 27 Jan 2011 11:01:24 -0800 (PST)
In-Reply-To: <09D9BE2AC4AA764DABAA8C91E48D819ED682EC06@DEMCHP99E35MSX.ww902.siemens.net>
References: <09D9BE2AC4AA764DABAA8C91E48D819ED682EC06@DEMCHP99E35MSX.ww902.siemens.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Jan 2011 11:01:24 -0800
Message-ID: <AANLkTimzYvPnN7tt54jcQVYUmBQFpQsO0LYFoRVh5Q8x@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: libpcre not compiling
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
X-List-Received-Date: Thu, 27 Jan 2011 19:02:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 27, 2011 at 8:15 AM, Aeschbacher, Fabrice
<Fabrice.Aeschbacher@siemens.com> wrote:
> Hi,
>
> [using released version 2010.12]
>
> libpcre (7.6-r8) fails to compile :
>
> ...
> | /bin/sh ./arm-angstrom-linux-gnueabi-libtool --tag=3DCXX =C2=A0 --mode=
=3Dlink arm-angstrom-linux-gnueabi-g++ -march=3Darmv5te -mtune=3Darm926ej-s=
 -mthumb-interwork -mno-thumb =C2=A0-isystem/srv/oe-2010/build/at91sam9g20e=
k/sysroots/armv5te-angstrom-linux-gnueabi/usr/include -O2 -fpermissive -fvi=
sibility-inlines-hidden -fvisibility-inlines-hidden -version-info 0:0:0 -Wl=
,-O1 -Wl,--hash-style=3Dgnu -o libpcrecpp.la -rpath /usr/lib pcrecpp.lo pcr=
e_scanner.lo pcre_stringpiece.lo libpcre.la
> | /bin/grep: /usr/lib/libstdc++.la: No such file or directory
> | /srv/oe-2010/build/at91sam9g20ek/sysroots/x86_64-linux/usr/bin/sed: can=
't read /usr/lib/libstdc++.la: No such file or directory
> | arm-angstrom-linux-gnueabi-libtool: link: `/usr/lib/libstdc++.la' is no=
t a valid libtool archive
> | make[1]: *** [libpcrecpp.la] Error 1
> | make[1]: Leaving directory `/srv/oe-2010/build/at91sam9g20ek/work/armv5=
te-angstrom-linux-gnueabi/libpcre-7.6-r8/pcre-7.6'
> | make: *** [all] Error 2
> | FATAL: oe_runmake failed
> NOTE: package libpcre-7.6-r8: task do_compile: Failed
> ERROR: Function 'do_compile' failed (see /srv/oe-2010/build/at91sam9g20ek=
/work/armv5te-angstrom-linux-gnueabi/libpcre-7.6-r8/temp/log.do_compile.172=
3 for further information)
> ERROR: '/srv/oe-2010/org.openembedded/recipes/libpcre/libpcre_7.6.bb' fai=
led
>
>
> I would be thankful if someone could give me any hint how to solve this.
>

Does it fail same way on master ? if not try to figure out commit
which fixed it git bisect is your friend. Otherwise we need to fix it
if its happening on master too.

> With kind regards,
> Fabrice Aeschbacher
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


