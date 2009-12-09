Received: from compulab.co.il ([67.18.134.219])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mike@compulab.co.il>) id 1NIGUs-000710-DH
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Dec 2009 07:58:06 +0100
Received: from [62.90.235.247] (helo=zimbra-mta.compulab.co.il)
	by compulab.site5.com with esmtp (Exim 4.69)
	(envelope-from <mike@compulab.co.il>) id 1NIGTE-0001J4-58
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Dec 2009 00:56:20 -0600
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zimbra-mta.compulab.co.il (Postfix) with ESMTP id 6259C9A0358
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Dec 2009 08:56:19 +0200 (IST)
X-Virus-Scanned: amavisd-new at compulab.co.il
Received: from zimbra-mta.compulab.co.il ([127.0.0.1])
	by localhost (zimbra-mta.compulab.co.il [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id xVOIwHMa-m4y
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Dec 2009 08:56:17 +0200 (IST)
Received: from [10.1.1.95] (mike-pc.compulab.local [10.1.1.95])
	by zimbra-mta.compulab.co.il (Postfix) with ESMTP id A4D889A034C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Dec 2009 08:56:17 +0200 (IST)
Message-ID: <4B1F4A11.2050204@compulab.co.il>
Date: Wed, 09 Dec 2009 08:56:17 +0200
From: Mike Rapoport <mike@compulab.co.il>
User-Agent: Thunderbird 2.0.0.21 (X11/20090712)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <cover.1260305960.git.mike@compulab.co.il>	<afbcd57e6833572755e535c8052474b8bc250cc7.1260305960.git.mike@compulab.co.il>
	<hfmmjh$qkr$2@ger.gmane.org>
In-Reply-To: <hfmmjh$qkr$2@ger.gmane.org>
X-ACL-Warn: {
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - compulab.site5.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - compulab.co.il
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 67.18.134.219
X-SA-Exim-Mail-From: mike@compulab.co.il
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 2/5] linux-omap 2.6.32: add cm-t35 support
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
X-List-Received-Date: Wed, 09 Dec 2009 06:58:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> On 08-12-09 22:11, Mike Rapoport wrote:
>> Signed-off-by: Mike Rapoport<mike@compulab.co.il>
> 
>> +SRC_URI_append_cm-t35 = " \
>> +file://cm-t35/0001-OMAP-DSS2-add-Toppoly-TDO35S-panel.patch;patch=1 \
>> +file://cm-t35/0002-omap3-cm-t35-add-DSS2-display-support.patch;patch=1 \
>> +file://cm-t35/0003-omap3-cm-t35-update-defconfig-for-DSS2.patch;patch=1
>> \
>> +file://cm-t35/0004-omap3-cm-t35-add-cm-t35-mux-configs.patch;patch=1 \
>> +file://cm-t35/0006-omap3-cm-t35-update-defconfig.patch;patch=1 \
>> +file://cm-t35/0001-backlight-tdo24m-ensure-chip-select-changes-between-.patch;patch=1
>> \
>> +"
>> +
> 
> Could you make those patches non-machine specific? If you put them in
> the main SRC_URI they stand a better change of being kept up to date.
> I'm going to add a lot of patches to that recipe soon and I don't want
> to break anything in the process.

Ok, will do.

> regards,
> 
> Koen
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 

-- 
Sincerely yours,
Mike.



