Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qm8jB-0007Aq-0q
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jul 2011 20:21:05 +0200
Received: by pzk1 with SMTP id 1so3128312pzk.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2011 11:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=cFFbHFyQUQmkaVWHfWcLZQyIIjKv+gQ8effZCu6nNyg=;
	b=WfyRM/g/QavwrxRHC5Rr7no5KYmUnb9zRCNXSCzuqkA3xHQu4wi4cl8CGu226hC5dU
	EqaP7jy1D+TbpdeNqIa0bOySNHHgslEArS9a+s7OHDzrOAAUDBjBVlBTgEPfpTKA+Xa2
	FaDdSWPeyWep8qKfcFgickjgZH2gg//PCFjD4=
Received: by 10.68.28.1 with SMTP id x1mr220645pbg.77.1311790609123; Wed, 27
	Jul 2011 11:16:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.65.130 with HTTP; Wed, 27 Jul 2011 11:16:18 -0700 (PDT)
In-Reply-To: <7B12C7CF8EB6734F9C50A406CD99BED20C7A8403@mail01b>
References: <7B12C7CF8EB6734F9C50A406CD99BED20C7A8403@mail01b>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Jul 2011 11:16:18 -0700
Message-ID: <CAMKF1speXi8LQETPqT+B9gj0UhWsVKNiEx2WfqJoEQs2bvXfsw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: FW: libvpx_0.9.5 fails with parallel make (-j 24)
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
X-List-Received-Date: Wed, 27 Jul 2011 18:21:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 27, 2011 at 3:52 AM, Daniel Sherwood
<Daniel.Sherwood@sepura.com> wrote:
>
>
>
>
> From: Daniel Sherwood
> Sent: 27 July 2011 10:59
> To: 'openembedded-devel@lists.openembedded.org'
> Subject: libvpx_0.9.5 fails with parallel make (-j 24)
>
>
>
> All
>
>
>
> This package fails to build with parallel make as
> libvpx/vp8/encoder/arm/armv5te/boolhuff_armv5te.asm includes
> vpx_vp8_enc_asm_offsets.asm but no dependency is resolved in the
> makefile.

hmmm turn this into some patch.
>
>
>
> I suggest that either the makefile is fixed or PARALLEL_MAKE=3D"" is adde=
d
> to the BB file.

yes this should be last option if nothing else works.
>
>
>
> Daniel Sherwood
> Software Specialist
>
> Sepura plc
>
> 100 Longwater Drive, Green Park, Reading RG2 6GP
>
> T: +44 (0) 1223 694637
> F: +44 (0) 1223 879000
>
> E: daniel.sherwood@sepura.com
> www.sepura.com <http://www.sepura.com>
>
> ________________________________
>
>
>
>
> The information in this email is confidential. It is intended
> solely for the addressee. Access to this email by anyone else
> is unauthorised. If you are not the intended recipient, any
> disclosure, copying, or distribution is prohibited and may be
> unlawful. If you have received this email in error please delete
> it immediately and contact commercial@sepura.com.
>
> Sepura plc. Registered Office: Radio House, St Andrew=E2=80=99s Road, Cam=
bridge, CB4 1GR, England. Registered in England and Wales. Registration Num=
ber 4353801
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


