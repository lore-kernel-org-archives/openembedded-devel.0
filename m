Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NxNKb-0002sG-1E
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 18:33:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o31GU5g3023253
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 1 Apr 2010 17:30:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23148-02 for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Apr 2010 17:30:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o31GTu48023241
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 1 Apr 2010 17:29:56 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <z2xd1b08f941004010918v6b58f2dducced0204ce8a9739@mail.gmail.com>
References: <1270135981.4993.128.camel@rex>
	<h2n19c1b8a91004010846u8f936157z252190a0f6a6b6e4@mail.gmail.com>
	<1270138171.4993.141.camel@rex>
	<z2xd1b08f941004010918v6b58f2dducced0204ce8a9739@mail.gmail.com>
Date: Thu, 01 Apr 2010 17:29:54 +0100
Message-ID: <1270139394.4993.150.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Request for branch merge
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
X-List-Received-Date: Thu, 01 Apr 2010 16:33:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-04-01 at 18:18 +0200, Andrea Adami wrote:
> >I just looked and the eglib
> -- sorry for jumping in --
> 
> RP, while you're there, pls look at klibc.
> 
> do_stage() {
>         oe_runmake  install
>         cp '${STAGING_DIR_TARGET}/bin/klcc'
> '${CROSS_DIR}/bin/${TARGET_PREFIX}klcc'
> }
> 
> How to properly install klcc ?

The closest analogy is what binconfig.bbclass ends up doing or in poky
see the gtk+.inc file and its sysroot postprocessing function.

You will be pleased to know I have plans to simplify this massively by
moving STAGING_BINDIR_CROSS to be a directory under ${D}${bindir}, I've
just not got to that yet. This is part of the gradual removal of the
cross directory in favour of the sysroots.

Cheers,

Richard




