Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NfEsJ-00033f-Nm
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Feb 2010 16:53:14 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	o1AFjxLO024887 for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2010 15:45:59 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Uij8JfwF8xFi
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2010 15:45:59 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	o1AFjtD6024864
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2010 15:45:57 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1265751396.6312.15.camel@trini-m4400>
References: <1265247822-20734-1-git-send-email-denis@denix.org>
	<1265302671.25338.57.camel@conroy-linux>
	<20100204172234.GA5641@denix.org>
	<1265306225.26642.3.camel@trini-m4400>
	<1265461459.5019.20.camel@lenovo.internal.reciva.com>
	<1265655603.16517.13.camel@trini-m4400>
	<20100209200804.GA3142@gmail.com>
	<1265751396.6312.15.camel@trini-m4400>
Date: Wed, 10 Feb 2010 15:50:38 +0000
Message-Id: <1265817038.9956.1.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC][PATCH] meta-toolchain: make SDK relocatable by	using $SDK_PATH var in env setup script
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
X-List-Received-Date: Wed, 10 Feb 2010 15:53:15 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2010-02-09 at 14:36 -0700, Tom Rini wrote:
> On Tue, 2010-02-09 at 12:08 -0800, Khem Raj wrote:
> > On (08/02/10 12:00), Tom Rini wrote:
> > I think the prerequisites of gcc libmpfr, libgmp and libmpc from 4.5
> > onwards are probably not used by 
> > any other tools we stage for host so it would be safer to build them inside
> > gcc tree and link in statically and only create runtime deps on the
> > libraries that always exist like libc. This will have better chance of
> > relocation. We just need to untar these libraries in top of gcc src tree
> > and it will use cofigure and use it. But this only solves gcc issue 
> > for other host/cross packages which depend upon libs from staging we still
> > need a solution. 
> 
> I was thinking that too.  Phil, can you try on your toolchain branch to
> do this? :)

Another generic solution I'm wondering about is postprocessing the
cross/native binaries with chrpath. This has the benefits of no horrible
shell quoting and its generic.

I might even be tempted to try this soon...

Cheers,

Richard



