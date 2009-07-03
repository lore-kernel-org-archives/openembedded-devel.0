Received: from [209.85.220.207] (helo=mail-fx0-f207.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MMjxy-0004mg-8C
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Jul 2009 16:42:18 +0200
Received: by fxm3 with SMTP id 3so2111704fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Jul 2009 07:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=+cBOj9dhZ0IFZ1E5UUZB+oJxxy8GndmNl6IMgTXxKAc=;
	b=Rbo/LZpvQ8QWM6HuVEqv4aT3tYyKe5ToUG072XD3nyvoYuZ6OBukSlbNn+Zb3ZzmmD
	UXTyE/saxvGHAhBxM7YQeG+HD0eXmoc4W2TFet4a/GID9a+4HUtZ2Ex2T4jY2PPW3Qm0
	8r6cmc1xIkdBNYjqw0FzRpuUTJOLGNhGq1E+s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=kadpYNZuK2yx1JIMInHCSahdYs+fBtiBtTrSmbUbVhsLE+9KNu3XwJ5w5OSPDDk/y7
	nxP6APz9RFeQndBdlpddtqfx2KgH2xDpu3KCs3r8cjY/gRdiBHExtzRsU0h5BaizYZBd
	eq/oMMTc01AZj3afEIr3z4GmFEnBAyOM+6dyg=
MIME-Version: 1.0
Received: by 10.103.233.11 with SMTP id k11mr355282mur.42.1246631408583; Fri, 
	03 Jul 2009 07:30:08 -0700 (PDT)
In-Reply-To: <d1b08f940903291632y1bcad5cam6b6c2cae47855a0f@mail.gmail.com>
References: <1233319034.13141.2.camel@EPBYMINW0568>
	<fce2a370902030302m1054bfc5wc5589ed60418c959@mail.gmail.com>
	<gm99v0$ier$1@ger.gmane.org>
	<fce2a370903030755n133906a3i32a25df5390d537@mail.gmail.com>
	<d1b08f940903291528i4fcd7139rc7d3cee88dd315d5@mail.gmail.com>
	<fce2a370903291558o335ef90bj5ac7e23203f3d7a4@mail.gmail.com>
	<d1b08f940903291611y67a2e1d0pd9dae7800c171dd@mail.gmail.com>
	<d1b08f940903291632y1bcad5cam6b6c2cae47855a0f@mail.gmail.com>
Date: Fri, 3 Jul 2009 17:30:08 +0300
Message-ID: <fce2a370907030730i9ffb505k42be0f8f933b1fab@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Automate uboot entry/load addresses detection.
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
X-List-Received-Date: Fri, 03 Jul 2009 14:42:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Any chance for patch inclusion?

On Mon, Mar 30, 2009 at 2:32 AM, Andrea Adami<andrea.adami@gmail.com> wrote:
> uboot-mkimage -A arm -O linux -T kernel -C none -a 0x800
> 08000 -e 0x80008000 -n "Angstrom/2.6.26/c7x0" -d linux.bin /oe/build/tmp/angstro
> m/deploy/glibc/images/c7x0/uImage-2.6.26-r9-c7x0.bin
>
> Ok, it just works after some cleanings...silly me...
> I'm not a core-dev but I tested it and you get my ack.
>
> Acked-by: Andrea Adami (andrea.adami@gmail.com)
>
> Regards
> Andrea
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


