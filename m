Received: from mail-ew0-f225.google.com ([209.85.219.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OE5cy-0000tX-JC
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 May 2010 21:05:26 +0200
Received: by ewy25 with SMTP id 25so1384978ewy.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 May 2010 12:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=jYrF+QY6tiCEo/YT1MB4Bn17fdFURgCIuA8HQ1HxTfA=;
	b=P2Cx1o9an4E5lHJVjw7Y9lf0CQyUEiwTaBcflxMzn6KCQLWU/93tn4rt6V4/Aw6BXR
	w+hF2Nt/a9AgUJcuPKgwNSap5zMcqEmnd4AgmxJ43XBymIYZv4Lp2ukjxLs0WAZdVGnw
	Omu3bVFje9Zi31NzzmCcs4mxPUwlgw6CyNee8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=WBst71DdP+Xn/L1x6Uh444Z5rndu80AqGsywgEZ1PsbjXzn6W0y3GZKkT7YMkISX/G
	MojwZyPZsehPjED7WBHxQaifBOr9TYRxq13RiQFetGYab+fx3/GKrdsCmYZT6i6aAep7
	bw2XFtgaNE4zW3PQcnK15TKEuPVdfnIY+Pl4w=
Received: by 10.213.70.10 with SMTP id b10mr2873707ebj.24.1274122885256;
	Mon, 17 May 2010 12:01:25 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 15sm2955437ewy.4.2010.05.17.12.01.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 17 May 2010 12:01:24 -0700 (PDT)
Date: Mon, 17 May 2010 12:01:52 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100517190152.GB7868@gmail.com>
References: <AANLkTinM-N-vAT4yP0ptz0UcMBNsLHpQZ1er2VwnsDDv@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTinM-N-vAT4yP0ptz0UcMBNsLHpQZ1er2VwnsDDv@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.219.225
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
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
X-List-Received-Date: Mon, 17 May 2010 19:05:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (17/05/10 13:38), Adrian Alonso wrote:
> Hi, I been working on adding OE support for microblaze arch
> I have a repo in gitorious [1] holding the changes I made so far;
> trying to build console-image fails on gcc-cross-initial compilation
> with the error shown on log [2]
> "configure: error: cannot compute suffix of object files: cannot compile"
> 

Care to provide config.log ?

> I also update gcc-svn.inc recipe to use gcc-microblaze branch
> SRC_URI_xlnx-mb-gen = "svn://gcc.gnu.org/svn/gcc/branches;module=microblaze
> And I get the same error shown in gcc-4.5.0
> 
> From log error I see that OE is generates the suffix info but fails for
> microblaze arch
> 
>    1.  set -e; for ml in `cat fixinc_list`; do \
>    2. |         sysroot_headers_suffix=`echo ${ml} | sed -e 's/;.*$//'`; \
>    3. |         multi_dir=`echo ${ml} | sed -e 's/^[^;]*;//'`; \
>    4. |         fix_dir=include-fixed${multi_dir}; \
> 
> 
> Can some one help me out figuring what is missing??
> 
> 
> [1] http://gitorious.org/oe-microblaze/oe-microblaze
> <http://gitorious.org/oe-microblaze/oe-microblaze>[2]
> http://pastebin.com/kqC8AP1s
> 
> -- 
> Saludos
> Adrian Alonso
> http://aalonso.wordpress.com
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


