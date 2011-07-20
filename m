Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QjT7H-0005pL-F7
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jul 2011 11:30:55 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 20 Jul 2011 02:26:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,233,1309762800"; d="scan'208";a="29336639"
Received: from unknown (HELO helios.localnet) ([10.255.17.201])
	by azsmga001.ch.intel.com with ESMTP; 20 Jul 2011 02:26:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jul 2011 10:26:46 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <4E269D1F.9070009@nedap.com>
In-Reply-To: <4E269D1F.9070009@nedap.com>
MIME-Version: 1.0
Message-Id: <201107201026.46169.paul.eggleton@linux.intel.com>
Subject: Re: best practice .inc files
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
X-List-Received-Date: Wed, 20 Jul 2011 09:30:55 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 20 July 2011 10:17:19 Jaap de Jong wrote:
> I'm using the 2010.12 release.
> I've created my own u-boot_2010.09.bb file in my local repository.
> In it is aline
>      require u-boot.inc
> (every u-boot*.bb recipe has it)
> Now I need a copy of the openembedded/recipes/u-boot/u-boot.inc in my
> local repository to get it bitbaked.
> (Well actually I've symlinked the file)
> I think both solutions are not optimal.
> Is there a way to this in a more gentle way?

If you use the path starting from the base i.e. "require recipes/u-boot/u-
boot.inc" it should work.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


