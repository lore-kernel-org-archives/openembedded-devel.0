Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PIPyl-00070s-CH
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Nov 2010 19:10:06 +0100
Received: by ywg8 with SMTP id 8so91810ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 10:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=/aCONby1Vm+LgsGoOISbfjVLy6OnuGpZM+Nsudw8VlU=;
	b=utPmawqjZ90B2QGdEsREKE0TU6bmQnuV6JE98/ykiDtGgB4Ts76Sq5cLhlk8j3yR39
	qdnRmTA02Dhka+2DXdqrz2ytXn0zSgeKWW2ZboR4B41Rk0wNuFgSPv9wEgHUchuwQDPT
	PS6B/lw1Ud9+JtD6G89+BxxUTKGaHhtjourKA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=S7gtENUrrWxcw4dgIjWvwoufYE94DujJKHkwjGUnFLl1fWeMGUrOcE/ZXNbqvpW+or
	JpLbk5JfEp+WZMS8KLi0B5HpQsWZjwCGClD3R/AcyeSv4741FhsHKLSjrca9cRa60kqP
	hyl+VR3beucrGL/Yjrg+jHHNHUnlCbC3mgRr0=
Received: by 10.91.10.21 with SMTP id n21mr10077734agi.75.1289930936451; Tue,
	16 Nov 2010 10:08:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Tue, 16 Nov 2010 10:08:35 -0800 (PST)
In-Reply-To: <1289780438-9926-1-git-send-email-angelox.123@gmail.com>
References: <angelox.123@gmail.com>
	<1289780438-9926-1-git-send-email-angelox.123@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Nov 2010 10:08:35 -0800
Message-ID: <AANLkTim_mPg9d98xa8by4O5M6GaLQg8iNZRRsaMDwUyd@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] metano.conf: Change eglibc to glibc
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
X-List-Received-Date: Tue, 16 Nov 2010 18:10:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 14, 2010 at 4:20 PM, angelox_123 <angelox.123@gmail.com> wrote:
> * Change eglibc to glibc on Metano's configuration file
>

moving forwards eglibc is being adopted more is there any particular
reason this distro should stick to glibc ?

> Signed-off-by: Angelo S. Mavridis Bartolome <angelox.123@gmail.com>
> ---
> =C2=A0conf/distro/metano.conf | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/conf/distro/metano.conf b/conf/distro/metano.conf
> index 4b47250..934c598 100644
> --- a/conf/distro/metano.conf
> +++ b/conf/distro/metano.conf
> @@ -81,7 +81,7 @@ MACHINE_OVERRIDES +=3D "${MACHINE_CLASS}"
> =C2=A0###################################################################=
##########
> =C2=A0# TOOLCHAIN SELECTION
> =C2=A0###################################################################=
##########
> -LIBC ?=3D "eglibc"
> +LIBC ?=3D "glibc"
> =C2=A0require conf/distro/include/sane-toolchain.inc
> =C2=A0require conf/distro/include/arm-thumb.inc
>
> --
> 1.7.2.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


