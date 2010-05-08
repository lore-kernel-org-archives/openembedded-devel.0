Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OAopD-0000fe-B1
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 May 2010 20:32:32 +0200
Received: by wwc33 with SMTP id 33so31224wwc.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 May 2010 11:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=ziFKAH6gBd7D1Hpn89blF0z/vXYyDD11JpvtPWYokw4=;
	b=mW8vLh6+C4yMmg5pzr8TAAAS1TjzMMcheo9jVQTuzYQTG4dzlkucRUPtX6wcMzn1Ng
	TO1eP+zpP3qxRQeZ8x8IrU9tszbGFMC/g33SyM8s7ny/Mc6WvTIKuIhHGclX95xCCpnm
	kZapBFpNY94A93vmwhOWnjtNhMvnX4R/f+6jc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=UfCbwN8vQ3kBOFZbYIUwzSK5YLXk9n7s9xr/oZyCygbSj3Hhbao6ShhH1El1wMyG3U
	BWM8oZte/5zIXcGwXgHIURU+4hypWvFLi2E8ZeWAIq7bRanC7TzS3oxLtmMW5g6NumI+
	VVq4/yTJWV8dwoMJutPC7EE2QdUxAUOT/ch2M=
MIME-Version: 1.0
Received: by 10.216.172.21 with SMTP id s21mr1042425wel.165.1273343320531; 
	Sat, 08 May 2010 11:28:40 -0700 (PDT)
Received: by 10.216.49.206 with HTTP; Sat, 8 May 2010 11:28:40 -0700 (PDT)
In-Reply-To: <f96d234e1002250719v2c996ba4kd631051f29cba633@mail.gmail.com>
References: <f96d234e1002250719v2c996ba4kd631051f29cba633@mail.gmail.com>
Date: Sat, 8 May 2010 14:28:40 -0400
Message-ID: <AANLkTin_ibS2jkoYBHmAkt4loIh2LCTSJsdsEaXKJdqZ@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: make explosion while building attr
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
X-List-Received-Date: Sat, 08 May 2010 18:32:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

For the record, this is caused by setting the TOPDIR env variable
manually, and white listing TOPDIR for bitbake.  I modified the
recipes to clear this variable:

http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=b9788810a898534c6bf417c84b1babeff07ea508
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=531a874848130d8a746d2337f62ed2358f43f086

It would be really nice to be able to rename TOPDIR in bitbake to
something like BB_TOPDIR, so we don't run into this problem.  Perhaps
it is not necessary to whitelist TOPDIR to get BB to use it -- guess I
need to try that as well.

Thanks,
Cliff


On Thu, Feb 25, 2010 at 11:19 AM, Cliff Brake <cliff.brake@gmail.com> wrote:
> Has anyone seen anything like this:
>
> http://bec-systems.com/oe/attr_make_explosion.txt
>
> setup:
> org.openembedded.dev
> beagleboard machine
> 64-bit Ubuntu workstation
> PARALLEL_MAKE = "-j 4"
> BB_NUMBER_THREADS = "4"
>
> It runs my workstation out of memory and is downright annoying!
>
> Thanks,
> Cliff
>


