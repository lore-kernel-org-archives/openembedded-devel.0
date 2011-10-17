Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RFcRy-0001hl-9H
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Oct 2011 03:57:10 +0200
Received: by pzk33 with SMTP id 33so7193487pzk.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Oct 2011 18:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=GFXw+VTvvKe6Y+F8mU+E64DVUQSQyecPuDL+FZeszL4=;
	b=qzSOb1unGgd1Q7Gf2ST6R/MFOYFZaPSbHW1Q6SYYxtCxylZZJwtC+csRudoUaxbMeV
	uyP9K2kdkwzKlomsFIZuQzcu9fFJ+st2ypRk6Q3q+n5YZf4WhhvtN3DyRW1oBPOD/rwc
	dH2Xku5Kl13tnEY2i68FGsArv4wD9OF6r17Xg=
Received: by 10.68.32.162 with SMTP id k2mr34410138pbi.132.1318816281090; Sun,
	16 Oct 2011 18:51:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Sun, 16 Oct 2011 18:50:51 -0700 (PDT)
In-Reply-To: <CAAQYJAvm1mGo6sswMBPx+tgQfZapTqX4E1SXSsZKU25D-u1eDA@mail.gmail.com>
References: <20111015185155.DA982101FE@opal>
	<CAAQYJAvm1mGo6sswMBPx+tgQfZapTqX4E1SXSsZKU25D-u1eDA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 16 Oct 2011 18:50:51 -0700
Message-ID: <CAMKF1sqEQtqCMi+p6yEArDWpiGGS2Du1ca34ROtkFAzdc-X3MA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Khem Raj : binutils-cross: Sync with oe-core
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
X-List-Received-Date: Mon, 17 Oct 2011 01:57:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 16, 2011 at 2:37 PM, Andrea Adami <andrea.adami@gmail.com> wrot=
e:
> On Sat, Oct 15, 2011 at 8:51 PM, <git@git.openembedded.org> wrote:
>
>> Module: meta-openembedded.git
>> Branch: master
>> Commit: 92b02b7209e426a70cc5626e7bdbc82052e01ac5
>> URL:
>> http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit;h=3D92=
b02b7209e426a70cc5626e7bdbc82052e01ac5
>>
>> Author: Khem Raj <raj.khem@gmail.com>
>> Date: =C2=A0 Sun Oct 16 01:28:32 2011 +0000
>>
>> binutils-cross: Sync with oe-core
>>
>> Now we have own copy of binutils-cross in meta-oe
>>
>
> I can't unfortunately find the discussion which supposedly provided a val=
id
> reason for binutils-2.20 in meta-oe while binutils-2.21 is in oe-core.
> I'm against that kind of policy for meta-oe, particularly when it's about
> toolchain.

oe-core is deprecating versions that are still used by consumers of
meta-oe (mainly angstrom 2010 release)
since its toolchain and it will also benefit derivatives of angstrom.
Angstrom could also move these elements
into meta-angstrom if we think that its only angstrom specific and no
other consumers of oe-core needs them
layer maintainers make judgement call which they think should benefit
wider community

similar but not for binutils here is a relevant thread

http://lists.linuxtogo.org/pipermail/openembedded-core/2011-October/010700.=
html

I think angstrom needs older binutils to support older kernels.

>
> we need to sync with oe-core periodically
>>
> That's just one of the bad effects :/
>
>
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>
>>
> my 2c
>
> Andrea
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


