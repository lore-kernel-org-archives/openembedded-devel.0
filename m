Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1O9XQs-0007jB-Fo
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 May 2010 07:46:08 +0200
Received: by vws14 with SMTP id 14so400099vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 May 2010 22:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=3C9hZFH9iVbAgnOQS7DZkesmsDaLGbr5v2jyzdNnKao=;
	b=BZ4ljI3e24YceIkrOXRV0d72nt1hX/q4LtLqvLoU7CsiJ4bxhQa+MpCGKjcc+Xk5el
	TAXWWn5Q6ypvrWZsbP9gjrd629x+FhxwUHiCqHQk/Y9yqjyiyFm3DoV2GS5EVWmo/tCr
	esTDT+By95DKW/DcZvGG0G/pJoliAxduEucig=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=AyzKextRqHM+5qMZyV3r9g1bYNoJF6FpjHwNzlzlVd7CQvTgzAIrfvm2k8Sud2FC2n
	TjvfnQthyUUwiuG3LRyQIcYiq4CAzagcAk+Ttn9qC+4ZuUaAwF/lIFScU7m1zcN+AvIx
	1grHzktabLogX7hbkqrbEXIjGmNe8Ioi9Q+Rg=
MIME-Version: 1.0
Received: by 10.220.121.229 with SMTP id i37mr1469989vcr.237.1273038138666; 
	Tue, 04 May 2010 22:42:18 -0700 (PDT)
Received: by 10.220.161.16 with HTTP; Tue, 4 May 2010 22:42:18 -0700 (PDT)
In-Reply-To: <s2wc384c5ea1005040902v77808234je982a023baea89f4@mail.gmail.com>
References: <p2rde65d1f11005040816q3d4b1201y9eac356634db14fa@mail.gmail.com>
	<s2wc384c5ea1005040902v77808234je982a023baea89f4@mail.gmail.com>
Date: Wed, 5 May 2010 07:42:18 +0200
Message-ID: <z2pac9c93b11005042242lf7f5b007s6b7abe11ebe2697c@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
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
X-List-Received-Date: Wed, 05 May 2010 05:46:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/5/4 Leon Woestenberg <leon.woestenberg@gmail.com>:
> Hello (again) Dmitry,
>
> On Tue, May 4, 2010 at 5:16 PM, Dmitry Vinokurov <df6.626@gmail.com> wrote:
>> about 0.8-0.9 seconds, and boot time is much more critical for my system
>> than image size, so even 0.5 seconds is really important. Bootloader is
>
> Also, consider using execute-in-place (XIP) stuff, this removes the
> loading stage from Flash to RAM.

Note that this assumes that the data is in NOR flash. XIP is not
possible with NAND.
NOR is slower than RAM but XIP avoids the decompression and only loads
what is really needed. so in the end most likely you'll win when it
comes to boottime.
There are several pages on elinux.org on boot time improvement.

Frans


