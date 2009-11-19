Received: from mail-px0-f174.google.com ([209.85.216.174])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ahsan.khwaja@gmail.com>) id 1NB6P0-0003oS-71
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 13:46:25 +0100
Received: by pxi4 with SMTP id 4so1423880pxi.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2009 04:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=Rpb+FOTyPvMlF9RYKd8Hw5fZGweqmlhsz5IkiaprY9I=;
	b=aL6hWV313ut+mvfKaDv6Im1T77xdkJP9QeTMXBrDRjNIWQZtRCGAUFwOrcA7B4m4PG
	2nXe4bha83l9qBbizAyuV/f9NMRnugQhZnwPFBkd+0KCt0gEXAbL+MMEi6BOc/3MmjoP
	XNdZBiLkcX3Yn43r6N844irelN0cbk/rdIHE0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=dR9t6oQREFUWxmabxLc1CJK+UjFoaQjGfkpHf30Pj8Tpz29WNV/sTsJKXCvrYTV+ZR
	OsoxbTWVntcGSIIFL+ZYB7wFQJHrMFfqNLQkO1dnnUw+JNz/Z10vKozaWamBLyPXXysf
	3CsfRadTYbHMQLJshZroS+E71ghMWrtUI1n+c=
MIME-Version: 1.0
Received: by 10.114.236.22 with SMTP id j22mr6743029wah.217.1258634693618; 
	Thu, 19 Nov 2009 04:44:53 -0800 (PST)
In-Reply-To: <c384c5ea0911190438l6e351ad0i97a798890ba152d4@mail.gmail.com>
References: <818ccfc40911182327t686578acn565645806bcf280e@mail.gmail.com>
	<c384c5ea0911190438l6e351ad0i97a798890ba152d4@mail.gmail.com>
Date: Thu, 19 Nov 2009 17:44:53 +0500
Message-ID: <818ccfc40911190444x5dc93e37g2fa2ebef9b339946@mail.gmail.com>
From: Ahsan Khawaja <ahsan.khwaja@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.174
X-SA-Exim-Mail-From: ahsan.khwaja@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: do staging failed while building eglibc
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
X-List-Received-Date: Thu, 19 Nov 2009 12:46:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

Architecture : ARM
Machine: imx31

I am unable to understand the error. Can you explain to me why staging phase
is failing. it just says

make -r PARALLELMFLAGS="" CVSOPTS="" -C
/opt/embeddedalley/freescale_mx31pdk/src/devsys/build_mx31pdk_debug_rebuild001/work/armv6-none-eabi/eglibc-initial-2.9-r4/eglibc-2_9/libc
objdir=`pwd` csu/subdir_lib
make[1]: Entering directory
`/opt/embeddedalley/freescale_mx31pdk/src/devsys/build_mx31pdk_debug_rebuild001/work/armv6-none-eabi/eglibc-initial-2.9-r4/eglibc-2_9/libc'
make  subdir=csu -C csu ..=../ subdir_lib
make[1]: *** [csu/subdir_lib] Error 2
make[1]: Leaving directory
`/opt/embeddedalley/freescale_mx31pdk/src/devsys/build_mx31pdk_debug_rebuild001/work/armv6-none-eabi/eglibc-initial-2.9-r4/eglibc-2_9/libc'
make: *** [csu/subdir_lib] Error 2
FATAL: oe_runmake failed

there is no clue that what went wrong

Regards,
Noor

On Thu, Nov 19, 2009 at 5:38 PM, Leon Woestenberg <
leon.woestenberg@gmail.com> wrote:

> Hello Ahsan,
>
> On Thu, Nov 19, 2009 at 8:27 AM, Ahsan Khawaja <ahsan.khwaja@gmail.com>
> wrote:
> >
> > i am using openembedded to build my develoment system for bare metal. I
> > changed the TARGET _OS to arm-none-eabi. while building the system the
> > eglibc gets error during staging process. Error description is to
> confusing.
> > Please help me in resolving this issue.
> >
> For what machine and/or architecture?
>
> Regards,
> --
> Leon
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

