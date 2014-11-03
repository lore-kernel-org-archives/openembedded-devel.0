Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 001CA60169
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Nov 2014 15:46:34 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 03 Nov 2014 07:40:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="410428028"
Received: from sergeypo-mobl1.ccr.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.106])
	by FMSMGA003.fm.intel.com with ESMTP; 03 Nov 2014 07:38:02 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Bryan Evenson <bevenson@melinkcorp.com>
Date: Mon, 03 Nov 2014 15:46:20 +0000
Message-ID: <4253192.vXvCSCqcaf@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.2 (Linux/3.16.6-203.fc20.x86_64; KDE/4.14.2; x86_64; ; )
In-Reply-To: <ab38d1872c37433981e9fd312b842a54@BLUPR05MB037.namprd05.prod.outlook.com>
References: <ab38d1872c37433981e9fd312b842a54@BLUPR05MB037.namprd05.prod.outlook.com>
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
X-List-Received-Date: Mon, 03 Nov 2014 15:46:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Bryan,

On Monday 03 November 2014 14:03:42 Bryan Evenson wrote:
> The official PHP archival version download site, http://museum.php.net, has
> been down at least since the beginning of October.  This is a problem for
> daisy and older branches if a build attempts to fetch PHP.  I expect this
> site will be back up again sometime, but from reading the conversation on
> the related PHP bug report (https://bugs.php.net/bug.php?id=68130) I do not
> believe http://museum.php.net can be viewed to be a reliable archive in the
> future.  I see that dizzy changed the SRC_URI to use
> http://www.php.net/distributions for the main download.  I did some testing
> and it appears that PHP versions that are about a year old or less are
> available from http://www.php.net/distributions.  So we can assume that a
> year from now the dizzy branch SRC_URI will need to change to something
> else.
> 
> I'd propose changing the SRC_URI to something that will not change over
> time.  My suggestion would be the PHP distributions Git repository located
> here: http://git.php.net/?p=web/php-distributions.git;a=summary.  This is
> the path suggested in the related PHP bug mentioned earlier.  The
> disadvantage is that the SRC_URI would refer to a file on a specific tag,
> so the SRC_URI would be specific for each PHP version.
> 
> Any further suggestions on how to handle this?  If the SRC_URI does get
> updated, how many branches back should the change be made?

So we do have mirrors that can help with this, unfortunately with the OE
mirror (as opposed to the Yocto Project one), its population is not automatic,
so you have to request that new archives get added. I'm not sure it would
be practical to change this either.

Why php thinks it's a good idea to distribute these tarballs in a single place
in a git repository but not in a simple flat HTTP location is a bit beyond me.
Fetching directly from git in this situation wouldn't be ideal as it'll end up
effectively fetching all of the binaries down when cloning the repo; however
I guess you could download a single file with:

SRC_URI = "http://git.php.net/?p=web/php-distributions.git;a=blob;f=php-${PV}.tar.xz"

Cheers,
Paul


-- 

Paul Eggleton
Intel Open Source Technology Centre

