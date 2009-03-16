Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Lj947-0002wv-5K
	for openembedded-devel@openembedded.org; Mon, 16 Mar 2009 10:25:01 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n2G9OKi2018106
	for <openembedded-devel@openembedded.org>; Mon, 16 Mar 2009 09:24:20 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18068-01 for <openembedded-devel@openembedded.org>;
	Mon, 16 Mar 2009 09:24:16 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n2G9OFr7018100
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Mon, 16 Mar 2009 09:24:15 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20090314174232.GH26343@smtp.west.cox.net>
References: <20090313145610.GA26373@denix.org>
	<018101c9a3f0$7f5b2cd0$5e3018ac@Glamdring>
	<20090313160732.GA26615@denix.org>
	<ac9c93b10903130920t14221262y841d9999563bd912@mail.gmail.com>
	<20090313165729.GG26343@smtp.west.cox.net>
	<ac9c93b10903140329g1504f185xea0b45bee224624b@mail.gmail.com>
	<20090314174232.GH26343@smtp.west.cox.net>
Date: Mon, 16 Mar 2009 09:24:21 +0000
Message-Id: <1237195461.5346.0.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_50,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: PARALLEL_MAKE
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
X-List-Received-Date: Mon, 16 Mar 2009 09:25:01 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Sat, 2009-03-14 at 10:42 -0700, Tom Rini wrote:
> On Sat, Mar 14, 2009 at 11:29:28AM +0100, Frans Meulenbroeks wrote:
> > (actually thinking of it as I write this: guess most packages should
> > depend on gcc, glibc etc but these are not made explicit)
> 
> Actually, I think those deps are explicit in the DEFAULT_DEPS or so
> variable, somewhere (which is why glibc and a few others have
> INHIBIT_DEFAULT_DEPS = 1).

Close. They get added to DEPENDS by base.bbclass unless
INHIBIT_DEFAULT_DEPS = 1.

Cheers,

Richard



