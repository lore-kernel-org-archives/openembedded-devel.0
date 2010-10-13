Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P6APu-0004rx-RX
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 01:07:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id ED0C53149DCE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 01:07:00 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 7v7XS+2CeFYc
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 01:06:54 +0200 (CEST)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id DC0143149DCD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 01:06:53 +0200 (CEST)
Message-ID: <4CB63B6E.4010305@opendreambox.org>
Date: Thu, 14 Oct 2010 01:06:22 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.12) Gecko/20100915 Thunderbird/3.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1287007782-1554-1-git-send-email-obi@opendreambox.org>	<1287007782-1554-2-git-send-email-obi@opendreambox.org>
	<AANLkTim2hP8QOog74zab1gtBr3o=cXPEx4mLoKn6C8Oq@mail.gmail.com>
In-Reply-To: <AANLkTim2hP8QOog74zab1gtBr3o=cXPEx4mLoKn6C8Oq@mail.gmail.com>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] module.bbclass: fix dependency on specific	kernel
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
X-List-Received-Date: Wed, 13 Oct 2010 23:07:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/14/2010 12:30 AM, Chris Larson wrote:
> On Wed, Oct 13, 2010 at 3:09 PM, Andreas Oberritter <obi@opendreambox.org>wrote:
> 
>> * Previously, the kernel version did not show up in the
>>  generated control file (debian ipk).
>> * Use the same format as in kernel.bbclass.
>>
>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>> ---
>>  classes/module.bbclass |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/classes/module.bbclass b/classes/module.bbclass
>> index 0e0018e..601a882 100644
>> --- a/classes/module.bbclass
>> +++ b/classes/module.bbclass
>> @@ -1,4 +1,4 @@
>> -RDEPENDS_${PN} += "kernel (${KERNEL_VERSION}) update-modules"
>> +RDEPENDS_${PN} += "kernel-${KERNEL_VERSION} update-modules"
>>  DEPENDS += "virtual/kernel"
>>
> 
> This looks just plain wrong to me.  kernel-<version> is bitbake build time
> syntax, kernel (<version>) is runtime syntax for dpkg/opkg.

Does this mean that kernel.bbclass is wrong, too? Because kernel.bbclass
calls do_split_packages with extra_depends='update-modules
kernel-${KERNEL_VERSION}', which translates to
RDEPENDS_kernel-module-foo = "update-modules kernel-${KERNEL_VERSION}".

Regards,
Andreas


