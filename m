Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PjjEr-0003vQ-MG
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 03:11:33 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id D09FA314D5FC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jan 2011 03:10:42 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id GPYMZKepTFbP
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jan 2011 03:10:37 +0100 (CET)
Received: from [172.22.22.61] (ip-94-79-168-47.unitymediagroup.de
	[94.79.168.47])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 1D36C314D5FA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jan 2011 03:10:37 +0100 (CET)
Message-ID: <4D461A1C.2040900@opendreambox.org>
Date: Mon, 31 Jan 2011 03:10:36 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110128 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1296316693.5925.10.camel@mattotaupa>	<4D44773D.5010103@opendreambox.org>
	<1296383636.4757.6.camel@mattotaupa>
In-Reply-To: <1296383636.4757.6.camel@mattotaupa>
Subject: Re: [solved][REGRESSION] omap3-sgx-modules: `NOTE: Runtime target 'kernel-' is unbuildable, removing...`
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
X-List-Received-Date: Mon, 31 Jan 2011 02:11:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/30/2011 11:33 AM, Paul Menzel wrote:
> Dear Andreas,
> 
> 
> Am Samstag, den 29.01.2011, 21:23 +0100 schrieb Andreas Oberritter:
>> On 01/29/2011 04:58 PM, Paul Menzel wrote:
> 
>>>         commit 2dac84b9a7b820466ed626420fec120093b56e16
>>>         Author: Andreas Oberritter <obi@opendreambox.org>
>>>         Date:   Sat Jan 29 00:51:25 2011 +0000
>>>         
>>>             module.bbclass: depend on kernel-${KERNEL_VERSION} instead of kernel (= ${KERNEL_VERSION})
>>>             
>>>             * As a special case, kernel modules must depend on
>>>               kernel-${KERNEL_VERSION}, which gets runtime provided by the kernel
>>>               package. The reason is, that the package version can be different
>>>               from ${KERNEL_VERSION}, because the latter depends on the kernel
>>>               configuration, e.g. CONFIG_LOCALVERSION.
>>>             
>>>             Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>>>
>>> [1] seems to have broken `omap3-sgx-modules`.
> 
>> thanks! It's a known bug. Can you please test this patch, while I'm
>> waiting for an ack or nack for it?
>>
>> http://patches.openembedded.org/patch/402/
> 
> Unfortunately I am having delivery problems with my SourceForge.net
> address, so I have not yet received the patch to the list and have to
> respond to this message.
> 
> Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>
> Tested-by: Paul Menzel <paulepanter@users.sourceforge.net> 
> 	for `omap3-sgx-modules` with `angstrom-2008.1`

Thanks for testing! I've pushed the patch to fix the regression before
the work week begins, but I'm not very comfortable with it, because of
the little feedback.

Let's hope that it works for everybody. Otherwise, it can still be
reverted together with the patches that caused the regression.

Regards,
Andreas


