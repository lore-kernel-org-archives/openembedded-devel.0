Received: from mail-bw0-f213.google.com ([209.85.218.213])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NjY1R-0003q7-KK
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Feb 2010 14:08:29 +0100
Received: by bwz5 with SMTP id 5so1490817bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2010 05:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=7M3BI2LUuNxZO4FV/30oQAYGBul2LjyCDXtYY1ueB0I=;
	b=gypFphYrQK+7RnM1g95fVxEiTc/v56GNFszNzAnprocqZcWLQ3kX/iMF9h/nXDP3HX
	xPmfYGJrDhntAJzO5vCewH4F7YEkBqsYfJpTridZEDrpo/RtI6omN6Oq1tVYz5HNwtnQ
	so84sAqsRImFTzu30neDFV2bwbQbvK2T8cOks=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=bSlsFy63WqO88yOzrOvGhrw6FtX0AtYMm4hPkjvv9oT7+Iut5hZ23KtKrM3GRXNnjO
	tJBlLCha0MmV3G8H0+GWQyswPUZr3OYKv7z/9fVxMxup+RlARbQbzGxl13iumWqknF6K
	pr2QroULytKvO7cwLfjer8JOl5AEEZR9eCVsk=
Received: by 10.204.4.150 with SMTP id 22mr2692815bkr.192.1266843941875;
	Mon, 22 Feb 2010 05:05:41 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 13sm1105918bwz.11.2010.02.22.05.05.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 22 Feb 2010 05:05:40 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NjY3c-0007bM-T5; Mon, 22 Feb 2010 14:10:40 +0100
Date: Mon, 22 Feb 2010 14:10:40 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100222131040.GW30265@mx.loc>
References: <20100221164048.GU30265@mx.loc>
 <1266842451.1714.8.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1266842451.1714.8.camel@rex>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.213
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [BBCLASSEXTEND BUG?] Not taking virtual:native provider into account?
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
X-List-Received-Date: Mon, 22 Feb 2010 13:08:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 22, 2010 at 12:40:51PM +0000, Richard Purdie wrote:
>On Sun, 2010-02-21 at 17:40 +0100, Bernhard Reutner-Fischer wrote:
>> Hi,
>> 
>> I'm using bitbake 641e6cf3ec3ab4d26929cf4d2a3704ff07eed4d6 (current
>> HEAD) on HEAD of oe.
>> 
>> I'm adding:
>> $ cat recipes/git/git_1.7.0.bb 
>> require git.inc
>> SRC_URI[git.md5sum] = "c7553b73e2156d187ece6ba936ae30ab"
>> SRC_URI[git.sha256sum] = "a61e863944381c4f8231841f678f41f56b634bebca486a61005b35e5bcbb7c79"
>> DEPENDS = "openssl curl zlib expat"
>> RDEPENDS = "perl perl-module-file-path cpio findutils sed"
>> PR = "r0"
>> FILES_${PN}-dbg += "${libexecdir}/git-core/.debug"
>> BBCLASSEXTEND = "native"
>> 
>> (and add ";name=git" to the .tar in git.inc's SRC_URI)
>> and bake git-native and see:
>> DEBUG: adding .../recipes/git/git-native_1.6.0.4.bb to satisfy git-native
>> instead of
>> DEBUG: adding virtual:native:.../recipes/git/git_1.7.0.bb to satisfy git-native
>> which i get if i rm git-native_*
>> 
>> Assuming that the aboce recipe is correct in principle, this somehow
>> sounds like BBCLASSEXTEND'ed virtual:native never make it into
>> providers. What am i doing wrong?
>
>If a real git-native_xyz.bb exists it will be preferred to the
>BBCLASSEXTEND version.

Even if the BBCLASSEXTENDed version is higher than the
git-native_0.bb's? That doesn't sound too handy for i'd need to also
touch the old version :(

$ ls -1 recipes/git/*bb
recipes/git/git_1.6.0.4.bb
recipes/git/git_1.7.0.bb
recipes/git/git-native_1.6.0.4.bb

>I'm not sure why you'd want two versions?

For this git package i wouldn't want to, but there are alot of packages
that have numerous (legacy) versions used by some distros. I'd rather
not update all old recipes just because i happen to add a new,
cleaned-up version of a package. What do you think?


