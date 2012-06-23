Received: from mail-out.m-online.net ([212.18.0.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sbabic@denx.de>) id 1SiOko-0000lZ-2E
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jun 2012 13:43:50 +0200
Received: from frontend1.mail.m-online.net (frontend1.mail.intern.m-online.net
	[192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 3WKDpj0LGrz3hhbZ;
	Sat, 23 Jun 2012 13:25:32 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.8.164])
	by mail.m-online.net (Postfix) with ESMTP id 3WKDps4v5Vz4KKC1;
	Sat, 23 Jun 2012 13:25:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from smtp-auth.mnet-online.de ([192.168.8.180])
	by localhost (dynscan1.mail.m-online.net [192.168.8.164]) (amavisd-new,
	port 10024)
	with ESMTP id BbhkS-0vNerD; Sat, 23 Jun 2012 13:25:40 +0200 (CEST)
Received: from [192.168.2.104] (unknown [88.149.182.160])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA;
	Sat, 23 Jun 2012 13:25:39 +0200 (CEST)
Message-ID: <4FE5A7B2.5080604@denx.de>
Date: Sat, 23 Jun 2012 13:25:38 +0200
From: stefano babic <sbabic@denx.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1339759019-3272-1-git-send-email-sbabic@denx.de>
	<jrsciv$ro6$1@dough.gmane.org>
	<20120620183655.GT3178@jama.jama.net>
In-Reply-To: <20120620183655.GT3178@jama.jama.net>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [meta-oe][PATCH V2] Added recipe for libconfig
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
X-List-Received-Date: Sat, 23 Jun 2012 11:43:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Am 20/06/2012 20:36, schrieb Martin Jansa:
> On Wed, Jun 20, 2012 at 01:35:59PM +0200, Koen Kooi wrote:
> Op 15-06-12 13:16, Stefano Babic schreef:
>>>> libconfig can be used to parse a configuration file in a structured
>>>> language, but still compact and more suitable for embedded devices
>>>> compared to XML.
>>>>
>>>> Signed-off-by: Stefano Babic <sbabic@denx.de> ---
>>>>
>>>> - V1 was sent to oe-core, comments redirect it as right place to meta-oe 
>>>> - Drop PR to use the default value
>>>>
>>>> .../recipes-support/libconfig/libconfig_1.4.8.bb   |   13 +++++++++++++ 1
>>>> file changed, 13 insertions(+) create mode 100644
>>>> meta-oe/recipes-support/libconfig/libconfig_1.4.8.bb
>>>>
>>>> diff --git a/meta-oe/recipes-support/libconfig/libconfig_1.4.8.bb
>>>> b/meta-oe/recipes-support/libconfig/libconfig_1.4.8.bb new file mode
>>>> 100644 index 0000000..ffde91f --- /dev/null +++
>>>> b/meta-oe/recipes-support/libconfig/libconfig_1.4.8.bb @@ -0,0 +1,13 @@ 
>>>> +SUMMARY = "C/C++ Configuration File Library" +DESCRIPTION = "processing
>>>> of structured configuration files" +SECTION = "libs" +LICENSE =
>>>> "LGPLv2.1" +LIC_FILES_CHKSUM =
>>>> "file://COPYING.LIB;md5=fad9b3332be894bab9bc501572864b29" + +SRC_URI =
>>>> "http://www.hyperrealm.com/libconfig/libconfig-1.4.8.tar.gz \
> 
> s/1.4.8/${PV}/
> 
>> s%libconfig/libconfig-1.4.8%${BPN}/${BP}%

Good point, thanks. I will send V3.

Regards,
Stefano

-- 
=====================================================================
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
=====================================================================


