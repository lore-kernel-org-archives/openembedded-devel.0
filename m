Received: from [74.125.92.149] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LcqVo-000336-BZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Feb 2009 01:23:32 +0100
Received: by qw-out-1920.google.com with SMTP id 5so776672qwf.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Feb 2009 16:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:organization:references:user-agent:x-url:x-attribution:date
	:in-reply-to:message-id:mime-version:content-type;
	bh=jvYaDKuyLp7AFjZCLKfqIOPKJO0WzR7jj1IAF0nP3Lk=;
	b=xY8XAbm21OvacepVblu3Cx5cmNdv/0hS859C3R3ag35xG1P3HuAq/4RQjlKbq/nENQ
	b/t4wjeWTJF0r4odLcbOdA0R8Zh6E7KrqzdBu6xjSF0mG1/+ajk4M006wcnGB9lYcuQO
	D3g2b1ouuXsNIuM9X/Zh0d3z9HnXWPhmm9lPE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:organization:references:user-agent:x-url
	:x-attribution:date:in-reply-to:message-id:mime-version:content-type;
	b=r5oylSUsc+uxHnZNGaZkW95l21QMbzWwoYPOcu6r2aMzIup9lROk5EPp7bzj4z1JeA
	e/Crj6aq7mMuAxuR1ohlZJ3e0S1h3FnZjDaQZR5FibPzmtLcs6Wdw73bNTSzMxZxDQCm
	njnH4Hq3zpoul/gIn1sbEuAbo/N18crc5w/yw=
Received: by 10.224.89.74 with SMTP id d10mr3224444qam.202.1235694009541;
	Thu, 26 Feb 2009 16:20:09 -0800 (PST)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 7sm88424qwf.50.2009.02.26.16.20.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 26 Feb 2009 16:20:08 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id E190A61010D; Thu, 26 Feb 2009 21:20:04 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <200902131728.08634.openembedded@haerwu.biz>
	<20090224064639.GE2172@smtp.west.cox.net>
	<1235492001.27962.60.camel@andromeda> <49A4203E.3060202@balister.org>
	<59251.AFRWVFwAXS0=.1235513405.squirrel@webmail.no-log.org>
	<1235514594.4890.525.camel@lenovo.internal.reciva.com>
	<1235552980.5399.10.camel@dax.rpnet.com>
	<20090225230412.GA25783@denix.org>
	<1235654920.6336.33.camel@dax.rpnet.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.90 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Thu, 26 Feb 2009 21:20:04 -0300
In-Reply-To: <1235654920.6336.33.camel@dax.rpnet.com> (Richard Purdie's
	message of "Thu, 26 Feb 2009 13:28:40 +0000")
Message-ID: <871vtkvih7.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: checksums situation
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
X-List-Received-Date: Fri, 27 Feb 2009 00:23:32 -0000
Content-Type: text/plain; charset=us-ascii

Richard Purdie <rpurdie@rpsys.net> writes:


[...]

> For checksum.ini I'm proposing we'd go through BBPATH and append all the
> checksum.ini files found together to form one large complete version.
> People's overlay/collections can then supplement the checksum data
> easily. There certainly isn't a technical reason I can see why this
> wouldn't work.

I fully agree that this is technically possible and even a desired
feature if we stay with a checksums.ini file however I fail to see how
it could help to solve the total mess we have in current checksums.ini
commits.

Even worse is the lack of a policy to add/change items there.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


