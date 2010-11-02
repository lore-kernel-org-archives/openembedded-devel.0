Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PDAu6-00037H-VP
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 08:03:35 +0100
Received: by iwn42 with SMTP id 42so7671656iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Nov 2010 00:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=6EoXuWEtaHmTEyC9Wft1A9Gk04XFUAQTvOYfeAxlV7M=;
	b=IH+WRZH7VyRDMzXbcBBVcC6uzyWeOvtOtSkexJz+G1FjVOhTfVs3il/taN28QcAZ6M
	HRoqijN139F1Rkpg5BXAs80Lxrg1GGVP0FwRZLkxTlbU5DY7Zc9/ePBAFfgCyXypQhZD
	gJ7iI0pLD7KZfHgi7jhG5WXJIzAh6efoQKDhM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Bs/R0u9rCiGgvHvB6X3e538Oc74SgGdK7Sd2ndRz3VbY59HNSDiIb5LE0Ip55E9Ngu
	j3PPq2TLxq0iHZKavKy1HRtPPGNb9t8fYXYGLmo0DLK9lQZJoDRtRCBGyTUGBzgROmp2
	joJ4abyTFPJv+MR7dh7fDn/Cneq4Y/001U2nw=
MIME-Version: 1.0
Received: by 10.231.152.143 with SMTP id g15mr1305538ibw.76.1288681365784;
	Tue, 02 Nov 2010 00:02:45 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Tue, 2 Nov 2010 00:02:45 -0700 (PDT)
In-Reply-To: <i9p1d0$7q4$1@dough.gmane.org>
References: <i9p1d0$7q4$1@dough.gmane.org>
Date: Tue, 2 Nov 2010 08:02:45 +0100
Message-ID: <AANLkTimRY+gDbK9jZvUEuxMAu3PvQ8pnfb3oXjAXeU0B@mail.gmail.com>
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
Subject: Re: [RFC] turning conf/machine into a set of bblayers
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
X-List-Received-Date: Tue, 02 Nov 2010 07:03:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/21 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> Recipes/linux is a mess and recipes/u-boot is as well. It would be a
> nice topic for OEDEM to see if we discuss switching to a poky BSP model.
> It would boil down to:
>
> 1 base bblayer with shared files:
> * conf/machine/include
> * recipes/linux/*.inc
>
> 1 bblayer per machine or SOC_FAMILY containing:
> * machine.conf
> * first and second stage bootloaders
> * kernel
>
> So, what are peoples thoughts on this? I haven't thought this through
> myself, so feel free to point out any show stoppers.
> I do not want this to turn into a "splitting the metadata" discussion,
> while I'm all for that, it really is a seperate effort and discussion.
> But any bblayer style split would benefit from OE being a collection of
> git submodules instead of a monolithic tree[1].
>
> Regards,
>
> Koen
>
> [1] Provided git submodules stop sucking so hard in future git versions

Replying on the original message on purpose.

Is the discussion concluded?
How do we proceed with this? Should we have a vote? escalate to TSC?
postpone until after the dec 1 release? already do something in a
branch?

Personally I am in favour of the idea.

Best regards, Frans


