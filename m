Received: from fg-out-1718.google.com ([72.14.220.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fat031c@gmail.com>) id 1OS010-0006xz-2i
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jun 2010 05:55:42 +0200
Received: by fg-out-1718.google.com with SMTP id d23so55462fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jun 2010 20:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:from:to:cc
	:references:subject:date:mime-version:content-type
	:content-transfer-encoding:x-priority:x-msmail-priority:x-mailer
	:x-mimeole; bh=VsGgIEINVep8wJR0I9jTKtsqfTb4xkEjksX67+Chcmk=;
	b=WPI1HbhcVmD7rxikuFTJGpSnJe9o89t8KAvewv3mtGJQl9KJZsZ0n1NwuISyZiBKHn
	dy+MRSFhSJwOZJt9DvsbbC1F3Ntj/ImCAREKhFjtOyWPfCN82yDwH5/oeEGZNyb7/bsy
	DRmh5MbW5Zl6lNo+CzwKTafP8ldC6gvvScWsQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:from:to:cc:references:subject:date:mime-version
	:content-type:content-transfer-encoding:x-priority:x-msmail-priority
	:x-mailer:x-mimeole;
	b=e3LRoyXeJRBSIfaKmN4boO4AT1I6soALmrs7M7uy8F5Irk0cx85lbIGSqSn84ku/DG
	yknkWRwt4iNJgtR/he6tAEXA7hjcBPAN4jHm+zlYS3OiB3lNjW7exjC6ZBVZwH0AvecC
	6F4n0T2QYeZM7q7fPxwjhCPRVVrSwDmrEUQpI=
Received: by 10.103.7.30 with SMTP id k30mr12614mui.24.1277437865939;
	Thu, 24 Jun 2010 20:51:05 -0700 (PDT)
Received: from atverdohlebov ([94.28.104.114])
	by mx.google.com with ESMTPS id w5sm12962835mue.59.2010.06.24.20.51.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 24 Jun 2010 20:51:05 -0700 (PDT)
Message-ID: <18D6E62E8C1C4021A7D301FE1448435A@rhonda.vtc.ru>
From: "Andrew Tverdohlebov" <fat031c@gmail.com>
To: <martin.jansa@gmail.com>
References: <3511CCD655164D0DACCECB9DE0506610@rhonda.vtc.ru><20100624151848.GD28292@gmail.com><B4EAD150EF8844DDB3676A4A9B08C120@rhonda.vtc.ru><20100625004612.GB27649@gmail.com><6A7B7034B0CC4B568C76BC153107D499@rhonda.vtc.ru>
	<20100625031129.GA17650@jama>
Date: Fri, 25 Jun 2010 14:51:00 +1100
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.5931
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.5931
X-SA-Exim-Connect-IP: 72.14.220.159
X-SA-Exim-Mail-From: fat031c@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	STOX_REPLY_TYPE autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: How to select specific version of dependant component
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
X-List-Received-Date: Fri, 25 Jun 2010 03:55:42 -0000
Content-Type: text/plain; format=flowed; charset="ISO-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit

>
> description in bitbake.conf
>
> # Overrides are processed left to right, so the ones that are named later 
> take precedence.
> # You generally want them to go from least to most specific.
> #
> # This means that an envionment variable named '<foo>_arm' overrides an
> # environment variable '<foo>' (when ${TARGET_ARCH} is arm).
> # an environment variable '<foo>_ramses' overrides '<foo>' but doesn't 
> override
> # '<foo>_arm' when ${MACHINE} is 'ramses'.
> # If you use combination ie '<foo>_arm_ramses', then '<foo>_arm_ramses' 
> will override
> # '<foo>_arm' and then '<foo>' will be overriden with that value from 
> '<foo>_arm'.
> # And finally '<foo>_local' overrides anything, but with lowest priority.

Ok, thanks. Good hint.
So if get it correctly _local ovverides a variable only for local 
configuration. Am I right ? 



