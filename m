Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SV2PE-00064t-WA
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 May 2012 17:14:21 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 17 May 2012 08:04:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="154047979"
Received: from unknown (HELO helios.localnet) ([10.252.120.140])
	by fmsmga001.fm.intel.com with ESMTP; 17 May 2012 08:04:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Gary Thomas <gary@mlbassoc.com>
Date: Thu, 17 May 2012 16:04:15 +0100
Message-ID: <2161931.GEEF89rDH1@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.2.0-24-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <4FB50F30.7000906@mlbassoc.com>
References: <4FB508C7.4070808@mlbassoc.com> <3003401.DA8hFehsbE@helios>
	<4FB50F30.7000906@mlbassoc.com>
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
X-List-Received-Date: Thu, 17 May 2012 15:14:21 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 17 May 2012 08:46:08 you wrote:
> On 2012-05-17 08:37, Paul Eggleton wrote:
> > On Thursday 17 May 2012 08:18:47 Gary Thomas wrote:
> >> Trying the new layer, when I ran 'bitbake chromium -c fetch', I got this
> >> error: Fetcher failure for URL:
> >> 'http://commondatastorage.googleapis.com/chromium-browser-official/chromi
> >> um
> >> -19.0.1049.3.tar.bz2'. The fetch command returned success for url
> >> http://commondatastorage.googleapis.com/chromium-browser-official/chromiu
> >> m-
> >> 19.0.1049.3.tar.bz2 but
> >> /local/p60_poky/downloads/chromium-19.0.1049.3.tar.bz2 doesn't exist?!
> >> 
> >> Looking at my tree, I found this:
> >> 
> >> downloads/chromium-19.0.1049.3.tar.bz2?cms_redirect=yes&redirect_counter=
> >> 1
> >> which has MD5SUM that matches the recipe.
> >> 
> >> Any ideas what might have gone wrong?
> > 
> > If it really has "?cms_redirect=yes&redirect_counter=1" at the end of the
> > filename that might have something to do with it...
> 
> Of course, but that's a result of the fetcher code - the recipe does not
> have such:
>    SRC_URI =
> "http://commondatastorage.googleapis.com/chromium-browser-official/${P}.tar
> .bz2"
> 
> The fetch log is at http://www.mlbassoc.com/misc/chromium_fetch.log
> My build host is Fedora 16 (i686)
> My oe-core (poky/master) is rev 38da655788

Out of curiosity I tried to download the file manually and got a 404, so I 
think there is a bigger issue with this recipe than fetcher behaviour...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


