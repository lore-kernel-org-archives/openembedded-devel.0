Received: from [74.125.92.144] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1MbB8b-0001Lu-5G
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Aug 2009 12:32:57 +0200
Received: by qw-out-1920.google.com with SMTP id 4so1490970qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2009 03:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=PGRr8x02r37uBVNqQ3VJkZbGAbEw1PEAYTu2K5A8n0U=;
	b=l3aUx9wO2tILkQ/tlCTpiuJLRgTX1HHt7Sm5MzQeii4uH0W2j6LCm/iQRZuUYANQG6
	/sCDXSeZ2OVWruL6dLyKbbgHuKEsdQtSc5F0WwAu6evTMtYIaH4mIUw3tBLC7YJ4VgmI
	RxGX1/82VoYZ8hGQqUnYs6Qu1PO3b164p7Krs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Eo/Y5nqesFaJFbvbAY3k1Hut0xrP/EplgBhe5hWr8npk3e9Qdx6JcFODk60mjvJ2W7
	u0c4QIAbqiXGV1oD/9u0cfBqjFkOVROVyAY+dXjFZPC4KnVy9tkUGdDadPxoEo77HDPZ
	9yvDp36ZkAkdZjWURmTsZGx8MGiJ1Lml50L6w=
MIME-Version: 1.0
Received: by 10.229.80.78 with SMTP id s14mr2142130qck.101.1250072193145; Wed, 
	12 Aug 2009 03:16:33 -0700 (PDT)
In-Reply-To: <h5u38c$htr$1@ger.gmane.org>
References: <4A826FF3.9030501@gmail.com> <h5u38c$htr$1@ger.gmane.org>
Date: Wed, 12 Aug 2009 19:46:33 +0930
Message-ID: <6ec4247d0908120316k595cf5eeobbe64aa31ab99f8@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: why does glibc_2.9.bb use glibc-ports-2.7?
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
X-List-Received-Date: Wed, 12 Aug 2009 10:32:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I currently don't have resources to test arm builds (or other
architectures...). mipsel builds take 16hrs on my workstation as it
is.

2009/8/12 Koen Kooi <k.kooi@student.utwente.nl>:
> On 12-08-09 09:32, Graham Gower wrote:
>>
>> This combination of glibc-2.9 with glibc-ports-2.7 fails to build on
>> mipsel.
>>
>> I assume there is either a problem with the glibc-ports-2.9 on arm, or the
>> recipe was simply copied from glibc_2.7.bb without noticing that the ports
>> version was hardcoded.
>
> Actually there was no 2.9 ports release on the gnu mirror when I did that
> recipe. Feel free to fix :)
>
> regards,
>
> Koen
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


