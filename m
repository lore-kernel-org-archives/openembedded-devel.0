Received: from mail-yw0-f176.google.com ([209.85.211.176])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OLsUm-0001IW-Q9
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jun 2010 08:41:09 +0200
Received: by ywh6 with SMTP id 6so3557188ywh.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jun 2010 23:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=llN0OKJqc/KiE1Vn42mpFS8YEsPema3CAW43ycpzoDg=;
	b=VNBBoyjfnmrS4+N6OrBdExVGHyCYMu+hMDr42fwvMNs4yRtaFNsZZdmqeW4ZHPCyBI
	gMCplchgqb3ip8C1xcDdi0twB8SrjnOcy+D8rVF1GykHFlGPiKoRxcJhZAMFeSD/UpQG
	5PIe4nH1zkobcNTo28gncOQ7fV3urMSgBS8Zs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=sImZWZh5l0TiRt4J5NE8EVWcJqOUoNalc69NGswjUlb6s7GEnZ7SE9RzP+SmgmGXvY
	bE3PSalDT1XJqU/OgDYupsgu0JcECgfS7oq2DSvjp68Al4zLShR1O4Wr7I6fvSrwGSVC
	3MQqelEngKu9OxsHEKBMsVBqMYzyoNK8JWsmw=
MIME-Version: 1.0
Received: by 10.90.179.14 with SMTP id b14mr7648347agf.69.1275979007511; Mon, 
	07 Jun 2010 23:36:47 -0700 (PDT)
Received: by 10.90.88.14 with HTTP; Mon, 7 Jun 2010 23:36:47 -0700 (PDT)
In-Reply-To: <4C0D498A.4030709@mentor.com>
References: <4C0D498A.4030709@mentor.com>
Date: Tue, 8 Jun 2010 08:36:47 +0200
Message-ID: <AANLkTilJrzCr73GBdsGFgxQl4Gn7FAGj3Aytx1IrzYpS@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.176
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH, RFC] Add linux-libc-headers-native, make it default 	dep for native
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
X-List-Received-Date: Tue, 08 Jun 2010 06:41:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/6/7 Tom Rini <tom_rini@mentor.com>:
> On some host distributions the provided linux kernel headers are too old
> to compile utilities we need[1].  Given that we need these utilities to
> run things on the target the best solution is to provide
> linux-libc-headers-native.  Rather than get things into an inconsistent
> state, we make linux-libc-headers-native be a default dependency.
>
> [1]: A prime example of this would be mtd-utils-native and UBI

I'd say this is heading in the totally wrong direction.

Target code should not depend on host headers.
And if you need the target headers, you should depend on and use
linux-libc-headers.

I guess mtd-utils-native is used to make an mtd image for the target
and as such I would expect it to use the target headers.

What would be the difference between linux-libc-headers and
linux-libc-headers-native in the first place?
(and if there is a difference, I think a better package name would be
linux-libc-headers-cross).

Btw if say mtd-utils-native needs kernel headers to access host
functionality using headers for a different kernel version seems to be
a no-no either.

Just my eur 0.02

Frans.

PS: which distributions/distribution versions/kernel versions do have
this problem?
Ubuntu 8.04 (which has a 2.6.24 kernel) does not seem to exhibit this problem).


