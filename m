Received: from [74.125.92.146] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MrLHj-0002jS-2e
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Sep 2009 02:37:14 +0200
Received: by qw-out-1920.google.com with SMTP id 4so1121114qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Sep 2009 17:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type;
	bh=O82PBMpEYn2mCJwAoBIWkLdLlpKmANGTFZFWfKnvNSE=;
	b=oCVB+QBjdQUfR4fWh9IHStrt565Nry0bUGXRoXe57gk9SHt9ehzLE9+hB/PSZ9CPOZ
	wNTAMrUfbhYQINEd6YI61Shtpn5kbnDl4SyGkCUTg137+ht4bNAHALnDm5bA8Su8BJWZ
	HAv6cyBFLwlN81O3ndGWD7oQlRqsPTCxcMqwA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=cRF3dibL25vY+Nh1nXq7ZRdOckx54eSTT/ZDI4AF7vr4ljDzEqimZ85vxl6S5eqYfK
	d5FrdOwZDpC1D79eNapThNG9CPEFlPfJP6zZxbcXDe9ZxiEGlcJQGKvMhq/okslLm4mi
	Nq5lcjtjMrH5t+5oiVApHe33rLmJ5cIReI89c=
MIME-Version: 1.0
Received: by 10.229.10.13 with SMTP id n13mr683272qcn.103.1253925392425; Fri, 
	25 Sep 2009 17:36:32 -0700 (PDT)
In-Reply-To: <4ABD47B1.1030108@palm.com>
References: <4ABD47B1.1030108@palm.com>
Date: Fri, 25 Sep 2009 17:36:32 -0700
Message-ID: <19c1b8a90909251736m691e910ct6f668b46e197862c@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.92.146
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: "openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
Subject: Re: colons in BBPATH
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
X-List-Received-Date: Sat, 26 Sep 2009 00:37:14 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 25, 2009 at 3:44 PM, Rich Pixley <rich.pixley@palm.com> wrote:
> How do I get a pathname into BBPATH which contains colons?
>
> Eg, my directory name is "2009-09-25T15:30:52/oe"...

havent tested myself but escaping colons might work. like using  \:

>
> --rich
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


