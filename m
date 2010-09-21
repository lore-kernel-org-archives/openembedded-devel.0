Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1Oy3MK-0001il-2C
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 15:58:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 27D5D8A5C95
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 09:58:09 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13157-08 for <openembedded-devel@lists.openembedded.org>; 
	Tue, 21 Sep 2010 09:58:09 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id E2BDB8830FA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 09:58:08 -0400 (EDT)
Message-ID: <4C98B9F0.2010005@cbnco.com>
Date: Tue, 21 Sep 2010 09:58:08 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100228)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C97AC2B.1040205@cbnco.com>
	<AANLkTikd-8b1oMbyVus7372HT7u9KON0rx_nZM9fn-8A@mail.gmail.com>
In-Reply-To: <AANLkTikd-8b1oMbyVus7372HT7u9KON0rx_nZM9fn-8A@mail.gmail.com>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] base.bbclass: add make-native to default dependencies
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
X-List-Received-Date: Tue, 21 Sep 2010 13:58:58 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj wrote:

> although it does but make 3.82 is not usable out of box yet.
> so people might find surprises. 3.81 would be ok.

I could add a DEFAULT_PREFERENCE = "-1" to the 3.82 recipe and mention 
the packages that don't build with it in a comment. Do you remember 
which packages fail to build with 3.82?

>> diff --git a/classes/base.bbclass b/classes/base.bbclass
>> index b19eb32..5c6d41d 100644
>> --- a/classes/base.bbclass
>> +++ b/classes/base.bbclass
>> @@ -71,7 +71,7 @@ def base_deps(d):
>>        if not bb.data.getVar('INHIBIT_DEFAULT_DEPS', d):
>>                if (bb.data.getVar('HOST_SYS', d, 1) !=
>>                    bb.data.getVar('BUILD_SYS', d, 1)):
>> -                       deps += " virtual/${TARGET_PREFIX}gcc virtual/libc "
>> +                       deps += " make-native virtual/${TARGET_PREFIX}gcc
>> virtual/libc "
>>                elif bb.data.inherits_class('native', d) and \
>>                                bb.data.getVar('PN', d, True) not in \
>>                                ("linux-libc-headers-native", "quilt-native",



