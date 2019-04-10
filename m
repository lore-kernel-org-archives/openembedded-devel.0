Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E76A87D4E5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 12:02:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44fN7m15VQzHf;
	Wed, 10 Apr 2019 14:02:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1554897748;
	bh=3aMakx+4SUFEaZF+SpGWFupQpfX2yiwQMrhxN0hc2GU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TSPpfx4w3dC1MSZ+cy7ddsJU2anK2msAsspu6SAA8nPxRsI2F8cX7uP7Tq/NH2Mgd
	55d3LfLPCfz/2Q7/hjmm5DP1X3EA2yZwNeodQlcQulRW7l114vVoYCkvhOssDkqRDi
	EnnSYndjSqYpyJirpeenbagZbf4ChFG8tuZaEgUOy7DNYcy1Fm5AvAEJWc40jKvo19
	tCVHmjPvnIGOamBm73UQOGK++j06rmQhwThUn4Sc7pg2/WJwycQq6MH4Je97eMT+TM
	2HtZxqU7Q7ozkz4qBQiabtOweQHyIn6nX+o7SB58bpq6BJPlnCyYOX4fE+Pnd65bBk
	msAF6rLLe8uZkbnvW/alKozu8zylHm7F9EewIuS9ts22MZSFuj8M2ky4X/ZAutcFgS
	aA1pKgAQzlktSuV8XqAhOhdj4a3BgS09tsy1rgm96AQHdcWAyAxByDZuE/NE6sKTE1
	Lqtb3mep6Uebr+T6BNPB5rQNM8QxUD6XIvc+4Csgpbrxne/GMDJ6Ua92MQvA143k9I
	0t6n6DhzVo+9OLbPdHr+rChGlkFEuonMjsKKud1qzdLKJ5c72G1rCwA28zhK/TJkeJ
	ZuQLpq4VjZQtZe6Q6AtF4bDvuThD/Cm4XdH9G2Tkcf/orIT5dXWgFG1zyRbwkoU34e
	ODu1QOoS+myB/J+7e7a6HbF4=
Date: Wed, 10 Apr 2019 15:02:21 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Andrej Valek <andrej.valek@siemens.com>
Message-ID: <20190410120221.GA7028@localhost>
References: <20190409084621.27294-1-andrej.valek@siemens.com>
	<20190409100504.GA12869@localhost>
	<1898c904-c55b-c34c-4162-cdfd0dd2d27a@siemens.com>
MIME-Version: 1.0
In-Reply-To: <1898c904-c55b-c34c-4162-cdfd0dd2d27a@siemens.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] squid: upgrade squid 3.5.28 -> 4.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Apr 2019 12:02:30 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Apr 09, 2019 at 12:14:49PM +0200, Andrej Valek wrote:
> I think, my changes are backport-compatible.
> 
> The esi feature was not enabled int the previous version. It means, that
> libxml2/expat was also not required. In the current version, they have
> invert the logic. So it needs to be explicitly disabled.
> I have added on option to enable/disable openssl support. Previous
> version has openssl disabled.

You are saying the unconditional DEPENDS in the current version are 
useless since explicit enabling is required for both options in 3.5.28?

It would be good to mention in the description when such a bug existed.

> Regards,
> Andrej

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


