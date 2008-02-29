Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JV9ba-0004ED-Ne
	for openembedded-devel@openembedded.org; Fri, 29 Feb 2008 19:05:12 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1TI4H0q002634
	for <openembedded-devel@openembedded.org>; Fri, 29 Feb 2008 18:04:17 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02334-06 for <openembedded-devel@openembedded.org>;
	Fri, 29 Feb 2008 18:04:12 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1TI48gm002627
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Fri, 29 Feb 2008 18:04:08 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <c384c5ea0802290924i636e65dey9b6bfdceda20d17f@mail.gmail.com>
References: <1204303564.8126.38.camel@dax.rpnet.com>
	<c384c5ea0802290924i636e65dey9b6bfdceda20d17f@mail.gmail.com>
Date: Fri, 29 Feb 2008 18:04:10 +0000
Message-Id: <1204308250.8126.42.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE Staging ABI Change Warning
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Feb 2008 18:05:13 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2008-02-29 at 18:24 +0100, Leon Woestenberg wrote:
> excellent work and plan of attack.

Thanks :)

> The patch looks quite sane to me (although I'm not familiar with all
> the pesky little details), and found one thing that I couldn't grasp:
> 
> +++ classes/sdk.bbclass 3d79f34a1ba3589e0d005c39cdaa6758bf8507f4
> @@ -6,15 +6,15 @@ HOST_ARCH = "${BUILD_ARCH}"
>  PACKAGE_ARCH = "${BUILD_ARCH}-${OLD_PACKAGE_ARCH}-sdk"
> 
>  HOST_ARCH = "${BUILD_ARCH}"
> -HOST_VENDOR = "${BUILD_VENDOR}"
> +HOST_VENDOR = "${TARGET_VENDOR}"
> 
> Could you explain why this must be TARGET_VENDOR instead of BUILD_VENDOR?

Its a little bit hacky but there is a good reason. Basically you don't
want -native and -sdk packages in the same directory. If you don't
change that here, they will trample on each other in staging.

Poky's currently using that as a workaround and Poky makes the most
extensive use of -sdk packages the metadata has seen so its better than
the current position in OE.dev. I don't claim its the best solution
though ;-).

Cheers,

Richard



