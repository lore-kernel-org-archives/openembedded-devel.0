Received: from out1.smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vjensen@gmx.de>) id 1PbEKA-00040W-AA
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 16:33:54 +0100
Received: from compute1.internal (compute1.nyi.mail.srv.osa [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id BBE6120B79;
	Fri,  7 Jan 2011 10:27:21 -0500 (EST)
Received: from frontend1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Fri, 07 Jan 2011 10:27:21 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=IKxZiwi5qNnJNXBfMnZ5p5HWUKQ=;
	b=gyoBQVZLjDyOO2WAkHi1bAuXeMMYR8v4Y26hGp1c59KB9MMoNDSqs6Aa5VMT1O17CUhm4pEAZq0LM0wYd8xhwiIVvNSRJAlE/iTYE8hIpzBfek2OjDO4WW0LuOW+lHmwVM6Y/Rmnop5IkC4uDhVXmBnJJ2hxD4elAohE1YSBPbc=
X-Sasl-enc: T24z2rqsbOA87S13v6lrHetRMHSunUtot+i2nDS1rhxA 1294414041
Received: from [192.168.1.34] (hnvr-4dbd3c5d.pool.mediaWays.net [77.189.60.93])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 1A91340A809;
	Fri,  7 Jan 2011 10:27:20 -0500 (EST)
Date: Fri, 7 Jan 2011 16:30:11 +0100 (CET)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
In-Reply-To: <AANLkTik3-5x2W+DRTJ9bC0YnUQB9HbvSWEYLSMWLTPjZ@mail.gmail.com>
Message-ID: <alpine.LNX.2.00.1101071623480.6291@asterix.crazy-teaparty.dyndns.org>
References: <AANLkTik3-5x2W+DRTJ9bC0YnUQB9HbvSWEYLSMWLTPjZ@mail.gmail.com>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
Cc: yocto@yoctoproject.org
Subject: Re: Multiple Repository support
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
X-List-Received-Date: Fri, 07 Jan 2011 15:33:54 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

Hi Cliff,


On Wed, 22 Dec 2010, Cliff Brake wrote:

> Hello,
>
> I've started collecting ideas from various emails on multiple
> repository support.
>
> http://wiki.openembedded.org/index.php/MultipleRepositoryMethods
>
> Please feel free to update the above page.

I seem to have no account and only administrators may create one.

> In my mind, this is a key problem we need to solve, not just for
> Yocto/OE, but also for anyone doing product development.
>
> I've personally been using git submodules for most projects, and repo
> for Android based projects.
>
> Appreciate any ideas, experiences, or insights into how we solve this problem.

From the list mentioned in that page I only used git submodules so far. 
Handling could be simpler, that's right.  On the other hand there was work 
done in git regarding submodules, see

http://git.kernel.org/?p=git/git.git;a=commit;h=4bb4d30095fbc3b1689cc656e71f6a51e43fbd69

16-dec-2010.  So perhaps some of the bad things will be easier in the next 
release.

Vitus

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


