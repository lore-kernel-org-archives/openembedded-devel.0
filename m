Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1Ow70d-0007BI-7f
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Sep 2010 07:27:48 +0200
Received: from compute3.internal (compute3.nyi.mail.srv.osa [10.202.2.43])
	by gateway1.messagingengine.com (Postfix) with ESMTP id C3345243
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Sep 2010 01:26:58 -0400 (EDT)
Received: from frontend1.messagingengine.com ([10.202.2.160])
	by compute3.internal (MEProxy); Thu, 16 Sep 2010 01:26:58 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=E/JRibit7FsjCwf/+j8Feqe6cYY=;
	b=CwhrQ6GQ820yotO/2I3CNPNObW2xBClz9lfihgEvrDMym4sosoVjM+2wHqmd16tsSAy1CJfShW3zaeQ6b3JQ8VgJv1DTyBZxjUueSm5CHRN34qdoUUtmJz+r4cCWJrVM6oWfqb/TVWiZjmywHTPjgIZAg+hhs/Z2eVTf1knInDc=
X-Sasl-enc: ZGTBb2XlcgHQk1aYooz011uX1M5tQXaaCE/MbfxHXXwm 1284614818
Received: from [192.168.1.34] (hnvr-4d07871e.pool.mediaWays.net [77.7.135.30])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 4055A407A01
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Sep 2010 01:26:58 -0400 (EDT)
Date: Thu, 16 Sep 2010 07:28:40 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
In-Reply-To: <alpine.LNX.2.00.1009160658000.29127@asterix.crazy-teaparty.dyndns.org>
Message-ID: <alpine.LNX.2.00.1009160726030.29127@asterix.crazy-teaparty.dyndns.org>
References: <AANLkTinWDmigJDsU-vJqwujb9hXu7p7j4QpY=nYQq3rh@mail.gmail.com>
	<alpine.LNX.2.00.1009160658000.29127@asterix.crazy-teaparty.dyndns.org>
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
X-List-Received-Date: Thu, 16 Sep 2010 05:27:48 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

On Thu, 16 Sep 2010, Vitus Jensen wrote:

> On Wed, 15 Sep 2010, AJ ONeal wrote:
>
>>  I don't know very much about this - only what I've seen discussed on the
>>  mailing list.
>
> And you probably searched recipes/ before writing your own?  This is my main 
> source of informationen.
>
>>  I've created a template and given my just-submitted recipe as an example.
>>
>>  If you know bitbake and OE policies, please share the wealth:
>>  http://wiki.openembedded.net/index.php/How_to_create_a_bitbake_recipe_for_dummies
>
> I don't think you should not use method overrides in the example (the wiki 
> list those overrides as things to avoid), just use the simpliest form of a 
> recipe there and refer to the OE usermanual from that page for additional 
> features, that URL: 
> http://docs.openembedded.org/usermanual/usermanual.html#chapter_recipes
>
> =====
> DESCRIPTION = ""
> HOMEPAGE = ""
> LICENSE = ""
> DEPENDS = ""
> PR = "r0"  # Package Revision, update this whenever you change the recipe.
>
> SRC_URI = " http://server/${PN}-${PV}.tar.bz2 \
> 	 file://fix-crosscompile.patch \
> 	 "
> SRC_URI[md5sum] = ""
> SRC_URI[sha256sum] = ""
> =====
>
> More isn't needed (some may argue about PR) and writing more may actually 
> harm.

Sorry, there was an important line missing:

inherit cmake
-or-
inherit autotools
-or-
inherit your-build-system

Vitus

-- 
/"\
\ / ascii ribbon campaign - Vitus Jensen
  X  www.asciiribbon.org - Hannover,Earth,Milky Way,Universe (current)
/ \


