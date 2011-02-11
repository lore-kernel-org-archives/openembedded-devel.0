Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1Pnt10-0008Kc-PD
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 14:26:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 79914314D875
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 14:25:23 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id zhhv0GIP0tYe
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 14:25:18 +0100 (CET)
Received: from [172.22.22.61] (ip-94-79-168-47.unitymediagroup.de
	[94.79.168.47])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 8CAC2314D31A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 14:25:18 +0100 (CET)
Message-ID: <4D5538BE.1080309@opendreambox.org>
Date: Fri, 11 Feb 2011 14:25:18 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110208 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1297429349-5526-1-git-send-email-obi@opendreambox.org>
	<ij3cut$mts$1@dough.gmane.org>
In-Reply-To: <ij3cut$mts$1@dough.gmane.org>
Subject: Re: [PATCH] kernel.bbclass: provide virtual/kernel-${PV}
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
X-List-Received-Date: Fri, 11 Feb 2011 13:26:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 02/11/2011 02:18 PM, Koen Kooi wrote:
> On 11-02-11 14:02, Andreas Oberritter wrote:
>> * Allow precompiled modules to depend on a specific kernel version.
> 
>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>> ---
>>  classes/kernel.bbclass |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
>> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
>> index 0d1b4ad..55e3ca0 100644
>> --- a/classes/kernel.bbclass
>> +++ b/classes/kernel.bbclass
>> @@ -1,6 +1,6 @@
>>  inherit linux-kernel-base module_strip
> 
>> -PROVIDES += "virtual/kernel"
>> +PROVIDES += "virtual/kernel virtual/kernel-${PV}"
>>  DEPENDS += "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}depmod-${@get_kernelmajorversion('${PV}')} virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX} update-modules bluez-dtl1-workaround"
> 
>>  # we include gcc above, we dont need virtual/libc
> 
> How is PV know before the kernel is built? The line below has a
> workaround for that, so I guess it also needs one in PROVIDES, no?

KERNEL_VERSION is what's unknown until after the build. PV is the
version set by the recipe. The line below uses PV to derive 2.4 or 2.6
from that.

Regards,
Andreas


