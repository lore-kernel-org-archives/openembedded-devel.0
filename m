Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MH2Wg-0005Mz-AS
	for openembedded-devel@openembedded.org; Wed, 17 Jun 2009 23:18:34 +0200
Received: (qmail 29287 invoked from network); 17 Jun 2009 21:08:06 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 17 Jun 2009 14:08:06 -0700
Date: Wed, 17 Jun 2009 14:08:05 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090617210805.GJ15477@smtp.west.cox.net>
References: <1245267720-13612-1-git-send-email-khimov@altell.ru>
	<1245267720-13612-2-git-send-email-khimov@altell.ru>
	<1245267720-13612-3-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <1245267720-13612-3-git-send-email-khimov@altell.ru>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH 3/3] package_ipk: fix race in opkg.conf creation
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
X-List-Received-Date: Wed, 17 Jun 2009 21:18:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 17, 2009 at 11:42:00PM +0400, Roman I Khimov wrote:

> It's a very little race, but one can hit it anyway on concurrent image builds.

So, the way this works is we do cp template ${IPKGCONF_TARGET} and use
it, or so?  And IPKGCONF_SDK / IPKGCONF_CANSDK won't race because we're
cp'ing them to a final destination ?

-- 
Tom Rini


