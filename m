Received: from out1.smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1OmTGT-00020B-6g
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Aug 2010 17:12:19 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id DCD91449
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Aug 2010 11:11:56 -0400 (EDT)
Received: from frontend2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Fri, 20 Aug 2010 11:11:56 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=LHLKNPOWoyUOohFsqgaN/NQBUps=;
	b=GMoGgNYCfn91N6QGlthyxq87YvjwG5bW2lsyt/sGb2iZ82how2aF3t5QFC2Oh7JRk70EFuCJylYx14PuWxiLbhnZVwJ/o8m53SkFC/ZIznfgUGDjPhXMC06N1fTtRiTuqatVbO5uUDO3ulsZ17moNaHYH/fTfA2cjujX/kzpJtQ=
X-Sasl-enc: X2+Tctv0xKj+LIvkm+2OGKL26z0S2cH8Pa/jXUbC6EGi 1282317116
Received: from [192.168.1.34] (hnvr-4d07974b.pool.mediaWays.net [77.7.151.75])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 5DF7D5E6BDD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Aug 2010 11:11:56 -0400 (EDT)
Date: Fri, 20 Aug 2010 17:13:34 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTinMr1=Bj8eK2D+mg_J-P6jzvSAQAhXNtgkK=u1n@mail.gmail.com>
Message-ID: <alpine.LNX.2.00.1008201656030.5745@asterix.crazy-teaparty.dyndns.org>
References: <AANLkTinr4-xEo+Urc_9P+uLmLk6qPJSRzCJNYVsKAxD6@mail.gmail.com>
	<alpine.LNX.2.00.1008191432360.5745@asterix.crazy-teaparty.dyndns.org>
	<AANLkTinMr1=Bj8eK2D+mg_J-P6jzvSAQAhXNtgkK=u1n@mail.gmail.com>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.25
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: orphaned files
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
X-List-Received-Date: Fri, 20 Aug 2010 15:12:19 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

On Fri, 20 Aug 2010, Frans Meulenbroeks wrote:

> 2010/8/19 Vitus Jensen <vjensen@gmx.de>:
>> On Sun, 15 Aug 2010, Frans Meulenbroeks wrote:
>>
>>> I've made a list of patch files in recipes (prefixed with file://) and
>>> compared it with the list of patch files as appear on disk.
>>> Below is the list of 645 files that do not show up in any recipe and
>>> as such can be considered as orphaned.
>>> Proposal is to remove these files after double checking that they are
>>> indeed not used.
>>>
>>> Do people agree with this? If so can I have an ack?
>>>
>>> And do we want to have a commit for every file (makes it easy to
>>> revert an error) or a big commit with all removals?
>>> (removals per dir are also possible but that process is more difficult
>>> to automate and hence not my preferred solution.
>>>
>>> Your opinion is appreciated.
>>>
>>> Frans
>>

>>> htmldoc paths_1.8.27.patch
>>
>>
>> vitus@asterix:/home/nobkp/oe.dev/recipes/htmldoc$ fgrep -C 1
>> paths_1.8.27.patch *
>> htmldoc_1.8.27.bb-SRC_URI = "http://..../htmldoc-${PV}-source.tar.bz2 \
>> htmldoc_1.8.27.bb:file://paths_1.8.27.patch"
>> htmldoc_1.8.27.bb-


....

> I thought I made a mistake in the script, but after verification I have not.
> The recipes you mention have been removed a few days ago
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=e5287904a9dddc8ddc0f486d8526bc8cfda427b7

But I made a mistake when I used git fetch and forgot the merge :-( 
Sorry to have caused noice.


> It there any particular reason why you want to have both the 1.8 and
> 1.9 versions in the archive?
> If so, we should revert the commit above (and then of course the patch
> file itself should not be removed either.

Well, htmldoc_1.9.x-r1571.bb fetches an older "developer snapshot" as 
www.htmldoc.org/ calls it.  The download link on that page offers 1.8.27 
as the official version.  1.8.28 is in the work.  In my opinion one should 
always offer to build the official version, not some revision from an 
arbitrary point of time.

Having said this 1.9.x-r1571 was added because it contains a feature which 
one customer required and wasn't in the official release from that time. 
I don't know whether someone at all is using that recipe now.  So it's 
only the official vs. developer version thingy.

Bye,
    Vitus

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


