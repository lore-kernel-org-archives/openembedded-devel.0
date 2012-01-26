Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1RqUJ3-0005Ra-DP
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Jan 2012 19:44:21 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 9B4A531581C1;
	Thu, 26 Jan 2012 19:36:33 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id oK4RD8WdYoVL; Thu, 26 Jan 2012 19:36:22 +0100 (CET)
Received: from [172.22.22.61] (drms-590ed503.pool.mediaWays.net [89.14.213.3])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 40A3C315818C;
	Thu, 26 Jan 2012 19:36:22 +0100 (CET)
Message-ID: <4F219D25.3050604@opendreambox.org>
Date: Thu, 26 Jan 2012 19:36:21 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111229 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1592899.mTy93uB97i@helios> <4F20130D.2010208@balister.org>
	<1908796.glHMrEiIxU@helios> <4F202735.8040405@balister.org>
	<CACW_hTYpQHcHT3YoN=-G1FFu2-KiUu_FOfkdEPk4P7wMNQEZZw@mail.gmail.com>
	<20120126090245.GB3747@jama.jama.net>
	<CACW_hTaYzG9zF+SSWpBFWxQyNMciQqk2zSQ9KJpo+4xc8_H5KQ@mail.gmail.com>
	<20120126161123.GD3747@jama.jama.net>
In-Reply-To: <20120126161123.GD3747@jama.jama.net>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: Splitting meta-oe
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
X-List-Received-Date: Thu, 26 Jan 2012 18:44:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 26.01.2012 17:11, Martin Jansa wrote:
> On Thu, Jan 26, 2012 at 03:45:52PM +0100, Frans Meulenbroeks wrote:
>> - and if a recipe is not well enough tested it should probably not end up
>> in meta-oe anyway (but better e.g. in meta-oe-next or meta-oe-new or
>> whatever you want to call the super bleeding edge version)
> 
> How will Joe Average know that because of webkit-efl he should enable
> meta-efl-next (or
> oe-core-next-libsoup-development-version-alpha-centauri-edition layer) 
>  if he doesn't even know what's happening in layers he is
> using already (meta-efl for webkit-efl)?

I think libsoup is not a good example, because the specific version
doesn't live in meta-oe, but in meta-efl, which is fine IMO.

Being someone who's just in the process of moving a distribution from
OE-classic to OE-core + meta-oe, I've already been busy figuring out the
exact differences between recipes present in both layers. I'd welcome
any reduction in duplication and versions present in both layers.

Regards,
Andreas


