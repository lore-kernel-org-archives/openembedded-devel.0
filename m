Received: from mail-fx0-f226.google.com ([209.85.220.226])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NgJ7R-000678-VQ
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Feb 2010 15:37:17 +0100
Received: by fxm26 with SMTP id 26so3428782fxm.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Feb 2010 06:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=x4y0Kdnw91FaEj6mhnvsBySsCMGmGtTbv19O0YU4Bvg=;
	b=Pc1TqDsmV3jnNszHDKnBfdghAzq6Gwpyt7M4Mzv6ThiPU/wTmJjsM9yNuvyNlyu+HT
	UbZbV/+AgpdEWEursFrsRIOk8Z5lP4BCWtJeFCQLeIjfKfKFN7xPlbTpUEFTA1+YYkLB
	joOOxHWVrobl8bqkrrUx07LWG17rStC6YvVXI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Sp9waUxAEq7syRa3LyV+8/MCaAMcGg4neH5L+MUCRL5j2LgvFQ08mDOYRbln0vmC3r
	SLj5Dyynf278dZMZ+LcfhLgDO7erCkbTG9VnjWxFrWd7s22AZPbOir8F65mHa4q7/Hgt
	Ple1UlwpaeHEViPYgMd/loaFCp22VddOt5lvQ=
Received: by 10.223.145.150 with SMTP id d22mr3240870fav.23.1266071677283;
	Sat, 13 Feb 2010 06:34:37 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 18sm7244274fks.4.2010.02.13.06.34.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 13 Feb 2010 06:34:35 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NgJ7d-0007Tx-K1; Sat, 13 Feb 2010 15:37:25 +0100
Date: Sat, 13 Feb 2010 15:37:25 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100213143725.GP10632@mx.loc>
References: <1265832780-19939-3-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-4-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-5-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-6-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-7-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-8-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-9-git-send-email-rep.dot.nop@gmail.com>
	<1265892781.3777.1050.camel@mill.internal.reciva.com>
	<20100213125146.GJ10632@mx.loc>
	<1266067169.5437.18.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1266067169.5437.18.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.226
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 8/8] xz: add xz package
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
X-List-Received-Date: Sat, 13 Feb 2010 14:37:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 13, 2010 at 01:19:29PM +0000, Phil Blundell wrote:
>On Sat, 2010-02-13 at 13:51 +0100, Bernhard Reutner-Fischer wrote:
>> It would indeed. Can i somehow say
>> file1: SRC="http:://one.ext/one.tar.xz"
>>        SRC[md5sum]=md5
>>        SRC[sha256sum]=sha256
>>        or, perhaps it's the basename if there was no ;name=
>>        SRC[one.tar.xz.md5sum]=md5
>>        SRC[one.tar.xz.sha256sum]=sha256
>> file2: SRC="git://two"
>> inc: FOO_SRC ?= SRC
>>      SRC_URI += FOO_SRC
>
>I don't think this needs to be as complicated as you are making it.  You
>should be able to simply move your original SRC_URI verbatim to the .inc
>file, i.e.:
>
>SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.bz2;name=xz"
>
>and then, in the individual .bb files for each version, write:
>
>SRC_URI[xz.md5sum] = ...
>
>There's no requirement for the two things to be in the same file.  If
>you need to add other things like patches to the SRC_URI for a specific
>version, you can just write:
>
>SRC_URI += "file://..."
>
>in the .bb file in question.

But that would clash with _git, wouldn't it, unless, and only if this
exact sequence would be used:
.inc:=S ?= ${WORKDIR}/xz-${PV}
.inc:=SRC_URI=http
0815.bb:PV=0814+0815foo
0815.bb:require .inc
0815.bb:SRC_URI+=patch1
git.bb:S=${WORKDIR}/git
git.bb:require .inc
git.bb:SRC_URI=git

which we can obey to in this case, but it somehow feels brittle altough
it should work out fine in practise, i think.
>
>> Revised patch is attached, but:
>> it works for the 4.999beta9 version (literally, since that's how
>> upstream calls the tarball; Is this a problem with the version-naming
>> like Koon indicates?) 
>
>It rather depends on what upstream are going to do next.  If "4.999" is
>the number that they are using for pre-releases leading up to 5.0, and
>everything in the 4.999 series is going to be a beta (i.e. they do
>4.999.8beta, 4.999.9beta, 4.999.10beta, 5.0) then it is probably fine as
>it stands.  But, if there is any risk that "4.999.9beta" might be
>followed at some point by a version called just "4.999.9", or even
>"4.999", then that would be a problem because the latter version will
>sort lower than the former.

ACK, exactly. I follow Koon on this.
>
>> since: $ ls -a ../sources/git/ctrl.tukaani.org.xz.git/
>> .  ..  1  .git
>> 
>> "1" ?!
>
>That is rather weird.  I can't see any obvious cause for that from a
>quick inspection of the files you attached.

Just try it out, that package shouldn't interfere with any existing
recipe.
To my untrained eyes it sounds like a glitch somewhere in infrastructure
and not in those recipes, but YMV alot from mine in this respect :)
Insights?

TIA && cheers,
Bernhard


