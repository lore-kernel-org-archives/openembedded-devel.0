Received: from p3plsmtpa01-04.prod.phx3.secureserver.net ([72.167.82.84])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mike@mwester.net>) id 1Pms8e-0001n5-Db
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Feb 2011 19:18:09 +0100
Received: (qmail 5428 invoked from network); 8 Feb 2011 18:16:59 -0000
Received: from unknown (209.242.7.132)
	by p3plsmtpa01-04.prod.phx3.secureserver.net (72.167.82.84) with ESMTP;
	08 Feb 2011 18:16:58 -0000
Message-ID: <4D51888D.5050707@mwester.net>
Date: Tue, 08 Feb 2011 12:16:45 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1297116822-30938-1-git-send-email-filip.zyzniewski@gmail.com>
	<4D517D6C.3070604@mentor.com>
In-Reply-To: <4D517D6C.3070604@mentor.com>
Subject: Re: [PATCH] task-base: conditional wifi and bluetooth tasks in	PACKAGES
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
X-List-Received-Date: Tue, 08 Feb 2011 18:18:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 2/8/2011 11:29 AM, Tom Rini wrote:
> On 02/07/2011 03:13 PM, Filip Zyzniewski wrote:
>> This reduces amount of tasks for bootstrap-image from around 3400 to
>> around 1600 for jlime.
>>
>> Signed-off-by: Filip Zyzniewski<filip.zyzniewski@gmail.com>
> 
> Can some of the other distro folks chime in here?

Er, yes.  The commit message lacks information on how this affects other
distros.

I'm just guessing, but I expect that this commit will require that
distros expecting bluetooth and wifi support will need to ensure that
the correct set of features are defined.  Is that a correct assumption?

-Mike (mwester)


>> ---
>>   recipes/tasks/task-base.bb |    6 +++---
>>   1 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/recipes/tasks/task-base.bb b/recipes/tasks/task-base.bb
>> index 32d871d..c8d6df7 100644
>> --- a/recipes/tasks/task-base.bb
>> +++ b/recipes/tasks/task-base.bb
>> @@ -1,5 +1,5 @@
>>   DESCRIPTION = "Merge machine and distro options to create a basic
>> machine task/package"
>> -PR = "r92"
>> +PR = "r93"
>>
>>   inherit task
>>
>> @@ -31,8 +31,8 @@ PACKAGES = ' \
>>               ${@base_contains("MACHINE_FEATURES", "redboot",
>> "task-base-redboot", "",d)} \
>>               ${@base_contains("MACHINE_FEATURES", "apex",
>> "task-base-apex", "",d)} \
>>               \
>> -            task-base-bluetooth \
>> -            task-base-wifi \
>> +            ${@base_contains("MACHINE_FEATURES", "bluetooth",
>> "task-base-bluetooth", "",d)} \
>> +            ${@base_contains("MACHINE_FEATURES", "wifi",
>> "task-base-wifi", "",d)} \
>>               \
>>               ${@base_contains("DISTRO_FEATURES", "cramfs",
>> "task-base-cramfs", "", d)} \
>>               ${@base_contains("DISTRO_FEATURES", "ipsec",
>> "task-base-ipsec", "", d)} \
> 
> 



