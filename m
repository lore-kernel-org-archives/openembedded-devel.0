Received: from [209.85.221.197] (helo=mail-qy0-f197.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MdWRc-0001Y3-Ed
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 23:42:16 +0200
Received: by qyk35 with SMTP id 35so2987574qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 14:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=41pXzdytUFZYFVWcdbY91tnqW7PWA+3dVcL6eGufYT4=;
	b=pY/qaeYmlwxWOgnWu2mX7EmqcNZQUa/BupThMJnvvcn2VFLqDggcWoiaCL5SlPP9KW
	TmdfsjfK1mIbOsK5sAFZi9u6tK7pW1uE4dpeiAG+9O3OkUghxoS4SoqZ+a1cE4mK2Ywo
	3/y7dtcd7nIkzWsev9eBfYEGdBhaxVjEvqZx0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=yGLZCKRxyfdaZuDVqY909cZ2qq8ewIr9aEUI9uW1xW6QU0TJSxZoWOI1UaI4zL3Lv0
	yy/wjeaNjDFuEyoGTB5IUdiPpbNB63Ldi2VBTCfwJOaGe6Jo1DHySFII+iE9NuWBa866
	M6Z0gf+61HbMiVzxeBRhzrs1jXPGGAo8seS20=
MIME-Version: 1.0
Received: by 10.229.112.139 with SMTP id w11mr2550644qcp.8.1250630708090; Tue, 
	18 Aug 2009 14:25:08 -0700 (PDT)
In-Reply-To: <1250626236.6785.50.camel@conroy-linux>
References: <1250176750.29049.1003.camel@conroy-linux>
	<20090813155909.GC8906@gmail.com>
	<1250612879.6785.12.camel@conroy-linux>
	<20090818174157.GB25000@denix.org>
	<1250620212.6785.43.camel@conroy-linux>
	<20090818195028.GU2227@smtp.west.cox.net>
	<1250626236.6785.50.camel@conroy-linux>
Date: Tue, 18 Aug 2009 14:25:08 -0700
Message-ID: <19c1b8a90908181425jca25c63ia12b7d9a9793636f@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: gcc-cross-sdk (GCC 4.2.3) limits.h woes
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
X-List-Received-Date: Tue, 18 Aug 2009 21:42:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2009 at 1:10 PM, Chris
Conroy<Chris.Conroy@hillcrestlabs.com> wrote:
> On Tue, 2009-08-18 at 12:50 -0700, Tom Rini wrote:
>>
>> OK, here's the problem, I think. =C2=A0You're trying to make an image fo=
r say
>> i686-armv6-sdk-linux-gnueabi? =C2=A0What are you expecting to be in this=
 raw
>> image however, the contents of say meta-toolchain, extracted and put
>> into a ext2? =C2=A0For most people, meta-toolchain, and the resulting ta=
rball
>> are the output that gets used.
>>
>
> The problem is the dependencies get satisfied during the build because
> package X depends on glibc, but external-toolchain.bb chimes in and says
> "Hi, I provide virtual/libc." Package X builds and links just fine since
> the external-toolchain dropped everything in the right place.
>
> The problem comes whenever opkg needs to deal with dependencies since it
> doesn't know about 'virtual/libc'. It sees that Package X wants glibc
> and it can't find it since it only knows about the debian-named version
> called 'libc6'. Glibc never gets built (since it's already been built)
> and thus never gets debian renamed.
>
> I don't see any easy path to change debian.bbclass since it requires
> introspection on the TMPDIR which does not exist for users of an
> external toolchain.
>
> I hope this is clear. Let me know if there are any points of confusion.
>
> In the meantime, turning off the renaming successfully works around this
> bug.

Do you have to use glibc built externally ? I would think that use
external compiler
and tools but build everything else that goes on target which is also libc.

>
> --Chris Conroy
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


