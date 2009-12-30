Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NQ4OV-00041N-UY
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Dec 2009 20:39:46 +0100
Received: by fxm4 with SMTP id 4so10387349fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2009 11:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=Jk2zeXYZq8IB4Jz64153PHUBWLNt/DvML+bnoYzJFFM=;
	b=VNzK0OxrakMr/Bm5pqTS/skslLMhqHofbSQBzMptmqcpSRiS/tmmYoGArGtPwQ9n3u
	TuGNoAylapYTz9Zyr7PneQF7a9gqDQ77lNGlcWHVxmxP4jTPQELm9qqaLQIwS8/CPHGD
	LLIqrsRlnnuuYZ9VD0nDFrUdkE+UXPc5JDjeo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=cgVeaDDK3H2kVZzHgn4iy6YDOnAqlicMqvuH0J15UVxKOu021tq4M0JmHvd/oSz1tP
	CGuNVgHCN4wystFrtDY/ctr3t+nzr1HyIKKR+RO19UQVUr+tsGnbIa09YDm90sUFEGbF
	l9H4w+hX5EmuU1ZnVKaE4xdSP3dDBx0ypre1Q=
MIME-Version: 1.0
Received: by 10.239.193.14 with SMTP id g14mr580896hbi.86.1262201865365; Wed, 
	30 Dec 2009 11:37:45 -0800 (PST)
In-Reply-To: <hhf457$n7h$2@ger.gmane.org>
References: <c384c5ea0912290715l24b705fat6700077741b1cc5b@mail.gmail.com>
	<hhdipd$25q$2@ger.gmane.org>
	<c384c5ea0912291144p3c800d9fq4975f94494a04e1f@mail.gmail.com>
	<19c1b8a90912291442q426ddd95n9acff7b8df592092@mail.gmail.com>
	<hhf457$n7h$2@ger.gmane.org>
Date: Wed, 30 Dec 2009 20:37:45 +0100
Message-ID: <c384c5ea0912301137r4990f109kd0db648bd2b1a546@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Move IMAGE_BOOT stuff into distro's?
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
X-List-Received-Date: Wed, 30 Dec 2009 19:39:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Wed, Dec 30, 2009 at 9:48 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>>> OK understood, apparantly we want to have a generic image base
>>> containing udev, a login, shadow etc.
>>> that is distro-indepent.
>>>
>>> Can we remove that from the image class, and move into a
>>> image-boot.inc or something?
>
> What's the problem with setting 3 vars to "" in your helloworld image?
>
Let me counter that question: What's the problem with bitrot and poor
design if the end result still works?

Of course it's easy to add 3 vars, that's not my point. The point is
those 3 vars do not need to be hard coded by
default in a class.


Design:

The class implements the work to be done.
The recipes describe what work has to be done indirectly.

Design problem:

The class now contains hard-coded package names directly.

The image recipes have to know the internals of the class in order to
revert to fully customizable behaviour.


Of course I could stop being frustrated about this and happily add 3
vars to my image and not care about this anymore.


Regards,
-- 
Leon


