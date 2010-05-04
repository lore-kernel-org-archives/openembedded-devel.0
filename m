Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1O9Kbs-00065H-Qq
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 May 2010 18:04:57 +0200
Received: by pxi14 with SMTP id 14so1754471pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 May 2010 09:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=hkgkqo18gCtFqA9FSC/rosTI/zSrGHt4lJtFW3rzWdI=;
	b=bn6mFK4E3O8p7DENZnObckD/V9tMz5776zX+FaxPyRfYe2S+GhfryqfBrNUxulVh8I
	KmxjxMw3/fpfeCvmpWNdTwkFo5avGkeXLi0nWO3E/EiU63OolZ+CnEEAxb958nI6K6fA
	58vrhVkLxIaaSQ7w/uCmhhR6O3o6tqgAk2ntM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=LiIReg5IdjcaudhYPilN69G/cbj0y7PSOwSm7uODqTFGKig4GncgX9kGKMTsV7Ezmq
	Wz1OdlAZEWxg6xHOTdbvIdunFCSLszmtji4Fo1DNhNIvrIVJVA+XM3qJ12wC1fWEeYCM
	DtcjkMgXwYI9D0SitUnD5hogzFlWSffhx86S0=
MIME-Version: 1.0
Received: by 10.140.58.15 with SMTP id g15mr4771521rva.96.1272988848503; Tue, 
	04 May 2010 09:00:48 -0700 (PDT)
Received: by 10.141.50.20 with HTTP; Tue, 4 May 2010 09:00:48 -0700 (PDT)
In-Reply-To: <p2rde65d1f11005040816q3d4b1201y9eac356634db14fa@mail.gmail.com>
References: <p2rde65d1f11005040816q3d4b1201y9eac356634db14fa@mail.gmail.com>
Date: Tue, 4 May 2010 18:00:48 +0200
Message-ID: <k2xc384c5ea1005040900u404c10fck4a305b1df5fe57ec@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Build uncompressed kernel
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
X-List-Received-Date: Tue, 04 May 2010 16:05:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Dmitry,

On Tue, May 4, 2010 at 5:16 PM, Dmitry Vinokurov <df6.626@gmail.com> wrote:

> Is there any way to cancel compression stage of kernel build and get
> uncompressed uImage using OE? I've measured uncompressing time (using
> stopwatch actually, so it could be +-0.1-0.2 seconds or even more) -- it's
> about 0.8-0.9 seconds, and boot time is much more critical for my system

Boot time is a combination of load time and decompression time.

Using a non-compressed kernel can increase boot time, so it's
interesting to test this properly.

Some public results show that using a fast decompression codec such as
LZO results in the smallest overall boot time on some platforms.

Your milage may vary, let us know what worked best for you, good luck,
-- 
Leon


