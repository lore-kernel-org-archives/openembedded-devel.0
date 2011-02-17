Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Ppuju-0000h2-50
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 04:41:10 +0100
Received: by fxm17 with SMTP id 17so2053528fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 19:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=1oKfnFlChZN//8glnzRZJ3IpudgdJ9svXFgxbB6SBXg=;
	b=l+sWd9qZzxNVNB+6WllEVzQy/8wwWLQe9soJaWGQ7ziPyNpMVyfE35pyU8W9/1ps/K
	Zo8lQO4O9FMGEXgb9e6qYeejJhf3DqmU0Rvqg8O1AskIKG6BvolYESi7nJHogAdyGNnh
	zp5xrWD3iSabOtG+fmeEPX5g7Snc9lwK/FJN0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=tyy810rzijwK4D87GRKhFKySrSZ+/U+ktAsMldclj1depvAJL+0NQ2eClmIvgrg826
	hv7UZ3VtJZ0zsemOdQvxXCgWDD8tjsowczVuKUiCYBuBtqS8fnM4z9AURQar10J8escN
	3HVYKtWd5kXm2umybBQi6SpcclxVTHhyLh68M=
Received: by 10.223.86.2 with SMTP id q2mr1703651fal.139.1297913998127; Wed,
	16 Feb 2011 19:39:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.66.22 with HTTP; Wed, 16 Feb 2011 19:39:38 -0800 (PST)
In-Reply-To: <AANLkTikbG2APGZh53J3fv9sGZYx_C7M0kuRWNmKCfO1D@mail.gmail.com>
References: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
	<1297855134-19216-9-git-send-email-otavio@ossystems.com.br>
	<20110216230953.GT14525@sakrah.homelinux.org>
	<AANLkTikZ1DpDSnj0gPwZVA4uZHTB1uR3B5dM+haW_VWh@mail.gmail.com>
	<20110216231949.GY14525@sakrah.homelinux.org>
	<AANLkTikbG2APGZh53J3fv9sGZYx_C7M0kuRWNmKCfO1D@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Feb 2011 19:39:38 -0800
Message-ID: <AANLkTikm_vK8ygnO00w0__UsQ93_q=pAUaA4A4tpWUXb@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 09/13] sdk.bbclass: cache ${libdir} as ${target_libdir}
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
X-List-Received-Date: Thu, 17 Feb 2011 03:41:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 16, 2011 at 3:24 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Wed, Feb 16, 2011 at 23:19, Khem Raj <raj.khem@gmail.com> wrote:
>> On (16/02/11 23:15), Otavio Salvador wrote:
>>> On Wed, Feb 16, 2011 at 23:09, Khem Raj <raj.khem@gmail.com> wrote:
>>> ...
>>> >> +target_libdir :=3D "${libdir}"
>>> >
>>> > could you explain more why this is needed
>>>
>>> Used on the qt-native-sdk change.
>>
>> Could you revert this and see if it fixes your i586 gcc-cross-sdk issue
>> ?
>
> It doesn't since Jay has tested it and it failed to him for
> i586-generic and qemux86.

yes I can reproduce the problem. Its a gcc ICE in this case. I have
few worarounds
but let me first acertain the real cause.

>
> --
> Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems
> E-mail: otavio@ossystems.com.br=C2=A0 http://www.ossystems.com.br
> Mobile: +55 53 9981-7854=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =
=C2=A0http://projetos.ossystems.com.br
>


