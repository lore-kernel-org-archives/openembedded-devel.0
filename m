Received: from mail-fx0-f226.google.com ([209.85.220.226])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NgHm2-0002kA-5S
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Feb 2010 14:11:05 +0100
Received: by fxm26 with SMTP id 26so3378564fxm.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Feb 2010 05:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=u7/eQxheNeDhk6RDunVUGvaQ36ff1Ly4rqOFMRD5f9Y=;
	b=cOStU4aTobr4XNwjxUhsim77zswkOT51iA+6KGxT9xKO+/BrhRUcPAldfXZ2LsZVvo
	NTg0KIxfxrsoA9T3x5pJMQLOJgz1IOQR0TunthjPV2dleQRqVEPEbuCE1+tm7nlrexnL
	Y1vmoU1CtBA0mgliMFgAMLhB+KAcC/0GpvA88=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=XYKTpPrGhWs6IuppxpdR0ePaxhvRY1N0JQfrAI3Kegw0BQPKzOV3XFUOhJw1Blt9oi
	XMiBYEUleXBdJyhb7Gq46QpsKQnTg32G+0bTrh+9tP3qJpP0WBd3miIhDO+TaZEUy+oe
	v7WPUhxxtI4Fcygo0aR6R4bJhorBBfGWfJ/54=
Received: by 10.223.73.82 with SMTP id p18mr3117893faj.34.1266066500476;
	Sat, 13 Feb 2010 05:08:20 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 26sm7118480fks.7.2010.02.13.05.08.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 13 Feb 2010 05:08:16 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NgHm5-000237-Qy; Sat, 13 Feb 2010 14:11:05 +0100
Date: Sat, 13 Feb 2010 14:11:05 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100213131105.GL10632@mx.loc>
References: <1265832780-19939-2-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-3-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-4-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-5-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-6-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-7-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-8-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-9-git-send-email-rep.dot.nop@gmail.com>
	<hl12tg$meo$2@ger.gmane.org> <20100213125519.GK10632@mx.loc>
MIME-Version: 1.0
In-Reply-To: <20100213125519.GK10632@mx.loc>
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
X-List-Received-Date: Sat, 13 Feb 2010 13:11:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 13, 2010 at 01:55:19PM +0100, Bernhard Reutner-Fischer wrote:
>On Thu, Feb 11, 2010 at 03:06:42PM +0100, Koen Kooi wrote:
>>On 10-02-10 21:13, Bernhard Reutner-Fischer wrote:
>>> +PV = "4.999.9beta"
>>That seems to violate our versioning policy, you want something like
>>
>>PV = "4.999.8+4.999.9beta"
>
>the upstream tarball is (literally!) named 4.999.9beta
>
>According to http://wiki.openembedded.net/index.php/Versioning_Policy
>(it would be nice to be able to just refer to /Versioning_Policy, btw)
>this should be ok in this particular case, no?

nm.. I now see the pitfall that may imply if Larhzu would do another
intermediate release. Done and thanks!


