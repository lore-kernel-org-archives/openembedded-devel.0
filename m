Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OXiyy-0000N5-OC
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Jul 2010 00:57:17 +0200
Received: by iwn34 with SMTP id 34so3543672iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Jul 2010 15:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=DusZ0RaQYkkqKZOW8Q1zBWBb+jedl1gpUXIELsbh6qE=;
	b=U9wl4WYRPJ6uss97HyE0PwcjQ3/JpfvhUUyS6rPpQRPktL/1J3Wl4Xsk+ti15X2+/s
	m+5H9RYnnKLof1lLuSCq3ZxMGvK+HOCXwaitjGR8Rs3eT/R3t+/KcwVo1dFIZnVR1vPB
	uRM24zC9kP55gUOX2COkQk00cz70pZs7RExJc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=xFnHpxinMCCvNytWxkbanZ4mOWYE1IljPGKZNC7DwvlHPlpBGhc4NUilnnAYuRmnVk
	phVns/7oo5l5a27ZygCEtUfb/A7U0j51ib15kQ/vKXyIZeAYcWrzGr29nMTQXZfIveF2
	MbwylwqsFCSNp1b2S0Ntw9cwOAr6DtxDybWLE=
Received: by 10.231.31.197 with SMTP id z5mr11645489ibc.80.1278802343327; Sat, 
	10 Jul 2010 15:52:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Sat, 10 Jul 2010 15:52:03 -0700 (PDT)
In-Reply-To: <AANLkTinBxC1R3u6zNROCBSG59X-CzwmMCiohckgAnvtn@mail.gmail.com>
References: <1278527926-5065-1-git-send-email-fransmeulenbroeks@gmail.com> 
	<AANLkTikso9BfJHslU0Ss6nQ5SfnOdgy8RIU0WF383jXX@mail.gmail.com> 
	<1278529036.4413.67.camel@lenovo.internal.reciva.com>
	<AANLkTil6ZzCLdFEKksqKwjzCj_DV2DT7eifCJakP1HhR@mail.gmail.com> 
	<1278531880.4413.70.camel@lenovo.internal.reciva.com>
	<AANLkTilH4HHsk0ftnGdTN43qWb70aDZvYt1o6557tAH4@mail.gmail.com> 
	<1278577398.15825.1.camel@lenovo.internal.reciva.com>
	<AANLkTinBxC1R3u6zNROCBSG59X-CzwmMCiohckgAnvtn@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 10 Jul 2010 15:52:03 -0700
Message-ID: <AANLkTil545S6LXIu81gk4Kr6n_vjWJ97ncau9ifceQal@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] classes/base.bbclass: add INCOMPATIBLE_MACHINE
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
X-List-Received-Date: Sat, 10 Jul 2010 22:57:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 10, 2010 at 9:23 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/7/8 Phil Blundell <philb@gnu.org>:
>> On Thu, 2010-07-08 at 08:49 +0200, Frans Meulenbroeks wrote:
>>> The only concern I have is the name COMPATIBLE_TARGET
>>> for me TARGET is the board so COMPATIBLE_TARGET for me more or less
>>> equates to COMPATIBLE_MACHINE.
>>> What about COMPATIBLE_ARCH or COMPATIBLE_ARCHITECTURE?
>>
>> I think the variable that you want to match against (in the specific
>> case of cross.bbclass) is ${TARGET_SYS}. =A0Having the matching variable
>> be named COMPATIBLE_ARCH would imply that it's going to match
>> ${HOST_ARCH}, which obviously isn't what you want.
>>
>> I would have thought that confusion with ${MACHINE} should be minimal
>> since that nomenclature is already quite well established in OE. =A0But
>> you could name it COMPATIBLE_TARGET_SYS if you wanted to make the name
>> completely explicit.
>>
> Patch posted. I named it COMPATIBLE_TARGET_SYS and compare with TARGET_SY=
S.
> Tested it, and for me it works like a charm.
>
> However just after posting I noticed we also have TARGET_ARCH.
> I'm a little bit lost wrt the differences between these.
> Let me know if I need to move to *ARCH

TARGET_ARCH is the architecture e.g. arm. mips etc.
TARGET_SYS is canonical name like arm-oe-linux-uclibceabi or mips-oe-linux =
etc.

>
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


