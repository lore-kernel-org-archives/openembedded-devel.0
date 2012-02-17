Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RyLBo-0006YE-3b
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Feb 2012 11:37:20 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 17 Feb 2012 02:29:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="67627791"
Received: from unknown (HELO helios.localnet) ([10.252.123.6])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Feb 2012 02:29:02 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Athanasios-Ilias Rousinopoulos <zoumpis@gmail.com>
Date: Fri, 17 Feb 2012 10:29:01 +0000
Message-ID: <1435009.yvO9RFTQOK@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.0; i686; ; )
In-Reply-To: <CAEjf2bhPLjjk3nuh4en5qy1Fs0v0BugmZMQB8nd2N5myPQThMg@mail.gmail.com>
References: <CAEjf2bhPLjjk3nuh4en5qy1Fs0v0BugmZMQB8nd2N5myPQThMg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Problem while building a simple helloworld.bb recipe....
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
X-List-Received-Date: Fri, 17 Feb 2012 10:37:20 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 17 February 2012 02:06:48 Athanasios-Ilias Rousinopoulos wrote:
> I face a problem while i build my helloworld recipe. Here i present
> all the information , also i submit the bitbake recipe and the .c
> source. Thanks. Hope someone can help me to overcome this problem and
> configure correctly the recipe. Thanks

> zoumpis@linux-bc34:~> bitbake -b
>...
> ccache: FATAL: Could not find compiler "i586-linux-gcc" in PATH

So the answer to this is do not use the -b option unless you've already 
ensured all the dependencies have been taken care of, because -b will not do 
that.

Simply place the recipe somewhere that bitbake can find it via BBFILES (i.e. 
next to other recipes) and then use "bitbake helloworld" and it should build 
fine.

Cheers,
Paul
-- 

Paul Eggleton
Intel Open Source Technology Centre


