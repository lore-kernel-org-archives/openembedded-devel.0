Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1P5iGW-0004L6-AJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 19:03:55 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1P5iG2-0007Gv-8b from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 10:03:22 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 12 Oct 2010 10:03:22 -0700
Received: from [172.30.80.109] ([172.30.80.109]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 12 Oct 2010 11:03:20 -0600
Message-ID: <4CB494D5.3010900@mentor.com>
Date: Tue, 12 Oct 2010 10:03:17 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CB48C51.9000403@mentor.com> <i9234d$dh4$1@dough.gmane.org>
	<4CB490CD.50500@balister.org>
In-Reply-To: <4CB490CD.50500@balister.org>
X-OriginalArrivalTime: 12 Oct 2010 17:03:21.0128 (UTC)
	FILETIME=[5FAB9A80:01CB6A2F]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Remove older freetype versions
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
X-List-Received-Date: Tue, 12 Oct 2010 17:03:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Philip Balister wrote:
> On 10/12/2010 12:41 PM, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 12-10-10 18:26, Tom Rini wrote:
>>> Hey all,
>>>
>>> I'd like to remove all versions of freetype before 2.4.3.  The only dist
>>> which is pinning freetype currently does so via
>>> conf/distro/include/preferred-opie-versions.inc and that pins to a
>>> non-existent version (it's using OPIE_VERSION which seems wrong).  All
>>> of the previous versions have various security issues, including
>>> remotely exploitable ones.  Only the very oldest version we have as a
>>> D_P -1 so everyone was using 2.3.12 and will be going up to 2.4.3
>>> (libraries are compat).
>>
>> Speaking of freetype, the bytecode patent expired, so we can turn that
>> on and get nicer text :)
>>
>> And removing older freetypes is a good idea
> 
> I'd like to point people at openwmbedded/removal.txt. This would be a 
> good place to schedule things for deletion. As in I added a new version 
> and made it active, but do not want to delete the older version for a 
> couple of months just in case something crops up. So leave a note in 
> removal.txt to look are removing a recipe on a certain date.

In general, good idea.  But we've been doing things a lot quicker more 
recently.  And I'd like to not wait for a long time for security related 
items.

-- 
Tom Rini
Mentor Graphics Corporation


