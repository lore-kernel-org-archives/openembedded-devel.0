Received: from [209.85.217.225] (helo=mail-gx0-f225.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1M53ob-0002HL-AO
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 May 2009 22:15:45 +0200
Received: by gxk25 with SMTP id 25so1948448gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 May 2009 13:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=7+Uu9dF/gy3UatpwUQfAufzrr+2U+zPx4EI2kgZNM10=;
	b=lMsJUi26H/eqh/d31YRn0z6m5VArqJafU1g5O2RV/Zq3R43/LP3InniADVzI2ppdds
	Oe9vRdqVPQshoWp0y2ZCzLX2q/opds8u5j0cPzkjcgZiCMbBJ//RjAEfBzFXYN4bTryO
	XZTWFBrrBHuBdkwy/0XdjDDh7ylf+oG2IYcYA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Ho62q+7CcWjWzbNCZHF8FToosqyy293s+1i6IIUbyDWMwS90VqRv7G79e83WxKtRV2
	pHG2avjPurSn1UMT1niXU6iZ5SwhPDn1iFL9STjrWJnWl/rPIjWuOeT+9sz2qvaOukwW
	lykH8g9OAdiSkJ3oVB32eaPbEhni8gt4QEPYI=
MIME-Version: 1.0
Received: by 10.151.137.6 with SMTP id p6mr6812572ybn.214.1242418051680; Fri, 
	15 May 2009 13:07:31 -0700 (PDT)
In-Reply-To: <200905112228.33758.g.eismann@gmx.net>
References: <200905111744.00650.g.eismann@gmx.net>
	<200905112052.53485.g.eismann@gmx.net>
	<f96d234e0905111309u1ae4805bnaeb9adc1bf1ceca3@mail.gmail.com>
	<200905112228.33758.g.eismann@gmx.net>
Date: Fri, 15 May 2009 16:07:31 -0400
Message-ID: <f96d234e0905151307y6a9a032ay61e5f58386d19490@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: image generation
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
X-List-Received-Date: Fri, 15 May 2009 20:15:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2009 at 4:28 PM, G. Eismann <g.eismann@gmx.net> wrote:
> On Lunes 11 Mayo 2009 22:09:47 Cliff Brake escribi=F3:
>
>> >
>> > When building the image, the release 5 (the last one) of the package i=
s
>> > built, but in the "do_package_write_ipk" step there is an error becaus=
e
>> > is looking for the install directory for the release 1.
>>
>> Can you post your recipe, and we'll take a look?
>
> Finally I have "fixed" it copying the recipe to a new one with a new name=
; so
> I am not sure if the problem has something to do with the recipe.
>
> bitbake was looking for release 1 of the recipe, while the release number=
 is
> 5.
> I dont know why it did only for "do_package_write_ipk" step and not for a=
ll of
> them.
>
> Anyway, the recipe:

Its not obvious to me yet what is causing this issue, but you may get
some more clues by running bitbake -DDDD

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


