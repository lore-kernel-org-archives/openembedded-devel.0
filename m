Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2558B6017E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Nov 2014 13:32:09 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Nov 2014 05:32:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,319,1413270000"; d="scan'208";a="626972258"
Received: from sergeypo-mobl1.ccr.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.106])
	by fmsmga002.fm.intel.com with ESMTP; 05 Nov 2014 05:32:09 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Bryan Evenson <bevenson@melinkcorp.com>
Date: Wed, 05 Nov 2014 13:32:08 +0000
Message-ID: <7571365.1nZ3Uh4ESC@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.2 (Linux/3.16.7-200.fc20.x86_64; KDE/4.14.2; x86_64; ; )
In-Reply-To: <12704febfbdc48c5bc9470e90312770b@BLUPR05MB037.namprd05.prod.outlook.com>
References: <ab38d1872c37433981e9fd312b842a54@BLUPR05MB037.namprd05.prod.outlook.com>
	<10fd3d410b8a453f9df7b32114add897@BLUPR05MB037.namprd05.prod.outlook.com>
	<12704febfbdc48c5bc9470e90312770b@BLUPR05MB037.namprd05.prod.outlook.com>
MIME-Version: 1.0
Cc: "koen@dominion.thruhere.net" <koen@dominion.thruhere.net>,
	openembedded-devel@lists.openembedded.org
Subject: Re: php: museum.php.net is broken - change recipe SRC_URI?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Nov 2014 13:32:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 05 November 2014 13:20:48 Bryan Evenson wrote:
> There hasn't been any follow-up on this thread for a couple days.  I'd like
> to know if there would be an acceptable solution for this issue.  I'd
> propose changing the SRC_URI for php-5.4.14 to
> http://git.php.net/?p=web/php-distributions.git;a=blob;f=php-5.4.14.tar.bz2
> ;h=0d950f179d586bb1d0e879e0d4aa3a5140e8d5f5;hb=3dd2f12609fc8a730d7cf341a932f
> 6c7b241f03c, which will directly pull only the tarball we need directly from
> the PHP Git repository.  I believe it's the only path that would be
> guaranteed to work long term.

Presumably if we did that we will need to keep updating the hash as well 
though?

Looking at the bug there are at least two mirrors mentioned, although those 
may not be reliable on a permanent basis there should be others (e.g. distros 
often provide copies of the upstream sources they use). We could leave the 
museum.php.net URL in place since it does appear it will eventually return, 
and add MIRRORS values to cover the situation while it's unavailable.

Does this sound like a workable plan?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

