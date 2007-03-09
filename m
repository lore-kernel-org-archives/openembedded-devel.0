Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HPd1f-0000r8-9T
	for openembedded-devel@openembedded.org; Fri, 09 Mar 2007 12:12:43 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l29BChXp015570
	for <openembedded-devel@openembedded.org>; Fri, 9 Mar 2007 11:12:43 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14437-10 for <openembedded-devel@openembedded.org>;
	Fri,  9 Mar 2007 11:12:40 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l29BCc7D015560
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Fri, 9 Mar 2007 11:12:38 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <45F13D02.9090402@whitby.id.au>
References: <45E77A73.5020800@protium.com>
	<45E7F2C4.9030300@dominion.kabel.utwente.nl>
	<1172949738.5942.57.camel@localhost.localdomain>
	<45F13D02.9090402@whitby.id.au>
Date: Fri, 09 Mar 2007 11:12:37 +0000
Message-Id: <1173438757.5864.61.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] bogofeed creation
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
X-List-Received-Date: Fri, 09 Mar 2007 11:12:44 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2007-03-09 at 21:24 +1030, Rod Whitby wrote:
> You all know what this is about, so I won't bother repeating the
> arguments for or against.
> 
> Here is a proposed method of bogofeed creation.
> 
> > ============================================================
> > --- packages/meta/package-index.bb      4f33564e2d11f46b7975676e5901b225190d4920
> > +++ packages/meta/package-index.bb      bd6e82e439382919a03c936ef326e8de3149c27d

package-index updates the index in deploy/ipk. I propose this bogofeed
should be a new .bb file, make-bogofeed.bb or something as they do two
different things.

I don't like "rm -rf ${DEPLOY_DIR_IPK}/$d/morgue" as that's not
something this script should be doing.

Personally, I still think there should be a flag to get the old feed
behaviour back.

Cheers,

Richard



