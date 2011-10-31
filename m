Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RKogY-0006eT-BO
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Oct 2011 11:01:42 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 31 Oct 2011 02:55:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,430,1315206000"; d="scan'208";a="31687648"
Received: from unknown (HELO helios.localnet) ([10.252.121.56])
	by AZSMGA002.ch.intel.com with ESMTP; 31 Oct 2011 02:55:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Paul Menzel <paulepanter@users.sourceforge.net>
Date: Mon, 31 Oct 2011 09:55:28 +0000
User-Agent: KMail/1.13.6 (Linux/2.6.38-11-generic-pae; KDE/4.6.5; i686; ; )
References: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
	<3bcd2fb9e853253747293c584109ab394ba3fd4e.1319884094.git.Martin.Jansa@gmail.com>
	<1319891607.3756.18.camel@mattotaupa>
In-Reply-To: <1319891607.3756.18.camel@mattotaupa>
MIME-Version: 1.0
Message-Id: <201110310955.28626.paul.eggleton@linux.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-efl][meta-oe 05/12] id3lib: Import from openembedded classic
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
X-List-Received-Date: Mon, 31 Oct 2011 10:01:42 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit

On Saturday 29 October 2011 13:33:27 Paul Menzel wrote:
> > +LIC_FILES_CHKSUM =
> > "files://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7" 
> > +PR = "r0"
> 
> According to Koen these are going away.

Well, Koen might reject PR = "r0" in meta-oe, that's fine; however 
LIC_FILES_CHKSUM is mandatory or the recipe will not build, and I don't think 
that will be changing any time soon. I have considered if it would be 
desirable/possible to eliminate it for recipes that don't install any files 
(e.g. tasks), so far I haven't done any work on that. For normal recipes it is 
required however.

Cheers,
Paul 


-- 

Paul Eggleton
Intel Open Source Technology Centre


