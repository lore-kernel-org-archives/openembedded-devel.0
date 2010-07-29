Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OeXIg-00032i-OB
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 19:53:48 +0200
Received: by ywe9 with SMTP id 9so217294ywe.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jul 2010 10:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=NqhT/um4qod7ZNMdQ47ttFd+jve8OnNYtYDRXUrYpJk=;
	b=M13vdkBf4MWLsHsBuKQH74VZcXO/vywnso1tdqqsBB1lpklHo/3WKfle8Bn+oINCk3
	Te608enu6q/5PomUwbBIEbMvvU92Yr9L7Sm+Nueie/i+Z0LMh3000EAnUUlrBcw7HO+Z
	OaO89vIHyJEHiF78EdZGK2l1H6SDMIHq6Irvw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=GUTr50KTT98TocqWESzDjUmwMGFRmVn59g5KGn0fPHsAydfQq61DeuCUFbftIsCPeD
	IMiri2wXw9R0P2hXmKrZkQZY24KNhhX6rBdZE/PES9ZpL07ryNpTUHp8pQFCThUH9sXA
	prsWPKGLBh+39IBfIvk9ky+4dTgVd1oqTw0kY=
Received: by 10.101.185.37 with SMTP id m37mr607035anp.0.1280426006261; Thu, 
	29 Jul 2010 10:53:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.186.88 with HTTP; Thu, 29 Jul 2010 10:53:06 -0700 (PDT)
In-Reply-To: <i2selm$mrf$2@dough.gmane.org>
References: <1280213315-5513-1-git-send-email-raj.khem@gmail.com> 
	<i2selm$mrf$2@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 Jul 2010 10:53:06 -0700
Message-ID: <AANLkTikdeZiuVt_gsrmWz1ePf5CLSBp1ZQU+=mGAj0id@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/8][v3] Make multi-machine toolchains to co-exist (revised again)
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
X-List-Received-Date: Thu, 29 Jul 2010 17:53:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jul 29, 2010 at 10:44 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 27-07-10 08:48, Khem Raj wrote:
>> Hi
>>
>> Following series of patches are for making multi-machine toolchains co-exist with
>> new cross staging for toolchain.
>>
>> It changes the toolchain triplet from ${TARGET_ARCH}-${VENDOR}-${OS} to
>> ${TARGET_ARCH}-${CPU_SUB_TARGET}_${VENDOR}-OS
>>
>> which means that a toolchain for armv7 is called arm-v7a_oe-linux-gnueabi-*
>> and for armv5te its called arm-v5te_oe-linux-gnueabi-*
>>
>> They can coexist in same native sysroot. The symlinks would mean that
>> gcc will not accidently mix the assemblers or linkers.
>>
>> MULTIMACH-* is not needed anymore as the TARGET_SYS is distinct enough
>> to serve same purpose.
>>
>> I have booted a minimal-image on qemuarm qemuppc and qemumips successfully. The build for
>> beagleboard native-sdk-image completed too.
>
> So what's the status on this? The problem is still present in .dev, this
> patchset introduces other problems and Phil & Richard want to take a
> different approach.
> Were do we go from here? I'd love to help out if I knew which approach
> is the right one. I'm not fond of abusing TARGET_VENDOR, but if the
> consensus is that's the way forward, so be it.

Yes I am not pursuing it as it does not seem to be a popular approach.
We could walk the remaining issues but we have to agree on it and then
fix the fallouts.

>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMUb31MkyGM64RGpERAtchAKCiNdy7Nbts/5fxA/wrUbrwZgpZRQCfcCcf
> kcCkAByszubSkNi1H/ExBnU=
> =UFfn
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


