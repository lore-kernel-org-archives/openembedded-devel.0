Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SV1z6-0004WV-85
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 May 2012 16:47:20 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 17 May 2012 07:37:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="101205667"
Received: from unknown (HELO helios.localnet) ([10.252.120.140])
	by AZSMGA002.ch.intel.com with ESMTP; 17 May 2012 07:37:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Gary Thomas <gary@mlbassoc.com>
Date: Thu, 17 May 2012 15:37:15 +0100
Message-ID: <3003401.DA8hFehsbE@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.2.0-24-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <4FB508C7.4070808@mlbassoc.com>
References: <4FB508C7.4070808@mlbassoc.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: meta-browser
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
X-List-Received-Date: Thu, 17 May 2012 14:47:20 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 17 May 2012 08:18:47 Gary Thomas wrote:
> Trying the new layer, when I ran 'bitbake chromium -c fetch', I got this
> error: Fetcher failure for URL:
> 'http://commondatastorage.googleapis.com/chromium-browser-official/chromium
> -19.0.1049.3.tar.bz2'. The fetch command returned success for url
> http://commondatastorage.googleapis.com/chromium-browser-official/chromium-
> 19.0.1049.3.tar.bz2 but
> /local/p60_poky/downloads/chromium-19.0.1049.3.tar.bz2 doesn't exist?!
> 
> Looking at my tree, I found this:
>   
> downloads/chromium-19.0.1049.3.tar.bz2?cms_redirect=yes&redirect_counter=1
> which has MD5SUM that matches the recipe.
> 
> Any ideas what might have gone wrong?

If it really has "?cms_redirect=yes&redirect_counter=1" at the end of the 
filename that might have something to do with it...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


