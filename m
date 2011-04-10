Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1Q8z6U-0001o6-W5
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Apr 2011 20:11:19 +0200
Received: from localhost (85.231.30.150) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.137.0; Sun, 10 Apr 2011
	20:07:52 +0200
Date: Sun, 10 Apr 2011 20:07:52 +0200
From: Anders Darander <anders@chargestorm.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20110410180752.GA14176@chargestorm.se>
Mail-Followup-To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <1302456441-3417-1-git-send-email-anders@chargestorm.se>
MIME-Version: 1.0
In-Reply-To: <1302456441-3417-1-git-send-email-anders@chargestorm.se>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: [PATCH v2] lowpan-tools_0.2.2; : fix build with static libnl1
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
X-List-Received-Date: Sun, 10 Apr 2011 18:11:19 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,

I'm replying to my own mail...
This patch is intended for th org.openembedded.dev branch, as it
requires the libnl -> libnl1 patch by Martin Jansa, wich is applied to
that branch.

This to solves the problem of using lowpan-tools on a system which
otherwise uses libnl2.

* Anders Darander <anders@chargestorm.se> [110410 19:27]:
> * add NL_CFLAGS to a few Makefiles.am
> * git version not fixed
> * build and runtime tested, although only in qemuarm

I forgot to mention that the difference between v2 and v1, is that I
forgot to update PR in the first version. This is corrected in the
current version.

I hope that this patch can be ACK'ed and pushed.

Regards,
Anders

-- 
Anders Darander
ChargeStorm AB	


