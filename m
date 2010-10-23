Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sakoman@gmail.com>) id 1P9k4P-0002wl-U9
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 21:48:04 +0200
Received: by wwb39 with SMTP id 39so1412613wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Oct 2010 12:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Jk3Vdy86nUFxyrBPk7Kndesje9+bMWf6Zr51COK9ccI=;
	b=fljiZrpH673IA82KupsQgfyhwZp3cteUPfcmkErgUzDqvXis7/CY53HBD5BhKwhW1J
	+z4JWt6HPlkYmkwHTVD7ia/80+hOOl6mfp37xoWPc7DdoBcCoWl1dRZ/WY79IFbWSw4f
	1X7Cz7UsAdlg+5iNBc5Kdw3xPasGbVc3CpMH0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ox/ruyYnkaBjpIKIndnenSbIiwAF57glYvgwRj6rsfZhl1N9C+CuBOoa55rTJ7u+AK
	xypbiE4c/z8v4Eq8bzKcTNC1ROB2u6LFLoI2elJH7MzerBKygPStTHdzHm+Dov2mbsxG
	N9ixDMrLEjwkH20Xol19fmLbgI8Jy7yrUaq3M=
MIME-Version: 1.0
Received: by 10.227.156.210 with SMTP id y18mr4551843wbw.63.1287863242214;
	Sat, 23 Oct 2010 12:47:22 -0700 (PDT)
Received: by 10.216.23.13 with HTTP; Sat, 23 Oct 2010 12:47:22 -0700 (PDT)
In-Reply-To: <AANLkTinENJ300R25P65JHJR5wX0jLvd0+TfvSOYKC7+K@mail.gmail.com>
References: <1287848486-14980-1-git-send-email-fransmeulenbroeks@gmail.com>
	<i9v396$cn4$1@dough.gmane.org>
	<AANLkTinENJ300R25P65JHJR5wX0jLvd0+TfvSOYKC7+K@mail.gmail.com>
Date: Sat, 23 Oct 2010 12:47:22 -0700
Message-ID: <AANLkTinR7OQFF7fzSmFnkuN+0y6b3jEV6s3N_OrNqckt@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: sakoman@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] u-boot-sakoman_git.bb: updated SRCREV to head to make it building again
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
X-List-Received-Date: Sat, 23 Oct 2010 19:48:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Oct 23, 2010 at 10:36 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/10/23 Koen Kooi <k.kooi@student.utwente.nl>:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 23-10-10 17:41, Frans Meulenbroeks wrote:
>>> SRCREV was "ccd0c67858c6e2807c695e2c8f545284cb871866", but that is not in the
>>> omap4s-exp branch any more. Guess it was gone after a merge. To make things
>>> building I moved the the head of the branch
>>> SRCREV = "8b931e51f46acffd61096553ae89dfb3ee30d398"
>>
>> That branch is rebased frequently, so this won't help much. The tarball
>> snapshot for the current revision is available on the angstrom source
>> mirror, so if you are using angstrom and a recent bitbake you won't get
>> bothered by the rebasing.
>> Having said all that, we should find a working repo for panda uboot and
>> use that. AIUI denx git should work soon.
>>
>> regards,
>>
>> Koen
>
> Guess that is why it was autorev, but on oct 12 you pinned it to the
> SRCREV that I could not fetch.
> A solution could be to pin on a rev that is a merge with the denx git.
> Not sure what the status is of the panda code in the u-boot git.
> I see quite some patches from Steve (but no idea how much of them are
> accepted/integrated by Wolfgang.

Using the upstream v2010.09 tag should give you a reasonable u-boot.

The exp in my my omap4-exp branch stands for "experimental", so it
probably is not a good place to pull from unless you are willing to
deal with frequent rebases and occasional breakage.

Steve


