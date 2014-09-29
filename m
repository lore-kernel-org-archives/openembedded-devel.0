Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-02.prod.phx3.secureserver.net
	(p3plsmtpa09-02.prod.phx3.secureserver.net [173.201.193.231])
	by mail.openembedded.org (Postfix) with ESMTP id 9FB90605B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 10:19:39 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa09-02.prod.phx3.secureserver.net with 
	id wyKe1o0090BVjqb01yKedZ; Mon, 29 Sep 2014 03:19:40 -0700
Message-ID: <5429323A.4060300@pabigot.com>
Date: Mon, 29 Sep 2014 05:19:38 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: Rongqing Li <rongqing.li@windriver.com>, 
	openembedded-devel@lists.openembedded.org
References: <1409227581-20888-6-git-send-email-pab@pabigot.com>
	<1409247791-29772-1-git-send-email-pab@pabigot.com>
	<54290F57.6090500@windriver.com>
In-Reply-To: <54290F57.6090500@windriver.com>
Subject: Re: [meta-networking][PATCH v2] ntp: add deterministic support for KPPS interface
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
X-List-Received-Date: Mon, 29 Sep 2014 10:19:47 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 09/29/2014 02:50 AM, Rongqing Li wrote:
>
>
> On 08/29/2014 01:43 AM, Peter A. Bigot wrote:
>> ntp checks for presence of sys/timepps.h to determine whether the kernel
>> supports the RFC 2783 KPPS interface.  Under Linux the pps-tools package
>> installs this header.  Without this feature the ATOM clock driver does
>> not work, and other drivers like NMEA have reduced precision. Remove
>> the feature non-determinism and increase ntpd capabilities by adding an
>> explicit dependency.
>>
>> See: http://doc.ntp.org/4.2.6/kernpps.html
>>
>> Signed-off-by: Peter A. Bigot <pab@pabigot.com>
>> ---
>> V2: replace PACKAGECONFIG with DEPENDS to remove nondeterminism
>>
>>   meta-networking/recipes-support/ntp/ntp.inc | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-networking/recipes-support/ntp/ntp.inc 
>> b/meta-networking/recipes-support/ntp/ntp.inc
>> index 55926e0..f55a39a 100644
>> --- a/meta-networking/recipes-support/ntp/ntp.inc
>> +++ b/meta-networking/recipes-support/ntp/ntp.inc
>> @@ -8,6 +8,8 @@ SECTION = "console/network"
>>   LICENSE = "NTP"
>>   LIC_FILES_CHKSUM = 
>> "file://COPYRIGHT;md5=fea4b50c33b18c2194b4b1c9ca512670"
>>
>> +DEPENDS = "pps-tools"
>
> Could we add this dependent by PACKAGECONFIG?

That was my original intent, but it was rejected as non-deterministic.  
See discussion at: http://patchwork.openembedded.org/patch/79279/

Peter

