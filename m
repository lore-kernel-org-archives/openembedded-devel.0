Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NzmjZ-0005bV-Ob
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 10:05:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o3881f78010463
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 8 Apr 2010 09:01:41 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10334-03 for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Apr 2010 09:01:37 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o3881W79010457
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 8 Apr 2010 09:01:35 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100407154445.GA9625@merkur.sol.de>
References: <1269796691.8018.74.camel@mattotaupa>
	<1269955259.4103.51.camel@mattotaupa>
	<1270223959.3873.29.camel@mattotaupa>
	<l2s19c1b8a91004021128sa6116ab2p62cec8cd78c4db43@mail.gmail.com>
	<1270237489.3714.11.camel@mattotaupa>
	<1270293620.3692.33.camel@mattotaupa>
	<20100403135105.GA6475@merkur.sol.de>
	<1270305838.4237.23.camel@mattotaupa>
	<20100407154445.GA9625@merkur.sol.de>
Date: Thu, 08 Apr 2010 09:01:32 +0100
Message-ID: <1270713692.24541.1374.camel@rex>
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
Subject: Re: autopoint || touch config.rpath
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
X-List-Received-Date: Thu, 08 Apr 2010 08:05:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-04-07 at 17:44 +0200, Jens Seidel wrote:
> > Thank you for this great summary. I am still clueless about
> > `config.rpath` though.
> 
> Yep, try the hints above.

I'm late to this thread but poky has this in autoconf.bbclass:


  if grep "^[[:space:]]*AM_GLIB_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then 
	if grep "sed.*POTFILES" $CONFIGURE_AC >/dev/null; then
		: do nothing -- we still have an old unmodified configure.ac
	else
		oenote Executing glib-gettextize --force --copy
		echo "no" | glib-gettextize --force --copy 130
	fi
  else if grep "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then 
	cp ${STAGING_DATADIR}/gettext/config.rpath ${S}/
  fi

which generally makes sure config.rpath is available when its needed.

Cheers,

Richard



