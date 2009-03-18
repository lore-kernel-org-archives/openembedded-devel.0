Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LjpE0-0000mW-U1
	for openembedded-devel@openembedded.org; Wed, 18 Mar 2009 07:26:04 +0100
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090318062509.TPXK15318.fed1rmmtao105.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Wed, 18 Mar 2009 02:25:09 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id UWR91b0064dMFYL04WR9aP; Wed, 18 Mar 2009 02:25:09 -0400
X-Authority-Analysis: v=1.0 c=1 a=GN_yKGkEFO0A:10 a=JfrnYn6hAAAA:8
	a=sUyiPbFjfHvuVPfQJuUA:9 a=AIKGenoRAz-giEo3oRcA:7
	a=faXxzkihn7jxFkQl3VFfhfAGo0AA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Tue, 17 Mar 2009 23:25:09 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090318062509.GQ26343@smtp.west.cox.net>
References: <20090317050424.GJ26343@smtp.west.cox.net>
	<49C05843.4030504@tait.co.nz>
MIME-Version: 1.0
In-Reply-To: <49C05843.4030504@tait.co.nz>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.41
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
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
X-List-Received-Date: Wed, 18 Mar 2009 06:26:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 18, 2009 at 03:11:15PM +1300, Douglas Royds wrote:
> Tom Rini wrote:
>> On Tue, Mar 17, 2009 at 05:33:14PM +1300, Douglas Royds wrote:
>>
>>   
>>> Working behind a firewall that doesn't allow Git access (except over  
>>> http). I've set SRC_TARBALL_STASH so that we only have to download 
>>> the  appropriate source tarball (manually) once.
>>>
>>> While building mtd-utils, BitBake is trying to fetch from the tarball stash:
>>>
>>>    http://.../git_git.infradead.org.mtd-utils.git.tar.gz
>>>
>>> Instead of:
>>>
>>>    http://.../git_git.infradead.org.mtd-utils.git_ea429635388f7bb53f62c41ec3d5ccf5fa207370.tar.gz
>>>
>>> The following patch appears to do the job, but I'm not confident this 
>>> is  the right fix. I notice that all the other fetchers use 
>>> ud.localfile,  which already has the correct filename.
>>>     
>>
>> What's going on is that it's trying to fetch the raw git tree stash,
>> rather than the checkout stash, so you need to mirror the other.  OTOH,
>> perhaps it should try first the checkout then the raw?
>>   
>
> I don't have the raw git tree stash (firewall, remember)? Regrettably,  
> mtd-utils don't appear to provide HTTP access to their repository - only  
> git and ssh - so I don't appear to have any way of getting it.

Right.  What I believe happens is that PREMIRRORS (etc) will work for
git_..GITHASH and SRC_TARBALL_STASH will work for git_...git.tar.gz as
(I believe) mirrors are, even for svn/cvs, the right version but
SRC_TARBALL_STASH will then make the checked-out tarball (ie populate
${DL_DIR}/cvs/pkg../ then make ${DL_DIR}/pkg...tar.gz).  I think :)

-- 
Tom Rini


