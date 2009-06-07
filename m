Received: from [209.85.218.219] (helo=mail-bw0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MDJRG-0007Bp-Gr
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jun 2009 16:33:34 +0200
Received: by bwz19 with SMTP id 19so2526257bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Jun 2009 07:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=NOGBnr5n3TpIOEwmlRThkAFp9BWMaaMLFGrtaBamocI=;
	b=CMuzoUzAyezLIGctilCummLACrTyqBx1yz/GxCXowGCm2st7/CJY3scj0cizI2Hr7N
	poVrwTzVXxd332FVkH/svqIkz7Y4/WVAxacr4t/+uxjU3rX/8SMWLjY3u1ZaIC5OVGGK
	tBPRdStJX4aFDr2myZmJy7rxyw+0zW37LR1D4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=nOeyPPshhSqEjGZWP0jrnOX2WAE9mSdtQdR4/Gn9Fh1bFkpwmEFjznoLHl+H+lWely
	3ZGVZ8LINxjylugWRuFJCncLcs405PT2WUuCffljWOt0Jk2rJKUxCbgqSmsGCWYcI0JM
	sq8C8uwkqFaZqtqQbEEcSyH4QxHcsFtc8x1j4=
MIME-Version: 1.0
Received: by 10.223.122.204 with SMTP id m12mr3128242far.73.1244384649527; 
	Sun, 07 Jun 2009 07:24:09 -0700 (PDT)
In-Reply-To: <1244384219.4431.46.camel@utx.utx.cz>
References: <1244366174.4412.11.camel@daniel-laptop>
	<1244384219.4431.46.camel@utx.utx.cz>
Date: Sun, 7 Jun 2009 17:24:09 +0300
Message-ID: <fce2a370906070724m1fcfae19w2011e66c56ba3f3e@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: e2fsprogs-libs failed on latest org.openembedded.dev branch
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
X-List-Received-Date: Sun, 07 Jun 2009 14:33:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 7, 2009 at 5:16 PM, Stanislav Brabec<utx@penguin.cz> wrote:
> Daniel.Li wrote:
>> Hi List,
>>
>> What's wrong with this? How can I fix the problem?
>>
>> $ bitbake e2fsprogs-libs
>> ERROR: =C2=A0 =C2=A0 =C2=A0 =C2=A00048: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 basedir =3D os.path.join(os.path.dirname(root))
>
> I was hoping that it was fixed by this commit:
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D3ac375640=
39127c80eb5cf109fddf23a8e438bf8

It wasn't, and I already wrote about it to the mailing list after testing.

>
> Can you confirm, that you have a newer snapshot?
>
>
> ________________________________________________________________________
> Stanislav Brabec
> http://www.penguin.cz/~utx/zaurus
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


