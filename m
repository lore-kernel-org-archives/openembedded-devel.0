Received: from [94.100.176.47] (helo=mx33.mail.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mad_soft@inbox.ru>) id 1M89Rx-00008I-5Z
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 May 2009 10:52:57 +0200
Received: from [95.72.100.202] (port=8619 helo=localhost)
	by mx33.mail.ru with asmtp id 1M89KI-000H1N-00
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 May 2009 12:45:03 +0400
Date: Sun, 24 May 2009 12:45:00 +0400
From: Dmitry Artamonow <mad_soft@inbox.ru>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090524084500.GA30448@rainbow>
References: <1243110920-18111-1-git-send-email-mad_soft@inbox.ru>
	<1243110920-18111-2-git-send-email-mad_soft@inbox.ru>
	<1243110920-18111-3-git-send-email-mad_soft@inbox.ru>
	<1243110920-18111-4-git-send-email-mad_soft@inbox.ru>
	<1243110920-18111-5-git-send-email-mad_soft@inbox.ru>
	<1243110920-18111-6-git-send-email-mad_soft@inbox.ru>
	<1243110920-18111-7-git-send-email-mad_soft@inbox.ru>
	<20090523210658.GO23842@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20090523210658.GO23842@smtp.west.cox.net>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-Spam: Not detected
X-Mras: Ok
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
X-List-Received-Date: Sun, 24 May 2009 08:52:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 14:06 Sat 23 May     , Tom Rini wrote:
> On Sun, May 24, 2009 at 12:35:20AM +0400, Dmitry Artamonow wrote:
> 
> [snip]
> > +++ b/recipes/netsurf/netsurf_2.1.bb
> [snip]
> > +DEPENDS = "gtk+ (>=2.12.0) lemon-native re2c-native jpeg openssl curl libxml2 \
> > +	   libglade (>=2.0) hubbub libnsgif libnsbmp lcms"
> 
> You can't currently do versioned dependancies.  While this didn't error
> out, it's not doing what you think.

OK. Then better drop versions for now - updated patch follows.

BTW, is there any work in this direction? I think it's important
feature missing. It would solve some problems with recipes broken with
certain PREFERRED_VERSIONs of toolchain/toolkit/etc in distro.conf
or local.conf, and working well with another...

-- 
Best regards,
Dmitry "MAD" Artamonow



