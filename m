Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pt1VY-0006Jk-Vy
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 18:31:13 +0100
Received: by fxm8 with SMTP id 8so1801944fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Feb 2011 09:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=8GmvYwkIAPDQnZFId0ENYq/nQRcYEIVEPDswqSIz3cA=;
	b=QxJQ6ieEmb6HUmlZvG8nKLCWJ6OkEDMJnokbX6CidJ9JnlMyHHtRdx2StcNxQ/TXTd
	otQCVDm9JkNcwRBQrwVipNL8+wwiMr2X1QTCc7MoLwdpslnQ2WOi4+dNZ1ZV1FnLcmv9
	njlHrlj2RNt20eT6ARVzIvSMOEcdO265zDyWo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=n0iwkwdsqHgjPTIxBCmDW2fCzVzKQZxGvwjNM9YY2+3klKSfGsjaUFyfuCDtyDkgqh
	mJXkpD8yYQ94mvPOtiwf6xE8ZDyOJQjqJUhsAoqukUYqO8h38OFS+Py3yWHF015IXSr5
	jC0CxwKLs/TsDTULMWNejZ95I30GnfvCHPop8=
Received: by 10.223.96.195 with SMTP id i3mr2987665fan.77.1298654926384; Fri,
	25 Feb 2011 09:28:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Fri, 25 Feb 2011 09:28:23 -0800 (PST)
In-Reply-To: <4D679C54.9060202@opendreambox.org>
References: <4D5A5871.7000005@dresearch.de> <4D5A89CD.803@opendreambox.org>
	<4D5A92BC.1010906@dresearch.de> <4D5E422B.3040703@dresearch.de>
	<AANLkTi=+vnLLOeP2umN3kdK3YzZBgLAwQgAvEKSjqd5f@mail.gmail.com>
	<4D665D92.7000100@dresearch.de> <4D6671C2.7060604@opendreambox.org>
	<4D675D08.6050301@dresearch.de>
	<AANLkTikv_D9xz3MYHwz0=eoJ+Q_p8TsCJC9k2Ps0SBw7@mail.gmail.com>
	<4D679C54.9060202@opendreambox.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Feb 2011 09:28:23 -0800
Message-ID: <AANLkTi=7ZpNFo+7+g4ymwHFRwAWx5PGUqOYRHeGN4XD8@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: linux-libc-headers version (reloaded)
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
X-List-Received-Date: Fri, 25 Feb 2011 17:31:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 25, 2011 at 4:11 AM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> On 02/25/2011 08:51 AM, Khem Raj wrote:
>> Well one way is to have kernel headers per machine which means you can
>> not share target packages anymore since they have to build per machine
>> but it would be much integrated solution and we could generate the
>> kernel headers from the kernel recipe itself so we are sure that the
>> .config of kernel headers match the .config of =C2=A0kernel itself
>> downside is it will defeat the multimachine sharing packages a bit.
>
> The .config does not have any influence on the generated

yes thats right

> linux-libc-headers by definition. linux-libc-headers must not contain
> any CONFIG_* statements, because they are meant to be independent of it.
> The kernel config is not available to linux-libc-headers after all.
>
> The point I was trying to make is that feature detection at compile time
> is impossible, if the feature can be disabled by the kernel config
> (which is the case for epoll and inotify, which in turn were the
> examples discussed on the mailing list in May 2010). You need to do
> runtime tests in programs intended to be portable.

which may not be easy to do for cross compiled packages unless they are pat=
ches
to make this test dynamic

>
> Regards,
> Andreas
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


