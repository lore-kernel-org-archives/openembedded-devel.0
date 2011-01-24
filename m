Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PhOc9-0004hC-2v
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 16:45:57 +0100
Received: by iwn8 with SMTP id 8so4597405iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 07:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=/nitTACGqr4vXWGTISj+K8yoorjPLBCcriyMnz4Bt8o=;
	b=Qh+GzcKRaNXLRSyj2BBzCstE/xsXaYKBPGFQjV9vDY2KSpqsGrCrGJGNCBiwttYrxZ
	W2w+in2nBzoImtIrbk6mLeooZRF5WGNCE6ubAZLn0Y2CYf8F33R3DSrJZJ/f+QhGVptX
	sjh10iFsPC0hcfJnukFi/XsFcHpKH+xumDWEo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=Ed1XKB1ap/wa1SpdKlokRcsIB+iWtTesUB3/AnWT58L0VFDzLKLweatgKOU0JJoUUN
	Fk9yZ4WgXCB8EdisnK6wiUm8KvTLCMBd/wysKG82Ate6g4nW4Piz9kcoj2x4dTgYv5NT
	KFvMOx/NUPtQ0npBRXJFNcs+vrIOnVpGFnTXg=
Received: by 10.42.165.71 with SMTP id j7mr4963303icy.474.1295883909974; Mon,
	24 Jan 2011 07:45:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.42.230.71 with HTTP; Mon, 24 Jan 2011 07:44:49 -0800 (PST)
In-Reply-To: <20110124102441.GA3616@jama>
References: <1294832897-3343-1-git-send-email-Martin.Jansa@gmail.com>
	<4D2DF2BA.6040000@gmail.com> <20110113073157.GO3244@jama>
	<4D2FBF32.30402@gmail.com> <20110124102441.GA3616@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Jan 2011 07:44:49 -0800
Message-ID: <AANLkTi=i13B+Y9AiFrdXS8RiVNG97-ZFzfmg1YeKB3He@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] libvpx: force arm mode to be able to link with ffmpeg where arm mode already is forced
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
X-List-Received-Date: Mon, 24 Jan 2011 15:45:57 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 24, 2011 at 2:24 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> only -fPIC and even with added -fno-PIE it still fails here (only with
> binutils-2.21, haven't seen it with 2.20)
>

Hmmm, then it needs some investigation weather its a latent bug that
2.21 uncovered or if its a regression


