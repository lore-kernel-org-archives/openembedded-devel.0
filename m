Received: from mail-fx0-f226.google.com ([209.85.220.226])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NgHWe-0008RK-SG
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Feb 2010 13:55:11 +0100
Received: by fxm26 with SMTP id 26so3369919fxm.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Feb 2010 04:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=pWp7sT9aLCs0BGcITrEvj4RgDeEKCU0hIvau4foqKL0=;
	b=CvQ7BSFk/aWJn7wx+HlJN3W3tsytWhe3udlPgkXPdGuJ3ByWf1ORVCKdpkXLwyVp0+
	0iystoYxAiBi3yqWJzWXSWZuYxDNPptYcQpMhdV0C2Ff6xYZJHiwLqQBdN/+5kWZSWH2
	VE/BknsRIg0mdS3G9ZUnSP5CoqROuV00c7/nM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=cX5G9J5xLYdkwVK91TXiE0VUQfSFNbzPJF6uHP+1iuXJloLgPC7YRDixVOlJjAFEQK
	/9fBL4U1pAQh97ufpvgA1bdBerD00M1O7yRQFohkC0D31LLZEovSQbpYZrg8RAm1Gcq8
	C1JXNG/bZ7YdESPmgYgS+wACtB9WxpkS/yUSk=
Received: by 10.223.5.81 with SMTP id 17mr3199814fau.3.1266065552822;
	Sat, 13 Feb 2010 04:52:32 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 13sm7098259fks.33.2010.02.13.04.52.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 13 Feb 2010 04:52:30 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NgHWp-0001sD-EH; Sat, 13 Feb 2010 13:55:19 +0100
Date: Sat, 13 Feb 2010 13:55:19 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100213125519.GK10632@mx.loc>
References: <1265832780-19939-1-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-2-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-3-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-4-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-5-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-6-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-7-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-8-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-9-git-send-email-rep.dot.nop@gmail.com>
	<hl12tg$meo$2@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hl12tg$meo$2@ger.gmane.org>
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
X-List-Received-Date: Sat, 13 Feb 2010 12:55:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 11, 2010 at 03:06:42PM +0100, Koen Kooi wrote:
>-----BEGIN PGP SIGNED MESSAGE-----
>Hash: SHA1
>
>On 10-02-10 21:13, Bernhard Reutner-Fischer wrote:
>> xz is the lzma successor
>
>> +PV = "4.999.9beta"
>
>That seems to violate our versioning policy, you want something like
>
>PV = "4.999.8+4.999.9beta"

the upstream tarball is (literally!) named 4.999.9beta

According to http://wiki.openembedded.net/index.php/Versioning_Policy
(it would be nice to be able to just refer to /Versioning_Policy, btw)
this should be ok in this particular case, no?


