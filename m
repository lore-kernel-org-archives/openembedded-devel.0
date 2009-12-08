Received: from mail-yw0-f190.google.com ([209.85.211.190])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NHw3F-0005gl-8C
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Dec 2009 10:08:12 +0100
Received: by ywh28 with SMTP id 28so5887402ywh.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Dec 2009 01:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=SVH5CmBArnjch8PvkGRhTN0t50FqgdHhHGwxOsTpDfY=;
	b=Iuxsdxq8Z1ZPbcpC1wwZ4A6bzgvKnzjWz/DWmkX7bs/gQsvEpzOf77P6wP+fwy2nt5
	unsuhjCDyaeMIWsrBDTci99Y1P4xC+LblTw+b21fYLC/ZOHRQDkH7SIPwBoijeqc/+LV
	kD25wJ7XknTLP9xCZLh2XKcyrnb3MAW6clI50=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=raw9vCr024fDzo62uqEF6z9WdVfdyKQzvrfvzbL2OVpOMfpm0W87wXhOW6C7RR7iT4
	m7T4DxfZXwlNsbsI0PO9dyo/+dIL60AD8aaYuzPPOKaxNXt9IeirQ3sGDP3DAoBpbSbL
	4R2nLtlES8nZVAEBtOCfn4Y8f/fHwfMmGcFJY=
MIME-Version: 1.0
Received: by 10.101.165.7 with SMTP id s7mr1357893ano.136.1260263187768; Tue, 
	08 Dec 2009 01:06:27 -0800 (PST)
In-Reply-To: <op.u4l246yhmn1qzu@guohr-laptop-ubuntu>
References: <op.u4lz932emn1qzu@guohr-laptop-ubuntu>
	<hfl1ft$sog$2@ger.gmane.org> <op.u4l246yhmn1qzu@guohr-laptop-ubuntu>
Date: Tue, 8 Dec 2009 10:06:27 +0100
Message-ID: <ac9c93b10912080106s655aba70kbed46f8a0c93c229@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.190
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Does it possible to use pre-built native tools
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
X-List-Received-Date: Tue, 08 Dec 2009 09:08:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2009/12/8 Guo Hongruan <camelguo@gmail.com>:
> Hi Koen,
> =C2=A0 Thanks for your information.
> =C2=A0 I think it will save my time. Consider I have to build several pla=
tforms
> for different architecture, in fact the native tools is architecture
> independent. So I think it is more reasonable to avoid building native to=
ols
> for other platforms. Is there anything wrong with me.

If you build different machines in the same tmp dir the system will
normally not rebuild native packages.
Also if it is the same architecture you won't get a new compiler (e.g.
if you have two armv5 systems).
Thinking of it, not sure what would happen if one version would insist
on using an older version of gcc

Frans
>
>
> =C2=A0 I tried to use ASSUME_PROVIDED to avoid compiling some native tool=
s, but
> it seems that there are some building failure. I am trying to figure them
> out.
>
> =E5=9C=A8 Tue, 08 Dec 2009 16:07:25 +0800=EF=BC=8CKoen Kooi <k.kooi@stude=
nt.utwente.nl> =E5=86=99=E9=81=93:
>
>> On 08-12-09 08:55, Guo Hongruan wrote:
>>>
>>> Hi guys,
>>> I want to configure openembedded to use the pre-built native tools.
>>> e.g: qemu-native, quilt-native when building the whole image, so that t=
he
>>> building can save lots of time. Is there anyone know how to achieve it?
>>
>> It won't save you any time, since every tool OE builds for it self is
>> built for a reason. If you think a 10 minute buildtime improvement outwe=
ighs
>> a month more of bughunting then look into ASSUME_PROVIDED.
>>
>> regards,
>>
>> Koen
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
> --
> Guo Hongruan, Embedded Linux Consultant
> Mobile: +86-0-13484056007
> Skype: camelguo
> Twitter: camelguo
> http://www.gulessoft.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


