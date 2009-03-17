Received: from [202.37.96.11] (helo=gatekeeper.tait.co.nz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <douglas.royds@tait.co.nz>) id 1LjhbU-00037G-EO
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Mar 2009 23:19:58 +0100
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by localhost.tait.co.nz (Postfix) with ESMTP id 94AB046759
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2009 11:16:56 +1300 (NZDT)
Received: from sunstrike.tait.co.nz (sunstrike [172.25.40.92])by 
	gatekeeper.tait.co.nz (Postfix) with ESMTP id 8495046755for 
	<openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2009 11:16:55 
	+1300 (NZDT)
Received: from conversion-daemon.sunstrike.tait.co.nz by 
	sunstrike.tait.co.nz(Sun Java System Messaging Server 6.1 (built Apr 28
	2004))id <0KGO00E017SIE700@sunstrike.tait.co.nz>(original mail from 
	douglas.royds@tait.co.nz)for openembedded-devel@lists.openembedded.org; 
	Wed,18 Mar 2009 11:16:55 +1300 (NZDT)
Received: from [172.25.116.23] by sunstrike.tait.co.nz(Sun Java System 
	Messaging Server 6.1 (built Apr 28 2004))with ESMTP id 
	<0KGO00E4X8K2I400@sunstrike.tait.co.nz> 
	foropenembedded-devel@lists.openembedded.org; Wed,18 Mar 2009 11:16:53 
	+1300 (NZDT)
Date: Wed, 18 Mar 2009 11:16:45 +1300
From: Douglas Royds <douglas.royds@tait.co.nz>
In-reply-to: <1237308009.20770.11.camel@homestead>
To: openembedded-devel@lists.openembedded.org
Message-id: <49C0214D.3050205@tait.co.nz>
MIME-version: 1.0
References: <49BF280A.7090705@tait.co.nz> 
	<1237308009.20770.11.camel@homestead>
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
X-imss-version: 2.053
X-imss-result: Passed
X-imss-approveListMatch: *@tait.co.nz
X-SA-Exim-Connect-IP: 202.37.96.11
X-SA-Exim-Mail-From: douglas.royds@tait.co.nz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_40,RDNS_NONE,
	UNPARSEABLE_RELAY,WHOIS_NETSOLPR autolearn=no version=3.2.5
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
X-List-Received-Date: Tue, 17 Mar 2009 22:20:39 -0000
Content-type: text/plain;
	format=flowed;
	charset=ISO-8859-1
Content-transfer-encoding: 7BIT

SRC_TARBALL_STASH is used by all the VCS "fetchers" (CVS, Subversion, 
Git, ...) to try to download the desired VCS tagged version as a tarball 
before going to the VCS itself.

SOURCE_MIRROR_URL is used in own-mirrors.bbclass to set the PREMIRRORS 
variable, which is used by the wget.pyb BitBake "fetcher" before it has 
a go at the specified SRC_URI. SOURCE_MIRROR_URL will only apply to 
tarballs fetched by wget, not to VCS URLs.


Shane Dixon wrote:
> Does SRC_TARBALL_STASH replace the PREMIRRORS variable?  I used to use a
> variable in my local.conf that was similar to the following:
>
> PREMIRRORS = "(ftp|https?)$://.*/.*/ http://server.com/openembedded/"
>
> Is SRC_TARBALL_STASH the better way to do this?
>
> --
> Shane
>
>
> On Mon, 2009-03-16 at 22:04 -0700, Tom Rini wrote:
>   
>> On Tue, Mar 17, 2009 at 05:33:14PM +1300, Douglas Royds wrote:
>>
>>     
>>> Working behind a firewall that doesn't allow Git access (except over  
>>> http). I've set SRC_TARBALL_STASH so that we only have to download the  
>>> appropriate source tarball (manually) once.
>>>
>>> While building mtd-utils, BitBake is trying to fetch from the tarball stash:
>>>
>>>    http://.../git_git.infradead.org.mtd-utils.git.tar.gz
>>>
>>> Instead of:
>>>
>>>    http://.../git_git.infradead.org.mtd-utils.git_ea429635388f7bb53f62c41ec3d5ccf5fa207370.tar.gz
>>>
>>> The following patch appears to do the job, but I'm not confident this is  
>>> the right fix. I notice that all the other fetchers use ud.localfile,  
>>> which already has the correct filename.
>>>       
>> What's going on is that it's trying to fetch the raw git tree stash,
>> rather than the checkout stash, so you need to mirror the other.  OTOH,
>> perhaps it should try first the checkout then the raw?
>>
>>     


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



