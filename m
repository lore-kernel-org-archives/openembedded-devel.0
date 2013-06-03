Return-Path: <net147@gmail.com>
Received: from mail-ve0-f171.google.com (mail-ve0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7388D60889
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Jun 2013 04:30:44 +0000 (UTC)
Received: by mail-ve0-f171.google.com with SMTP id b10so2443000vea.16
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Jun 2013 21:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=DXVKkYh7WvDD3Ef3y79y+aPBT9nmur9b3+ok6cLkW9Q=;
	b=ZIkfeH4HnFggL3SaaSa30r6GG8/FYFyeEdNYCEIEE6PjJJMr3wOYR7Rmri56mwCwIP
	ySa9LcZbm+xFEpeJdFLY9vsAUqi9pxnXmfRJTKtFjo14Sw1BelwGetrBtddmyB0wfOtc
	Q1aacJUQbvPzabo/YZqpZeAFec5bJgOxJCdd71PeN4CUmq/oltfSG+QtXCh3YJz+BDWl
	yjqVNlYt/dhzuq53Arvf+i61o5Pt2gDomJSjW++8QdEvMXseOzOolXVej5Gx8nG5nN55
	Ej5hdO4b0wn3VoAokHxgJsf2z8Flbab/7NT9FuS3epvErQ/eejtdxDpjkhCk4idoPjXv
	jYJg==
MIME-Version: 1.0
X-Received: by 10.58.50.198 with SMTP id e6mr16456180veo.30.1370233845417;
	Sun, 02 Jun 2013 21:30:45 -0700 (PDT)
Received: by 10.58.34.132 with HTTP; Sun, 2 Jun 2013 21:30:45 -0700 (PDT)
In-Reply-To: <51AB1684.1080500@juszkiewicz.com.pl>
References: <1370165592-15697-1-git-send-email-net147@gmail.com>
	<51AB1684.1080500@juszkiewicz.com.pl>
Date: Mon, 3 Jun 2013 14:30:45 +1000
Message-ID: <CANwerB08rsnH33f764tBvdmgu51+ty=KCFESmsm47cmdUnFYGQ@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] llvm3.2: new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Jun 2013 04:30:45 -0000
Content-Type: text/plain; charset=UTF-8

On 2 June 2013 19:55, Marcin Juszkiewicz <marcin@juszkiewicz.com.pl> wrote:
> W dniu 02.06.2013 11:33, Jonathan Liu pisze:
>> +def get_llvm_arch(d):
>> +    import bb;
>> +
>> +    arch = bb.data.getVar('TARGET_ARCH', d, 1)
>> +
>> +    if arch == "x86_64" or arch == "i486" or arch == "i586" or arch == "i686":
>> +        arch = "x86"
>> +    elif arch == "x86_64":
>> +        arch = "x86_64"
>> +    elif arch == "arm":
>> +        arch = "arm"
>> +    elif arch == "mipsel" or arch == "mips":
>> +        arch = "mips"
>> +    elif arch == "powerpc" or arch == "powerpc64":
>> +        arch = "powerpc"
>> +    else:
>> +        bb.warn("%s does not support %s yet" % (bb.data.getVar('PN', d, 1), arch) );
>> +
>> +    return arch
>
> Can we get rid of such blocks? They are worthless and only generate
> extra support questions when OE newbies use OE with 'not supported'
> architectures.

Done in v3 patch.

Regards,
Jonathan

