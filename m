Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PnsW9-0001Q8-Tr
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 13:54:34 +0100
Received: by iyj8 with SMTP id 8so2356146iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 04:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=DtK6MLROM9DxtuUEcP+JVnhxXo0UoBXzb8fHHKxbJoQ=;
	b=M7oFaRzO97tyNeQ/IwYn+ipVeVU7d23p4O7qHz6lkpd3ysOrXqSnniqT9ZZscHekfx
	0nVIpclKJJVQn6p7EfHYVUcaEok/zf2EfHePSnVcOFNiwaNJzT/HkHO81S+MS9iQRGO4
	rZI6Vie1ADi8qDGJeM8vIAuwn1JakJ4YuNFcE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=J0KXuhx7cC7khr2d/M8ctljaxSPtbyylsAojhsGMEf5XJi8Ybst6LBR/hdjeRpmdUG
	yp2MWwVuA+KgsrA44npO5hfzoVTMPotCzFX4RlySqSwWYjgC8IH1cRWOpXEBgmB9dZ7r
	vxvAFPsGjAOSw/9TpKTFTMez8nauPfOxIkCGc=
MIME-Version: 1.0
Received: by 10.231.39.201 with SMTP id h9mr325992ibe.147.1297428806643; Fri,
	11 Feb 2011 04:53:26 -0800 (PST)
Received: by 10.231.30.73 with HTTP; Fri, 11 Feb 2011 04:53:26 -0800 (PST)
In-Reply-To: <4D550B17.6000607@atmel.com>
References: <4D51566B.9060603@mentor.com>
	<20110209100249.GG28019@excalibur.local>
	<4D550B17.6000607@atmel.com>
Date: Fri, 11 Feb 2011 13:53:26 +0100
Message-ID: <AANLkTinxsHq86KY7xBBd4=iJmG3Xcz_8nx3Ex0hHHM=P@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: OpenEmbedded 2011.3 Release: Request for targets!
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
X-List-Received-Date: Fri, 11 Feb 2011 12:54:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/2/11 Ulf Samuelsson <ulf.samuelsson@atmel.com>:
> Stefan Schmidt skrev 2011-02-09 11:02:
>>
>> Hello.
>>
>> On Tue, 2011-02-08 at 07:42, Tom Rini wrote:
>>>
>>> As March is fast approaching I want to gather the list of DISTRO /
>>> MACHINE / BBPKGS targets that the various distributions would like
>>> to see at least compile tested (volunteers for HW testing welcome!).
>>
>> I will do compile and runtime testing on bug20 (omap3). Targets would be
>> console-, minimal- and bug-image-production. The later one includes the
>> complete
>> oenjdk-6 stuff with zero as JIT, the osgi recipes and much of the normal X
>> and
>> linux stuff.
>>
>
> I think that for the AT91 the three most important targets are:
>
> AT91SAM9M10EKES
> AT91SAM9G20EK
> AT91SAM9263EK
>
> I noted that when I added the gpe-mini-browser2
> to my image, the boot fails.
>

If there is room left, we have interest in:

calamari/minimal/console-image
mpc8313e-rdb/minimal/console-image
nslu2le/slugos/slugos-image
nslu2be/slugos/slugos-image

I'l try to set up something here as well, but not sure how often I can
run it (and check the results).
(it would be nice if the QA issues in the first two images are solved,
because then I can use the result of bitbake  to check, now I need to
fetch all the logs)

Best regards, Frans


