Received: from [209.85.198.245] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hvontres@gmail.com>) id 1LeCE0-00037C-2D
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Mar 2009 18:46:46 +0100
Received: by rv-out-0708.google.com with SMTP id b17so2621460rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Mar 2009 09:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=aU/M1tr9C2BgnG9X3Cj0fErrkBYrSZbovDBItUFLCI0=;
	b=cz8wKusfmKVLhf6cTMzZvyo8zuHCW+fozr55DjPM9SHDeY5jooMsTWYBaK8gDEi2D6
	NomnSg5soEES2i4W/NT4sBigYmIwU/dRB1pfiVP4iClccKuyleYgFdy40kmkZ8FZ8YJe
	vfFhIsrKXpyG/huLRFOom67ilwZJ+UX0mU8Bs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=LF4L0+JRUWhZspX/MSJ5qREUzZ2HnSVu8rW7NT8ZtV4faprFGrUDD+plV6aItmAkzb
	oRFupYMcXnVuXgqfrXxAe4mOWBV0HuanUX6D39LwCGy0cdZ8AEzRP3EUO8E1DMvx8uq0
	726uhcGaeQWvo9BpoQagcZYKn4Hgi/yqlZL64=
MIME-Version: 1.0
Received: by 10.141.196.8 with SMTP id y8mr2997003rvp.298.1236015767980; Mon, 
	02 Mar 2009 09:42:47 -0800 (PST)
In-Reply-To: <49AAA599.5070507@dresearch.de>
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF686@hiob.intern.dresearch.de>
	<49A7BD17.2080407@dresearch.de>
	<432beae0902271228w2150a17fo79e5a76c8eb71b42@mail.gmail.com>
	<49AAA599.5070507@dresearch.de>
Date: Mon, 2 Mar 2009 09:42:47 -0800
Message-ID: <a7f8874a0903020942y65f55a90rec06b1bc87ac8702@mail.gmail.com>
From: Hans Henry von Tresckow <hvontres@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Ugly build problem with emacs/qemu
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
X-List-Received-Date: Mon, 02 Mar 2009 17:48:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 1, 2009 at 7:11 AM, Steffen Sledz <sledz@dresearch.de> wrote:
> Justin Patrin schrieb:
>> Are the machines you're building on exactly the same? Do they perhaps
>> have different architectures or distributions? Have you tried updating
>> the systems?
>
> The machines are different.
>
> The one that works fine:
> =A0Ubuntu 8.10
> =A0Linux bfg9000 2.6.27-11-generic #1 SMP Thu Jan 29 19:28:32 UTC 2009 x8=
6_64 GNU/Linux
>
> The one with the problem:
> =A0openSUSE 11.1
> =A0Linux recycler 2.6.27.19-3.2-default #1 SMP 2009-02-25 15:40:44 +0100 =
i686 athlon i386 GNU/Linux
>
>> This looks like a qemu failure to me.
>
> I agree. But i can't believe, that the different OS my be involved in tha=
t. Both are up-to-date. And i thought that all the tools needed to cross-bu=
ild the packages are build by OE itself.
>
> Steffen
>

I don't kow about openSuse, but I remember that Fedora used to have
some kernel patches that did not play well with QEMU. But that was
back on Ferora 7, since then I switched to ubuntu. I don't even
rmember exactly what patch caused the problems, but IIRC it was
security related.

--=20
Henry von Tresckow (hvontres)
W. C. Fields  - "I never drink water because of the disgusting things
that fish do in it."


