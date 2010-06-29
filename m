Received: from smtp205.alice.it ([82.57.200.101])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1OTdhO-0008MN-OB
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Jun 2010 18:30:29 +0200
Received: from [192.168.10.101] (95.237.131.90) by smtp205.alice.it
	(8.5.124.08) (authenticated as editempo)
	id 4C1A264500CE0352 for openembedded-devel@lists.openembedded.org;
	Tue, 29 Jun 2010 18:19:49 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTimtQogqYVnJvtD2BQInWujKyXs3ecFTptF6ZlBf@mail.gmail.com>
References: <AANLkTimtQogqYVnJvtD2BQInWujKyXs3ecFTptF6ZlBf@mail.gmail.com>
Date: Tue, 29 Jun 2010 18:19:47 +0200
Message-ID: <1277828387.2465.1.camel@gnutoo-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 82.57.200.101
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_SORBS_DUL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: bitbake: environments getting lost inside python callback function
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
X-List-Received-Date: Tue, 29 Jun 2010 16:30:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2010-06-28 at 17:32 +0530, Anand Sivaram wrote:
> bitbake -v -b ./recipes/ti/ti-dspbios_5.41.00.06.bb -f

Don't use bitbake -b,it doesn't handle compile-time dependencies.

Denis.




