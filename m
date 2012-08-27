Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T63Mi-0003uE-4I
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Aug 2012 19:44:49 +0200
Received: by eekb57 with SMTP id b57so1275424eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2012 10:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=qDudeV3SHtDtNs1P2uCbJJXgB3dllm8Bs0QOQYp7J5k=;
	b=oQ+MhFYtra29NUvnT6uCqkjpaTVvOuaYCfXOzgW8YTIo/2cr1a1U2ugXPsCz1aaPZ+
	hnD4pJKnebpESVk5eV/f1C3OLubbAJsiH37CBLCBOTWcZ/zGgAaZhLj1W4Rd1QsO81zc
	IbiZx36H+rB2zeCRsoxu+2JekxdddzsteqAj4kvJjBtpuHB+VsFX4C0a86e8as9eodsv
	UCiXbyI1yBPNFiaXTnQ2MT18rOPoCmvu5GHjYLkvJ3KmSTdW9QYBQiZJCrCi3YXsKh3m
	By0zHm2EI1h6VZsunSizM6fintPgDakh4lVIloteiHvqsjiRzmNqV/+yMzMamz7swKNa
	2AGg==
Received: by 10.14.5.67 with SMTP id 43mr18416919eek.15.1346088720706; Mon, 27
	Aug 2012 10:32:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Mon, 27 Aug 2012 10:31:30 -0700 (PDT)
In-Reply-To: <503B8DC7.3050909@gravedo.de>
References: <503B8DC7.3050909@gravedo.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Aug 2012 10:31:30 -0700
Message-ID: <CAMKF1sotij-SktKtd27iE+rNjU09XZYBQzNMssRpBZVK1myrOw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] udev without initscript
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
X-List-Received-Date: Mon, 27 Aug 2012 17:44:50 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 27, 2012 at 8:09 AM, Simon Busch <morphis@gravedo.de> wrote:
>
> recently I discovered that the udev version provided by meta-oe doesn't
> ship an initscript for sysvinit anymore where oe-core's version of udev
> still does. Is there a specific cause for this or is it just as
> everybody uses systemd theses days with meta-oe instead of sysvinit?
>

I guess people just use systemd since it was entwined in meta-oe before it spun
into its own layer.

> If there is not specific cause I will provide a patch to the initscript
> back for the versions of udev in meta-oe.


