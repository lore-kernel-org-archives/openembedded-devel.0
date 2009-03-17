Received: from [204.2.163.5] (helo=sjogate2.atmel.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Shane.Dixon@atmel.com>) id 1LjcNy-0004ze-IK
	for openembedded-devel@openembedded.org; Tue, 17 Mar 2009 17:43:59 +0100
Received: from csomb01.corp.atmel.com ([10.95.30.150])
	by sjogate2.atmel.com (8.13.6/8.13.6) with ESMTP id n2HGcQnL007887
	for <openembedded-devel@openembedded.org>;
	Tue, 17 Mar 2009 09:41:23 -0700 (PDT)
Received: from 10.95.105.47 ([10.95.105.47]) by csomb01.corp.atmel.com
	([10.95.30.150]) with Microsoft Exchange Server HTTP-DAV ; 
	Tue, 17 Mar 2009 16:40:09 +0000
Received: from homestead.cso.atmel.com by csomb01.corp.atmel.com;
	17 Mar 2009 16:40:09 +0000
From: Shane Dixon <shane.dixon@atmel.com>
To: openembedded-devel@openembedded.org
In-Reply-To: <20090317050424.GJ26343@smtp.west.cox.net>
References: <49BF280A.7090705@tait.co.nz>
	<20090317050424.GJ26343@smtp.west.cox.net>
Organization: Atmel
Date: Tue, 17 Mar 2009 16:40:09 +0000
Message-Id: <1237308009.20770.11.camel@homestead>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
X-SA-Exim-Connect-IP: 204.2.163.5
X-SA-Exim-Mail-From: Shane.Dixon@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RDNS_NONE,
	WHOIS_NETSOLPR autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Git SRC_TARBALL_STASH filename
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
X-List-Received-Date: Tue, 17 Mar 2009 16:44:11 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Does SRC_TARBALL_STASH replace the PREMIRRORS variable?  I used to use a
variable in my local.conf that was similar to the following:

PREMIRRORS = "(ftp|https?)$://.*/.*/ http://server.com/openembedded/"

Is SRC_TARBALL_STASH the better way to do this?

--
Shane


On Mon, 2009-03-16 at 22:04 -0700, Tom Rini wrote:
> On Tue, Mar 17, 2009 at 05:33:14PM +1300, Douglas Royds wrote:
> 
> > Working behind a firewall that doesn't allow Git access (except over  
> > http). I've set SRC_TARBALL_STASH so that we only have to download the  
> > appropriate source tarball (manually) once.
> >
> > While building mtd-utils, BitBake is trying to fetch from the tarball stash:
> >
> >    http://.../git_git.infradead.org.mtd-utils.git.tar.gz
> >
> > Instead of:
> >
> >    http://.../git_git.infradead.org.mtd-utils.git_ea429635388f7bb53f62c41ec3d5ccf5fa207370.tar.gz
> >
> > The following patch appears to do the job, but I'm not confident this is  
> > the right fix. I notice that all the other fetchers use ud.localfile,  
> > which already has the correct filename.
> 
> What's going on is that it's trying to fetch the raw git tree stash,
> rather than the checkout stash, so you need to mirror the other.  OTOH,
> perhaps it should try first the checkout then the raw?
> 
-- 
Shane Dixon
Atmel Corporation
E-mail: shane.dixon@atmel.com


