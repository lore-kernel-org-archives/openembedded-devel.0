Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <edoiron@cbnco.com>) id 1MgIVw-0002Gh-Eo
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Aug 2009 15:26:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 3D12C54BCAE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2009 09:08:15 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 28833-04 for <openembedded-devel@lists.openembedded.org>; 
	Wed, 26 Aug 2009 09:08:15 -0400 (EDT)
Received: from [172.20.22.61] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id C913941F939
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2009 09:08:14 -0400 (EDT)
Message-ID: <4A953372.8060000@cbnco.com>
Date: Wed, 26 Aug 2009 09:06:58 -0400
From: Evan Doiron <edoiron@cbnco.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1251229783-6077-1-git-send-email-edoiron@cbnco.com>
	<20090826015850.GA5705@gmail.com>
In-Reply-To: <20090826015850.GA5705@gmail.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH] net-snmp: add v5.4.2.1
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
X-List-Received-Date: Wed, 26 Aug 2009 13:26:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> On (25/08/09 15:49), Evan Doiron wrote:
>> +
>> +PARALLEL_MAKE = ""
>> +CCACHE = ""
>>     
> just curious on why CCACHE is disabled.
>   
It seems the Parallel_Make and CCache were introduced in the commit below:

        commit 8b12893071b868cd76e88155fcdc2ae2acc3ff1d
        Author: Sergey Lapin <slapin@ossfans.org>
        Date:   Thu Jan 29 16:12:06 2009 +0300

            net-snmp_svn, net-snmp_5.1.2, net-snmp_5.4.1: extracted
common parts

As I do not utilize either Parallel_Make or CCache in my build
environment, I do not know if it will build properly with caching
enabled. It seems that since CCache is not disabled in the net-snmp.inc
that the original author could have intended to allow certain recipes to
support caching, but as I don't have the facilities to test it I am
unable to report which (if any) will build with caching enabled.

-- 
Evan Doiron
Software Developer
Canadian Bank Note Company Limited
edoiron@cbnco.com



