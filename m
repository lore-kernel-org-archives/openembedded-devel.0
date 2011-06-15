Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QWqp8-00051f-GZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jun 2011 16:12:02 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5FE8YaS011828
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2011 07:08:34 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 15 Jun 2011 07:08:34 -0700
Message-ID: <4DF8BCE1.8030202@windriver.com>
Date: Wed, 15 Jun 2011 09:08:33 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <840A81C1B782724A8EB52725BD519EFF02EAF4@MBX20.4emm.local>
In-Reply-To: <840A81C1B782724A8EB52725BD519EFF02EAF4@MBX20.4emm.local>
Subject: Re: [PATCH] prelink: Added prelink-20100106, which works on ARM.
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
X-List-Received-Date: Wed, 15 Jun 2011 14:12:02 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/15/11 4:18 AM, James Limbouris wrote:
> On Tue, 14 Jun 2011 22:20:18 -0500, Mark Hatle wrote:
>> On 6/14/11 10:02 PM, Mark Hatle wrote:
>>> Have you looked at:
>>>
>>> http://git.yoctoproject.org/cgit/cgit.cgi/prelink-cross/
>>>
>>> As far as I'm aware, this version works properly for all of the expected
>>> targets, including ARM.
>>>
>>> If it doesn't work, someone should submit a patch to the maintainer (me)
>> and
>>> we'll get things resolved.
>>>
>>> The Yocto prelinker contains both local (on-target) as well as cross-
>> prelinking
>>> support... (This is already integrated into oe-core)
>>
>> Forgot to note, look at the cross_prelink branch.  This is the head of tree for
>> the embedded items.  The "master" is a mirror of the current SVN tree from
>> Jakub
>> Jelinek.
>>
>> The ld-linux... patch hunk is already there, and in a better shape then the one
>> proposed.  Both the ld-linux.so.2 and ld-linux.so.3 are supported.
>>
>>> --Mark
> 
> Hi,
> 
> Thanks for the link - looks like the right way to go. Would it be a waste of time to copy
> the oe-core prelink and elfutils to vanilla oe? I'm a little confused about the relationship
> between the two branches, and the status of oe-core. Should I be working with local
> overlays, until things stabilise, or trying to push changes across?

While I haven't tried to do so, I would expect the recipes from oe-core for
prelink and elfutils to work pretty much as-is.  There might be a few very minor
tweaks required, but it would be minor.

--Mark

> James
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



