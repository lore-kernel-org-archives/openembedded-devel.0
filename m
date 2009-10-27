Received: from [209.85.223.198] (helo=mail-iw0-f198.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1N2sD1-00054k-9s
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Oct 2009 21:00:02 +0100
Received: by iwn36 with SMTP id 36so59499iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2009 12:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=V+XcvCTTS1U85msUB0eimao7grok+FfE4tOU9toh8RY=;
	b=qiphoeEHrarSjjbaXsQf6OQHRLrBB/7pYsalStMj05wX2Ysl4hXw9+/ljL3/H+irvK
	x8lphrroaQ/DG9E+X14GqSy/uFAPjW5C7cVnIR8mCE55bKeMV6pgQDtXgpbr8VzdamEB
	2hp+nGxmox7kEuzGxY9JaYK/S/kf1+jAMaruc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=BpgVbIY8ezbbtzOjQtG4nqI2qt8HCL0VSjFdMIeEeTq9bZ2Bzdz+C6myuJvclL1tWX
	SJZmEUqOC1olfGGsPFI0W+zmkdFdr2q76E4hoQCwUJZQ9//GLtQ/DX67D/ZSxBU8ZWbc
	T4vEdwkNMOqDeGfMSvX3RVTpYN8VNyGjyuSrs=
MIME-Version: 1.0
Received: by 10.231.29.149 with SMTP id q21mr1146641ibc.35.1256673532664; Tue, 
	27 Oct 2009 12:58:52 -0700 (PDT)
In-Reply-To: <4AE6AE15.4080206@dresearch.de>
References: <1256566659-32412-1-git-send-email-sledz@dresearch.de>
	<4AE6AE15.4080206@dresearch.de>
Date: Tue, 27 Oct 2009 12:58:52 -0700
Message-ID: <19c1b8a90910271258kb65e4b3wf62fb79c09413eef@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.198
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] glibc_2.9: disable parallel make
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
X-List-Received-Date: Tue, 27 Oct 2009 20:00:03 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 27, 2009 at 1:23 AM, Steffen Sledz <sledz@dresearch.de> wrote:
> Steffen Sledz wrote:
>> Parallel make for glibc_2.9.bb fails on different multi-cpu build hosts
>> (e.g. AMD Phenom(tm) 9150e Quad-Core Processor running openSUSE 11.1)
>> with various errors. :(

I would suggest to refrain from applying this patch as it affects
people who do not suffer from this problem
and compile time for glibc is quite huge that everyone will feel the
pinch. I would still urge to
debug the real problem and fix it. May be there is something wrong
with the OS on the box or even in the
parallel build mechanism of glibc.  Or if there is a way to say 'only
disable parallel build when build machine is
"AMD Phenom(tm) 9150e Quad-Core Processor running openSUSE 11.1" would
be ok too.

Thanks

-Khem

>>
>> Signed-off-by: Steffen Sledz <sledz@dresearch.de>
>> ...
>
> BTW: It is the first time i proposed a patch this way and i expected
> to see it in the patchwork queue but it doesn't. :(
>
> Steffen
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


