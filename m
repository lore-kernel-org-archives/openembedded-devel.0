Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PgRFs-0006Yx-3y
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 01:23:00 +0100
Received: by yie16 with SMTP id 16so789344yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jan 2011 16:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=ZjaXVnymHsNcv5uLj0afAX078wubxgUNNNHN7j4dcWU=;
	b=FQCMD28fNUj+zI/c1cNSlwzrbH1va0sMzdk375nQT+vxon0ctmmbCGeq82TTE8rTXT
	XQyCbeH/qae4i3wcXCZG33hs4VN16fUeeTdhhHKU6N7CIYDN1qmT7hTLlTxDDbdaZS+u
	h2GfjAbfsAdBNNBUG68OG3UxVm5be+ZvapeFE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=OXtApYWKnqDSvY8dsD2Bo5jTp5E3fyuQ8loh+Gci6FefVRcaf9Y6fbSsexQg3iRS/K
	fC7vZnZSeQoznqMXivT/7aqZxNIe8fdk6Ruzt/aciMoXXf/Za27fnzIl2Ir9wfYdb63v
	s2FoOTrp/CRpqAPSQbVlau47ZB+0TBxzwvlbM=
Received: by 10.90.80.18 with SMTP id d18mr1628048agb.31.1295655735237; Fri,
	21 Jan 2011 16:22:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.55.10 with HTTP; Fri, 21 Jan 2011 16:21:55 -0800 (PST)
In-Reply-To: <ihbp5c$4ov$1@dough.gmane.org>
References: <20110120181233.GA1789@lit.local.igalia.com>
	<ihbp5c$4ov$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Jan 2011 16:21:55 -0800
Message-ID: <AANLkTinnrY2o___wOwe3vqrYfY8QsBQYE6AA7VFuAq7T@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: problems compiling glibc_2.9-r37.4 under Angstrom
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
X-List-Received-Date: Sat, 22 Jan 2011 00:23:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 21, 2011 at 3:03 AM, Koen Kooi <k.kooi@student.utwente.nl> wrot=
e:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 20-01-11 19:12, V=C3=ADctor M. J=C3=A1quez L. wrote:
>>
>> In order to build native-sdk-image recipe, I found my self compiling
>> glibc_2.9-r37.4, because it is the real provider of virtual-libc-dev (th=
e
>> toolchain does not truly provide it -but that is another bug [1]-).
>>
>> But the glibc_2.9-r37.4 configuration fails using the canonical
>> arm-angstrom-linux-gnueabi- toolchain
>
> If you're using angstrom 2008, glibc 2.9 is built by default. Trying to
> rebuild it won't work because it will be missing headers due to all the
> - -initial and -intermedia shuffle.
> If you're using angstrom 2010, eglibc is built by default and should
> providing virtual-libc-dev

yes angstrom-2010.x is a better option keep in mind its new so expect
some churn every now and then.

>
> Switching to minimal will only get you anguish, since it's broken by desi=
gn.

Heh interesting :) It would help if you elaborate on the flaws so we
can improve it and in turn improve OE in general


> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFNOWfsMkyGM64RGpERAsqfAKC2L5KDSLLBSC0tES2r+Axm+rxGoQCfVssG
> IDR7J61eU9hEKOTT2+CRW9M=3D
> =3DR8yc
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


