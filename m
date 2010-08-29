Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Opc00-0001lk-Vu
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 09:08:18 +0200
Received: by mail-iw0-f175.google.com with SMTP id 2so3823880iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 00:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=zr5zEPP74Rg0wfK4GW4+hWrQnHyhi5jaAWlOaPf3lAE=;
	b=DdJh/dV4g8wSYXlhZzIIVBGi4rdglVCqTaPByoKQeCSdwcqsykjiIni74ujgqK+uG3
	UFHpNZbIpSBT4tqAPUeLu9p4mZku4g5/3flGwg3dvFUqEBJ3Ij7O8rjP4ee5/x00mDVy
	sDDel86vU3rHT240F1XibVSmojcN9ssXe8rD0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=bvEXJ4RLGnI7dfu1Fjucj9mNITzEYoDkG/nOQPKfqV2yLa4g79C9cM03TWcm+/t0t5
	FLrl2q+qRBSIy20ZXtWKiD3taOKgEsyCVC3OBnISOyqNpj+8lCG+9MJFpqP3jKZYl1FD
	d1CwJEpEDEX2TT9WOjmod0xf9fEyS0FY3gJtQ=
MIME-Version: 1.0
Received: by 10.231.30.76 with SMTP id t12mr586765ibc.161.1283065668514; Sun,
	29 Aug 2010 00:07:48 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sun, 29 Aug 2010 00:07:48 -0700 (PDT)
In-Reply-To: <1283027073-12308-14-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
	<1283027073-12308-14-git-send-email-raj.khem@gmail.com>
Date: Sun, 29 Aug 2010 09:07:48 +0200
Message-ID: <AANLkTin721m_woZsC-rXz0BHJiPq6MQNR0fasZ-rK6Fo@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 13/23] bt950-cs_0.1.bb: Dont override PACKAGES but append to it.
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
X-List-Received-Date: Sun, 29 Aug 2010 07:08:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

2010/8/28 Khem Raj <raj.khem@gmail.com>:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0recipes/bt950-cs/bt950-cs_0.1.bb | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/bt950-cs/bt950-cs_0.1.bb b/recipes/bt950-cs/bt950-cs=
_0.1.bb
> index ec90c81..09b6281 100644
> --- a/recipes/bt950-cs/bt950-cs_0.1.bb
> +++ b/recipes/bt950-cs/bt950-cs_0.1.bb
> @@ -11,7 +11,7 @@ file://makefile.patch"
>
> =A0S =3D "${WORKDIR}/bt950-${PV}"
>
> -PACKAGES =3D "${PN}-dbg kernel-module-bt950-cs"
> +PACKAGES +=3D "kernel-module-bt950-cs"
> =A0FILES_kernel-module-bt950-cs =3D "/etc/pcmcia/bt950.conf /lib/modules/=
${KERNEL_VERSION}/kernel/drivers/bluetooth/bt950_cs.o"
>
> =A0inherit module
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


