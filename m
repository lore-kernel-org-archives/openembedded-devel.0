Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PbGrQ-000794-S4
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 19:16:24 +0100
Received: by bwz10 with SMTP id 10so16845348bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Jan 2011 10:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received
	:in-reply-to:references:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=oSgsk79WYBLEDOU7BJZRLz8xH0FVnOANv44Bw+S0FNk=;
	b=UyVlGpzftor1bTRVHp5Y2tsk6MxjQvb71VvxZYaQBqCwTcwXcX4geafM2Se6eeAcgw
	H+94XQPj2GmACjLs+UCDKCgCj2H3eQTOshEykFV82o+A5pCudIjZMS9ZQTDo7UPiWicU
	kxdpsr+RPR2dQDfbkB0A1cwLdbknuth/N5nIc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=tYfEaRnM+ntQTktTMXOHf3np+rBNPHWjwLKh4HO0KAQI7egXTT5s1Icl6sGmhg9YLA
	7cwIcNsAvxtQd1AcnFvSXJlzINYYHSFysXGf7QO/toCizA40k1LLJmAo58emSYb8z3vr
	Q4DrMan5y9NQ2P0dkPfLrBxBM9HkkeC6B0IwM=
MIME-Version: 1.0
Received: by 10.204.68.69 with SMTP id u5mr8265745bki.99.1294424158904; Fri,
	07 Jan 2011 10:15:58 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.59.147 with HTTP; Fri, 7 Jan 2011 10:15:58 -0800 (PST)
In-Reply-To: <AANLkTikTFe9ytvKcD1T=_L8GFiPo5bqBQ2o29McmzYU4@mail.gmail.com>
References: <1294392497-24747-1-git-send-email-raj.khem@gmail.com>
	<AANLkTi=UUDxkTNDoWBoOxaCPDyupG8BazYtt6nGs3-7E@mail.gmail.com>
	<4D272079.5000402@opendreambox.org>
	<AANLkTikTFe9ytvKcD1T=_L8GFiPo5bqBQ2o29McmzYU4@mail.gmail.com>
Date: Fri, 7 Jan 2011 16:15:58 -0200
X-Google-Sender-Auth: uswEjKaX4-iIqqHQn4dX1CEmKvY
Message-ID: <AANLkTi=SAg9i3VVH4Ac81ap0EtjXuMhs918uPyEsCknv@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] eglibc: Make it configurable by tuning eglibc options
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
X-List-Received-Date: Fri, 07 Jan 2011 18:16:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 7, 2011 at 15:30, Khem Raj <raj.khem@gmail.com> wrote:
>> Maybe it would be better to introduce EGLIBC_FEATURES and
>> BUSYBOX_FEATURES, possibly presetting some values with options already
>> present in DISTRO_FEATURES.
>>
>
> I think it can get to many knobs and confusion in settings. With
> system library any feature en|disable
> is system =A0wide so having it as a distro policy is right way to go imo.

We can use DISTRO_EGLIBC_FEATURES or DISTRO_LIBC_FEATURES (so we can
add to uclibc support for it too). Spliting it from DISTRO_FEATURES
makes sense IMO since we'd use the same concept to recipes (as
busybox) that are ofthen customized.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


