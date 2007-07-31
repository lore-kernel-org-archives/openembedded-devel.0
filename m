Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IFfQ9-0000QO-QA
	for openembedded-devel@openembedded.org; Tue, 31 Jul 2007 02:17:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l6V0FIxk007661;
	Tue, 31 Jul 2007 01:15:18 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07409-04; Tue, 31 Jul 2007 01:15:14 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l6V0F62o007623
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Tue, 31 Jul 2007 01:15:06 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: "Dr. Mickey Lauer" <mickey@vanille-media.de>
In-Reply-To: <1688461606.20070731020758@vanille-media.de>
References: <1185839805.7719.103.camel@localhost.localdomain>
	<52752373.20070731020230@vanille-media.de>
	<1688461606.20070731020758@vanille-media.de>
Date: Tue, 31 Jul 2007 01:15:06 +0100
Message-Id: <1185840906.7719.107.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@openembedded.org,
	Henryk =?ISO-8859-1?Q?Pl=F6tz?= <henryk@openmoko.org>,
	bitbake-dev <bitbake-dev@lists.berlios.de>
Subject: Re: The future of "svnnow"
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
X-List-Received-Date: Tue, 31 Jul 2007 00:17:06 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-07-31 at 02:07 +0200, Dr. Michael Lauer wrote:
> Dr. Michael Lauer wrote:
> >> c) how to migrate to these changes in OE.dev
> 
> > Who has actually used SRCDATE = now? I know I did.
> 
> Ok, upon rereading the challenge seems to change the pinpointed SRCDATEs
> in sane-srcdates.inc while making sure that the upgrade path still
> works (i.e. lexical comparison), right?

If we use

PV = "x.y.z+svnrXYZ"

that should sort above

PV = "x.y.z+svnYYYMMDD"

which is as good as we can probably hope for?

Richard



