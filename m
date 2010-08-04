Received: from smtp-68.nebula.fi ([83.145.220.68])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <henri.bragge@dcombus.com>) id 1OgdUi-0003Ip-E6
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 14:54:54 +0200
Received: from [100.100.100.68] (unknown [83.150.95.26])
	by smtp-68.nebula.fi (Postfix) with ESMTP id AE17A43F0424
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Aug 2010 15:54:43 +0300 (EEST)
Message-ID: <4C596314.3050305@dcombus.com>
Date: Wed, 04 Aug 2010 15:54:44 +0300
From: Henri Bragge <henri.bragge@dcombus.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1280918590-5969-1-git-send-email-henri.bragge@dcombus.com>	<1280918590-5969-2-git-send-email-henri.bragge@dcombus.com>	<1280918590-5969-3-git-send-email-henri.bragge@dcombus.com>
	<AANLkTik=Xm39yJcLnLH12heRyvS0gUEvSwFCJMBtWeLi@mail.gmail.com>
In-Reply-To: <AANLkTik=Xm39yJcLnLH12heRyvS0gUEvSwFCJMBtWeLi@mail.gmail.com>
X-SA-Exim-Connect-IP: 83.145.220.68
X-SA-Exim-Mail-From: henri.bragge@dcombus.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] recipe for scli-0.4.0
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
X-List-Received-Date: Wed, 04 Aug 2010 12:54:54 -0000
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks wrote:
> 2010/8/4 Henri Bragge <henri.bragge@dcombus.com>
>
>   
>> Signed-off-by: Henri Bragge <henri.bragge@dcombus.com>
>> ---
>>  recipes/scli/scli.inc    |    6 ++++++
>>  recipes/scli/scli_svn.bb |    8 ++++++++
>>  2 files changed, 14 insertions(+), 0 deletions(-)
>>  create mode 100644 recipes/scli/scli.inc
>>  create mode 100644 recipes/scli/scli_svn.bb
>>
>> diff --git a/recipes/scli/scli.inc b/recipes/scli/scli.inc
>> new file mode 100644
>> index 0000000..abe341d
>> --- /dev/null
>> +++ b/recipes/scli/scli.inc
>> @@ -0,0 +1,6 @@
>> +DESCRIPTION = "SNMP Command Line Interface"
>> +LICENSE = "GPLv2"
>> +SECTION = "console/network"
>> +DEPENDS = "gsnmp readline libxml2 ncurses"
>> +
>> +inherit autotools
>> diff --git a/recipes/scli/scli_svn.bb b/recipes/scli/scli_svn.bb
>> new file mode 100644
>> index 0000000..45bd08e
>> --- /dev/null
>> +++ b/recipes/scli/scli_svn.bb
>> @@ -0,0 +1,8 @@
>> +require scli.inc
>> +
>> +SRCREV = "3285"
>> +PV = "0.4.0+svnr${SRCREV}"
>> +PR = "r1"
>>
>>     
> +
>   
>> +SRC_URI = "svn://
>> cnds.eecs.jacobs-university.de/svn/schoenw/src/scli;module=trunk;proto=https
>> "
>> +S = "${WORKDIR}/trunk"
>>
>>     
>
> Same remarks as for the other one.
> Also, do we need the .inc file. If I look at the content it is hardly worth
> putting it in a separate file.
>
> Then again *if* you insist on an inc file you should also have an INC_PR.
>
> This also holds for the other recipe.
>   

Thanks for the comments, sent v2 of the patches.

Just thought .inc would be a good idea to separate generic stuff from 
svn-specific, but indeed there's very little of the generic part to 
justify its own file. Fixed the PRs also.

Btw, only https seems to be available.

- Henri


