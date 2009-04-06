Received: from [74.125.44.157] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Lquar-0000oA-86
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Apr 2009 21:34:55 +0200
Received: by yx-out-1718.google.com with SMTP id 3so1596666yxi.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Apr 2009 12:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=mHszvya05nep9QQ/vEIUw1KBjatkmrIoAV9jXEmVA/0=;
	b=pPll1Hs3f2hOMhhnCwRX2Kl5BfgrX/IuuXKtaL1oqijffvZ5g4aVcO8D7SSNJhGfbM
	hVSwAYmG7xJknrtk3hjjw4sAat+kuNzod0xtQx3c3Lz+WBGVYUlQlF9zztKFMgGXpJ1x
	FoZyH9n/U4LsSO+vhzxJdHkzteL7LiCkCJ2lM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=GZsvBrX9UEBQ1FUYbN0+i1n955JMZ6RzA10qqpYOzsJRp3OELXO4RInm0rMcCcq7fd
	HW84Podo2Yx7JHot3lVGpnRBSPjxVkWXAQhmsEFvnZ5ZELjWVlHYQWIsqQWza8ALhbGW
	vdgNwKCsqagMrRKsUsJTokN4u9hJSKIQnNBzA=
MIME-Version: 1.0
Received: by 10.100.205.15 with SMTP id c15mr7063412ang.20.1239046321097; Mon, 
	06 Apr 2009 12:32:01 -0700 (PDT)
In-Reply-To: <49D677A3.2070702@cs.cmu.edu>
References: <49D677A3.2070702@cs.cmu.edu>
Date: Mon, 6 Apr 2009 12:32:01 -0700
Message-ID: <19c1b8a90904061232i307b288ao7d1802a4363bbba9@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.44.157
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: uclibc build failure on armv4t with -mthumb (internal compiler error)
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
X-List-Received-Date: Mon, 06 Apr 2009 19:34:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

please try with gcc 4.3.3, the fix is just a workaround to get past this error.
Looks like fix is not sufficient for all gcc versions

Thx

-Khem

On 4/3/09, David Huggins-Daines <dhuggins@cs.cmu.edu> wrote:
> I'm having trouble building uclibc in thumb mode for armv4t.  It is
> getting an internal compiler error when compiling ldso.  The error
> message is:
>
> NOTE: make STRIPTOOL=true LD=arm-angstrom-linux-uclibcgnueabi-ld
> LOCALE_DATA_FILENAME=uClibc-locale-030818.arm.tgz CC=ccache
> arm-angstrom-linux-uclibcgnueabi-gcc -march=armv4t -mtune=arm920t
> -mthumb-interwork -mthumb
> HOSTCFLAGS=-I/home/dhuggins/Projects/TeRK/oe/tmp/staging/x86_64-linux/usr/include
>   CC ldso/ldso/ldso.oS
> ldso/ldso/dl-elf.c: In function '_dl_dprintf':
> ldso/ldso/dl-elf.c:913: error: unable to find a register to spill in
> class 'LO_REGS'
> ldso/ldso/dl-elf.c:913: error: this is the insn:
> (insn 121 120 122 6 (set (reg/f:SI 406)
>         (plus:SI (reg/f:SI 25 sfp)
>             (reg:SI 405))) 5 {*thumb_addsi3} (nil)
>     (expr_list:REG_DEAD (reg:SI 405)
>         (nil)))
> ldso/ldso/dl-elf.c:913: confused by earlier errors, bailing out
> make: *** [ldso/ldso/ldso.oS] Error 1
> FATAL: oe_runmake failed
>
> I'm using the stable/2009 branch and this is GCC 4.2.4-r5
>
> I believe there were some patches for this recently (in particular,
> building ldso with -O0) but I'm still getting the error - note that it
> is in a different function than the one seen earlier.
>
> I worked around this by forcing ldso to compile with the ARM instruction
> set, but I'm not sure if this is the right approach or not.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


