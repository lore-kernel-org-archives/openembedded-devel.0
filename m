Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PIiae-0000gb-6v
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 15:02:24 +0100
Received: by iwn9 with SMTP id 9so34352iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 06:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=XDjzkYtKHzt/Rc/B0vI7iQ/jLHNqpbw1tlRpiS35ahE=;
	b=bZeQgBfhlfJNvna7HLwOBo5JuhhtKUYiSwkyG3Lr7w7B/k6vorhhL8NQqg0tAD4R2o
	+42apyJwZkZoTSORaaGGIllV1CL6akmy0Rgw9zK6nKS5gbtH0rEMnKmOl3FbCUGtrf1N
	sP3nCQ8nZRkMDpg2L3fakgYzzquF50xa3fc/8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=B3mEOCO0LkepH88wOj1vFc62KsInSVx2CKyl7A6/8kKSwJLLFvu5SenkLG1vtpVgRc
	VQ7vKQD76dIf66ud2gEdH+VZvWPXx5EkDKGqdEuFwsa62P6RhsgvQ8V4wHmHLDjvtReX
	ghaHhfhpzKdF0NDiEVuNj5YKX46hgQ6Sh7ejY=
MIME-Version: 1.0
Received: by 10.231.37.201 with SMTP id y9mr7044028ibd.76.1290002476833; Wed,
	17 Nov 2010 06:01:16 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Wed, 17 Nov 2010 06:01:16 -0800 (PST)
In-Reply-To: <4CE3D70F.2000101@gmail.com>
References: <4CE3D70F.2000101@gmail.com>
Date: Wed, 17 Nov 2010 15:01:16 +0100
Message-ID: <AANLkTin0i5rSxwA8Q3+jN7tLR-Rn3JEei6D==1CjKOh9@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Error: git was compiled without libcurl support
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
X-List-Received-Date: Wed, 17 Nov 2010 14:02:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/11/17 Marco Cavallini <koansoftware@gmail.com>:
> Hi, I just tried installing OE retrieving it from git
> git clone git://git.openembedded.org/openembedded
>
> bitbake version 1.10.0
> branch master
> MACHINE=akita time bitbake minimal-image
> DISTRO = "angstrom-2008.1"
> host machine : Debian lenny x86_64-linux
>
> I face to an unexpected error
> "Error: git was compiled without libcurl support"
>
> I successfully built it until November 2nd but since last Saturday I
> wonder if it should build or if is normal this behavoiur.
> log: http://paste.ubuntu.com/533450/
>

you're using git from the host, guess that got changed one way or another.

Frans


