Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PJCKs-0008N1-QM
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 22:48:07 +0100
Received: by gwaa11 with SMTP id a11so2321226gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Nov 2010 13:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=Sph/pmWhnxPPFEOpk7eDFkZ7XvEj41dfnKhYsuhyRrQ=;
	b=jN00XS978rSeOu/wYduXcXHXvlhWgb3tZ5i48ZIn/IOpm5nB/gQcsDR3l9SrMTyDze
	tiWUd9LqhKwRAzNy4ngbSVHH2qkyOweufBWBtInsKequCf+oCnnKEs6fT5xGFATjRpqK
	8rijul3sRKbCRzfX3bgJWaTfM4YXapnTqtG24=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=SlqLL5kN712f3mNgMoniXHCTYMUMTRhB+ZEO+CAGO27JDcjNksppGMnyccvHW0y5t3
	W4B6urV+vVLmOX3byq8QRr/WwnKd827aQEHW0nlw+NIIl64XdRZqkMi40U/WpqdLuEE4
	SB4LdUIdcpx90+3Rd6ZMwsd4nCdOnXjPNr4eQ=
Received: by 10.91.42.30 with SMTP id u30mr31287agj.102.1290116817408; Thu, 18
	Nov 2010 13:46:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Thu, 18 Nov 2010 13:46:36 -0800 (PST)
In-Reply-To: <AANLkTik0thyw1SiJNdu9oDuPJtvpRY7Gfah8Z9z5ck7Y@mail.gmail.com>
References: <AANLkTik0thyw1SiJNdu9oDuPJtvpRY7Gfah8Z9z5ck7Y@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 Nov 2010 13:46:36 -0800
Message-ID: <AANLkTikn3_nE33yeAX-Cem1y8SYNU4Qf6AFRyBu8b-Z+@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: bitbake ntpdate failure
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
X-List-Received-Date: Thu, 18 Nov 2010 21:48:07 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 18, 2010 at 11:56 AM, AJ ONeal <coolaj86@gmail.com> wrote:
> *| ntpdc.c:452: error: 'EAI_NODATA' undeclared (first use in this function)*
>

EAI_NODATA is removed from getaddrinfo struct

you can conditionalize the code to take care of it

#if defined(EAI_NODATA) && EAI_NODATA != EAI_NONAME
     stuff .... depending on EAI_NODATA
#endif

>
> Full output:
> https://gist.github.com/705497
>
>
> Snippit:
>
> | make[3]: Entering directory
> `/mnt/local/overo-coolaj86/tmp/work/armv7a-angstrom-linux-gnueabi/ntp-4.2.0-r9/ntp-4.2.0/ntpdc'
> | arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon
> -mfloat-abi=softfp -mthumb-interwork -mno-thumb -std=gnu99 -DHAVE_CONFIG_H
> -I. -I.. -I../include
> -isystem/mnt/local/overo-coolaj86/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include
> -isystem/mnt/local/overo-coolaj86/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include
> -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2
> -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -Wall -Wcast-qual -Wmissing-prototypes
> -Wpointer-arith -Wshadow -Wstrict-prototypes -MT ntpdc.o -MD -MP -MF
> .deps/ntpdc.Tpo -c -o ntpdc.o ntpdc.c
> | ntpdc.c: In function 'openhost':
> *| ntpdc.c:452: error: 'EAI_NODATA' undeclared (first use in this function)*
> | ntpdc.c:452: error: (Each undeclared identifier is reported only once
> | ntpdc.c:452: error: for each function it appears in.)
> | make[3]: *** [ntpdc.o] Error 1
> | make[3]: Leaving directory
> `/mnt/local/overo-coolaj86/tmp/work/armv7a-angstrom-linux-gnueabi/ntp-4.2.0-r9/ntp-4.2.0/ntpdc'
> | make[2]: *** [all] Error 2
> | make[2]: Leaving directory
> `/mnt/local/overo-coolaj86/tmp/work/armv7a-angstrom-linux-gnueabi/ntp-4.2.0-r9/ntp-4.2.0/ntpdc'
> | make[1]: *** [all-recursive] Error 1
> | make[1]: Leaving directory
> `/mnt/local/overo-coolaj86/tmp/work/armv7a-angstrom-linux-gnueabi/ntp-4.2.0-r9/ntp-4.2.0'
> | make: *** [all] Error 2
> | FATAL: oe_runmake failed
> NOTE: Task failed:
> /mnt/local/overo-coolaj86/tmp/work/armv7a-angstrom-linux-gnueabi/ntp-4.2.0-r9/temp/log.do_compile.7879
> ERROR: TaskFailed event exception, aborting
>
> AJ ONeal
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


