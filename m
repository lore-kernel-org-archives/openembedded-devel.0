Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <daniel.xntian@gmail.com>) id 1OEhCt-00049e-QH
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 May 2010 13:13:05 +0200
Received: by vws20 with SMTP id 20so2756735vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 May 2010 04:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=NHt0V7pzkTTnA3uyoPpY46TOA2ThMgyLcs8aBZKk2RM=;
	b=wB4Z+X6dZTI/esVeulPqX1/ejSQX3igTmuFXxlZYK/EefwWvel+VeuV5MsG0LRl/NP
	EhbU+rNs5rP1z1/3w20R3fKEuego1nA+j1mi1m6uvXtewCA6Ddi7GpQ+P/fAq14RgoRm
	lrIv/a/V6PQKGPb4fxpZzuTm36Jr+kWQeNHk0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=L84FxVY89Yq9qhUzArCs+ptjp1vQfeQxodIKt+KuPbe7qrdnLMzMONeNJpDxa/oGuh
	+hIVFTEDz+shD6wWdobqiVMjenl5oJjxiUolfykhj/5y9JA67sMTV33fWIIsMUM13be4
	utRv8eQgDZqCyXxh6ebrYJgWEMWdlYpKnmvHI=
MIME-Version: 1.0
Received: by 10.220.121.136 with SMTP id h8mr4278618vcr.213.1274267329032; 
	Wed, 19 May 2010 04:08:49 -0700 (PDT)
Received: by 10.220.100.140 with HTTP; Wed, 19 May 2010 04:08:48 -0700 (PDT)
In-Reply-To: <20100519094209.GH3302@jama>
References: <AANLkTimeUg2WhglfZE-N2rdYNZ4yehKmR6YSvBL5NIPX@mail.gmail.com>
	<20100519094209.GH3302@jama>
Date: Wed, 19 May 2010 19:08:48 +0800
Message-ID: <AANLkTikHxRda_PrKUt97p3ICME5B1O35hFRcSuz9nxed@mail.gmail.com>
From: daniel tian <daniel.xntian@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: daniel.xntian@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Does anybody try the e-image-core
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
X-List-Received-Date: Wed, 19 May 2010 11:13:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

hi, Martin:

2010/5/19 Martin Jansa <martin.jansa@gmail.com>:
> On Wed, May 19, 2010 at 05:31:21PM +0800, daniel tian wrote:
>> Hi, guys:
>> =A0 =A0 Now I am working on a project: porting the enlighenment on mips =
machine.
>> =A0 =A0 The local.conf is configure as db1200 machine which is a mips32
>> little endian arch.
>> =A0 =A0 I have already built a rootfs and kernel from previous
>> openembedded source code.
>> =A0 =A0 But the startx command is not found, so I don't know how to
>> startup the enlightenment desktop, and maybe there have any others
>> packages missing in this rootfs.
>
> you can try xserver-nodm-init recipe which provides
> /etc/init.d/xserver-nodm (no idea if it's part of e-image-core).
>ed checkout on mirror.
>>

I will try to build this recipe alone. and I still have one problem:
how to merge this package into rootfs
when i finish the building stage if the package is not in the e-image-core.

Thanks for you advice.


daniel


