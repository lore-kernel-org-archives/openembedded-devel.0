Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PKsGG-0007ye-Vh
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 13:46:17 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 9155F314AEFE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 13:45:06 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id RPD682ZX8gxi
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 13:44:59 +0100 (CET)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id E057E314AE47
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 13:44:58 +0100 (CET)
Message-ID: <4CEBB74A.6000606@opendreambox.org>
Date: Tue, 23 Nov 2010 13:44:58 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.12) Gecko/20101027 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CEB3497.90607@gmail.com> <4CEBB582.3030106@opendreambox.org>
In-Reply-To: <4CEBB582.3030106@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] strace_4.5.20.bb: Fix build on mips{, el} when DISTRO_FEATURES lacks "largefile".
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
X-List-Received-Date: Tue, 23 Nov 2010 12:46:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 11/23/2010 01:37 PM, Andreas Oberritter wrote:
> On 11/23/2010 04:27 AM, Graham Gower wrote:
>> diff --git a/recipes/strace/strace_4.5.20.bb b/recipes/strace/strace_4.5.20.bb
>> index 873ce52..086a4d7 100644
>> --- a/recipes/strace/strace_4.5.20.bb
>> +++ b/recipes/strace/strace_4.5.20.bb
>> @@ -4,9 +4,13 @@ LICENSE = "GPL"
>>  PR = "r0"
>>  
>>  DEFAULT_PREFERENCE = "-1"
>> +DEFAULT_PREFERENCE_mips = "1"
>> +DEFAULT_PREFERENCE_mipsel = "1"
>>  
>>  SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.bz2 \
>>            "
>> +SRC_URI_append_mipsel += " file://mips-nolargefile.patch "
>> +SRC_URI_append_mips += " file://mips-nolargefile.patch "
> 
> I think it would be better to apply this patch unconditionally, because
> it doesn't impose negative effects on other archs, and future patches
> which might only get compile-tested on other archs must make sure that
> mips-nolargefile.patch still applies.

Albeit, the correct syntax would be:
SRC_URI_append_mipsel = " file://mips-nolargefile.patch"



