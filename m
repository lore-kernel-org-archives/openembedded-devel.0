Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P9DRh-0005UY-LG
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 10:57:57 +0200
Received: by ywa8 with SMTP id 8so504199ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 01:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=DqY+MIs93USArdVaOeDe9cT9G8/gaNTw+A9BFDhfEsM=;
	b=HAfSXHzpAb5Sd2w7Dxdwwr67Zt6nCaCUrxqnz8uk43sMGiikQFb9UJ3oKQqxJE1/AX
	68/+5Wgyg/ZWf0+M7+M0kkRvQt1G88vbeJCEEYtpkJ96aCX0Ym1I65hGm+QEk+ERhk9x
	UHhrqdmM1VmNEJKoHZrxfpLTInCA6fWewy1MA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=SaXnWiAQPgVMFrcEKjuoFndJRznU3HbhU3yJmCSkXOF+O6KgOJN4LYZSrH8Jc9/+RL
	PwtMgAGDggAzTec75lZ6m19QfE0anp8mc72V9lR/9A1Wn2sF7I5os2KZXNHt9r5C0fCm
	oFP1fNB6R6RqBZWPQOBY1cwCFIS13xuQpkpPc=
MIME-Version: 1.0
Received: by 10.42.208.75 with SMTP id gb11mr1770792icb.290.1287737835740;
	Fri, 22 Oct 2010 01:57:15 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Fri, 22 Oct 2010 01:57:15 -0700 (PDT)
In-Reply-To: <1286570255-7554-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1286570255-7554-1-git-send-email-fransmeulenbroeks@gmail.com>
Date: Fri, 22 Oct 2010 10:57:15 +0200
Message-ID: <AANLkTikv3ffmk=OFeeKqzoa1cdmVtx96aDGcZaVz+Ex8@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] module.bbclass: RDEPENDS -> RDEPENDS_${PN}
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
X-List-Received-Date: Fri, 22 Oct 2010 08:58:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

ping

2010/10/8 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
>
> one more place in classes where there is an RDEPENDS i.s.o. RDEPENDS_${PN=
}
> =A0classes/module.bbclass | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/classes/module.bbclass b/classes/module.bbclass
> index 83463ac..0e0018e 100644
> --- a/classes/module.bbclass
> +++ b/classes/module.bbclass
> @@ -1,4 +1,4 @@
> -RDEPENDS +=3D "kernel (${KERNEL_VERSION}) update-modules"
> +RDEPENDS_${PN} +=3D "kernel (${KERNEL_VERSION}) update-modules"
> =A0DEPENDS +=3D "virtual/kernel"
>
> =A0inherit module-base
> --
> 1.6.4.2
>
>


