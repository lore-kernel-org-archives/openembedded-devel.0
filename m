Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1N5btc-0005h6-H4
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Nov 2009 10:11:19 +0100
Received: by bwz9 with SMTP id 9so8504678bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2009 01:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type;
	bh=l+OZyoSwFKYnz+D/AHbDExbkdNAHwQKVn9LMI4R7QoY=;
	b=hnpFdI29Oah+hYt+El+BGx36lI8uyC5UVlrtBg0J0YDBc/eP1dVD0atN24tSMy0y1a
	SDmYOMbKt/JJ8hXlSzzQspTjMEhDXLiBaEWCrku7QDziu2GvjS2ToGioohPqKG5tm5VB
	WiOdIFb5tZI1VcIO858EkjBnnjwnixxSuEXaM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=l8/mKI31YHubaUQv0Buy1BRWmrgXY0XCU5Adc8OFPpP4IkU40ZKcvHbRm29LoSxJJ3
	xoyQRuzGX9qrOMNiESPCMJi88ebcxGG1Wh0eiek8IRK2Il0pcU40UtLPJ2ZI7O/vJhGq
	//zQFL7YPDGIGy+k5f/OuN+H8jLQ9BurbfsvM=
MIME-Version: 1.0
Received: by 10.223.53.149 with SMTP id m21mr153656fag.101.1257325804115; Wed, 
	04 Nov 2009 01:10:04 -0800 (PST)
In-Reply-To: <1257325402-3232-1-git-send-email-Martin.Jansa@gmail.com>
References: <1257325402-3232-1-git-send-email-Martin.Jansa@gmail.com>
Date: Wed, 4 Nov 2009 10:10:04 +0100
Message-ID: <141020e30911040110q319ae21dxd1c0a266e6ef7599@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] eglibc: updated armv4t-interworking.patch
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
X-List-Received-Date: Wed, 04 Nov 2009 09:11:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 4, 2009 at 10:03 AM, Martin.Jansa <martin.jansa@gmail.com>wrote:

> From: Martin Jansa <Martin.Jansa@gmail.com>
>
> * Updated patch to make SYSCALL_ERROR_HANDLER interworking safe.
> * Phil Blundell found and fixed another issue in eglibc armv4t builds.
>
>
http://cgit.openembedded.net/cgit.cgi/openembedded/commit/?h=shr/merge&id=b7c9855c7ece03a0876c0d50922f908b65c5f095
should be also cherry-picked to replace another __ARM_ARCH_V4T__
with __ARM_ARCH_4T__. pb suggests its typo and gcc output/OE tree grep/GCC
sources grep and google are confirming it.

SHR root@gojama ~ $ echo | arm-oe-linux-gnueabi-cpp -march=armv4t -dM -E -
 | grep __ARM
#define __ARMEL__ 1
#define __ARM_ARCH_4T__ 1
#define __ARM_EABI__ 1

