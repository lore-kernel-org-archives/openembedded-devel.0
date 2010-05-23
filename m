Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OGIG4-0007XN-MC
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 May 2010 22:58:54 +0200
Received: by iwn2 with SMTP id 2so2634824iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 May 2010 13:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=dDwvsQ4nGFU1P3yskxh/KpISnf2g2s0siZThNeMO8RM=;
	b=w2IP9BfrADxQufo8RTblxB+j2CmciBbPS+X3DIMoGaoyr2YH3/Vs/003VV2df+eq/B
	1shhOPM693KPUfmfGoXEY7G4tyONFdek1IyKOGEqY0t6kdo7SZWkJr219oWW2eLJDB9f
	JSC4AEFhEzzb9ADrY+MlYhdXyRvPFM/aRkmt8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=wWawERy+TkstL819WUN5oUI/HHPP6tXvxhaDMZSOM+b0z77VA/IMGUOX/rQrMOuCzx
	99nfFlJzQLEZthOmX0jr9emvQhpJ2zM6CbycJHLk64vHms8M30lHYqbr/F8mQa1KGp/f
	NhNR8MIAKt3uGnNb3e4ZTd8JMJTpWyVeN1dwA=
MIME-Version: 1.0
Received: by 10.231.185.86 with SMTP id cn22mr3227550ibb.69.1274648088444; 
	Sun, 23 May 2010 13:54:48 -0700 (PDT)
Received: by 10.231.30.67 with HTTP; Sun, 23 May 2010 13:54:48 -0700 (PDT)
In-Reply-To: <AANLkTin1nyU7-QCJ8LOpk_xXXToOaT79Nao-s5Z0L37i@mail.gmail.com>
References: <AANLkTimqsLv69OOmckplXCqoIZbybtIwjTVBAC-Uax4Q@mail.gmail.com>
	<AANLkTimzxtQko6-MOSAhVLlC4rGFakVOC76zDh091D14@mail.gmail.com>
	<AANLkTin1nyU7-QCJ8LOpk_xXXToOaT79Nao-s5Z0L37i@mail.gmail.com>
Date: Sun, 23 May 2010 13:54:48 -0700
Message-ID: <AANLkTimAmsnKHJEeWnfV2dLUqN2iv_C_7BzvAriB01Tn@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Angstrom distro, qemu: uncaught target signal 4 (Illegal instruction) - core dumped on glibc package
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
X-List-Received-Date: Sun, 23 May 2010 20:58:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, May 23, 2010 at 10:20 AM, Grzegorz Toporek
<top.grzechu@gmail.com> wrote:
> 2010/5/23 Khem Raj <raj.khem@gmail.com>
>
>> On Sun, May 23, 2010 at 3:17 AM, Grzegorz Toporek <top.grzechu@gmail.com>
>> wrote:
>> > Hi all,
>> >
>> > thank you for all your suggestions and help. I started to build angstrom
>> > distro as you recommended.
>> >
>> > Unfortunately, I got this error while building glibc package:
>> > qemu: uncaught target signal 4 (Illegal instruction) - core dumped
>> >
>> > I found this tread which says that gemu doesn't support iwmmxt...but how
>> to
>> > deal with this? Is there a patch needed? Where to find it?
>> > http://ibot.rikers.org/%23oe/20060827.html.gz
>> >
>> > I use tune-iwmmxt.inc file with my machine.
>> >
>> > Please help me with it.
>> >
>>
>> I have pushed a fix to qemu recipe to .dev, if you are not using qemu
>> built with OE then
>> you have to use it to get this fix. IOW if you have qemu-native in your
>> list of
>> ASSUME_PROVIDED list then remove it from there.
>>
>> Thanks
>>
>> -Khem
>>
>
> Thank you very much. However it doesn't solve my problem. I still have this
> error wit a few additional lines:
>
> NOTE: generating locale es_NI (UTF-8)
> Internal resource leak before 4011435c
> Internal resource leak before 40114384
> Internal resource leak before 40114384
> Internal resource leak before 40114624
> Internal resource leak before 40114624
> Internal resource leak before 40114658
> qemu: uncaught target signal 4 (Illegal instruction) - core dumped

if it recompiled qemu-native after pull and you still see the core dump
then the qemu bug is not fixed fully problem might have to be debugged

>
> Maybe I didn't understand you well. I update my recipes by "git pull" and
> checked if ASSUME_PROVIDED variable is not set. It wasn't...I have checked
> qemu_0.12.4.bb recipe and SRC_URI contains new patch.
>
> What do you mean "qemu built with OE"?
>
> Sorry for my little knowledge of OE and bitbake.
>
>
> Kind Regards,
> Grzegorz
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


