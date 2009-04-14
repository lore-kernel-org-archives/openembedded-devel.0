Received: from [206.46.173.17] (helo=vms173017pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LtqIL-0005Wl-Mj
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Apr 2009 23:35:58 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KI400C6R155FD90@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	14 Apr 2009 16:31:53 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 533806B83A8; Tue,
	14 Apr 2009 17:31:52 -0400 (EDT)
Date: Tue, 14 Apr 2009 17:31:52 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090414213152.GE28306@denix.org>
References: <1239335608-11080-1-git-send-email-denis@denix.org>
	<20090410040406.GA28306@denix.org> <gs1ffa$2r0$1@ger.gmane.org>
MIME-version: 1.0
In-reply-to: <gs1ffa$2r0$1@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.17
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=AWL,BAYES_00,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH] gegl: fix CR+LF newlines in the patch, as	it fails to apply
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
X-List-Received-Date: Tue, 14 Apr 2009 21:35:58 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 14, 2009 at 09:54:18AM +0200, Koen Kooi wrote:
> On 10-04-09 06:04, Denys Dmytriyenko wrote:
>> On Thu, Apr 09, 2009 at 11:53:28PM -0400, Denys Dmytriyenko wrote:
>>>
>>> Signed-off-by: Denys Dmytriyenko<denis@denix.org>
>>
>> Ah, as I thought - CR+LF newlines were lost somewhere in the MTA/MUA
>> transfer...
>>
>> But, if anybody cares, you can download the patch by wget and examine it 
>> in
>> hexview :)
>>
>> $ wget 
>> 'http://cgit.openembedded.net/cgit.cgi?url=openembedded/patch/&id=51893f23d9ec8ba94d9a29be7da3914bf2259eaf' 
>> -O gegl-newlines.patch
>>
>> Not sure why my quilt/patch fails to apply the patch with CR+LF newlines
>> though, as it appears to work fine for others.
>
> If you can manage to get it into git properly: Acked-by: Koen Kooi 
> <koen@openembedded.org>

There is no problem with git - it preserves all the characters as is, 
including CR and LF. I pushed it to .dev last week...

And BTW, patchwork didn't catch your Ack, as it wasn't on a separate line.

-- 
Denys


