Received: from mail-bw0-f219.google.com ([209.85.218.219])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NgmOv-0004wv-Qd
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Feb 2010 22:53:16 +0100
Received: by bwz19 with SMTP id 19so3063764bwz.28
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Feb 2010 13:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=mX5hCQXLHgxEJWeYTnvly7u+Vmq5V3bNJSJf2kImnOo=;
	b=CZEVsg8r/ivqYTmTl/QD7ResARZoox3w67jxJIGl40svcrYrvdst+uCgKIgT1WZvqx
	eK694rV/wx2Ly/7KXzycmlrEfAslu8GuyjHVjQvg9eijscW8Nqh6EnfaxK7W4h6fh3k6
	XGqQvhjYB39mwGydK/jLEigXvsEsnEm0z4UVo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=FVftGlVmVeBeGJ9nKwgAXBbqv3iWz7orIvenUbY7R9ZMycjUgPjZvZaqhUttAEUwhF
	ayQ1tiK5K5HPLN+u2iD1RQrCY/55ZfHa0DqFr7FrDW2MQYu/tMe62adey3NnBy6SoZMb
	xV06n4KospapdL82GeAfGT6LE7fo5PUx0mcu0=
Received: by 10.204.5.217 with SMTP id 25mr2690021bkw.114.1266184236532;
	Sun, 14 Feb 2010 13:50:36 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 13sm2385485bwz.14.2010.02.14.13.50.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 14 Feb 2010 13:50:33 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NgmPN-0001EW-Tp; Sun, 14 Feb 2010 22:53:41 +0100
Date: Sun, 14 Feb 2010 22:53:41 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100214215341.GL30265@mx.loc>
References: <b8e1ecc81002111744u4e9c2d84xc5cc1e3d2d1b3a0d@mail.gmail.com>
	<20100213152222.GA30029@mx.loc>
MIME-Version: 1.0
In-Reply-To: <20100213152222.GA30029@mx.loc>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.219
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: busybox* Fix URI
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
X-List-Received-Date: Sun, 14 Feb 2010 21:53:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 13, 2010 at 04:22:22PM +0100, Bernhard Reutner-Fischer wrote:
>On Thu, Feb 11, 2010 at 11:44:04PM -0200, Marcos Amorim wrote:
>>Hi All,
>>
>>I suggest move SRC_URI from all busybox_${PV}.bb for busybox.inc, but i dont
>>really if is possible.
>
>The patch posted here:
>http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-February/017232.html
>uses tar.bz2 and switches to new-style checksums. Please use that one
>and
>http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-February/017231.html
>instead.

These 2 abovementioned patches got applied now, so the patch in this
thread should be (please confirm):
Superseded


