Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1Lo4WJ-0003rt-1L
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Mar 2009 01:34:27 +0200
Received: by fxm20 with SMTP id 20so1662433fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Mar 2009 16:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=jjPml8UjueSxFDN+6OHXwu939tse55iVmvikDQuZckY=;
	b=W3TWoGK2zse7mANaPPSynME9jHumu29UucjGpIFVgqIqMlnqqnbb7cXgpduuLPaUlT
	gY7CgcD0J12GU705psFBrd5xsvbVSuuDFSCkG5/MUsUAj5gMTNH+6/vrVeijTHAajYuk
	i2qWUDXfS5v4ZyEUS2vYPHB+zgyFpv5UWxmYw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=S5HQQ5EKQHHIB2D0AOIsyIM5N5PeJ/VxKcYLa/2bu7STh3BuFB+Orq0eTbu0dHiWKD
	lPn/Ke570PJ2+zXVAQFrYGLal+x5OitToJcTmPe/NUz71YzEaIou0oOQTufdjwrABgwV
	70gSkq7i7noGdP/aw6tjchk/hDQGXaKmA3mY4=
MIME-Version: 1.0
Received: by 10.223.126.1 with SMTP id a1mr3450732fas.52.1238369542390; Sun, 
	29 Mar 2009 16:32:22 -0700 (PDT)
In-Reply-To: <d1b08f940903291611y67a2e1d0pd9dae7800c171dd@mail.gmail.com>
References: <1233319034.13141.2.camel@EPBYMINW0568>
	<fce2a370902030302m1054bfc5wc5589ed60418c959@mail.gmail.com>
	<gm99v0$ier$1@ger.gmane.org>
	<fce2a370903030755n133906a3i32a25df5390d537@mail.gmail.com>
	<d1b08f940903291528i4fcd7139rc7d3cee88dd315d5@mail.gmail.com>
	<fce2a370903291558o335ef90bj5ac7e23203f3d7a4@mail.gmail.com>
	<d1b08f940903291611y67a2e1d0pd9dae7800c171dd@mail.gmail.com>
Date: Mon, 30 Mar 2009 01:32:22 +0200
Message-ID: <d1b08f940903291632y1bcad5cam6b6c2cae47855a0f@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
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
X-List-Received-Date: Sun, 29 Mar 2009 23:34:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

uboot-mkimage -A arm -O linux -T kernel -C none -a 0x800
08000 -e 0x80008000 -n "Angstrom/2.6.26/c7x0" -d linux.bin /oe/build/tmp/angstro
m/deploy/glibc/images/c7x0/uImage-2.6.26-r9-c7x0.bin

Ok, it just works after some cleanings...silly me...
I'm not a core-dev but I tested it and you get my ack.

Acked-by: Andrea Adami (andrea.adami@gmail.com)

Regards
Andrea


