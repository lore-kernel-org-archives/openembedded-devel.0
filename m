Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P8dju-00010Z-GN
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Oct 2010 20:50:19 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 29CFC3149ED0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 20:49:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id rA4NIrsSoEn9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 20:49:36 +0200 (CEST)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id E43EC3149EA0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 20:49:35 +0200 (CEST)
Message-ID: <4CBF39BF.9000809@opendreambox.org>
Date: Wed, 20 Oct 2010 20:49:35 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.12) Gecko/20100915 Thunderbird/3.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1286812675-31626-1-git-send-email-chase.maupin@ti.com>	<AANLkTinR7QSaFb1FTzETX9=k9=JZh58iZgyD=7=So1uF@mail.gmail.com>	<131E5DFBE7373E4C8D813795A6AA7F080310FFA2BC@dlee06.ent.ti.com>	<AANLkTi=uKwjKYq5W4VwKXcNHdSJkxZnu_w4M9kkvVWoX@mail.gmail.com>
	<20101020182509.GO11514@denix.org>
In-Reply-To: <20101020182509.GO11514@denix.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCHv2] recipe licenses: update recipe LICENSE fields
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
X-List-Received-Date: Wed, 20 Oct 2010 18:50:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/20/2010 08:25 PM, Denys Dmytriyenko wrote:
> In OE we've been using this term for some time now. Although, still too many 
> old recipes use old notations, sometimes even as generic as just plain "GPL" 
> w/o specifying the exact version. It wasn't as critical before, but these days 
> OE is being adopted in corporate environments and proper licensing became 
> quite important.

How exactly do "GPLv2" and "GPLv2+" differ from a corporate point of
view? Can you imagine any company forking a GPLv2+-licensed project to
distribute it under the terms of a later version of the license?

Is there any case where someone would say "Hey, we can't use this
package, because it's GPLv2. We need it to be v3 or later"? The opposite
seems to be a common case instead.

I'm asking, because I don't think it's worth the time to verify all
packages in such detail, i.e. looking at all source files and guessing
what the original author intended to choose, if there are files called
COPYING or LICENSE in the root folder of a package.

The only case where it's important whether v2 or v2+ is in use is if you
want to stop using v2. IMO, if someone wants to do that, he should do
the research himself. It isn't important for a distribution.

Regards,
Andreas


