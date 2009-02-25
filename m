Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1LcFfD-0006Ob-Ma
	for openembedded-devel@openembedded.org; Wed, 25 Feb 2009 10:03:09 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n1P8xblK028501
	for <openembedded-devel@openembedded.org>; Wed, 25 Feb 2009 08:59:37 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25651-07 for <openembedded-devel@openembedded.org>;
	Wed, 25 Feb 2009 08:59:29 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n1P8xQ2g028491
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Wed, 25 Feb 2009 08:59:27 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20090225022507.GP2172@smtp.west.cox.net>
References: <200902131728.08634.openembedded@haerwu.biz>
	<20090224064639.GE2172@smtp.west.cox.net>
	<1235492001.27962.60.camel@andromeda>
	<8763izyarp.fsf@neumann.lab.ossystems.com.br>
	<fce2a370902241036y359e2c7cv1126a62c8627d2bb@mail.gmail.com>
	<20090224185059.GL2172@smtp.west.cox.net>
	<87wsbfw9zy.fsf@neumann.lab.ossystems.com.br>
	<20090225022507.GP2172@smtp.west.cox.net>
Date: Wed, 25 Feb 2009 09:01:48 +0000
Message-Id: <1235552508.5399.2.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: checksums situation
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
X-List-Received-Date: Wed, 25 Feb 2009 09:03:12 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Tue, 2009-02-24 at 19:25 -0700, Tom Rini wrote:
> On Tue, Feb 24, 2009 at 11:01:05PM -0300, Otavio Salvador wrote:
> [snip]
> > I do belive that the best way to solve it is to have a md5 file together
> > with the .bb recipe. This solves the problems for forks, derivatives and
> > also makes harder to just use "cat tmp/checksums.ini >> conf/checksums.ini".
> 
> Running a script that will make the .sum file isn't any harder really.
> And it's still a "this is the checksum we downloaded" not "this is the
> checksum upstream says is correct".

You can specify the md5 as part of the SRC_URI if I remember correctly.
Its just such a pain, nobody does.

-- 
RP



