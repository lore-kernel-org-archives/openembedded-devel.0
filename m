Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1TfnQ4-0004Wv-0k
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 09:00:02 +0100
Received: from localhost (193.41.119.134) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.279.1; Tue, 4 Dec 2012
	08:44:04 +0100
Date: Tue, 4 Dec 2012 08:44:30 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20121204074429.GA6288@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <cover.1353602922.git.paul.eggleton@linux.intel.com>
	<ea86ab799567bbf1f2fd02d47f9bdc775ba26f9e.1353602922.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <ea86ab799567bbf1f2fd02d47f9bdc775ba26f9e.1353602922.git.paul.eggleton@linux.intel.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.20 (2009-12-10)
X-GFI-SMTP-Submission: 1
Subject: [danny?] Re: [meta-networking][PATCH v2 1/2] ntp: cleanup recipes and fix SSL support
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
X-List-Received-Date: Tue, 04 Dec 2012 08:00:03 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline


Hi,

* Paul Eggleton <paul.eggleton@linux.intel.com> [121122 17:50]:

> * Move common definitions to the inc file
> * Drop override of do_configure which doesn't seem to be needed anymore
> * Fold ntp-ssl into the ntp recipe as a PACKAGECONFIG option for those
>   who want it (default to off) and fix configure-time checks to detect
>   OpenSSL properly so that it gets enabled when selected
> * Remove ntp-bin package and put its contents in currently empty
>   ntp-utils package (with migration path)
> * Fix hardcoded paths in ntpd initscript
> * Specify ntpd.conf as a configuration file for packaging purposes
> * Rearrange so that packaging definitions are towards the end in the
>   expected order
> * Delete unused "ntp" initscript file
> * Add SUMMARY
> * Update HOMEPAGE

Would this patch be acceptable for a push to danny? Or is it to
intrusive?

If it's to intrusive, we need to update the SRC_URI checksums in danny,
as they're currently not matching the downloaded file...

If needed, I can create a SRC_URI-patch for danny, though I'd prefer to
get this one in if possible.

Cheers,
/Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB


