Received: from mail-yx0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NTNWY-0000er-5n
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jan 2010 23:41:45 +0100
Received: by yxe1 with SMTP id 1so18529797yxe.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jan 2010 14:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=HJEeovISUzoM8zewU+p/jsbtXTtlxDUbFv7jSVi4Dbg=;
	b=RuSsEwMEm/h/nlDBTLTpHQt/4lWEtT3jH+S1OH6Y/8guPaQmZQg/UZa4PWpUBQdG3x
	nfgPOB+nbAktnNEzwv25gVtuk4DoobtHyawJj9dPfDe0s1K+Yln6J2OTA0oq+6QthUdI
	ueICZwtq+ahodB+R8D5vzm64Z7LXBzRW0Y4/4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=da6bmyEeOdSwa4lb5ijs0npwfHoY0kvotcSK6SKlQysZUjSzr0uOjSNW6lvTSemuV/
	W7RgzP5zIO1w04EZn7xZ5A7eIe6ao2kN8V8zqm7ThCTY5lmRDLzZfVHgxMqGtWfw8ePY
	9PeKsZDsA2TG6tESdKESFIjzX9C1T6OZjtFQ0=
Received: by 10.101.63.3 with SMTP id q3mr21390525ank.155.1262990375264;
	Fri, 08 Jan 2010 14:39:35 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 4sm8127096ywd.29.2010.01.08.14.39.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 08 Jan 2010 14:39:34 -0800 (PST)
Date: Fri, 8 Jan 2010 14:39:15 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100108223915.GA29981@gmail.com>
References: <1262986639.11887.8.camel@fred.uchi.de>
MIME-Version: 1.0
In-Reply-To: <1262986639.11887.8.camel@fred.uchi.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.210.171
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Remote Debugging
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
X-List-Received-Date: Fri, 08 Jan 2010 22:41:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (08/01/10 22:37), Joerg Eesmann wrote:
> Hi there,
> I am trying to remote debug my Openmoko freerunner.
> I already installed succesfully gdbserver, and can attach it to the
> progem I am going to debug.
> The question is, what to do on host side?
> I bitbaked gdb-cross-sdk, I bitbaked my changed package (bluez4)
> So I will install a debug version of the package, and attach to the
> bluetoothd-demon.
> On host side, I guessed I needed a gdb, that can handle ARM-processor,
> therefore gdb-cross-sdk.
> Now I should have everything... but a few questions left.
> GDB ist only ipk-package, what to do with this?

you need gdb-cross once you build that you should be able to use it
from same place as cross gcc.

> Where do I find the arm-compiler bluetoothd on my host (I guess in work,
> but will this be the strippded version or not, because also stripped
> package has been made).
> Am I on the right way? Is there any howto or something like that
> availlable, where you could point me?
> 

if you build it then the non stripped version should be there in 
your workdir (where the package was built)

-Khem
> thank you for your help in advance,
> best regards,
> Joerg
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


