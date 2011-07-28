Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QmNwu-0004P6-7v
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jul 2011 12:36:16 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Jul 2011 03:31:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,281,1309762800"; d="scan'208";a="32497243"
Received: from unknown (HELO helios.localnet) ([10.255.17.244])
	by azsmga001.ch.intel.com with ESMTP; 28 Jul 2011 03:31:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Jul 2011 11:31:58 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <4E31324C.3030901@nedap.com>
In-Reply-To: <4E31324C.3030901@nedap.com>
MIME-Version: 1.0
Message-Id: <201107281131.58174.paul.eggleton@linux.intel.com>
Subject: Re: how to apply bbappend selectively
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
X-List-Received-Date: Thu, 28 Jul 2011 10:36:16 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 28 July 2011 10:56:28 Jaap de Jong wrote:
> I.m creating a special image with for instance a modified udev package.
> I've created a udev-xxx.bbappend for that purpose.
> But for all the other images I build for other hardware I still want to
> use the original udev-xxx.

Usually this is just done with machine overrides within the bbappend.

e.g.

SRC_URI_append_somemachine = "file://somefile.patch"
SOMEVARIABLE_somemachine = "value1"
ANOTHERVARIABLE_somemachine = "value2"

That way building for all other machines will be unaffected.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


