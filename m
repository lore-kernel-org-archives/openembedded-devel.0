Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OE8LV-0005xj-Ey
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 May 2010 00:00:06 +0200
Received: by pzk30 with SMTP id 30so2579756pzk.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 May 2010 14:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=URFPZLKzkzGHgOa+KiAHFP7yObp5SX7ZyWKI1iUf87o=;
	b=FnYsNfb6yDB5dA2lFtbdHnCt4WKf5cROAjHIdo5V2aUWIRR5PiFM+sIzgyC7yb06Ua
	m/k5Keg1maah9jHx9Y2KhikgykF1GufgxLnb9JXKy2lxSezOlM6AhoynO9BuEQmcckEi
	TWsbxyM3Z9Ne6UjTirrq+WDji/d3gQN5yygEw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=dStQpUNvRnmD2PIxKCZ0YuLtM29jSjRhbBi7+fGOy2uKhimn9FlCqBACv6tCk08YPr
	OHh0d2ZjAY1m0f1yvmCfI5Y5oonziiOqtHERw3pQN4giDA4N1c7DD0KKJtfT3N3t9vAb
	o9Lpx2Xg3UY1cA0uP3/prehty+ySBlYHrbHF8=
Received: by 10.114.188.4 with SMTP id l4mr4918168waf.19.1274129349188;
	Mon, 17 May 2010 13:49:09 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id n29sm52152650wae.16.2010.05.17.13.49.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 17 May 2010 13:49:08 -0700 (PDT)
Date: Mon, 17 May 2010 13:49:34 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100517204934.GE7932@gmail.com>
References: <AANLkTinM-N-vAT4yP0ptz0UcMBNsLHpQZ1er2VwnsDDv@mail.gmail.com>
	<20100517190152.GB7868@gmail.com>
	<AANLkTinsmKk2J576bTB0-Wkk48G5He9koqeQiU4MHhL_@mail.gmail.com>
	<20100517191837.GB7932@gmail.com>
	<AANLkTikLN9HgYy5Q6ICrDYuOBB47JdPy8vZiaf-Hv5uu@mail.gmail.com>
	<20100517194116.GD7932@gmail.com>
	<AANLkTimIyO_fMaHX_tsssDwFNTLBBl3aFSaMmeBQHk_C@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTimIyO_fMaHX_tsssDwFNTLBBl3aFSaMmeBQHk_C@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.222.192
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Microblaze gcc 4.5.0 support
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
X-List-Received-Date: Mon, 17 May 2010 22:03:48 -0000
X-List-Received-Date: Mon, 17 May 2010 22:03:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (17/05/10 14:57), Adrian Alonso wrote:
> libgcc config.log http://pastebin.com/3mLhBMNP
> 
> <http://pastebin.com/3mLhBMNP>I see the error
> conftest.c:1:0: error: 'microblaze' is an invalid argument to -mcpu=

yeah :). So you know what to do next time you have a gcc configure error.
I think microblaze support is still on a branch in gcc. You
will be better off using the branch or get the diff of the
branch over gcc 4.5.0

-Khem


