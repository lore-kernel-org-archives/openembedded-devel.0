Received: from mail.gmx.net ([213.165.64.20])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1OVW9x-0007cn-Oz
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Jul 2010 22:51:30 +0200
Received: (qmail invoked by alias); 04 Jul 2010 20:46:41 -0000
Received: from p50886CC2.dip.t-dialin.net (EHLO [192.168.142.128])
	[80.136.108.194]
	by mail.gmx.net (mp070) with SMTP; 04 Jul 2010 22:46:41 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18l92Q9hBUltxp2tbYT+r+9WBjavMOxwyu6V8Qtyr
	MBvGQdTd+lr6pD
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 4 Jul 2010 22:41:28 +0200
User-Agent: KMail/1.9.6 (enterprise 0.20071012.724442)
References: <201007041550.26470.schnitzeltony@gmx.de>
	<AANLkTiks6AKzZhkZSMahSKYTCJoRH-cl2P2yjb3gQCbF@mail.gmail.com>
In-Reply-To: <AANLkTiks6AKzZhkZSMahSKYTCJoRH-cl2P2yjb3gQCbF@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201007042241.33918.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.20
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libpam-base-files.bb: Change pam.d files location to fix install error.
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
X-List-Received-Date: Sun, 04 Jul 2010 20:51:30 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sunday 04 July 2010 07:54:59 pm Khem Raj wrote:
> You do not need this fix if you take base.bbclass patch
> I posted earlier.
> 
> http://article.gmane.org/gmane.comp.handhelds.openembedded/34074
> 
> can you try it out ?

For your information:
1. Before I sent the 'libpam-base-files' I went into trouble during install with with angstrom-version and helped myself by manually copying lsb_release
2. After sending my patch trouble installing with 'base-files' came up.

So I did
1. Clean 'angstrom-version', 'libpam-base-files' and 'base-files'
2. Applied your patch for base.bbclass
3. Rebuild  'angstrom-version', 'libpam-base-files' and 'base-files'

The recipes baked without error.

Thanks


