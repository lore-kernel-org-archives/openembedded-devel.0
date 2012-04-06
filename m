Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SGApk-0005Vl-OP
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Apr 2012 17:12:16 +0200
Received: by qao25 with SMTP id 25so429774qao.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Apr 2012 08:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=ocSE0IIHslo2xyzcn+86oKqlNZNsyFQRgZxFDsxRgiU=;
	b=vWYUgsg+q4vzeaCmlmDovXvIaFeTJgcFaxtuqFomBBM0Ngf28wCSpW1GDgfxDdAYeT
	qUd6VuTj7pRjcLxu87CrBU+nbBghHdsWYuNgaGbPcCsG6yol5O2WKpkz+q31K3blml5T
	N/4K4YndYEFq/EDa0In5XGinrhzk9E5NH3wrUIaSo/YaIBz7ze/8zzHC+qvxBW55Vf+P
	qIM8aUxV5aTT2Ga4nNjVFGfftJbmsavcJjK+PAJ9a36O8WZ9XUsqedGi3TeiMEfthoQu
	A46ZCcfuaNR+jZ18YfLEfitLSVQ3QL2P9PpwqAcBAuWUCzBR+OV5qO6uUXwFZ0a/oCnm
	JtDA==
Received: by 10.224.111.5 with SMTP id q5mr9628100qap.41.1333724583353; Fri,
	06 Apr 2012 08:03:03 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.79.79 with HTTP; Fri, 6 Apr 2012 08:02:41 -0700 (PDT)
In-Reply-To: <20120406091243.1f1969d2@eb-e6520>
References: <20120404091720.4b743c5b@eb-e6520> <jli1uf$7nt$1@dough.gmane.org>
	<CABcZANngH2BSmSdBPkaPyJcG1RFuKLxc9DnJWhe7_b9xcSGjxA@mail.gmail.com>
	<jllb47$64q$1@dough.gmane.org> <20120406091243.1f1969d2@eb-e6520>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 6 Apr 2012 08:02:41 -0700
X-Google-Sender-Auth: nazKLes5SJWjUXOjCU0y7BG4LJE
Message-ID: <CABcZANnkYkLQEtpem_-eHskm9VzECkKodZBHyJOwuReoA4DY-A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: build meta-oe without systemd
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
X-List-Received-Date: Fri, 06 Apr 2012 15:12:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 6, 2012 at 12:12 AM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> Le Thu, 05 Apr 2012 16:50:32 -0700,
> Koen Kooi <koen@dominion.thruhere.net> a =C3=A9crit :
>> I would appreciate people sending decent bugreports to the list, because=
 it
>> is *NOT* supposed to break this way. The breakage needs to get fixed bef=
ore
>> we merge it into oe-core.
>>
> to reproduce the problem I met, simply add to a conf file :
> PREFERRED_VERSION_udev =3D "164"
>
> and using oe-core + meta-oe try to build anything which has "inherit
> systemd" (even if in the end you don't install the corresponding
> ${PN}-systemd in the target's rootfs) : systemd's configure will fail
> because it requires a more recent udev.

In addition, for me, at least in the past, I hit an issue where
systemd sucks in x11 bits, which means any DISTRO lacking the 'x11'
distro feature fails miserably at even building busybox.
--=20
Christopher Larson


