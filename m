Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OshlI-00033Y-TX
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 21:54:05 +0200
Received: by iwn2 with SMTP id 2so4452068iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 12:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Uep4zjKFclnX9Yif4Hws6FddHhSEpaJ/sFsjXn+7X9I=;
	b=qYmYPq/gqIcL1uF/B/0FoT+uQ2rwCA0/qrxVJChA5vYR+b3TUTKCRu54p/VxdevMGz
	dkNzrrV86pje9nDXz5sAYCqNKp2i4MPB0FzrqBeSFvPBmx2rl0hy75fF5NmYGvfQPqZv
	vbSzW30lnR64YNODiJ2juu8vsnLBwAJkRBKiM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=uRtIYeLGrc8E0yl87ktHwf0J3MaNpkVNaYn144CUyZXi+AJOvLrZg6GVjGHon6mFP3
	tPn7NISw3sx7WjliCxPffTusTfMPPBzsTa/JCOrZNiSXcuHKKhXGI2uGf1P9bJ4hS8yU
	mfR53kWpVbGDS1XadKVvufbPeMRPOVQ/OUbuw=
MIME-Version: 1.0
Received: by 10.231.182.201 with SMTP id cd9mr6787963ibb.21.1283802792720;
	Mon, 06 Sep 2010 12:53:12 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Mon, 6 Sep 2010 12:53:12 -0700 (PDT)
In-Reply-To: <1283688889.25525.1.camel@saphir>
References: <AANLkTikC4v+QEpYsos2=f4wtEUUCt8Q=VK9ByT56pn-L@mail.gmail.com>
	<1283688889.25525.1.camel@saphir>
Date: Mon, 6 Sep 2010 21:53:12 +0200
Message-ID: <AANLkTinzpowwAP-eTfJMLCraeRT5TWCYFsmg_PpLNeqG@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: pulseaudio issue
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
X-List-Received-Date: Mon, 06 Sep 2010 19:54:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/5 Michael 'Mickey' Lauer <mickey@vanille-media.de>:
> Am Sonntag, den 05.09.2010, 11:10 +0200 schrieb Frans Meulenbroeks:
>> I have an issue with pulseaudio:
>>
>> | =A0 CC =A0 =A0 libpulsecore_0.9.21_la-svolume_arm.lo
>> | pulsecore/svolume_arm.c: In function 'pa_volume_s16ne_arm':
>> | pulsecore/svolume_arm.c:53: error: can't find a register in class
>> 'LO_REGS' while reloading 'asm'
>> | pulsecore/svolume_arm.c:53: error: 'asm' operand has impossible constr=
aints
>> | make[3]: *** [libpulsecore_0.9.21_la-svolume_arm.lo] Error 1
>>
>> From searching the irc log this is a longer standing issue.
>> Is there any suggested solution for this.
>> If I understand corrrectly it affects all our armv4 and armv5 machines.
>
> Indeed. Pulseaudio has broken armv4 and armv5 support since a couple of
> versions. We should probably add some COMPATIBLE_ARCH (do we have that?)
> as a duct tape until someone knowledgable can fix the ARM ASM portions
> for good.
>
We have COMPATIBLE_HOST. Guess that can be used.
0.9.15 builds fine for arm5. Haven't exained the differences in that file y=
et
Frans


