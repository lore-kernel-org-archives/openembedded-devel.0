Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PuV41-00074J-Hg
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 20:16:53 +0100
Received: by bwz10 with SMTP id 10so4858749bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Mar 2011 11:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=Blobl1rTqaqUSNrFsYGrJwzc/pDg11mM9jkKt8YP4+I=;
	b=H1lw4yDR/rj1pDM86Ly3derUEHBNcYXhaAJhdymSlj/EVWttGKCHJ0/Dz8Gr6X9B3e
	ABJ85Ncj+rIJdML5YKVRCfZy4mBXTFChJYu5SC2T1yhJwOVLE/1h5GUDlVGfky4kktyf
	AqxKLmiG2GMXBtxgKT+Xk3MaBqPuHZsqhIBPs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=CsVwHrl6U1cByoVxDyMUcCiXE0ZG8cTSpXEi77dUQKHGxa20TCjCb4yQzNF7zxBCpx
	IyJRDS7xQGJtOv2IA2KhwGoMjTRe8A7av89bl31/XFzxLliVdXq+3vqGIJ2KnTbwJnog
	lHn/yqEDZZBowOFAHNOrNxs2cCVspiHI7Uiow=
Received: by 10.204.17.8 with SMTP id q8mr3282507bka.138.1299006927128; Tue,
	01 Mar 2011 11:15:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.204.49.207 with HTTP; Tue, 1 Mar 2011 11:14:59 -0800 (PST)
In-Reply-To: <4D6D3B0E.9030309@mentor.com>
References: <1298970609-4974-1-git-send-email-Martin.Jansa@gmail.com>
	<4D6D19AD.5010505@mentor.com>
	<AANLkTinXnoSaJDqBSMHp2V0xA1Wbku1ktx3UKh37KV8=@mail.gmail.com>
	<4D6D2F3F.7060403@mentor.com>
	<AANLkTik7Cm2P6KL5aRDVf4sOUGsnAbpACyS+PucRpHiX@mail.gmail.com>
	<4D6D32B9.9080708@mentor.com> <1299003013.23547.118.camel@phil-desktop>
	<4D6D3B0E.9030309@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Mar 2011 11:14:59 -0800
Message-ID: <AANLkTim2CcNy4f_mXGmyeJ9yTfSsXnMFgZTMM6g8sOQ=@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] sane-toolchain-*: add -g to FULL_OPTIMIZATION to make -dbg packages more usefull
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
X-List-Received-Date: Tue, 01 Mar 2011 19:16:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 1, 2011 at 10:29 AM, Tom Rini <tom_rini@mentor.com> wrote:
> On 03/01/2011 11:10 AM, Phil Blundell wrote:
>>
>> On Tue, 2011-03-01 at 10:54 -0700, Tom Rini wrote:
>>>
>>> That's why I'm asking for the -g part to be put into a variable so that
>>> it can be overriden easily, in all cases, without needing to know the
>>> special cases (ie glibc).
>>
>> Why is glibc special anyway (or, why is the optimization in a
>> libc-specific conf file)? =C2=A0It seems a bit bogus that the choice of =
your
>> C library would be having such a global impact on the compiler flags for
>> everything else.
>
> There is some odd papering over that's going on to switch out a flag or t=
wo
> (and force -O2) for glibc (but not eglibc). =C2=A0But my point is that to=
day we
> have a few special case FULL_OPTIMIZATION_pn-'s and it'd be great to just
> not have to worry about that when setting the debug level we build with.
>

May be debugability can be expressed via another variable say
DEBUG_FLAGS or somesuch which can then we appended to global CFLAGS

> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


