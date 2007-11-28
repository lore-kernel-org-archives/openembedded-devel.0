Received: from [209.85.134.184] (helo=mu-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <philipp.zabel@gmail.com>) id 1IxOH3-0000Qc-J9
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Nov 2007 15:52:25 +0100
Received: by mu-out-0910.google.com with SMTP id w8so1901176mue
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2007 06:49:28 -0800 (PST)
Received: by 10.82.112.3 with SMTP id k3mr265390buc.1196261368507;
	Wed, 28 Nov 2007 06:49:28 -0800 (PST)
Received: by 10.82.120.17 with HTTP; Wed, 28 Nov 2007 06:49:28 -0800 (PST)
Message-ID: <74d0deb30711280649l7b286342wf37e81eb517a1404@mail.gmail.com>
Date: Wed, 28 Nov 2007 15:49:28 +0100
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <474D707E.2000504@student.utwente.nl>
MIME-Version: 1.0
References: <474D5541.2020107@xora.org.uk>
	<474D707E.2000504@student.utwente.nl>
Cc: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
Subject: Re: [RFC] Fix uImage generation in way compatible with kernel.bbclass
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2007 14:52:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Nov 28, 2007 2:43 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Graeme Gregory schreef:
>
> > I would like to do the attached patch to linux.inc to change uImage
> > generation so it is compatible with the way kernel.bbclass does things.
> >
> > This means the uImage ends up in kernel-image not some random file
> > called uImage but not really a uImage.
> >
> > koen said the do_install_prepend stuff was to work around vendor bugs
> > and is no longer needed in this file.
>
> Looks good, except for these bits of collateral damage:
>
> - -        if test -e arch/${ARCH}/boot/images/uImage ; then
> - -             ln -f arch/${ARCH}/boot/images/uImage
> arch/${ARCH}/boot/uImage
>
> The above is needed for various powerpc/ppc boards, and the below is
> needed for at least blackfin:
>
> - -        if test -e arch/${ARCH}/kernel/vmlinux.lds ; then
> - -             ln -f arch/${ARCH}/kernel/vmlinux.lds
> arch/${ARCH}/boot/vmlinux

The blackfin patches overwrite the kernel linker script with the
binary kernel image?!

> The linux kernel doesn't seem to have a strict policy on image placement
> and various vendor patches aren't exactly helping the situation :/
>
> regards,
>
> Koen
>
> - --
> koen@dominion.kabel.utwente.nl will go go away in december 2007, please
> use k.kooi@student.utwente.nl instead.
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFHTXB+MkyGM64RGpERAnEUAJ9pzhdplIFn1idz+r9u4m7VbT93YgCgjDpk
> VX+OKjBT3o1A03PyurqBI+g=
> =nfJA
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

cheers
Philipp


