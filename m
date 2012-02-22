Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S0GZf-0001t1-Ta
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 19:05:56 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 Feb 2012 09:57:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="109536907"
Received: from unknown (HELO helios.localnet) ([10.252.123.31])
	by azsmga001.ch.intel.com with ESMTP; 22 Feb 2012 09:57:33 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Rich Pixley <rich.pixley@palm.com>
Date: Wed, 22 Feb 2012 17:57:32 +0000
Message-ID: <1886014.FJCS6mMrjt@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.0; i686; ; )
In-Reply-To: <4F452A74.6040603@palm.com>
References: <4F452A74.6040603@palm.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Still no luck with runqemu
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
X-List-Received-Date: Wed, 22 Feb 2012 18:05:56 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 22 February 2012 09:48:36 Rich Pixley wrote:
> It boots, and opens a window, but when I type in the window, the keys
> are scrambled.
> 
> Screen shot attached.  The characters you see are the result of typing
> "root<return>" into that window.
> 
> Does this look familiar to anyone?  Who can tell me what I need to do to
> be able to use the qemu?

Some quick googling suggests that adding the following to the runqemu command 
line might help:

qemuparams="-k en"

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


