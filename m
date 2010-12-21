Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PUv7W-0001Qn-Qt
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 06:50:46 +0100
Received: by yxd5 with SMTP id 5so1691802yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Dec 2010 21:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=9W7F7gxYLQzUEMwad1ge2UlVFclTztIfbXkyCDkDH58=;
	b=kmfgaqLJAR6knLo08Y62H5hE9UCqw5W5ffdTIV/Jxdc9jC9SXOg/DhPaIc03jyjNYF
	/SdAMWqoQz85h834At+umfEVlX1zGitCc/YzgRu1tJrK8bWP+ugiIezCCPqrhLOfBIMC
	5PTfDfYamRjGllRInIWPfM1DJO4q9EQSq7NRM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=XfxRGC6zGE9hfZYzSBfbgNmHCQK3hGSNtkueyjA74aAx2ceKRQ3kY738utOK/n0J7G
	b5CpjRwUQfL+ugvtybPHgiNaMvGbVzUW83MdQ76yrF24F+L82OS1mkZnNLAdkN+vbWjM
	S10Wu1ozfyjGCHpvv29AQHftBA171oOf2rlXQ=
Received: by 10.90.80.18 with SMTP id d18mr6538916agb.31.1292910639754; Mon,
	20 Dec 2010 21:50:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Mon, 20 Dec 2010 21:50:19 -0800 (PST)
In-Reply-To: <4D10315D.5020707@gmail.com>
References: <4D10315D.5020707@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Dec 2010 21:50:19 -0800
Message-ID: <AANLkTin8Fk1Zs3U-s_SAHrHOCn+NW2j=utt0J5OYtbKb@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: uclibc - which virtual/libintl?
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
X-List-Received-Date: Tue, 21 Dec 2010 05:50:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 20, 2010 at 8:47 PM, Graham Gower <graham.gower@gmail.com> wrot=
e:
>
> grg@eye7:/mnt/oe/openembedded$ grep virtual/libintl conf/distro/include/*=
uclibc.inc
> conf/distro/include/sane-toolchain-uclibc.inc:PREFERRED_PROVIDER_virtual/=
libintl =C2=A0 =C2=A0 =C2=A0=3D "proxy-libintl"
> conf/distro/include/uclibc.inc:PREFERRED_PROVIDER_virtual/libintl ?=3D "g=
ettext"
> conf/distro/include/uclibc.inc:PREFERRED_PROVIDER_virtual/libintl_avr32 =
=3D "proxy-libintl"
>
> Is there any pressing reason to use one over the other?
>

Well usually when using uclibc based system full gettext may be an overkill

> -Graham
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


