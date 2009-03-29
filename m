Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1Lo4Bs-0006WD-Hr
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Mar 2009 01:13:20 +0200
Received: by fxm20 with SMTP id 20so1659606fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Mar 2009 16:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=2YZMEpvij1vibznF6QHt84KPf1wRikITCepfeK4Z9+k=;
	b=aTkQlh+0ZZTeydFhrHbtfOUotIa6dV9XzFe0WwWFSTKaiJK2YQaF763yXqtzP5Nv5g
	fsMn1mGXLxaHstYM24JprmFaKfJ8AjjWxBXipQVbuycRZVJC4WEWERTD6aS2KU9a4P8A
	UlF3YVvE/eM5pXQncARYv3LY198ojEu55Zr+g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=l32tIw9Kd012akXeF1vWI2jI1QugeT+FusxW7US0hIErnaIjJ7YlGgrzYtBWn7w7cw
	ch5ERmPZaWG3ZCStsqmnvS1Va43lf5vxem8oiWBUoYFEx90c15QxVS+202K5deNwZ9eY
	7w4BWYbpOK5bBu7vCtJXNyMvKoE29rOYD37h0=
MIME-Version: 1.0
Received: by 10.223.108.74 with SMTP id e10mr3449628fap.35.1238368276041; Sun, 
	29 Mar 2009 16:11:16 -0700 (PDT)
In-Reply-To: <fce2a370903291558o335ef90bj5ac7e23203f3d7a4@mail.gmail.com>
References: <1233319034.13141.2.camel@EPBYMINW0568>
	<fce2a370902030302m1054bfc5wc5589ed60418c959@mail.gmail.com>
	<gm99v0$ier$1@ger.gmane.org>
	<fce2a370903030755n133906a3i32a25df5390d537@mail.gmail.com>
	<d1b08f940903291528i4fcd7139rc7d3cee88dd315d5@mail.gmail.com>
	<fce2a370903291558o335ef90bj5ac7e23203f3d7a4@mail.gmail.com>
Date: Mon, 30 Mar 2009 01:11:16 +0200
Message-ID: <d1b08f940903291611y67a2e1d0pd9dae7800c171dd@mail.gmail.com>
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
X-List-Received-Date: Sun, 29 Mar 2009 23:13:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

ehm...the Author part doesn't appear..sorry.
For the rest, I replied to my own message (and here you see it
correctly threaded:
http://lists.linuxtogo.org/pipermail/openembedded-devel/2009-March/thread.html).

There is a problem anyway...it works if you pre-define the two
vars...otherwise these are not expanded.

uboot-mkimage -A arm -O linux -T kernel -C none -a
${UBOOT_LOADADDRESS} -e ${UBOOT_ENTRYPOINT} -n "Angstrom/2.6.26/c7x0"
-d linux.bin /oe/build/tmp/angstrom
/deploy/glibc/images/c7x0/uImage-2.6.26-r9-c7x0.bin


I need to check more thoroughly.

NACK

Sorry for the noise

Andrea


