Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1Lxq0B-0001Zc-A6
	for openembedded-devel@openembedded.org; Sun, 26 Apr 2009 00:05:39 +0200
Received: (qmail 11902 invoked from network); 25 Apr 2009 22:00:46 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by  with SMTP; 25 Apr 2009 15:00:46 -0700
Date: Sat, 25 Apr 2009 15:00:45 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090425220045.GJ15489@smtp.west.cox.net>
References: <1240589520-1104-1-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-3-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-4-git-send-email-trini@kernel.crashing.org>
	<200904252333.34329.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
In-Reply-To: <200904252333.34329.marcin@juszkiewicz.com.pl>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH][STABLE] meta-toolchain, canadian-sdk: Move C++	headers into the correct location, bump PR
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
X-List-Received-Date: Sat, 25 Apr 2009 22:05:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Apr 25, 2009 at 11:33:33PM +0200, Marcin Juszkiewicz wrote:

> Can populate_sdk() function in canadian-sdk.inc and meta-toolchain.bb be 
> merged somehow?

As a longer term project, yes, they should be merged totally.  In the
near-term, I think that roughly the middle could be.  Or perhaps making
canadian include meta and just override the package function.  Or always
make zips.  Or make it be controlable ala IMAGE_FSTYPES.  Sorry,
thinking aloud here :)

-- 
Tom Rini


