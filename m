Received: from [209.85.218.165] (helo=mail-bw0-f165.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1LiR7r-0006C7-Ln
	for openembedded-devel@openembedded.org; Sat, 14 Mar 2009 11:29:55 +0100
Received: by bwz9 with SMTP id 9so3186790bwz.12
	for <openembedded-devel@openembedded.org>;
	Sat, 14 Mar 2009 03:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=3a5pqzoURLOdrVl3xzJ/VO6Wdp23qYiIbAFc6Fgwz6g=;
	b=FGpCR/O+xod8dEd4/ExtNpEet5EsKr0mFlKGoSf6A0uZ812zq0u3jzOjfOCI8mtjdX
	muX+5du/XI8HU/iR8xBg+VyIhLpKy02G27Qent2OMs5Vm03FB7igQSjiZWxqqnHFo6BO
	v6xYKPkHX56IHwJ31JiXoCw886XXTjyQ2WvYk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=ezD7BXhUhnELlltxahpAwtp2LCSbAYKJze40m91faGZnsmJ0JE+nNZZV5QD9aNZdwI
	dXYhRvWcFNalvXMsFWi8EnEBr+sD7M0A4tYRC0v7fQioR5d6OOoiIo++zxLymxIpnBdV
	V38mrbhqB1ZeYJ2kr4Zk1rKqDBiKbomUDnihg=
MIME-Version: 1.0
Received: by 10.223.114.207 with SMTP id f15mr1119997faq.90.1237026568923; 
	Sat, 14 Mar 2009 03:29:28 -0700 (PDT)
In-Reply-To: <20090313165729.GG26343@smtp.west.cox.net>
References: <20090313145610.GA26373@denix.org>
	<018101c9a3f0$7f5b2cd0$5e3018ac@Glamdring>
	<20090313160732.GA26615@denix.org>
	<ac9c93b10903130920t14221262y841d9999563bd912@mail.gmail.com>
	<20090313165729.GG26343@smtp.west.cox.net>
Date: Sat, 14 Mar 2009 11:29:28 +0100
Message-ID: <ac9c93b10903140329g1504f185xea0b45bee224624b@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: PARALLEL_MAKE
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
X-List-Received-Date: Sat, 14 Mar 2009 10:29:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Ah,

Thanks alot Tom, I was unaware of this. Mostly I repaired thse
breakages by disabling PARALLEL_MAKE. Apparently most of the time not
the optimal solution....
Will do things better in the future (and will try to repair things
where things go wrong.
One small Q though: The fact that a package is build during the build
of another pacakge, doesn't that implicitly say that there is a
dependency between these?
(actually thinking of it as I write this: guess most packages should
depend on gcc, glibc etc but these are not made explicit)

Frans.

2009/3/13 Tom Rini <trini@kernel.crashing.org>:
> On Fri, Mar 13, 2009 at 05:20:51PM +0100, Frans Meulenbroeks wrote:
>
>> I'm not sure how PARALLEL_MAKE is supposed to work, but I noticed that
>> often there is a problem because with it a package on which there is a
>> dependency is build in parallel. Since there is a dependency in a lot
>> of cases the underlying package fails.
>
> PARALLEL_MAKE is just a wrapper around make ( / cmake?) -j N.
> BB_NUMBER_THREADS is how you get different packages going in parallel.
>
>> A typical scenario:
>> a package X depends on perl-native, typically they start to build in
>> parallel but perl-native does take much longer than X. X requires
>> perl-native to complete and fails.
>
> Right. =A0This is a bug on package X not listing perl-native as a
> dependancy as with BB_NUMBER_THREADS >1 perl-native will be worked until
> do_populate_staging before X do_configure is started.
>
> --
> Tom Rini
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


