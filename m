Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SP5Rg-0001q9-Tf
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 May 2012 07:16:17 +0200
Received: by pbbrq2 with SMTP id rq2so3839733pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Apr 2012 22:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=MeZRJXjvL7Kgi+nbTLNCcGKFEZ06xFSGMTGHEp56QXw=;
	b=Ra9bw+8Zdk73l7EPMJsC0qXqS12sdIdhR4FoGBa8+3zl2+ADjNXvxve7MIQYpZCQ3P
	T+1PVImjM6pzINGiuq8HFWIT1omBDtK3hdRBb2wP65iQ5/moNmdVOJ6fN6nb/eyTQmP/
	KbMQfZGrmWEhE51WMZhNygexAMnl2TC8V/0O3TK0qMBP97tI/MWNkL1IfAcvXp/DFyHG
	EH12dum8jRo0+qp1/7oprFr6SzFnS837AOk4CdUKShIsrI0iLpXGVCpGNhsOkBfTTfX8
	2X5UfC7ASQhPHHuOGsjbtBysmsuVS3HlCUKZFbj4i18LkaJRKQkHE4Y4F4aJ4iCGbE1x
	plYg==
Received: by 10.68.218.198 with SMTP id pi6mr21796188pbc.121.1335848793390;
	Mon, 30 Apr 2012 22:06:33 -0700 (PDT)
Received: from [192.168.1.104] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id pi10sm17172885pbc.9.2012.04.30.22.06.31
	(version=SSLv3 cipher=OTHER); Mon, 30 Apr 2012 22:06:32 -0700 (PDT)
Message-ID: <4F9F6F53.4050601@gmail.com>
Date: Mon, 30 Apr 2012 22:06:27 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120411 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F9A932F.1020400@gmail.com>
In-Reply-To: <4F9A932F.1020400@gmail.com>
X-Enigmail-Version: 1.4.1
Subject: Re: Openembedded and ld-linux-armhf.so.3
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
X-List-Received-Date: Tue, 01 May 2012 05:16:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 04/27/2012 05:38 AM, Martin Ertsås wrote:
> Hi.
> 
> I'm working on a pandaboard with OMAP4460. Were trying to use the
> newest PVR drivers, which conforms to the result that arose from 
> https://wiki.linaro.org/OfficeofCTO/HardFloat/LinkerPathCallApr2012
>
>  We have applied the patch at the bottom of that page gcc, and also
> a patch for making eglibc make ld-linux-armhf, and load
> ld-linux-armhf instead of ld-linux. Problem is, this gives us a
> kernel panic when it tries to run init. Linking ld-linux.so.3 to
> ld-linux-armhf.so.3 does not work, and we're kind of in the dark as
> to what is missing.
> 
> We tried fixing this by renaming the toolchain to be 
> arm-none-linux-gnueabihf instead of arm-none-linux-gnueabi, as we
> heard this might be a problem with hardfloats, but this needed a
> lot of extra patches, and some patchwork on other packages like
> openssl and shadow.
> 
> My question is, are there any ongoing plans to fix this, and make
> sure that if we have set hard float we make ld-linux-armhf in
> openembedded?
> 
> For the record we are using eglibc2.15 and gcc4.6 from
> openembedded-core.
> 

OK, I have cooked up something that you can try the top three patches on

http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/misc

is what you will need and make sure that you choose a tuning which asks
for callconvention-hard

- -Khem
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk+fb1MACgkQuwUzVZGdMxR2GQCgije/XES//4BWCHk8tXvXqA84
ugAAn0nXozwW8mCpqlmEcy1XhPt3lyFF
=tC7M
-----END PGP SIGNATURE-----


