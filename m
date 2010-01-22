Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rk.raggit@gmail.com>) id 1NYE2e-0001rg-Cj
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 08:34:55 +0100
Received: by pwi4 with SMTP id 4so588465pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 23:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=Ugs1dN75ySXpXirl2UmRDn/poF5We3af+sZfK4l388Y=;
	b=LlEi3VuPof3oqePsXBRtrBVh7wRE2FJaMQBv7us3O51goea/Cl2zWiAdCEtWXOa7nW
	NjL7hlVqhItmiNev/jyxtJFRSN/pokQm7buOCM50uGhAfAwdH1G7CKwkaEHA/DXryFML
	oXu9dP6GpmKaDj3y9c5Hv6IlgjJSrUXA/fDjY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ldk7USWK1vwwj4qvY90zIKGmcsj4II+KyHUQRG89NvRNPjX260L9FVa1VCyDF5UaJb
	YjwzH6ygOtywFEzhoGX/TGZ9z5oubLvYFSjOGuhVe1Oz+8jpB9MQoLrdjg9UHdjQ2nbX
	38w/Li1BmwhXdUYGjI1rRYLOoWhAD4LBRc1y8=
MIME-Version: 1.0
Received: by 10.141.107.13 with SMTP id j13mr1823286rvm.172.1264145554140; 
	Thu, 21 Jan 2010 23:32:34 -0800 (PST)
In-Reply-To: <1264075631.9743.178.camel@mill.internal.reciva.com>
References: <ec1f3d400911270337wbbbcae8gab291075d242c9d9@mail.gmail.com>
	<19c1b8a90912100944g4b405319v6e121ebf03449f0b@mail.gmail.com>
	<ec1f3d400912110347x365c0873i9d03b58d02cbf735@mail.gmail.com>
	<19c1b8a90912110925k5e8063b7wdc160af7eb29fb2a@mail.gmail.com>
	<ec1f3d401001050143o2cdfb989x119ea3dd6352f4ed@mail.gmail.com>
	<19c1b8a91001050954m5f002c66s7a282c1382a2dcea@mail.gmail.com>
	<ec1f3d401001200350g9fb8480h1ed53a8ee4a90e0@mail.gmail.com>
	<19c1b8a91001201656g6fd1751bvc2a478b2d4c9ef8c@mail.gmail.com>
	<ec1f3d401001210353j1802eb6am9d931438e3db1302@mail.gmail.com>
	<1264075631.9743.178.camel@mill.internal.reciva.com>
Date: Fri, 22 Jan 2010 13:02:34 +0530
Message-ID: <ec1f3d401001212332i6062141ej86abe243cd7858d4@mail.gmail.com>
From: RK Raggit <rk.raggit@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: rk.raggit@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: cortex-a9 build failure at glibc
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
X-List-Received-Date: Fri, 22 Jan 2010 07:34:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

> That instruction is "ldcl 11, cr0, [fp, #-140]", which looks like a VFP
> double precision instruction.  Do you have floating point hardware on
> your platform, and is it enabled in the kernel?
>
> p.
>
>

You are right Phil. I have a Neon FPU but it was disabled in the kernel
configuration.I am able to boot and get a shell now.

Just for my knowledge, how did you translate "pc=4000673c" ,which could be
an address in a shared library, to an exact instruction like "ldcl 11, cr0,
[fp, #-140]" ?

Thanks
--RK

