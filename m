Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1PBFCe-0002Ju-0P
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Oct 2010 01:14:44 +0200
Received: by fxm3 with SMTP id 3so1346028fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Oct 2010 16:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=Kk+sa1sXDrSCseg5tLkQNXxlJxRQubXQYNuyuPeLrrc=;
	b=qBvUttfC+ZNe/BQYdGUA1Z2VOCwgZpng3/380uNFT3+o6GZzQV/ASvOo9ZpW0/h73w
	HIStuULy0LcL66zE3MzGPkna1mCI1xQHzXG1WVbE0g9Qw0qQH4172bMDXnm07lzIfDlN
	MpAVt59MvvYAuEJLsYIfJ7PtLY4DcY2prlphQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=mYltUIJfnPcD8QDCGtPP6d7BqkNCVv5BuNDc0y3DrIk4QhelPG6a/C5d+5iVkdl00o
	B+B42pcj5KIKSOMnNebYMOLwgfCoX433pnFtsvZx7uzKRUHufStREWn3xRsAtCEyuVcq
	T+4iz5CHyJosSqpJhgfJUL59vgJBu5q7mh+Ts=
Received: by 10.223.83.193 with SMTP id g1mr3087519fal.119.1288221240478; Wed,
	27 Oct 2010 16:14:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.112.201 with HTTP; Wed, 27 Oct 2010 16:13:40 -0700 (PDT)
In-Reply-To: <AANLkTikG3t-cDmFcGfcdiOiNJha1yKYU9Gmn5Kfep+p5@mail.gmail.com>
References: <AANLkTikG3t-cDmFcGfcdiOiNJha1yKYU9Gmn5Kfep+p5@mail.gmail.com>
From: AJ ONeal <coolaj86@gmail.com>
Date: Wed, 27 Oct 2010 17:13:40 -0600
Message-ID: <AANLkTinvsjya9b3kgFgLvfg0f2ZPX5kddhDj1_eai5VL@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: netpbm fails: 'struct jpeg_decompress_struct' has no member named 'min_DCT_scaled_size'
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
X-List-Received-Date: Wed, 27 Oct 2010 23:14:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

Status update: still can't get it built



bitbake jpeg libpng
bitbake -c configure netpbm

svn checkout http://netpbm.sourceforge.net/subversion.tigris.org
cp -a netpbm/* ./tmp/work/arm*/netpbm*/netpbm*/
bitbake -f -c configure netpbm

bitbake netpbm

and it gets hung up at the end when looking for `ld` it finds it in /usr/bin
instead of in the oe directory

I manually relinked `/usr/bin/ld` temporarily to

/mnt/local/overo-coolaj86/tmp/sysroots/i686-linux/usr/armv7a/arm-angstrom-linux-gnueabi/bin/ld

and it works for netpbm, and then fails for the next package
so I link things back try again
and then back again

but there I got stuck...



For the benefit of others needing netpbm on arm finding this post:

I tried compiling from source natively, but it failed with a flex exec error

I found prebuilt packages at
https://launchpad.net/ubuntu/+source/netpbm-free/2:10.0-12ubuntu2/+build/1547834

I was able to unpack those with file-roller and install them with
tar xf -C / data.tar.gz

but they don't run because they require glibc 2.11

AJ ONeal


On Wed, Oct 27, 2010 at 4:08 PM, AJ ONeal <coolaj86@gmail.com> wrote:

> The netpbm in the repo is out-of-date with the libjpeg in the repo.
>
>
> | arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon
> -mfloat-abi=softfp -mthumb-interwork -mno-thumb -c
> -I/mnt/local/overo-coolaj86/tmp/work/armv7a-angstrom-linux-gnueabi/netpbm-10.28-r8/netpbm-10.28/converter/ppm/ppmtompeg
> -I.
> -I/mnt/local/overo-coolaj86/tmp/work/armv7a-angstrom-linux-gnueabi/netpbm-10.28-r8/netpbm-10.28/converter/ppm/ppmtompeg/headers
> -DNDEBUG \
> |
> -isystem/mnt/local/overo-coolaj86/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include
> -isystem/mnt/local/overo-coolaj86/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include
> -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2
> -ggdb2   -o jpeg.o jpeg.c
>
>
> | jpeg.c: In function 'ReadJPEG':
> | jpeg.c:484: error: 'struct jpeg_decompress_struct' has no member named
> 'min_DCT_scaled_size'
>
>
>
> | make[3]: *** [jpeg.o] Error 1
> | make[3]: Leaving directory
> `/mnt/local/overo-coolaj86/tmp/work/armv7a-angstrom-linux-gnueabi/netpbm-10.28-r8/netpbm-10.28/converter/ppm/ppmtompeg'
> | make[2]: *** [ppmtompeg/all] Error 2
> | make[2]: Leaving directory
> `/mnt/local/overo-coolaj86/tmp/work/armv7a-angstrom-linux-gnueabi/netpbm-10.28-r8/netpbm-10.28/converter/ppm'
> | make[1]: *** [ppm/all] Error 2
> | make[1]: Leaving directory
> `/mnt/local/overo-coolaj86/tmp/work/armv7a-angstrom-linux-gnueabi/netpbm-10.28-r8/netpbm-10.28/converter'
> | make: *** [converter/all] Error 2
> | FATAL: oe_runmake failed
> NOTE: Task failed:
> /mnt/local/overo-coolaj86/tmp/work/armv7a-angstrom-linux-gnueabi/netpbm-10.28-r8/temp/log.do_compile.8537
>
> AJ ONeal
>

