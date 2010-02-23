Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1Nk0g6-0004Al-Ak
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 20:44:21 +0100
Received: by fxm20 with SMTP id 20so3888173fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 11:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type; bh=jyQ+qcfwpzDmM/0Eq24/CP7MrQWoJoAziSskKaJz8xU=;
	b=WhBONpGQwaPnGZafK+XDphpoUaCljZ9SaDBrRqV8XLQW1nRn1wIDm89glemqul/Nk0
	xODEactpv0MjM92fSZpGjbye+4qLSdarvoybD62q7LdPUyKybQ/U1xaBn5CvuuZQ6dK6
	hMJFVfayH5UcQqA5VB0RktgVWLagvEATvxlq0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=VTSUDktefsauZYdEd4HDpNMy25hdydCRYgECtsu9IttZPNP6L9kQ+mS87gUQbcmt4F
	3YxYPoWWK31XJyCgUUj9Sdwq0FDeCexi3vnAQ7+udtgwNkzstY2EqDfat91Qw1T3Qoia
	mlNs7KrWinIi52F+Eq3zRFbVLyyg2IUwlNZfU=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.180.19 with SMTP id f19mr5824hbg.35.1266954093537; Tue, 23 
	Feb 2010 11:41:33 -0800 (PST)
In-Reply-To: <1266953000.18176.52.camel@trini-m4400>
References: <be7a9f3d1002231055n5783b939j7d7d75081efdaa2a@mail.gmail.com>
	<1266953000.18176.52.camel@trini-m4400>
Date: Tue, 23 Feb 2010 16:41:33 -0300
X-Google-Sender-Auth: 5b5e7ed591385d5c
Message-ID: <be7a9f3d1002231141y2fde23afn787781d354f5ead@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Kernel image stagging [was Re: [PATCH] kernel.bbclass: Stage the raw zImage and modules tarball for inclusion in pstage
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
X-List-Received-Date: Tue, 23 Feb 2010 19:44:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Tue, Feb 23, 2010 at 4:23 PM, Tom Rini <tom_rini@mentor.com> wrote:

>  In the second case, why do I want to waste space with an image on the
> rootfs that I don't need?  Today, that image goes from deploy dir to
> <however we give stuff to the end user> or right to the device.  I could
> see, however, adding images to a defined place in meta-toolchain so that
> this isn't an issue anymore and we could stop putting raw kernel stuff
> into the deploy directory.
>

I think that a binary fine, copied from the built package, in deploy dir is
wrong by conception. It ought to be puted there as an image, if it is needed
by an image. We could have a class to make it easy, but IMO it ought to be
done at same time the rootfs is built so it uses the same kernel for modules
(that are included into the rootfs) and the binary.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br

