Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1USPsq-0002Bk-Db
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Apr 2013 12:46:38 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 17 Apr 2013 03:29:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,492,1363158000"; d="scan'208";a="320361972"
Received: from unknown (HELO helios.localnet) ([10.255.14.28])
	by fmsmga001.fm.intel.com with ESMTP; 17 Apr 2013 03:28:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Date: Wed, 17 Apr 2013 11:28:42 +0100
Message-ID: <7119347.tG3WeIFq8N@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <20130417102144.GE26007@jama>
References: <1366193237-12197-1-git-send-email-ml@communistcode.co.uk>
	<1366193237-12197-2-git-send-email-ml@communistcode.co.uk>
	<20130417102144.GE26007@jama>
MIME-Version: 1.0
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 2/2] net-snmp: Update to 5.7.2
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
X-List-Received-Date: Wed, 17 Apr 2013 10:46:39 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 17 April 2013 12:21:44 Martin Jansa wrote:
> On Wed, Apr 17, 2013 at 11:07:17AM +0100, Jack Mitchell wrote:
> > From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> > 
> > - Removed some un-needed patches
> > 
> > Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> > ---
> > 
> >  .../net-snmp/files/libnl-3-support.patch           |    69 -
> >  .../net-snmp/files/sync-with-5.7-branch.patch      | 19998
> >  ------------------- .../recipes-extended/net-snmp/net-snmp_5.7.2.bb    |
> >     31 +
> >  3 files changed, 31 insertions(+), 20067 deletions(-)
> >  delete mode 100644
> >  meta-oe/recipes-extended/net-snmp/files/libnl-3-support.patch delete
> >  mode 100644
> >  meta-oe/recipes-extended/net-snmp/files/sync-with-5.7-branch.patch
> >  create mode 100644 meta-oe/recipes-extended/net-snmp/net-snmp_5.7.2.bb
> Is there reason to keep net-snmp_5.7.1.bb?
> 
> If no, then please remove it in the same commit and send with -M.

Also I just tried to "git am" 2/2 on top of master + 1/2 and it failed, not 
sure exactly why. (I wanted to see if this would fix the build failure I noted 
earlier.)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


