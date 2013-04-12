Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UQaCy-0004Tk-Kc
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Apr 2013 11:23:57 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 12 Apr 2013 02:06:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,462,1363158000"; d="scan'208";a="226357968"
Received: from unknown (HELO helios.localnet) ([10.255.14.15])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Apr 2013 02:06:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Apr 2013 10:06:18 +0100
Message-ID: <1397311.kYWOu8yYWG@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <c63fb0a794520e59580eeec88b2086494da43986.1365489405.git.jackie.huang@windriver.com>
References: <cover.1365489405.git.jackie.huang@windriver.com>
	<c63fb0a794520e59580eeec88b2086494da43986.1365489405.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: Re: [meta-webserver][PATCH 2/2] modphp: enable mysql option in PACKAGECONFIG
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
X-List-Received-Date: Fri, 12 Apr 2013 09:23:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 09 April 2013 15:11:05 jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
> 
> * enable mysql option in PACKAGECONFIG
>...
> 
> -PACKAGECONFIG ??= ""
> +PACKAGECONFIG ??= "mysql"
>  PACKAGECONFIG[mysql] =
> "--with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config,--without-mysqli,mysql5

So, I'm not entirely sure about this. RFC: what do other people think about 
enabling this by default?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


