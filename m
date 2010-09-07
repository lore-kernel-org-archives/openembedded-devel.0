Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OsrC3-0003EZ-W8
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 07:58:08 +0200
Received: by iwn2 with SMTP id 2so4908205iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 22:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=GMQousZfy88VOMQ2XL3YjmloCiurSTqg1Q72q1pWzVQ=;
	b=VXIq1dAK4unX0yhU1lUeqM4uHl5Pk1sBgO+GopYPwwsPIA6z2iYTeFRx1tNa2uBTSB
	EJhX+E/8m5UiQ1oTbthLIMF5BKFq/TvHOQkjaB4JHOcKWt0Je72sM7r1kDi03E6z3cnw
	GWKwaw7L5eklwtJcQ7K8F1oaLRY9HwEduPyVQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=SfJXOyTDEmsaVGDg/42y9JJG1ZDXcrdRpkokLOEYHp2M6WEucDFL1vw8exB1QqPBIt
	zyixNWBcJH2kNuAU5qt4yrDWQKNDWno1ayPX9DKnkKw3euZQ6RdylOP9jdrkte30FtID
	shzyfkSM335lclKoubOcBZdR7T7UkGgeaOG0k=
Received: by 10.231.37.10 with SMTP id v10mr7371969ibd.188.1283839048372; Mon,
	06 Sep 2010 22:57:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.205.134 with HTTP; Mon, 6 Sep 2010 22:57:08 -0700 (PDT)
In-Reply-To: <AANLkTikC4v+QEpYsos2=f4wtEUUCt8Q=VK9ByT56pn-L@mail.gmail.com>
References: <AANLkTikC4v+QEpYsos2=f4wtEUUCt8Q=VK9ByT56pn-L@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Sep 2010 22:57:08 -0700
Message-ID: <AANLkTinGsnbP++GV+sLj3Q0g5R1HHHkq7NtBVWrhSmzh@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
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
X-List-Received-Date: Tue, 07 Sep 2010 05:58:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 5, 2010 at 2:10 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> I have an issue with pulseaudio:
>
> | =A0 CC =A0 =A0 libpulsecore_0.9.21_la-svolume_arm.lo
> | pulsecore/svolume_arm.c: In function 'pa_volume_s16ne_arm':
> | pulsecore/svolume_arm.c:53: error: can't find a register in class
> 'LO_REGS' while reloading 'asm'
> | pulsecore/svolume_arm.c:53: error: 'asm' operand has impossible constra=
ints
> | make[3]: *** [libpulsecore_0.9.21_la-svolume_arm.lo] Error 1
>
> From searching the irc log this is a longer standing issue.
> Is there any suggested solution for this.
> If I understand corrrectly it affects all our armv4 and armv5 machines.
>

well its not arm v4 or v5 but its thumb. If you use arm instruction
set then it would
work. set ARM_INSTRUCTION_SET =3D "arm" in the recipe and retry.

> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


