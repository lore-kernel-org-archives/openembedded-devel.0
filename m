Received: from [202.37.96.11] (helo=gatekeeper.tait.co.nz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <douglas.royds@tait.co.nz>) id 1LuYoW-0006xA-5J
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Apr 2009 23:08:08 +0200
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by localhost.tait.co.nz (Postfix) with ESMTP id 16EFD46753
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Apr 2009 09:04:05 +1200 (NZST)
Received: from sunstrike.tait.co.nz (sunstrike [172.25.40.92])by 
	gatekeeper.tait.co.nz (Postfix) with ESMTP id 0617746749for 
	<openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2009 09:04:05 
	+1200 (NZST)
Received: from conversion-daemon.sunstrike.tait.co.nz by 
	sunstrike.tait.co.nz(Sun Java System Messaging Server 6.1 (built Apr 28
	2004))id <0KI700901JI7XB00@sunstrike.tait.co.nz>(original mail from 
	douglas.royds@tait.co.nz)for openembedded-devel@lists.openembedded.org; 
	Fri,17 Apr 2009 09:04:04 +1200 (NZST)
Received: from [172.25.116.23] by sunstrike.tait.co.nz(Sun Java System 
	Messaging Server 6.1 (built Apr 28 2004))with ESMTP id 
	<0KI700KWCP6PL750@sunstrike.tait.co.nz> 
	foropenembedded-devel@lists.openembedded.org; Fri,17 Apr 2009 09:04:03 
	+1200 (NZST)
Date: Fri, 17 Apr 2009 09:04:00 +1200
From: Douglas Royds <douglas.royds@tait.co.nz>
In-reply-to: <49C05843.4030504@tait.co.nz>
To: openembedded-devel@lists.openembedded.org
Message-id: <49E79D40.3060003@tait.co.nz>
MIME-version: 1.0
References: <49BF280A.7090705@tait.co.nz> <49C05843.4030504@tait.co.nz>
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
X-imss-version: 2.053
X-imss-result: Passed
X-imss-approveListMatch: *@tait.co.nz
X-SA-Exim-Connect-IP: 202.37.96.11
X-SA-Exim-Mail-From: douglas.royds@tait.co.nz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	UNPARSEABLE_RELAY autolearn=no version=3.2.5
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
X-List-Received-Date: Thu, 16 Apr 2009 21:08:08 -0000
Content-type: text/plain;
	format=flowed;
	charset=ISO-8859-1
Content-transfer-encoding: 7BIT

Douglas Royds wrote:
> Tom Rini wrote:
>> On Tue, Mar 17, 2009 at 05:33:14PM +1300, Douglas Royds wrote:
>>> Working behind a firewall that doesn't allow Git access (except 
>>> over  http). I've set SRC_TARBALL_STASH so that we only have to 
>>> download the  appropriate source tarball (manually) once.
>>>
>>> While building mtd-utils, BitBake is trying to fetch from the 
>>> tarball stash:
>>>
>>>    http://.../git_git.infradead.org.mtd-utils.git.tar.gz
>>
>> What's going on is that it's trying to fetch the raw git tree stash,
>> rather than the checkout stash, so you need to mirror the other. 
>
> I don't have the raw git tree stash (firewall, remember)? Regrettably, 
> mtd-utils don't appear to provide HTTP access to their repository - 
> only git and ssh - so I don't appear to have any way of getting it.

For the record, I was able to download the mtd-utils Git stash tarball 
from the Angstrom mirror:

    http://www.angstrom-distribution.org/unstable/sources/git_git.infradead.org.mtd-utils.git.tar.gz

Now I can set SRC_TARBALL_STASH, and people (here behind the firewall) 
can access the appropriate git revision.

Douglas.




=======================================================================
This email, including any attachments, is only for the intended
addressee.  It is subject to copyright, is confidential and may be
the subject of legal or other privilege, none of which is waived or
lost by reason of this transmission.
If the receiver is not the intended addressee, please accept our
apologies, notify us by return, delete all copies and perform no
other act on the email.
Unfortunately, we cannot warrant that the email has not been
 altered or corrupted during transmission.
=======================================================================



