Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1I8Bzn-0007R0-6n
	for openembedded-devel@openembedded.org; Tue, 10 Jul 2007 11:26:59 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 09C2228C013; Tue, 10 Jul 2007 11:20:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_NJABL_DUL,RCVD_IN_PBL,REPTO_OVERQUOTE_THEBAT autolearn=no 
	version=3.1.7-deb
Received: from PROMETHEUS (e180181024.adsl.alicedsl.de [85.180.181.24])
	by srv043.dedi23.de (Postfix) with ESMTP id 3688028C012;
	Tue, 10 Jul 2007 11:20:03 +0200 (CEST)
Date: Tue, 10 Jul 2007 11:21:18 +0200
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.3) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <309753579.20070710112118@vanille-media.de>
To: Rolf Leggewie <no2spam@nospam.arcornews.de>
In-Reply-To: <f6ubg3$97c$1@sea.gmane.org>
References: <E1I7yE2-0000V0-1x@linuxtogo.org>
	<126613333.20070709215755@vanille-media.de>
	<f6u4pj$fk0$1@sea.gmane.org> <f6ubg3$97c$1@sea.gmane.org>
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: dbg packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jul 2007 09:26:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Rolf Leggewie wrote:
> Koen Kooi wrote:
>> Packaging is tedious, but let's not automate doing the wrong thing  

> I certainly agree with the general statement.  But I wonder if in this
> case it would not be OK to have just one big -dbg package per bb file
> even if there are more subpackages.  Going granular is certainly nice
> but I wonder if just having a dbg package suffices even if contains more
> than necessary.  I guess the -dbg packages should not be necessary most
> of the time.

> My vote would go for "bigger size" if it means "easier packaging right
> now instead of later" unless that entails "something breaks".

I totally agree. If I have to decide between slightly less granular
packaging of debug packages vs. tedious error-prone repetetive stating
of packaging for debug packages I gladly chose the first one.

For debugging, one or very few packages per recipe makes perfect sense to me.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



