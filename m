Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NfHc0-0005YZ-RQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Feb 2010 19:48:36 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NfHZW-0007LT-1H from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Feb 2010 10:45:58 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 10 Feb 2010 10:45:57 -0800
Received: from 172.30.80.244 ([172.30.80.244]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Wed, 10 Feb 2010 18:45:56 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	10 Feb 2010 11:45:53 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1265817038.9956.1.camel@dax.rpnet.com>
References: <1265247822-20734-1-git-send-email-denis@denix.org>
	<1265302671.25338.57.camel@conroy-linux>
	<20100204172234.GA5641@denix.org>
	<1265306225.26642.3.camel@trini-m4400>
	<1265461459.5019.20.camel@lenovo.internal.reciva.com>
	<1265655603.16517.13.camel@trini-m4400>
	<20100209200804.GA3142@gmail.com>
	<1265751396.6312.15.camel@trini-m4400>
	<1265817038.9956.1.camel@dax.rpnet.com>
Organization: Mentor Graphics Corporation
Date: Wed, 10 Feb 2010 11:45:53 -0700
Message-Id: <1265827553.6312.182.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-OriginalArrivalTime: 10 Feb 2010 18:45:57.0665 (UTC)
	FILETIME=[48759910:01CAAA81]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC][PATCH] meta-toolchain: make SDK relocatable by using $SDK_PATH var in env setup script
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
X-List-Received-Date: Wed, 10 Feb 2010 18:48:36 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2010-02-10 at 15:50 +0000, Richard Purdie wrote:
> On Tue, 2010-02-09 at 14:36 -0700, Tom Rini wrote:
> > On Tue, 2010-02-09 at 12:08 -0800, Khem Raj wrote:
> > > On (08/02/10 12:00), Tom Rini wrote:
> > > I think the prerequisites of gcc libmpfr, libgmp and libmpc from 4.5
> > > onwards are probably not used by 
> > > any other tools we stage for host so it would be safer to build them inside
> > > gcc tree and link in statically and only create runtime deps on the
> > > libraries that always exist like libc. This will have better chance of
> > > relocation. We just need to untar these libraries in top of gcc src tree
> > > and it will use cofigure and use it. But this only solves gcc issue 
> > > for other host/cross packages which depend upon libs from staging we still
> > > need a solution. 
> > 
> > I was thinking that too.  Phil, can you try on your toolchain branch to
> > do this? :)
> 
> Another generic solution I'm wondering about is postprocessing the
> cross/native binaries with chrpath. This has the benefits of no horrible
> shell quoting and its generic.

This might be nice for relocating packaged staging, more-so than SDK
(depending on what you need / want your SDK to be able to do without
OE...)

-- 
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


