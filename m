Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S2NEE-0008Uw-52
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 14:36:30 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Feb 2012 05:28:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122510919"
Received: from unknown (HELO helios.localnet) ([10.252.123.68])
	by fmsmga001.fm.intel.com with ESMTP; 28 Feb 2012 05:28:01 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Date: Tue, 28 Feb 2012 13:28 +0000
Message-ID: <19009938.gXoWXZHh4x@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.0; i686; ; )
In-Reply-To: <4F4CC45C.8010501@dresearch-fe.de>
References: <4F4C9DB8.5050203@dresearch-fe.de> <1567078.cdBARgH5ks@helios>
	<4F4CC45C.8010501@dresearch-fe.de>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Use python in variable assigment of a recipe
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
X-List-Received-Date: Tue, 28 Feb 2012 13:36:30 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 28 February 2012 13:11:08 Steffen Sledz wrote:
> Because i'm working with oe-classic i tried this (found in some other
> examples):
> 
>   MYVAR = "${@my_func()}"
> 
>   def my_func():
>       bbpath = os.path.dirname(bb.data.getVar('FILE',d,1))
>       ...
> 
> But this leads to an error:
> 
>   NameError: global name 'd' is not defined

If you pass in d it should work, i.e.:

   MYVAR = "${@my_func(d)}"
 
   def my_func(d):
       bbpath = os.path.dirname(bb.data.getVar('FILE',d,1))

BTW, d.getVar() should work fine in OE-Classic (or to be fully correct, it 
should work fine with older versions of bitbake).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


