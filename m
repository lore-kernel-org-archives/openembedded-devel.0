Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1QJrwN-00007M-D6
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 20:45:51 +0200
Received: by fxm19 with SMTP id 19so5092397fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 11:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=JAAiLfNIS8hc1OLaepoN/eHYz9ix0t3iGrE4P0MRDAM=;
	b=eUEA3i/nPeV9NL8L3WFzTTElOvW5W+Fmv6XD7kdsTiPo9uSrPXDKwpLZY5uPUZQPrS
	C7xb7gBLL/+FdgVuOYFMZuWxXrnJrS0N1cdK3jg3IXW3F3RM7mixGpU8NyGL2y0vnQad
	e+ZMh2Y9twjdb73M+wEUyvDbfb/wYsCageJsI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=MU0hQEHYSS+vSg0C0TZURGkNvBUo0SwiZKluATnfVkisBPhA8LCyp+V4ArSduFP3bf
	o5FHAOwGsyjH9upuTUo1OX5nXO0ppXwu9q/664wTNNTm2RRElf9hpj2yUb2gWmZoyI/h
	1ltqSmRTtDYemRRz4h0v3lbi/LG3RdvRHBGmM=
Received: by 10.223.53.85 with SMTP id l21mr3826422fag.26.1305052985910;
	Tue, 10 May 2011 11:43:05 -0700 (PDT)
Received: from s42.loc (85-127-250-41.dynamic.xdsl-line.inode.at
	[85.127.250.41])
	by mx.google.com with ESMTPS id o20sm590353fal.1.2011.05.10.11.43.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 11:43:04 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.75)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1QJrty-0001Zl-3M; Tue, 10 May 2011 20:43:22 +0200
Date: Tue, 10 May 2011 20:43:22 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110510184322.GB7657@mx.loc>
References: <4DC8F3A2.2090005@nedap.com> <20110510100020.GA10493@mx.loc>
	<1305022004.8000.149.camel@phil-desktop>
	<20110510161532.GB10493@mx.loc>
	<1305049907.3355.99.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1305049907.3355.99.camel@lenovo.internal.reciva.com>
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
X-List-Received-Date: Tue, 10 May 2011 18:45:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 10, 2011 at 06:51:47PM +0100, Phil Blundell wrote:
>On Tue, 2011-05-10 at 18:15 +0200, Bernhard Reutner-Fischer wrote:
>> On Tue, May 10, 2011 at 11:06:44AM +0100, Phil Blundell wrote:
>> >"x86_64" seems to be what's currently used as the architecture name.  If
>> 
>> That doesn't work as arch-dependent e.g. append, does it.
>> 
>> FOO_append_x86_64 = '-mcpu=barcelona'
>
>It seems to work just fine for me.  What goes wrong for you?

It was OVERRIDES as Enrico mentioned.
Given that both khem in (IIRC) 2009 and me a year later stumbled across
the name and abandoned the thing in consequence, settling on an example
name would be nice -- nowadays i would just use amd64 but that won't
happen anytime soon, unfortunately.
Both patches should be in the old patchwork, for reference.

cheers,


