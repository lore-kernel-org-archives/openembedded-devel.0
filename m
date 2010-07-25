Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Od3Wv-00009t-Ob
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Jul 2010 17:54:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o6PFs7mG009347
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jul 2010 16:54:07 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08908-07 for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jul 2010 16:54:03 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o6PFs2C7009341
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jul 2010 16:54:03 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <i2hk5h$86q$1@dough.gmane.org>
References: <1279963975-3736-1-git-send-email-raj.khem@gmail.com>
	<i2fjoo$iiu$1@dough.gmane.org> <20100724212502.GA4218@gmail.com>
	<i2gsqi$8sv$1@dough.gmane.org> <i2h6dv$1ni$1@dough.gmane.org>
	<i2harj$e6t$1@dough.gmane.org>
	<AANLkTik9ZnjaXvx6vxnjzxx013ms+cDjVv1FvsK31r5u@mail.gmail.com>
	<i2hk5h$86q$1@dough.gmane.org>
Date: Sun, 25 Jul 2010 16:53:56 +0100
Message-ID: <1280073236.13006.125.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/3] Make multi-machine toolchains to co-exist.
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
X-List-Received-Date: Sun, 25 Jul 2010 15:54:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2010-07-25 at 17:10 +0200, Koen Kooi wrote:
> > And cacao:
> > 
> > | configure: error: armv7a systems are not supported at this time
> > | ERROR: Function do_configure failed
> > 
> >> yes I was expecting that kind of problems. openssl also has similar issues.
> > 
> >> another idea that struck me was that we could change the target triplet to drop
> >> TARGET_VENDOR and replace it with TARGET_SUB_ARCH and TARGET_SUBARCH
> >> could be anything
> >> we could even make it same as MACHINE_ARCH which means you will build
> >> toolchain per machine
> >> and they will live together.
> > 
> >> then the tool names will be something like arm-v7-linux-gnueabi-*
> >> powerpc-e500-linux-gnu
> >> mips-mips2-linux etc. instead of *-angstrom-*- or *-oe-*-
> > 
> >> or arm-beagleboad-linux-gnueabi-* etc if we go with MACHINE_ARCH
> > 
> >> that would keep all recipe configury happy as the arch detected from
> >> config.guess will be what
> >> we had (arm, mips, mipsel powerpc etc) so no changes needed but we
> >> will have to drop the brand
> > 
> >> does it sound good ? bad?
> 
> I don't think abusing target vendor for that is a good idea. And I'm
> quite attached to my angstrom branded toolchains, tbh.

Note that you can still append your angstrom string to the vendor part
of the triplet...

Cheers,

Richard



