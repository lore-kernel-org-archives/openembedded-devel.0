Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1LkFXp-0004ke-Ty
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Mar 2009 11:32:16 +0100
Received: by fxm20 with SMTP id 20so408396fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Mar 2009 03:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=XUbfgaJlELC2F6Xq9sGxCiq/6N+enRtTZHcHhMI59wM=;
	b=P9qvkJ1dTs8K2i1Qhr7hinS0IriVA1TdBnz9pRwu1s0AP3+aGZv54PJY5o9ljtABl3
	7bfUhjl2iGiA4r9pd9EC48x0xSUE/+JIoNHREetbxicxKUTV9ce3srEfKTUZlJbyHiuG
	wVV+0cMka8y8tIRf24dY4QFoRzhEMyPRqCN9Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=YhOXYMpCALj42Mlg2SX7O8cPlohl9bY6zuxinq/uU3RFlRH0KxGdQfG1NfwIsbePwF
	CG4jhaTXHxI3ENN+8wSbmoZzv6dDN987kTjOUERoaPmGCBnIIdOKnBG5MaQuz0weGM9c
	NZPJeBpPyUq5XSjBfJmM/7ZKyQ8ZqGT7l5P2E=
MIME-Version: 1.0
Received: by 10.223.120.197 with SMTP id e5mr1969263far.25.1237458675841; Thu, 
	19 Mar 2009 03:31:15 -0700 (PDT)
In-Reply-To: <20090318171248.GA25537@denix.org>
References: <1237328436.20770.57.camel@homestead>
	<d1b08f940903171633l7c66f604rfa6375bd95b2c3bf@mail.gmail.com>
	<20090318001624.GB20384@denix.org>
	<ac9c93b10903180121l3454a2adqbaac9590659daf76@mail.gmail.com>
	<20090318171248.GA25537@denix.org>
Date: Thu, 19 Mar 2009 11:31:15 +0100
Message-ID: <ac9c93b10903190331m307e5954web2c049fd94acee5@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.172
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Cleaning tmp folder
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
X-List-Received-Date: Thu, 19 Mar 2009 10:32:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

2009/3/18 Denys Dmytriyenko <denis@denix.org>:
> On Wed, Mar 18, 2009 at 09:21:53AM +0100, Frans Meulenbroeks wrote:
>> A crude temp solution could be to just remove the stamps of all
>> non-native, non-cross packages.
>>
>> Also if you only want to reclaim space I guess it is ok to remove the
>> work subdir (or at least in my case (beagleboard) the work/arm* dir)
>> If this is not right I guess someone will correct me :-)
>>
>> Btw: it would also be nice to have a command to purge the tmp dir, so
>> if X build for r0 is there and X build for r1 is there the r0 version
>> is nuked. Never got to writing something for that though :-)
>
> Speaking of purging tmp/work - you might want to look for
> INHERIT += "rm_work", which cleans work directory for every package, after
> it's built and staged/packaged.
>

Nice, but is there a way to overrule it on the command line.
Generally I'd like to have this, but when working on a new package I
typically like to have a look at the work dir too before committing
the new recipe.

FM


