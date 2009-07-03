Received: from [74.125.78.148] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1MMrNu-0001hY-UL
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Jul 2009 00:37:34 +0200
Received: by ey-out-1920.google.com with SMTP id 5so862083eyb.22
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Jul 2009 15:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=QH00DlBiwSBrkihajz+u1HhqYf1rJm1FRQRRXSdtpdo=;
	b=idu96rC1HXVrIvy3GLJNvqJF/R8yNc/sATxvjH3HZIHusx47bqHIWZifscOozfExmd
	qVnOI8n8FW91gomNzzdzEiOO5oqJElxC/0nIqdI76qNLw/c/1GFimwltXd6tg15Or89P
	XeMcHSfqEwu7xqZ75145Vek5zkJgLYwBA+EdY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=FirSkn4BtKv5N8NfYkjqy92HuUIHUIMutd/amxDqXVIbj+g+XwFdwcIB45aZ23IgkD
	EH99a+ePpm25FYNzRxvFs7nouXRGtqFPaR9NJQxKlZdRuEN7D2VvdkJJZzN9h4VaMY1n
	prXbh4hjwu9GseizOoJOKG+dE0KxLk30wLHoQ=
MIME-Version: 1.0
Received: by 10.216.9.66 with SMTP id 44mr498914wes.73.1246659924915; Fri, 03 
	Jul 2009 15:25:24 -0700 (PDT)
In-Reply-To: <fce2a370907030730i9ffb505k42be0f8f933b1fab@mail.gmail.com>
References: <1233319034.13141.2.camel@EPBYMINW0568>
	<fce2a370902030302m1054bfc5wc5589ed60418c959@mail.gmail.com>
	<gm99v0$ier$1@ger.gmane.org>
	<fce2a370903030755n133906a3i32a25df5390d537@mail.gmail.com>
	<d1b08f940903291528i4fcd7139rc7d3cee88dd315d5@mail.gmail.com>
	<fce2a370903291558o335ef90bj5ac7e23203f3d7a4@mail.gmail.com>
	<d1b08f940903291611y67a2e1d0pd9dae7800c171dd@mail.gmail.com>
	<d1b08f940903291632y1bcad5cam6b6c2cae47855a0f@mail.gmail.com>
	<fce2a370907030730i9ffb505k42be0f8f933b1fab@mail.gmail.com>
Date: Sat, 4 Jul 2009 00:25:24 +0200
Message-ID: <d1b08f940907031525r3bfaaddfyb4804ef1e1eead83@mail.gmail.com>
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
X-List-Received-Date: Fri, 03 Jul 2009 22:37:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Ihar,

the patch sounds very interesting but I had issues with the version
you posted...

1) You need to ECHO out the two vars, then it 'works'
-UBOOT_LOADADDRESS=`${OBJDUMP} -p ...
+echo UBOOT_LOADADDRESS=`${OBJDUMP} -p ...

2) the values don't correspond to the mkimage parameters...(tested for
Zaurus+u-boot)

So, for the moment, NACK, my ack was premature
Still, I appreciate very much your efforts, unfortunately I have not
yet full knowledge about that matter.
Hopefully some kernel hacker will jump in...

Regards

Andrea


