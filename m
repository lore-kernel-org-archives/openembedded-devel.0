Received: from [74.125.44.158] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LmKH5-0006Z3-Qv
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Mar 2009 04:59:31 +0100
Received: by yx-out-1718.google.com with SMTP id 3so2015319yxi.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2009 20:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=2bBz0rkqRIVU2d+PkmZ4FxwGj1t7UFq4Kc1CVuS9sEA=;
	b=WuviV8LIts685DBuvaOU5Y+E1uxhHPXk+GUNe7vlTLrmwfKgxFymDFgSJjnTp5AR6r
	SoiHk7usiNSRduU+SH2E3oqsaajeQF3ZTk7wrbJ6nT/LoLckepW5VZuhCQBE6zVFnG6G
	W7SIK7aOo4iGJ2LD1jP9pqWWjCXkiArwRPpSM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=xeVZkGcgfR63ol0FM9uWY4LBIqTHLHTowUbloKzKVq3zilZmTCFrDuFd3YpVwAgbGf
	PWpVVcHA3co678hwKjiMuqHluozkkvvD8/HgnhZ31UkXMh1Ab4rWZIM0Gd9ECyZsk4Av
	2NsRe/TdtxFhvnMxsa9dW7qeGdQQlGY/FAt6k=
MIME-Version: 1.0
Received: by 10.100.251.14 with SMTP id y14mr1610083anh.35.1237953478070; Tue, 
	24 Mar 2009 20:57:58 -0700 (PDT)
In-Reply-To: <20090324233009.GC9461@fh-wedel.de>
References: <20090324233009.GC9461@fh-wedel.de>
Date: Tue, 24 Mar 2009 20:57:58 -0700
Message-ID: <19c1b8a90903242057v4873c28if94f14f5631ecd6d@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Strange name for cross binutils binaries
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
X-List-Received-Date: Wed, 25 Mar 2009 03:59:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2009 at 4:30 PM, Martin Dietze <di@fh-wedel.de> wrote:
> Hi,
>
> =C2=A0just trying another build of OE for nylon/mtx-1 (which is
> TARGET_ARCH "mipsel"). Compiling gcc-cross fails with this
> message:
>
> | make[2]: mipsel-linux-ar: Command not found
>
> Looking at tmp/cross, I find that the cross ar got installed
> under this name: tmp/cross/mipsel/bin/mipsel-linux-mipsel-linux-ar
>
> This does not seem right, or is there anything which I need to
> adapt due to global bbclass/configuration changes?

Well nylon distro is using quite old tools and I dont think anybody
has been using
gcc 3.3 binutils 2.14 and glibc 2.3.3 combo.

Thats your problem. Now if you can help in testing this distro I can
certainly put new toolchain in
but that could mean more changes.


>
> Cheers,
>
> Martin
>
> --
> ----------- / http://herbert.the-little-red-haired-girl.org / -----------=
--
> =3D+=3D
> * Free Speech Online!!! Support the Blue Ribbon Campaign! *
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


