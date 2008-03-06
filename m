Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JXFRu-0002kf-Vi
	for openembedded-devel@openembedded.org; Thu, 06 Mar 2008 13:44:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m26CgLBM001937
	for <openembedded-devel@openembedded.org>; Thu, 6 Mar 2008 12:42:21 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01624-07 for <openembedded-devel@openembedded.org>;
	Thu,  6 Mar 2008 12:42:17 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m26CgCWU001930
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Thu, 6 Mar 2008 12:42:12 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <47CD7E84.9010603@student.utwente.nl>
References: <1204303564.8126.38.camel@dax.rpnet.com>
	<47CD7E84.9010603@student.utwente.nl>
Date: Thu, 06 Mar 2008 12:42:11 +0000
Message-Id: <1204807332.8034.0.camel@dax.rpnet.com>
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
X-List-Received-Date: Thu, 06 Mar 2008 12:44:24 -0000
X-List-Received-Date: Thu, 06 Mar 2008 12:44:24 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2008-03-04 at 17:53 +0100, Koen Kooi wrote:
> Richard Purdie schreef:
> | Hi,
> |
> | OE.dev is now just about ready to switch to using sysroot. The compilers
> | have been updated to activate sysroot and the fixes I/Poky have for
> | various pkgconfig issues have been committed. The final change is to
> | actually change the layout.
> |
> | I've attached the patch I have locally for doing this. Since it changes
> | the layout of staging I've gone for changing the ABI and warning users
> | using the newly added mechanism.
> |
> | insane.bbclass will warn about potentially problematic .pc files and I
> | suspect a few people will hit that since there are a lot of broken ones
> | around. I'll give a summary of the problem and the way to solve it:
> 
> When are we going to make insane halt on .la files referring to
> ${WORKDIR}? Right now those are the biggest problem for packaged-staging
> and rm_work.

I don't remember seeing too many warnings about these? Are there many
problematic packages?

Cheers,

Richard



