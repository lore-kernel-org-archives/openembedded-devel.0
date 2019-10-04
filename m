Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 512EF7319F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2019 19:05:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46lK8C5BBjz4S;
	Fri,  4 Oct 2019 21:05:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1570215931;
	bh=cDEyMVZ17CyCQNqsOzU/I4d78Sd+3WAVfLTZBoTaf6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lZe+ZM0TrUamX2w7uJ52Kuxp1seSNJasISYGi+t1fXdS1q4tOqgcSgNBeZ0C4YXjk
	e3oFXm6AUS7QsTdw4nKmLqCCGeOXsl0iGBkl+eIlJlxKxh4tmCz9bfG2frMRNjDLuZ
	SYenXSTozkXxUqMgitxDsmsrJzM7deuHe2d9Nu+Hp+z74ibXfJ7oWewgJdaywCsHBN
	2Z6es1E93Fd2tvXP3eSlo8dkzVhL0mPBznliuCy0AEFaP+pZn9u3l5m5/RrGvBakL1
	Id3U19B5f9VhaLWG42ii7ECkp8anUjFNKzezS+VLLNr5iM7uZt8pq/XQLhw6DRVNUL
	turw/jbYscxmyPFJ7ddlTvWReHvsDVca4DhAT99f1ZfX/YY5ZdrN/vpIqBVGUNiehu
	5YHA+kHCGld285xUmtUwK4BiWux5HVg3Zp8coQGd7wg/NCXQ7vVruNhnDFfBHrryUg
	Xk8irguasJH57aSeiuoxnWRBHfEEsotmVIuF6Ju5K5WXuZx3yAlfywYWuq6SHqLEqH
	wI+nLfkXgnBNah3In9KwXNw7vgtvNG971z4AVwW1TgdG3UvTdDRDFg8zHqJAQhhREB
	2iDM/CqZxDYg5YWFTTkqNHkp9/LK0axi280QnqqPa5fDkM7Hu8PMRd8er8kuZM+1b5
	gMXeC3YTGAZyrNWiXxhoG/H0=
Date: Fri, 4 Oct 2019 22:05:28 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Trevor Gamblin <Trevor.Gamblin@windriver.com>
Message-ID: <20191004190528.GA15666@localhost>
References: <20191004152018.32461-1-Trevor.Gamblin@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20191004152018.32461-1-Trevor.Gamblin@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] freeradius: mark as incompatible with armv5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Oct 2019 19:05:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Oct 04, 2019 at 11:20:18AM -0400, Trevor Gamblin wrote:
> From: Trevor Gamblin <trevor.gamblin@windriver.com>
> 
> Freeradius fails to build for armv5:
> 
> | *** Warning: Linking the executable build/bin/local/radeapclient against the loadable module
> | *** libfreeradius-server.so is not portable!
> |
> | *** Warning: Linking the executable build/bin/local/radeapclient against the loadable module
> | *** libfreeradius-eap.so is not portable!
> path -Wl,/yow-lpggp31/tgamblin/freeradius.build/tmp-glibc/work/armv5e-oe-linux-gnueabi/freeradius/3.0.19-r0/git/build/lib/local//.libs
> /arm-oe-linux-gnueabi/9.2.0/ld: build/lib/local/.libs/libfreeradius-radius.so: undefined reference to `__atomic_compare_exchange_8'
> /arm-oe-linux-gnueabi/9.2.0/ld: build/lib/local/.libs/libfreeradius-radius.so: undefined reference to `__atomic_load_8'
> /arm-oe-linux-gnueabi/9.2.0/ld: build/lib/local/.libs/libfreeradius-radius.so: undefined reference to `__atomic_store_8'
> | collect2: error: ld returned 1 exit status
> | scripts/boiler.mk:630: recipe for target 'build/bin/local/radeapclient' failed
> 
> gcc does not supply 64-bit atomic operations,

This is not true.

> so freeradius cannot be built. Marking as incompatible for armv5.
>...

What is needed is linking with -latomic, as is already done for other 
architectures.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


