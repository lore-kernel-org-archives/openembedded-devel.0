Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JT2ND-00010l-73
	for openembedded-devel@openembedded.org; Sat, 23 Feb 2008 22:57:37 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1NLvIPZ007489
	for <openembedded-devel@openembedded.org>; Sat, 23 Feb 2008 21:57:18 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06903-09 for <openembedded-devel@openembedded.org>;
	Sat, 23 Feb 2008 21:57:14 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1NLvBPT007479
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Sat, 23 Feb 2008 21:57:11 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20080223223439.528c6997@widy.localdomain>
References: <1203793457.8255.5.camel@dax.rpnet.com>
	<fppt2j$thh$1@ger.gmane.org> <20080223223439.528c6997@widy.localdomain>
Date: Sat, 23 Feb 2008 21:57:11 +0000
Message-Id: <1203803831.8255.9.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Uppercase overrides and parsing speed
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
X-List-Received-Date: Sat, 23 Feb 2008 21:57:37 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Sat, 2008-02-23 at 22:34 +0200, Paul Sokolovsky wrote:
> On Sat, 23 Feb 2008 20:44:19 +0100 Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> > Didn't we also agree that variable names shouldn't include '_' at all?
> 
> How is that achievable? LETSUSEITLIKETHIS? Maybe exclude 'A' too? ;-)
> Isn't there was a hint that using '_' as an override operator is funky?

Changing the override operator involves a flag day and is painful,
changing the variable names isn't quite as invasive and it would be
possible to upgrade to over time.

FWIW, there isn't as much improvement as I'd hoped. I mentioned the
benchmark result since I had it and I thought it interesting...

Cheers,

Richard



