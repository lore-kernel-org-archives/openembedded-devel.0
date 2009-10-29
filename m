Received: from [209.85.223.190] (helo=mail-iw0-f190.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1N3dWC-0003q4-Vo
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Oct 2009 23:31:00 +0100
Received: by iwn28 with SMTP id 28so1798550iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2009 15:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type;
	bh=ycMwHqycSbe++ndgvemRQ8EEnKYmmTznsz8Aqc/Xh4s=;
	b=gEQDkj6ITdq8DWAPDC/gsyZPH7gxGiJFuXbDjkhqxlLmKtbVienHkTSif3EFx4aWpI
	aVKN2ZZiGl6geXLKE+xay37FKV2+6Cj6maErCDdMXfwSEY6b+1JhKnBMYiazmM+fnMij
	LEtvT3bVD17cD02yJYbeJKlUbx1oVHQ4cZMGE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=rB61DF+NGk/Kjro3Nvv4OHwS60NcuX2GVm0KkCjdJA9KEoUzWz8jOX0LbnMIxIkm+I
	JtneOR2xd+JCG5L5S0pKq6VqB0suBZTM80XViqvMioSJSdkaJJdh47RiN9BTkHFQU0uI
	Si1Zcv8xSUQcQj9YujojcUp5X3sahCPUIBwWk=
MIME-Version: 1.0
Received: by 10.231.170.201 with SMTP id e9mr962703ibz.17.1256855381289; Thu, 
	29 Oct 2009 15:29:41 -0700 (PDT)
In-Reply-To: <4AE830DE.5030209@dresearch.de>
References: <4AE830DE.5030209@dresearch.de>
Date: Thu, 29 Oct 2009 15:29:40 -0700
Message-ID: <19c1b8a90910291529m56c2af1fvaa56dc17a657044f@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.190
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: mlauer@vanille-media.de
Subject: Re: busybox-static linking failed
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
X-List-Received-Date: Thu, 29 Oct 2009 22:31:00 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 28, 2009 at 4:54 AM, Steffen Sledz <sledz@dresearch.de> wrote:
> After a long time i tried to build an initramfs image containing
> busybox-static which fails to link (besides some warnings) with these
> errors:
>
> /home/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/busybox-static-1.11.3-r22.1/busybox-1.11.3/networking/libiproute/iptunnel.c:189:
> undefined reference to `__cpu_to_be16'
> /home/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/busybox-static-1.11.3-r22.1/busybox-1.11.3/networking/libiproute/iptunnel.c:190:
> undefined reference to `__cpu_to_be16'
> /home/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/busybox-static-1.11.3-r22.1/busybox-1.11.3/networking/libiproute/iptunnel.c:202:
> undefined reference to `__cpu_to_be16'
> /home/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/busybox-static-1.11.3-r22.1/busybox-1.11.3/networking/libiproute/iptunnel.c:214:
> undefined reference to `__cpu_to_be16'
> /home/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/busybox-static-1.11.3-r22.1/busybox-1.11.3/networking/libiproute/iptunnel.c:224:
> undefined reference to `__cpu_to_be16'
> networking/libiproute/lib.a(iptunnel.o):/home/OE/tmp.3/work/armv5te-angstrom-linux-gnueabi/busybox-static-1.11.3-r22.1/busybox-1.11.3/networking/libiproute/iptunnel.c:225:
> more undefined references to `__cpu_to_be16' follow
>
> This is really obscure for me because i can't identify the code lines
> responsible for them. :(

you need this kernel patch here
http://lkml.org/lkml/2009/6/18/223

>
> Steffen
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


