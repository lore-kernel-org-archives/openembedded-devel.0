Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RsE0L-0002ch-TE
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jan 2012 14:44:14 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 31 Jan 2012 05:36:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="101524665"
Received: from unknown (HELO helios.localnet) ([10.252.122.224])
	by azsmga001.ch.intel.com with ESMTP; 31 Jan 2012 05:36:16 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jan 2012 13:36:15 +0000
Message-ID: <2408772.PAkgyL27F6@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-15-generic-pae; KDE/4.8.0; i686; ; )
In-Reply-To: <20120131132717.GB3644@jama.jama.net>
References: <20120131132717.GB3644@jama.jama.net>
MIME-Version: 1.0
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: WARN: polkit pulls systemd to image if not disabled explicitly
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
X-List-Received-Date: Tue, 31 Jan 2012 13:44:14 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 31 January 2012 14:27:18 Martin Jansa wrote:
> Since version 104 polkit has support for systemd session tracking
> commit
> http://cgit.freedesktop.org/PolicyKit/commit/?id=2027302e803a9569a370b429a47
> 5dae5ef8afe34
> 
> Unless passed --disable-systemd it will autodetect libsystemd-login
> with pkg-config and enable it, which results in polkit package pulling
> systemd as RDEPEND.
> 
> To check your build look for
> Session tracking:           ConsoleKit
> or
> Session tracking:           systemd
> in polkit-0.104-r*/temp/log.do_configure
> 
> and as gconf depends on polkit I guess this happens for a lot of images.

Are we now at the stage where we need a distro-level option to enable/disable 
systemd?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


