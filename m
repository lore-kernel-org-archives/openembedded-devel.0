Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PSrDw-0005gS-HG
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Dec 2010 14:16:52 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 5A4BF314BB48
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 14:15:15 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id rcjqm6xeTw2B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 14:15:10 +0100 (CET)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 99C4A314BB26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 14:15:10 +0100 (CET)
Message-ID: <4D08BF5E.5050105@opendreambox.org>
Date: Wed, 15 Dec 2010 14:15:10 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1PR45K-0000jK-SU@melo.openembedded.org>	<01EE9A12-BE87-4EF6-9F0B-EAA20A1DBAAE@vanille-media.de>	<4D077186.2050708@balister.org>	<20101214133729.GE6662@jama>	<ie9tg4$9t0$1@dough.gmane.org>	<20101215082910.GA3238@jama>
	<4D08B85B.3000404@balister.org>
In-Reply-To: <4D08B85B.3000404@balister.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Philip Balister : i2c-tools : Stage i2c-dev.h header as i2c-dev-user.h.
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
X-List-Received-Date: Wed, 15 Dec 2010 13:16:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 12/15/2010 01:45 PM, Philip Balister wrote:
> On 12/15/2010 03:29 AM, Martin Jansa wrote:
>> On Wed, Dec 15, 2010 at 09:16:04AM +0100, Koen Kooi wrote:
>>> What are other distributions based on? Pixie dust?
>>
>> I meant distritubions where end-user normally gets only recipes how to
>> build from source
>> on his machine instead of installing prebuilt binary packages shipped
>> by distribution.
>>
> I am not sure there is a lot od software that uses the problematic
> header :)
> 
> Khem suggested we put the file in include/i2c-tools/i2c-dev.h. This
> means programs that need the i2c-tools version can adjust the header
> search path with a -I.

I think what Khem suggested was ${include}/i2c-tools/linux/i2c-dev.h,
because otherwise programs including <linux/i2c-dev.h> would still pick
up the kernel header, even if -I${include}/i2c-tools was prepended to
the program's CPPFLAGS.

Regards,
Andreas


