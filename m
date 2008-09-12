Received: from [63.80.53.70] (helo=smtp-relay1.palm.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <prvs=rich.pixley=1345d411b@palm.com>)
	id 1KeDw1-0007sJ-BI
	for openembedded-devel@openembedded.org; Fri, 12 Sep 2008 21:04:01 +0200
X-IronPort-AV: E=Sophos;i="4.32,390,1217833200"; d="scan'208,217";a="6467677"
Received: from unknown (HELO mailhost02.palm.com) ([148.92.223.90])
	by smtp-relay1.palm.com with ESMTP; 12 Sep 2008 12:01:12 -0700
Received: from nara.local ([10.100.2.13])
	by mailhost02.palm.com (8.13.6+Sun/8.12.10) with ESMTP id
	m8CJ1BA6015115; Fri, 12 Sep 2008 12:01:11 -0700 (PDT)
Message-ID: <48CABC77.6090208@palm.com>
Date: Fri, 12 Sep 2008 12:01:11 -0700
From: Rich Pixley <rich.pixley@palm.com>
User-Agent: Thunderbird 2.0.0.16 (Macintosh/20080707)
MIME-Version: 1.0
To: "openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
References: <69E6C70090A0A14498CC98FAE5E06B6E2B3B01@hiob.intern.dresearch.de>	<48CA48B8.4060708@gmx.de>
	<69E6C70090A0A14498CC98FAE5E06B6E2B3B04@hiob.intern.dresearch.de>
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E2B3B04@hiob.intern.dresearch.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Some beginners problems
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
X-List-Received-Date: Fri, 12 Sep 2008 19:04:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Sledz, Steffen wrote:
>>> I wan't to make an image (e.g. minimal-image) for atngw100
>>> but with different linux kernel configuration (e.g.
>>> CONFIG_EXT2_FS=y). What's th right way to do this?
>>>
>>> * Just edit packages/linux/linux-2.6.24/atngw100/defconfig?
>>>       
>> Yes. But don't forget to increase the PR. Otherwise bitbake
>> doesn't know that the recipe was changed and doesn't rebuild
>> it.
>>     
>
> The change is not a bug fix or something like this. It's just a variant and not mentioned to become committed. So if i increase PR and someone else fixes a bug and increases PR too and I pull this fixes from git I have a conflict.  :(
Try using the  debian name branching approach.

"r6" -> "r6palm1"

That way "r7" will take precedence and yet "r6palm1" is different and 
lexically later than "r6".

--rich

