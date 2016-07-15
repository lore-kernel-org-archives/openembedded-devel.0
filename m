Return-Path: <pascal.bach@siemens.com>
Received: from lizzard.sbs.de (lizzard.sbs.de [194.138.37.39])
	by mail.openembedded.org (Postfix) with ESMTP id 10DBC7317F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 14:35:04 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id u6FEZ2kt004201
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 16:35:02 +0200
Received: from [139.16.77.104] (MD1FZU9C.ww002.siemens.net [139.16.77.104])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id u6FEZ2BO026310
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 16:35:02 +0200
To: openembedded-devel@lists.openembedded.org
References: <1467976306-4442-1-git-send-email-pascal.bach@siemens.com>
	<20160712135247.w2bcuhgvtlvyr3hk@jama>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <052d4b80-f033-ade9-9479-e1258594010c@siemens.com>
Date: Fri, 15 Jul 2016 16:34:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <20160712135247.w2bcuhgvtlvyr3hk@jama>
Subject: Re: [meta-oe][PATCH] poco: update to 1.7.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Jul 2016 14:35:05 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit


On 12.07.2016 15:52, Martin Jansa wrote:
> On Fri, Jul 08, 2016 at 01:11:46PM +0200, Pascal Bach wrote:
>> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
>> ---
>>  meta-oe/recipes-support/poco/{poco_1.7.1.bb => poco_1.7.3.bb} | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>  rename meta-oe/recipes-support/poco/{poco_1.7.1.bb => poco_1.7.3.bb} (96%)
>>
>> diff --git a/meta-oe/recipes-support/poco/poco_1.7.1.bb b/meta-oe/recipes-support/poco/poco_1.7.3.bb
>> similarity index 96%
>> rename from meta-oe/recipes-support/poco/poco_1.7.1.bb
>> rename to meta-oe/recipes-support/poco/poco_1.7.3.bb
>> index 135d2aa..75e0997 100644
>> --- a/meta-oe/recipes-support/poco/poco_1.7.1.bb
>> +++ b/meta-oe/recipes-support/poco/poco_1.7.3.bb
>> @@ -17,8 +17,8 @@ SRC_URI = " \
>>      file://run-ptest \
>>     "
>>  
>> -SRC_URI[md5sum] = "a4b755d47303b20a0e2586f281d05a36"
>> -SRC_URI[sha256sum] = "6dbbc2018912ad9af6af96f605933ed91354a1e7423e5dbd04d8e9a2b2d15c05"
>> +SRC_URI[md5sum] = "6b979d7d9c1751c2e063338cb5ea8977"
>> +SRC_URI[sha256sum] = "af75f279c9eac35b39fc998d8d20dc45d5bef91eb75851ff99d948ca128c7740"
> Don't use github archives which don't have stable checksums, this fails
> again the same as I've reported when you sent this change last time.
>
Sorry I completely missed that. I will submit a revised patch. Thanks for the hint.

