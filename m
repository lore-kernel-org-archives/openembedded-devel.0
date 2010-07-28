Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OeAc1-0005Iq-8I
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 19:40:14 +0200
Received: by fxm12 with SMTP id 12so1431322fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 10:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=FfMSYgizNZiKK4zHXCCHRmvXxxQ8HRoH42Wqgar6l9U=;
	b=Wl+wvFKudJri6iRz3PAT1OjFzRowztE5S5yD5iYFIFBADmPzpTIU8z6Gi3YHW8QHCa
	OyZM3zbkuSyW7ZHRuI6ln5rM71nUBRg9yvJqziJcNldKdd7nyApcaO/f9UebpSAwdzf1
	5ya8lJ5A8cVTuToGnpI9HuCmvTTq/ekQ3AaW0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=sYGZTIEQLpKLc0ON3ncNMqH2ohTk7/gOWtW6C0sU2PYyyFOQQaQ/wSg66PPj0sTsk9
	x2d4NIR5vEpEXkgYO2CvMonUB833uiLm2b44eVl0IpE6TvuHDK8DF4kulIjRlVnQCrCE
	hQ/a5zqPKBGWVNun1t+n4PTz6VgnByvVGHM+M=
Received: by 10.223.123.79 with SMTP id o15mr9679554far.12.1280338794369;
	Wed, 28 Jul 2010 10:39:54 -0700 (PDT)
Received: from s42.loc (85-127-241-5.dynamic.xdsl-line.inode.at [85.127.241.5])
	by mx.google.com with ESMTPS id d15sm1833028faa.1.2010.07.28.10.39.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 28 Jul 2010 10:39:53 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OeAbZ-0006qg-SS; Wed, 28 Jul 2010 19:39:45 +0200
Date: Wed, 28 Jul 2010 19:39:45 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100728173945.GD19135@mx.loc>
References: <20100716213929.GI23169@mx.loc>
	<1280337265-25582-1-git-send-email-rep.dot.nop@gmail.com>
	<i2pokl$7iu$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <i2pokl$7iu$1@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][v3] gcc-cross: fix PV and make it compile
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
X-List-Received-Date: Wed, 28 Jul 2010 17:40:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 28, 2010 at 07:16:05PM +0200, Koen Kooi wrote:
>-----BEGIN PGP SIGNED MESSAGE-----
>Hash: SHA1
>
>On 28-07-10 19:14, Bernhard Reutner-Fischer wrote:
>
>> -PV = "4.6+svnr${SRCPV}"
>> +PR = "4.6+svnr${SRCPV}"
>
>NAK, PV = "4.6+svnr${SRCPV}" is the right thing to do

ok what should i do then?
I want to use the svn version of gcc regardless of it being called
"1.2.3-svn" or "5.0.0-svn" so i put this into my local.conf:

#PREFERRED_GCC_VERSION = "4.4.4"
PREFERRED_GCC_VERSION = "svn"

But that obviously doesn't work with a PV of "4.6+svnr${SRCPV}" like
current git has.
I made up that "svn" intuitively, with the following reasoning:
i'm using the subversion version (_version_, hence PV)
with an arbitrary revision as Package Release that will sort correctly
iff a 4.6.0 release would be made.

Now how am i supposed to pick "svn" if not by using "svn"?

thanks for clarification,


