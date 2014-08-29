Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C635B7113B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Aug 2014 01:02:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7T1265A001242
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 28 Aug 2014 18:02:06 -0700 (PDT)
Received: from [128.224.162.141] (128.224.162.141) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 28 Aug 2014 18:02:05 -0700
Message-ID: <53FFD113.7050307@windriver.com>
Date: Fri, 29 Aug 2014 09:02:11 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Peter A. Bigot" <pab@pabigot.com>
References: <1407986086-29096-1-git-send-email-rongqing.li@windriver.com>
	<53FDC33C.7060208@pabigot.com>
In-Reply-To: <53FDC33C.7060208@pabigot.com>
Cc: xufeng.zhang@windriver.com, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 1/2] ntp: Disable debugging by default
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
X-List-Received-Date: Fri, 29 Aug 2014 01:02:10 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/27/2014 07:38 PM, Peter A. Bigot wrote:
> On 08/13/2014 10:14 PM, rongqing.li@windriver.com wrote:
>> From: Xufeng Zhang<xufeng.zhang@windriver.com>
>>
>> There is a problem in configure.ac file that whether or not
>> '--enable-debugging' is specified in configure cmdline, debugging
>> is always enabled.
>
>  From my testing this is incorrect.  Both --disable-debugging and
> --enable-debugging=no correctly override the upstream decision to enable
> debugging by default.
>
>> We should disable ntp debugging by default.
>
> Could we have more of an explanation why this is a good thing?  It
> doesn't seem relevant to the security patch it accompanied.
>
> I've got a patch I'm validating that will revert this fix and use
> PACKAGECONFIG to control whether debugging is supported. Personally, I'd
> rather have the default be to keep debugging enabled.
>
> Upstream ntp enables debugging support by default, and OE's build has
> never disabled it before.  ntp is a tricky beast and is very terse about
> what it's doing.  Having the ability to make it explain why (for
> example) it's disabling a reference clock is very useful in
> diagnostics.  Disabling debugging during the build makes it impossible
> to get that information out of an installed system.
>

Ok, Please send your patch out, thanks

-Roy


> Peter
>
>>
>> Signed-off-by: Xufeng Zhang<xufeng.zhang@windriver.com>
>> ---
>>   .../ntp/files/ntp-disable-debugging.patch          |   23
>> ++++++++++++++++++++
>>   meta-networking/recipes-support/ntp/ntp.inc        |    1 +
>>   2 files changed, 24 insertions(+)
>>   create mode 100644
>> meta-networking/recipes-support/ntp/files/ntp-disable-debugging.patch
>>
>> diff --git
>> a/meta-networking/recipes-support/ntp/files/ntp-disable-debugging.patch b/meta-networking/recipes-support/ntp/files/ntp-disable-debugging.patch
>>
>> new file mode 100644
>> index 0000000..3c94d8d
>> --- /dev/null
>> +++
>> b/meta-networking/recipes-support/ntp/files/ntp-disable-debugging.patch
>> @@ -0,0 +1,23 @@
>> +set ntp_ok to no if ntp debugging is not enabled.
>> +
>> +Upstream-status: Pending
>> +
>> +There is a problem in configure.ac file that whether or not
>> +'--enable-debugging' is specified in configure cmdline, debugging
>> +is always enabled.
>> +We should disable ntp debugging by default.
>> +
>> +Signed-off-by: Xufeng Zhang<xufeng.zhang@windriver.com>
>> +
>> +---
>> +--- a/configure.ac
>> ++++ b/configure.ac
>> +@@ -2458,7 +2458,7 @@
>> +         [+ include ntpd debugging code]
>> +     )],
>> +     [ntp_ok=$enableval],
>> +-    [ntp_ok=yes]
>> ++    [ntp_ok=no]
>> + )
>> + case "$ntp_ok" in
>> +  yes)
>> diff --git a/meta-networking/recipes-support/ntp/ntp.inc
>> b/meta-networking/recipes-support/ntp/ntp.inc
>> index 49f9901..2c8f488 100644
>> --- a/meta-networking/recipes-support/ntp/ntp.inc
>> +++ b/meta-networking/recipes-support/ntp/ntp.inc
>> @@ -23,6 +23,7 @@ SRC_URI
>> ="http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
>>              file://sntp.service \
>>              file://sntp \
>>              file://ntpd.list \
>> +           file://ntp-disable-debugging.patch \
>>   "
>>   inherit autotools update-rc.d useradd systemd
>
>
>

-- 
Best Reagrds,
Roy | RongQing Li

