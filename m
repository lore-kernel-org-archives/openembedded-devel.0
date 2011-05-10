Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1QJpdK-0005YP-Jp
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 18:18:02 +0200
Received: by fxm19 with SMTP id 19so4979293fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 09:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=LY6A+dXEHdJuNFn0pVpM8HgFxf22gdqWrN59Ahl2HSc=;
	b=eQwnNvDJ/IElqVsU9touGppjkr7fxI+cv3sBgtUtR3fs1atr/s1jhBpWohrxXp0mBe
	E+6U6OQnjBTOCnkeMskRQSxir1Bi1ScAQQ9eQvit1zonVq4fXyF0a2sDBANl+ZdLoiLy
	P+jf1LeXf7uqz4earZk5tLKjzyx/B0xADSfH8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=rkrmMAFCHsoYeZgNn3sdac/sx5SnrBGbkLwDikUlYdFeaklrLGLFQa6c2GxzYTwwkc
	pswGW2wOfDG1rRWRsum/bS9KfdHN7dOvsJTwQGScLM6cGH0sh5JPrXwZt46ZafQ6wJs2
	bTt5TeM+FJoggh4jvZZvY9XA3a2brYLHAPwG4=
Received: by 10.223.86.130 with SMTP id s2mr887968fal.115.1305044116825;
	Tue, 10 May 2011 09:15:16 -0700 (PDT)
Received: from s42.loc (85-127-250-41.dynamic.xdsl-line.inode.at
	[85.127.250.41])
	by mx.google.com with ESMTPS id p16sm2443108fax.21.2011.05.10.09.15.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 09:15:15 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.75)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1QJpau-0004dE-K1; Tue, 10 May 2011 18:15:32 +0200
Date: Tue, 10 May 2011 18:15:32 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110510161532.GB10493@mx.loc>
References: <4DC8F3A2.2090005@nedap.com> <20110510100020.GA10493@mx.loc>
	<1305022004.8000.149.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1305022004.8000.149.camel@phil-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: x86_64
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
X-List-Received-Date: Tue, 10 May 2011 16:18:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 10, 2011 at 11:06:44AM +0100, Phil Blundell wrote:
>On Tue, 2011-05-10 at 12:00 +0200, Bernhard Reutner-Fischer wrote:
>> On Tue, May 10, 2011 at 10:13:22AM +0200, Jaap de Jong wrote:
>> >Hi All,
>> >
>> >is there any support for 64 bit intel/amd machines?
>> >And if so, how to build for them?
>> 
>> Can we settle on a name please for i want to add a qemu machine for
>> testing x86_64?
>> 
>> x8664
>> amd64
>> ...
>> 
>> Opinions?
>
>"x86_64" seems to be what's currently used as the architecture name.  If

That doesn't work as arch-dependent e.g. append, does it.

FOO_append_x86_64 = '-mcpu=barcelona'

>you want a value for ${MACHINE} then I guess something like
>"x86_64-generic" would do.  I don't think there's any prohibition
>against underscores in machine names.

Well, I was talking about the arch.


