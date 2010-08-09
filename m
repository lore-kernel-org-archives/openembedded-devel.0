Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OiYOM-0005td-7t
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 21:52:40 +0200
Received: by bwz8 with SMTP id 8so1510239bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Aug 2010 12:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=XlKtfgR7Q/7O6OpKZWb7FN+8yuiam6S0pYDYUgu1kqM=;
	b=Q52rA52ZrnYj7THYyNkB0rKBKqklEyBbxbdKAzINEuxzbPMfUsW/mnUyebeYk6uKzf
	HenUmOSgnv1/nnL4FTS7dq3zmaBERCJZ80SfXEkWH2vRXonWm5AIqvPwZsWkzlqMKR3k
	Cr1cGhoxBg9PXxLyZAq3/8pSx2tSZXMWASr6U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=dweeIAxxagq3BVi1NdDzTUkQ8yq6FySjCv/xdg1PGylnfTA5HUZmNhTQq8B/Ar5XMJ
	PNLL5ARpFXiUD/1PNl74C/iMNxYQrBfa3YvdIcgaqm1wrtA+lmv4haVW2VhpcOUNEHMa
	fE/xqFdiOJwc3MhM85ZhvJ1UOKMYXxjnLpZf8=
Received: by 10.204.46.159 with SMTP id j31mr3310069bkf.5.1281383526588; Mon, 
	09 Aug 2010 12:52:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.204.71.8 with HTTP; Mon, 9 Aug 2010 12:51:46 -0700 (PDT)
In-Reply-To: <AANLkTin9dRBe8r_-gqQagZSZGTfPy2jT08Nvt12Nr+3w@mail.gmail.com>
References: <AANLkTikW-PHOKKuz1fOiocuU8gGiwFRk3CmTfYtU_gZf@mail.gmail.com> 
	<AANLkTi=vY5==A3XoJfhpp4Qjgbur+fy46L_gPacNhT6d@mail.gmail.com> 
	<AANLkTin9dRBe8r_-gqQagZSZGTfPy2jT08Nvt12Nr+3w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Aug 2010 12:51:46 -0700
Message-ID: <AANLkTikBRL9nujDhEFtkDqciQXupVJty9EYK4ZVK5uAF@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: application not getting loaded
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
X-List-Received-Date: Mon, 09 Aug 2010 19:52:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 9, 2010 at 4:43 AM, Anand Sivaram <aspnair@gmail.com> wrote:
> On Mon, Aug 9, 2010 at 05:12, Graham Gower <graham.gower@gmail.com> wrote=
:
>
>> On 8 August 2010 20:25, Anand Sivaram <aspnair@gmail.com> wrote:
>> > Dear All,
>> >
>> > I wrote a custom gstreamer application on ARM (dm6446) angstrom.
>> > Whenever I try to run the application, I am getting the following erro=
r,
>> > that looks
>> > as if the shell is treating the application as a shell script.
>> >
>> > /usr/bin/app: line 1: syntax error: word unexpected (expecting ")")
>> >
>> > I made sure that the application is having 755 permission and
>> readelf/file
>> > etc. from
>> > a linux pc shows this as an ELF 32 bit ARM executable.
>>
>> This error message is typical when the system is trying to execute a
>> binary built for a different architecture.
>>
>>
>> > These are the dynamic library dependencies during compilation.
>> > pkg-config --libs gtk+-2.0 gstreamer-0.10 gstreamer-interfaces-0.10
>> >
>> > Is it due to some shared library loading problem? =A0In that case is t=
here
>> > any arm "ldd" available on openembedded target or on build host to
>> > verify what is missing?
>>
>> You can invoke the dynamic linker and have it print out the dependent
>> dynamic libs. e.g.
>> $ /lib/ld.so.1 --list /path/to/bin
>>
>> But this will execute the binary to make the list, so if your system
>> doesn't recognise the binary, this won't work.
>>
>> -Graham
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> Thanks Graham, =A0I am looking into that.
>
> Also I noticed the following error while linking, but still the executabl=
e
> is getting built.
>
> /mnt/project/angstrom-dev/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueab=
i/4.3.3/../../../../arm-angstrom-linux-gnueabi/bin/ld:
> warning: libc.so, needed by
> /mnt/project/angstrom-dev/cross/armv5te/lib/gcc/arm-angstrom-linux-gnueab=
i/4.3.3/../../../../arm-angstrom-linux-gnueabi/lib/libgcc_s.so,
> not found (try using -rpath or -rpath-link)
>
> Any idea?

its a warning. should be fine

>
> Thanks and Regards
>
> Anand
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


