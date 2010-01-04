Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NRrQ0-0006xe-Ea
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jan 2010 19:12:43 +0100
Received: by fxm4 with SMTP id 4so12769947fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2010 10:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=MJWhhTevD/reDS5KU1aUQx5YoDIgjlVgsJ7vXaDOiYw=;
	b=oanW7Li5zDM9FOOjPB21amoTa5CTWBw4xdfxWaOZKmFcSYrWEInWTx7ZDux1p2axXj
	Aecj9HVcMIX63yhW3kBULeH6EPeCzjJKX3BSBaJWGn4q/cTUMh/o0oG8kv2d9DLqjtoD
	UiSB7GLprGGCqUhmRPiOmz9zNP8X1PXn3V9nw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=EJRmHmuMV38541rikirpAg9ex5dtXthMdeIYn56pg4pQkSUvotMQ349ExadCo1ThWK
	IjUcyEpoUqcOjUneDn5bzGhZCEKw73s7sNbp1rala5UK0mTf6VjWYpIZjFXGW2VgFvku
	DVTJnxw67zHFvQwJ3JUT58/Qm/vpHrKJEmYR4=
Received: by 10.87.44.39 with SMTP id w39mr21117956fgj.17.1262628637182;
	Mon, 04 Jan 2010 10:10:37 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id d4sm43195128fga.21.2010.01.04.10.10.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 04 Jan 2010 10:10:36 -0800 (PST)
Date: Mon, 4 Jan 2010 10:10:57 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100104181057.GA4326@gmail.com>
References: <op.u5mp87ximn1qzu@guohr-laptop-ubuntu>
	<19c1b8a90912281053u2ebb8e62k313b1c41f99462f6@mail.gmail.com>
	<op.u5sogndnmn1qzu@guohr-laptop-ubuntu>
MIME-Version: 1.0
In-Reply-To: <op.u5sogndnmn1qzu@guohr-laptop-ubuntu>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: compilation of gcc-cross-intermediate-4.4.2 failed due to lack of fenv.h
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
X-List-Received-Date: Mon, 04 Jan 2010 18:12:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (31/12/09 16:56), Guo Hongruan wrote:
> I am afraid that the failure is not so easy.
> 
> Today, I recompile the following builds:
> MACHINE=qemux86 DISTRO=micro-uclibc
> MACHINE=qemuarm DISTRO=micro-uclibc
> MACHINE=qemumips DISTRO=micro-uclibc
> 
> only qemuarm works. But the problem is that the uclibc configuration
> in qemuarm building has not defined UCLIBC_HAS_FENV, and the
> configuration options of gcc-cross-intermedia lacks
> --disable-decimal-float. So according the previous analysis, the
> qemuarm building should failed and reported the same reason.
> 
> Why did qemuarm build pass? I can not figure it out.

decimal float is enabled by default for powerpc, x86 and x86_64 in gcc
thats why you see that it works ok on arm because its disabled by
default for arm. So yes for uclibc on these architectures you need to
disable it because uclibc does not have decimal floating library
implementation. Thats why in my patch in previous email I disabled 
it for all uclibc based builds of gcc. 
It should be disabled for mips as the code in gcc seems
like.  If you could post your gcc build logs somewhere I can have a
look.

-Khem



