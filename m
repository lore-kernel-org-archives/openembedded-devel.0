Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 0907665CDD
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jul 2015 14:12:09 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id D2BDBF811DD; Wed,  1 Jul 2015 08:12:09 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 2BB32F811DB;
	Wed,  1 Jul 2015 08:12:09 -0600 (MDT)
Message-ID: <5593F569.2080008@mlbassoc.com>
Date: Wed, 01 Jul 2015 08:12:57 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1435697730-12800-1-git-send-email-gary@mlbassoc.com>
	<5593A340.8030507@windriver.com>
In-Reply-To: <5593A340.8030507@windriver.com>
Subject: Re: [meta-browser][PATCH v2] chromium: List all PACKAGECONFIG settings to avoid warning
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Jul 2015 14:12:10 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-07-01 02:22, Robert Yang wrote:
> Hi Gary,
>
> On 07/01/2015 04:55 AM, Gary Thomas wrote:
>> OE-core now warns if PACKAGECONFIG is used to set an option that
>> does not have a corresponding PACKAGECONFIG[option]="xxx" line.
>> This recipe makes use of many such options & this patch suppresses
>> those warnings by listing the options.
>>
>> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
>> ---
>>   recipes-browser/chromium/chromium.inc | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/recipes-browser/chromium/chromium.inc b/recipes-browser/chromium/chromium.inc
>> index 8e83f6a..973d1c9 100644
>> --- a/recipes-browser/chromium/chromium.inc
>> +++ b/recipes-browser/chromium/chromium.inc
>> @@ -17,6 +17,13 @@ PACKAGECONFIG ??= "use-egl"
>>   # automatically and silently fall back to GLX
>>   PACKAGECONFIG[use-egl] = ",,virtual/egl virtual/libgles2"
>>
>> +# Additional PACKAGECONFIG options - listed here to avoid warnings
>> +PACKAGECONFIG[component-build] = ""
>> +PACKAGECONFIG[disable-api-keys-info-bar] = ""
>> +PACKAGECONFIG[ignore-lost-context] = ""
>> +PACKAGECONFIG[impl-side-painting] = ""
>> +PACKAGECONFIG[use-gl] = ""
>
> Since you don't really use PACKAGECONFIG, why not use
> ANY_OTHER_VALUE_YOU_LIKE rather than PACKAGECONFIG to configure it ?

No, it's much better to use the standard mechanism (PACKAGECONFIG) rather
than making up something special for this recipe.  The patch is needed only
to suppress warnings about how it's being used.

>> +
>>   GYP_DEFINES += "${ARMFPABI} release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot=''"
>>
>>   do_configure() {
>>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

