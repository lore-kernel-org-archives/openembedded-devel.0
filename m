Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OxYJs-0006My-AQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Sep 2010 06:49:37 +0200
Received: by pwj1 with SMTP id 1so1236005pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Sep 2010 21:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=NwldB71KdhyFD9diVMUhf6mAXJAnAnIB0n96Ngjn+i4=;
	b=GB6H5bgh4buX4P2zGrJ5WCZLVkmRFQYjSpLoUQeuLG9TFzkxVyofv6h6G2oC8qGLc2
	NQzLRmnL9YY+njTr5vcfRa23OvHJmLrWeUlY1fuf0Gpbkd9XfsxaQryFRCehy8FeszW3
	zCwsyiBq7dcxojxakeWFX33vAAQrUABzoGqes=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=b06IZskQNL0mf0bEBLhwN9m0mG835/nJGHDmyx+O03sDo3lUwrrtBD3lDpWRHIKCLv
	SHdldGqqivqGE73MRurPnvLggwgateCTMHjWtWVljoBlcCBICt77u3wDR0p8SiuE9ln6
	rWyJ3N5rAdluadhgN7zhKWq3glM7Nb4SA1wcc=
Received: by 10.114.95.12 with SMTP id s12mr9149961wab.217.1284958120063;
	Sun, 19 Sep 2010 21:48:40 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id c24sm12730019wam.7.2010.09.19.21.48.38
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 19 Sep 2010 21:48:38 -0700 (PDT)
Date: Sun, 19 Sep 2010 21:45:48 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100920044548.GB7809@gmail.com>
References: <AANLkTim7Z2-z6E+4Duo-s1pvVBK35mWNQE5k7TuEnqvJ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTim7Z2-z6E+4Duo-s1pvVBK35mWNQE5k7TuEnqvJ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: "General mailing list for gumstix users."
	<gumstix-users@lists.sourceforge.net>
Subject: Re: Question on apr on what it said during build
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
X-List-Received-Date: Mon, 20 Sep 2010 04:49:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (26/08/10 10:22), J. L.  wrote:
> I am building a image and had apr error out while building so I did a
> -c clean and rebuilt it which it did fine but, I saw something I had
> not noticed before and would like to know if its something to worry
> about and if its not what does it mean. The message is below:
> 
> NOTE: Running task 749 of 759 (ID: 13,
> /home/vdubhack/overo-oe/org.openembedded.dev/recipes/apr/apr_1.3.5.bb,
> do_package)
> NOTE: the following files were installed but not shipped in any package:
> NOTE:   /usr/lib/apr.exp
> NOTE:   /usr/share/build-1/mkdir.sh
> NOTE:   /usr/share/build-1/apr_rules.mk
> NOTE:   /usr/share/build-1/make_var_export.awk
> NOTE:   /usr/share/build-1/make_exports.awk

the files in /usr/share should be packaged into apr-dev and apr.exp may 
be deleted.

-Khem


