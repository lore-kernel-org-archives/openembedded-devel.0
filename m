Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P2nTH-0004Mt-6p
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 18:01:03 +0200
Received: by iwn2 with SMTP id 2so7037291iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Oct 2010 09:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=eqDjGiqz/fIc8S4JeU6x8fnOhZ/o2Sta8lzbiCz4eN4=;
	b=qVMnEeeOYDvdZ7Lg6hNnewzldxy8epM8GRo+v7aA4cttrIGJcgDO/uw3PXanbpm7qz
	8J2MCAHWUSx+aY8rADh3FHQ/czMjk3YF+bOfSDA+2Yrko8ZjdvAjwZTJE/f5T1R5nnVq
	QLWQapiHuTohr2WGsoQfV78q7698YIFcXmhpI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=XYF5OfRSjP7Dd782yAJt5GIXN9epCbi6tTsRCJdsPMv4WAMiJKhdjN6ASokGEX9FUs
	/xlko9ieqIHp459bs3hJAkPJAMor2zp3Qw+d4kbT1MwT4AeVIK9CRIa8asUE1qatRvmA
	HdCv1GSyNmZKhCK7wYGGugfMhYNUFLw0/OrVU=
Received: by 10.231.35.200 with SMTP id q8mr10372598ibd.191.1286208037369;
	Mon, 04 Oct 2010 09:00:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Mon, 4 Oct 2010 09:00:15 -0700 (PDT)
In-Reply-To: <4CA98B66.3060404@dresearch.de>
References: <1285777033-19478-1-git-send-email-t.fromm@dresearch.de>
	<AANLkTikWLrAZaejWvnBGf4hn0CdKV2FgYiMxLEkDn+Wi@mail.gmail.com>
	<4CA46AD8.2070205@dresearch.de>
	<AANLkTimOEDXH3=OrROehD+sVtNdihoO8Q3P6Vy0oJscQ@mail.gmail.com>
	<4CA5B348.1000404@dresearch.de>
	<AANLkTinw6Tz0fDEGPBDyvv85KRk4w3v+ygeNemSHceh2@mail.gmail.com>
	<AANLkTimviE5VqivppJTVZvhspZtsiUNpqVjGD4=p=No+@mail.gmail.com>
	<4CA98B66.3060404@dresearch.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Oct 2010 09:00:15 -0700
Message-ID: <AANLkTi=mw3h2vqEav+yz2begWJVR++V6823_QmjdNqAg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libunwind: force gcc to be built first
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
X-List-Received-Date: Mon, 04 Oct 2010 16:01:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 4, 2010 at 1:08 AM, Thilo Fromm <t.fromm@dresearch.de> wrote:
> Hello Frans,
>
>>>> I tracked it down - libunwind publishes unwind.h, and gcc uses an
>>>> internal
>>>> file of the same name while being built.
>>>
>>> Yes gcc has its own version of libunwind which it used unless
>>> configured with --with-system-libunwind
>>> IIUC the problem happens with target gcc not with cross-gcc. target
>>> gcc is built using cross-gcc and
>>> <sysroot>/use/include could be preferred over the location of
>>> libunwind.h which is in gcc sources
>>> If thats the case then we need to fix gcc build to not look into
>>> standard sysroot/usr/include but prefer
>>> the local unwind.h when its using internal libunwind. The problem
>>> would not show up if the libunwind versions
>>> were matching but that may not be the case always and I dont know of
>>> hand how we can fix the gcc configury/build
>>> to ignore installed unwind.h
>>>
>>> You workaround would only work if build sequence was followed if some
>>> one just cleaned gcc and rebuild it
>>> the problem will resurface.
>>>
>> Thanks for the analysis Khem.
>> This is indeed more or less what I had expected.
>>
>> For me this patch gets a NAK as it does only masks the problvem in
>> some cases but not really solves it.
>
> You're right with this analysis; however, the patch enables Openembedded =
to
> be built *at all*. If you care less about whether you're able to actually
> build and if you have the time to wait until someone ventures deep into t=
he
> gcc build and fixes the cause, then this is the way to go.
>
> For us, however, this patch is a valid workaround. It will make Openembed=
ded
> work for us until the original issue is fixed.

I think we should try to fix it in right way.

>
> Regards,
> Thilo
>
> --
> Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Developer
> DResearch Digital Media Systems GmbH
> Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
> Tel: +49 (30) 515 932 228 =C2=A0 mailto:t.fromm@dresearch.de
> Fax: +49 (30) 515 932 77 =C2=A0 =C2=A0http://www.dresearch.de
> Amtsgericht: Berlin Charlottenburg, HRB:54412
> Ust.-IDNr. DE169013825; WEEE Reg.-Nr. DE 85995642
> Gesch=C3=A4ftsf=C3=BChrer: Dr. M. Weber, W. M=C3=B6gle
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


