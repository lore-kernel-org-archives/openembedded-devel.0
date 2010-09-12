Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OuwQJ-0003tO-AV for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 01:57:28 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OuwPa-0001F7-PH for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 01:56:42 +0200
Received: from d75-157-58-185.bchsia.telus.net ([75.157.58.185])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Sep 2010 01:56:42 +0200
Received: from dfoley by d75-157-58-185.bchsia.telus.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Sep 2010 01:56:42 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: dfoley <dfoley@telus.net>
Date: Sun, 12 Sep 2010 16:56:34 -0700
Message-ID: <4C8D68B2.20102@telus.net>
References: <AANLkTimErvT=QwSRo25H-Bn2cjdao5x4XMbp_nz4Vc9_@mail.gmail.com>	<i6f9uu$39o$1@dough.gmane.org>
	<i6fc40$90f$1@dough.gmane.org> <201009122308.59800.pieterg@gmx.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: d75-157-58-185.bchsia.telus.net
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.12) Gecko/20100826 Thunderbird/3.0.7
In-Reply-To: <201009122308.59800.pieterg@gmx.com>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: patch to fix libstdc++ problem, was Re: Images no longer automatically include libstdc++6
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
X-List-Received-Date: Sun, 12 Sep 2010 23:57:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10-09-12 02:08 PM, pieterg wrote:
> On Saturday 11 September 2010 09:46:08 Koen Kooi wrote:
>> Can people ack or nack the following please:
>>
>>
>> diff --git a/recipes/gcc/gcc-package-cross.inc
>> b/recipes/gcc/gcc-package-cross.inc
>> index 0c4ea2d..59e7dde 100644
>> --- a/recipes/gcc/gcc-package-cross.inc
>> +++ b/recipes/gcc/gcc-package-cross.inc
>> @@ -2,6 +2,8 @@ PACKAGE_STRIP ?= ""
>>   OLD_PACKAGE_STRIP := "${PACKAGE_STRIP}"
>>   PACKAGE_STRIP = "no"
>>
>> +SHLIBSDIR = "${STAGING_DIR_TARGET}/shlibs"
>> +
>>   PACKAGES = "libgcc libssp libstdc++ libg2c libgfortran"
>>
>>   # Called from within gcc-cross, so libdir is set wrong
>
> Yes, that fixes it for me.
>
> Rgds, Pieter

ack







