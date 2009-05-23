Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1M7yYL-0005Y8-CZ
	for openembedded-devel@openembedded.org; Sat, 23 May 2009 23:14:49 +0200
Received: (qmail 5809 invoked from network); 23 May 2009 21:06:59 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 23 May 2009 14:06:59 -0700
Date: Sat, 23 May 2009 14:06:59 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090523210658.GO23842@smtp.west.cox.net>
References: <1243110920-18111-1-git-send-email-mad_soft@inbox.ru>
	<1243110920-18111-2-git-send-email-mad_soft@inbox.ru>
	<1243110920-18111-3-git-send-email-mad_soft@inbox.ru>
	<1243110920-18111-4-git-send-email-mad_soft@inbox.ru>
	<1243110920-18111-5-git-send-email-mad_soft@inbox.ru>
	<1243110920-18111-6-git-send-email-mad_soft@inbox.ru>
	<1243110920-18111-7-git-send-email-mad_soft@inbox.ru>
MIME-Version: 1.0
In-Reply-To: <1243110920-18111-7-git-send-email-mad_soft@inbox.ru>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] netsurf: add recipe for version 2.1
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
X-List-Received-Date: Sat, 23 May 2009 21:14:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 24, 2009 at 12:35:20AM +0400, Dmitry Artamonow wrote:

[snip]
> +++ b/recipes/netsurf/netsurf_2.1.bb
[snip]
> +DEPENDS = "gtk+ (>=2.12.0) lemon-native re2c-native jpeg openssl curl libxml2 \
> +	   libglade (>=2.0) hubbub libnsgif libnsbmp lcms"

You can't currently do versioned dependancies.  While this didn't error
out, it's not doing what you think.

-- 
Tom Rini


