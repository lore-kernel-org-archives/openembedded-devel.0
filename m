Received: from mail-fx0-f225.google.com ([209.85.220.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Nghsp-0006T4-5S
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Feb 2010 18:03:50 +0100
Received: by fxm25 with SMTP id 25so2191412fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Feb 2010 09:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=PxysodYPYoWjwNu0A4i2/uAw4JPgq2ZmlYZIj4ybeyI=;
	b=wc46vzIjJqF6i3S9BtosTuzN/MG33aJU5hEyPnL0xq7QezWYpYgmTCbkakyLX5m1kg
	nDwVHPx+PP2cBhH/HDSxN9bvZw5G4ofxBB8inXBFB26gj0yb9Hzg1g6CIXY0T+pLwWD5
	iekS1DRvATI+Zs8cb4FotlaBkTJs6ywvS7e34=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=hBbPMMhcWL1olQ5xoK1HTAJn58VOSQCoIy7okoPhUUiRV6nAKLD3sdgZYH0tGicG5t
	NV8n4hIS4ES9LWTaajz5geapCjSuf7CVdaXwVjfGITGAM2ary0FK/ePDQNbdc3BXSGIx
	RoXVtJlhfc9Uf2rvXnbcV65SmUkbAFomker8U=
Received: by 10.223.143.71 with SMTP id t7mr4669872fau.38.1266166870143;
	Sun, 14 Feb 2010 09:01:10 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 22sm8680767fkq.54.2010.02.14.09.01.09
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 14 Feb 2010 09:01:09 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NghtH-0004tH-0h; Sun, 14 Feb 2010 18:04:15 +0100
Date: Sun, 14 Feb 2010 18:04:14 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100214170414.GG30265@mx.loc>
References: <20100214142309.52217185B3BB9@dd20204.kasserver.com>
MIME-Version: 1.0
In-Reply-To: <20100214142309.52217185B3BB9@dd20204.kasserver.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.225
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: How to sane replace a path in a pkgconfig file ?
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
X-List-Received-Date: Sun, 14 Feb 2010 17:03:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 14, 2010 at 03:23:09PM +0100, bernhard.guillon@opensimpad.org wrote:
>Hi all,
>currently I am working on fixing blackbox. I had to add a lot of includes to fix compiler errors.

I have an import of the CVS tree here, fyi:
http://git.busybox.net/~aldot/git/blackboxwm/
http://git.busybox.net/~aldot/git/bbkeys/

There were a couple of debian's patches applied (still by brad), i'd
recommend to use all blackbox-0.70.1..master patches and base off that.

HTH,


