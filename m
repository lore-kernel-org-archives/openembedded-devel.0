Received: from [59.124.115.149] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nytowl@openmoko.org>) id 1LpbLR-0006Tv-K0
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Apr 2009 06:49:36 +0200
Received: from s0106001c100a3234.cg.shawcable.net ([70.73.132.19]
	helo=[172.16.14.105]) by aakash.openmoko.org with esmtpsa (SSL
	3.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <nytowl@openmoko.org>)
	id 1LpbIn-0006tU-2V; Fri, 03 Apr 2009 12:46:59 +0800
From: Angus Ainslie <nytowl@openmoko.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <6b7bf6e9-f3cb-4460-b1dc-312bc0ced19e@j18g2000prm.googlegroups.com>
References: <6b7bf6e9-f3cb-4460-b1dc-312bc0ced19e@j18g2000prm.googlegroups.com>
Date: Thu, 02 Apr 2009 22:46:37 -0600
Message-Id: <1238733997.6527.26.camel@think-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
X-SA-Exim-Connect-IP: 59.124.115.149
X-SA-Exim-Mail-From: nytowl@openmoko.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: opkg-devel <opkg-devel@googlegroups.com>
Subject: Re: [RFC] opkg conffiles force overwrite
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
X-List-Received-Date: Fri, 03 Apr 2009 04:49:36 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-04-02 at 20:59 -0700, Tick wrote:
> Adding another flag e.g. force_overwrite_conffile seems a little bit
> superfluous and not orthogonal to force_overwrite. But it will not
> change current opkg behavior.

There is currently a force-defaults switch so why not have a
force-maintainer or something similar. In OE specifically it would be
nice to be able to set this per recipe to try and guarantee a certain
config. The problem comes when 2 different recipes try to assert them
selves by using th force-maintainer flag.

Angus  



