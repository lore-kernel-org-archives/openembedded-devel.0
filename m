Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5C54365C63
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jun 2015 13:09:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t53D9Rfn025202
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 3 Jun 2015 06:09:27 -0700 (PDT)
Received: from [128.224.162.136] (128.224.162.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 3 Jun 2015 06:09:27 -0700
Message-ID: <556EFC86.60308@windriver.com>
Date: Wed, 3 Jun 2015 21:09:26 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>, Martin Jansa
	<martin.jansa@gmail.com>
References: <1433324376-3374-1-git-send-email-rongqing.li@windriver.com>
	<20150603101138.GA2380@jama>
In-Reply-To: <20150603101138.GA2380@jama>
Subject: Re: [PATCH][meta-oe] php: add a vardeps for configure on sysconfdir
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
X-List-Received-Date: Wed, 03 Jun 2015 13:09:30 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年06月03日 18:11, Martin Jansa wrote:
> On Wed, Jun 03, 2015 at 05:39:36PM +0800, rongqing.li@windriver.com wrote:
>> From: Roy Li <rongqing.li@windriver.com>
>>
>> building php will fail when sstatus is used, since some hardcode paths
>
> what's sstatus? did you mean sstate?
>
>> in php-native will make the wrong path, and try to fix it like below:
>>      do_install_append_virtclass-native() {
>>             create_wrapper ${D}${bindir}/php \
>>                 PHP_PEAR_SYSCONF_DIR=${sysconfdir}/ \
>>      }
>> but php-native does not work for a 64bit target(qemuarm64) and if sstat is
>> from a 32bit(qemuppc) on the host same machine.
>>
>> Consider no too much package depends on php-native, so add a vardeps for
>> configure on sysconfdir to force php-native to build always.
>
> Please improve the commit message, from this I'm still not sure what
> this is supposed to fix.
>

Ok, I will resend it, if the new commit log is not clear,
I think you can build two project with same sstate.

Thanks


-Roy


>>
>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
>> ---
>>   meta-oe/recipes-devtools/php/php_5.5.24.bb | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-oe/recipes-devtools/php/php_5.5.24.bb b/meta-oe/recipes-devtools/php/php_5.5.24.bb
>> index 3e656af..9c0dd7f 100644
>> --- a/meta-oe/recipes-devtools/php/php_5.5.24.bb
>> +++ b/meta-oe/recipes-devtools/php/php_5.5.24.bb
>> @@ -106,6 +106,8 @@ EXTRA_OEMAKE = "INSTALL_ROOT=${D}"
>>
>>   acpaths = ""
>>
>> +do_configure[vardeps] += "${sysconfdir}"
>> +
>>   do_configure_prepend () {
>>       rm -f ${S}/build/libtool.m4 ${S}/ltmain.sh ${S}/aclocal.m4
>>       find ${S} -name config.m4 | xargs -n1 sed -i 's!APXS_HTTPD=.*!APXS_HTTPD=${STAGING_BINDIR_NATIVE}/httpd!'
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

-- 
Best Reagrds,
Roy | RongQing Li

