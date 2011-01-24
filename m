Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PhJJo-0006P1-D6
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 11:06:40 +0100
Received: by iwn8 with SMTP id 8so4283994iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 02:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=g8MuSKwArZVmJko8R4fQE/oqDk3oL/FtevdWpKzKOyk=;
	b=nwOPx8qGzbL/kmJJaW6QoKqnux/DTZK7oFyV/1nGDLYFkvEY4ZtQhT2FUBWY8Ogakl
	OKOxvqNOZkvANk+roe1c2FC7AHLsS7sujxXPeic03rhz8M0CosOwhiGj2rr7PShTnFE4
	FZ4eaJkK+UAlOdU4Tgrm4SzIgLgdGgmMhohY8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=U/54esU1TkuP+iCi7HBjyfZr90lcQJCOYE0xUuTWxT+4I25zzBtsyLeNubgm0PpG+K
	NSMU/GdjiLaiiJA+2790kOMEJoPYgpMPv/fOW0b3jlWYR54yeaychHuc5wDUwIzv1oRV
	77E6bG6yzN7+TvQaip6NzISWq2SnwqomLvkoM=
MIME-Version: 1.0
Received: by 10.231.37.12 with SMTP id v12mr4450947ibd.83.1295863153003; Mon,
	24 Jan 2011 01:59:13 -0800 (PST)
Received: by 10.231.36.68 with HTTP; Mon, 24 Jan 2011 01:59:12 -0800 (PST)
In-Reply-To: <ihjhd3$n1e$1@dough.gmane.org>
References: <1295834629-3974-1-git-send-email-raj.khem@gmail.com>
	<ihjf6u$c5u$1@dough.gmane.org>
	<AANLkTin6h0bLj=s=ngGQrJMEQx2PBfK3hbm54nsmXari@mail.gmail.com>
	<ihjhd3$n1e$1@dough.gmane.org>
Date: Mon, 24 Jan 2011 10:59:12 +0100
Message-ID: <AANLkTikqMQ8_xZZUjrm3Cu2GVJ5COM0u5PFuGAvyst+2@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] angstrom-2010.x.conf: Prefer binutils 2.21 and uclibc-git
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
X-List-Received-Date: Mon, 24 Jan 2011 10:06:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/1/24 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 24-01-11 10:15, Khem Raj wrote:
>> On Mon, Jan 24, 2011 at 1:02 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>> On 24-01-11 03:03, Khem Raj wrote:
>>>>> * no need to pin older udev with uclibc/git either
>>>>>
>>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>
>> NAK! binutils 2.21 introduces way too many problem at this moment, those
>> need to get solved before switching to it.
>>
>>> hmmm. Too vague a statement. Do you have list of issues somewhere I can look at
>>> it built the console-image x11-image images I tried and booted
>>> console-image too.
>
> Try building anything that uses linux-omap-psp 2.6.32. You will run into
> the secure mode problem. That one is relatively easy to solve, but it
> needs to get solved *before* the switch, not after.
>
> But besided that, so a change needs to get RFC'd, tested and signed off
> by the angstrom maintainers before it gets pushed. It's a toolchain
> change and we take toolchains seriously.
>
> Waking up and seeing it applied without all that is *extremely*
> insulting. So I reverted it.
>

Pushing distro changes without review is against the policy:

From http://www.openembedded.org/index.php/Commit_Policy:

 * Distro config changes should be reviewed by the distro maintainers
   where known

Reveting changes from others is also against the policy:

http://www.openembedded.org/index.php/Revert_Policy

(and imho equally bad (or insulting if you prefer))


Do unto others as you would have them do unto you

My two eurocents. Frans.


