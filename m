Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 33B23788AA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 22:11:43 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id h127so9572881lfg.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2018 14:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2wQClyRGwVF3UontM3+FEYNGfxNfSkpZTVILJOHJmmE=;
	b=N9tkwXsn/rN736jaOMVxqcT5WHbKA9Ul0k3EplwTQRIRErQSMYckvrjniUV/Ne6pij
	j3QBYQVOrXe/D1nL5OcrkK6b090qGSsc2HBTRVosoEuHC5zkGxYVID2Advv5KtbTpcsM
	d8LpPTAjUWSLjmfanlQxDleguaqtwpFDvffeGa2HlNFlTgVPrvABfFmjbZc7IWiCHXcC
	4UKmTO7FcW1Wj1/uN1OThAudC3w56QSV13s+AA4Z0gxDigqi/RfHUj/XiyEwsOF8+jqr
	fQttYHPeTQB8Z0vFhoQykc14WT/58VleIHYxNbKCM3d9o8W/8gXjlEToN2XWiSuGy3C8
	a9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2wQClyRGwVF3UontM3+FEYNGfxNfSkpZTVILJOHJmmE=;
	b=umuvbLTxHNhxaOR0vJD64Bay6xilB2qNVyAaprx0FJemvssEW6Lz/X6xEe/reISWAV
	WfUlIPEQ5DT2J1wuf37DExcw5g/6oZ+MqJQX6JgbHb/eoKUlaQ1EQfbGsFykOcLRu1Ms
	c4qahKDB41eVsa3sJQ5PeqEe0hINzM//7TZtLXBwZjFtE07ttOlThxTLSJl80A4/BxR0
	ftWwVC26DHIIn98TxRxVeByGdrJ43zyRfccIQQ4bd5oIz1kqyGER8nxjS1g+aFtKaSus
	k9NOZsf+QmxluZ9RQsnNca9iUeE4GzjIBgd7wDax1XJ2/bMTMvkCmVK72KbzL0S523RM
	RGRw==
X-Gm-Message-State: APf1xPDV0N1B+uVjJgyt90NsjR0/4p/dxZMx9iw7OsnLBMCBgn58rOUV
	REZ58Q22AhWJDqLPdMEt8fDZ2fUKk2lSpSShWdQ=
X-Google-Smtp-Source: AG47ELu4O3ns5Gfje+RR6m7HgQjcn4iMVt3giQlFm2FNEu4jIgMi99RUNvySNFjG2WTzDpvZDFMRFmB/LxgXyzgxg7g=
X-Received: by 10.46.17.220 with SMTP id 89mr2359416ljr.87.1519942304659; Thu,
	01 Mar 2018 14:11:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.48.4 with HTTP; Thu, 1 Mar 2018 14:11:43 -0800 (PST)
In-Reply-To: <da663886-ec79-fea4-3b44-7d5f03658945@gmail.com>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<17c4a7f6-c188-1a8c-2371-74ec67ebfdac@linux.intel.com>
	<1d48c1f1-8b2d-2f8d-ff23-31890aeadbcc@gmail.com>
	<5542c5ec-fbbc-694a-3183-98bc78b12702@linux.intel.com>
	<da663886-ec79-fea4-3b44-7d5f03658945@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 1 Mar 2018 17:11:43 -0500
Message-ID: <CADkTA4M57xk9zq+qzs0oSNhMBqHmte+pR7yTbpEsGACN6GA4Mw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Splitting meta-oe?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Mar 2018 22:11:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 1, 2018 at 1:44 PM, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 03/01/2018 01:04 AM, Alexander Kanavin wrote:
>> On 03/01/2018 03:17 AM, akuster808 wrote:
>>> We had/have a situation with the Yocto 4.12 kernel that broke wireguard
>>> in meta-networking. Their are two patches that don't exist in K.O. which
>>> are causing the problem.
>>> Meta-openembedded can't fix that, do I blacklist wireguard? Wireguard
>>> builds fine with K.O 4.12.
>>
>> I'm not sure what is K.O.,
> Kernel.org. Upstream linux-4.12.y branch in this case.
>
>> but if the breakage can be resolved by changing things in oe-core,
>> then by all means do let us know.
>
> These two commits introduced an ABI change.
>
> http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-4.12/commit/include/linux/random.h?h=standard/base&id=6e4990d8d226e1861a5a2b632cf93bc70feab3af
> http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-4.12/commit/include/linux/random.h?h=standard/base&id=20543a488913755be70f54be52b32f727e8179d8
>
> This makes linux-kernel_4.12 different than linux 4.12.y.

To be clear, the work that PaulG is doing is the korg 4.12.y. He's
doing -stable off the end of where Greg EOL'd it, so it doesn't differ
.. it continues on from where the other left off.

Those commits are from the 4.x -stable queue from Greg's other
kernels, so they are consistent with the other stable trees and
mainline kernel.

But yah, if you have questions on the process, email Paul, cc' the
linux-yocto list and it can get sorted out. Paul documents everything
he does in a patch queue, a tree and in his pull requests, so the info
is all floating around.

Cheers,

Bruce

>
> - Armin
>>
>> Alex
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

