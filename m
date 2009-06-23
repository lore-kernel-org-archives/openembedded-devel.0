Received: from [209.85.210.188] (helo=mail-yx0-f188.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MJBdk-0004BK-Js
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Jun 2009 21:26:44 +0200
Received: by yxe26 with SMTP id 26so38680yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jun 2009 12:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=KZuMg2VwRcbJQZ5pgvzV6GYu4j0Mowlm02FrvgFxGMg=;
	b=V8XmEAiaLvTFGpyKSCiIT+B9VXhl8CwUKvCRJac2nJrIDaHt+GqDjdODblYnPJuOFM
	olkeWG4fme3B/oimINgEcbCixl5bo82JVoOt4MaLiLcuJFmbeB9xbL7xfLqWuLOLjGBW
	u7VEBVIeuKk6ApI706J+5ttECDO0uLn0GZFCk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=i2FYZVCvQwLmQr8aic2PeT0SALXgpr+M6oXIZRi2aWxIya7qTiZPFVCuBrHLy5vhBi
	MluZW6A+ZL3O3NaCgHEJTu4RnJaN2ACE5UYIWGWg1tW3krePrlCftVdXIfHjyWGicj5z
	x9T4McotV1u/K6EkTe4ajW6ph0BIER6nH2WYg=
MIME-Version: 1.0
Received: by 10.231.17.199 with SMTP id t7mr150547iba.46.1245784536836; Tue, 
	23 Jun 2009 12:15:36 -0700 (PDT)
In-Reply-To: <1245779214.29153.376.camel@lenovo.internal.reciva.com>
References: <1244836535.4151.140.camel@lenovo.internal.reciva.com>
	<1244838263.5958.34.camel@dax.rpnet.com>
	<f96d234e0906181109y4ee832bcu7b53037c917709be@mail.gmail.com>
	<19c1b8a90906231030i3e810672j13ca95b56c647022@mail.gmail.com>
	<1245779214.29153.376.camel@lenovo.internal.reciva.com>
Date: Tue, 23 Jun 2009 12:15:36 -0700
Message-ID: <19c1b8a90906231215n7e0eeba3o94a31b74537a6c19@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [rfc] change default for BUILD_OPTIMIZATION, remove spurious 	assignments
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
X-List-Received-Date: Tue, 23 Jun 2009 19:26:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2009 at 10:46 AM, Phil Blundell<philb@gnu.org> wrote:
> On Tue, 2009-06-23 at 10:30 -0700, Khem Raj wrote:
>> =C2=A0-frename-registers was a workaround to get past a ARM GCC ICE in 4=
.2 IIRC
>> we should get rid of it.
>
> No, -frename-registers is an optimisation in its own right.

yes I was mentioning about why we have it enabled.

I think we
> probably want to keep that.

side effect is that It hampers debugging

=C2=A0You might be thinking of the
> -fno-rename-registers that we do use for some packages to avoid an ice
> on arm with gcc 3.4.

yeah thats right. Rusted me

>
>> -fexpensive-optimizations and -fomit-frame-pointer are passed by
>> default at O2 so we should get rid of them too.
>
> Is that true on all targets?

yes

I didn't think that -O2 implied
> -fomit-frame-pointer on arm.
>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


