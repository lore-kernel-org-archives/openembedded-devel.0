Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1Ow6qN-00070S-JV
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Sep 2010 07:17:18 +0200
Received: from compute2.internal (compute2.nyi.mail.srv.osa [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 18F034A5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Sep 2010 01:09:36 -0400 (EDT)
Received: from frontend2.messagingengine.com ([10.202.2.161])
	by compute2.internal (MEProxy); Thu, 16 Sep 2010 01:09:36 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=G/GxKPecP46hkK4ivtnTVJjLDzk=;
	b=YrvBVUMa18sL3WcOiJhFStrwKRLCx1F9IbUWF+6GGkArhdBii6gJUN7icHn+QzY7nv5UFyCAGHWjRdfpuDHQ0DNr5ivk5hAdya/r3U6O/7H7txSBWCgTdyltZ5ODGAp1Lz6DQWnNyXUbKtmLEBIRctC3rJGK3iy9A0C2Y8w40Tw=
X-Sasl-enc: b3CbisiWQI7JF9G7GtVa1ivyfjFW71xnDewyDJy3hV2g 1284613775
Received: from [192.168.1.34] (hnvr-4d07871e.pool.mediaWays.net [77.7.135.30])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 85F2A5E3113
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Sep 2010 01:09:35 -0400 (EDT)
Date: Thu, 16 Sep 2010 07:11:17 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
In-Reply-To: <AANLkTinWDmigJDsU-vJqwujb9hXu7p7j4QpY=nYQq3rh@mail.gmail.com>
Message-ID: <alpine.LNX.2.00.1009160658000.29127@asterix.crazy-teaparty.dyndns.org>
References: <AANLkTinWDmigJDsU-vJqwujb9hXu7p7j4QpY=nYQq3rh@mail.gmail.com>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.26
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Howto create a bitbake recipe
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
X-List-Received-Date: Thu, 16 Sep 2010 05:17:18 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

On Wed, 15 Sep 2010, AJ ONeal wrote:

> I don't know very much about this - only what I've seen discussed on the
> mailing list.

And you probably searched recipes/ before writing your own?  This is my 
main source of informationen.

> I've created a template and given my just-submitted recipe as an example.
>
> If you know bitbake and OE policies, please share the wealth:
> http://wiki.openembedded.net/index.php/How_to_create_a_bitbake_recipe_for_dummies

I don't think you should not use method overrides in the example (the wiki 
list those overrides as things to avoid), just use the simpliest form of a 
recipe there and refer to the OE usermanual from that page for additional 
features, that URL: 
http://docs.openembedded.org/usermanual/usermanual.html#chapter_recipes

=====
DESCRIPTION = ""
HOMEPAGE = ""
LICENSE = ""
DEPENDS = ""
PR = "r0"  # Package Revision, update this whenever you change the recipe.

SRC_URI = " http://server/${PN}-${PV}.tar.bz2 \
 	file://fix-crosscompile.patch \
 	"
SRC_URI[md5sum] = ""
SRC_URI[sha256sum] = ""
=====

More isn't needed (some may argue about PR) and writing more may actually 
harm.

Best regards,
    Vitus

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


