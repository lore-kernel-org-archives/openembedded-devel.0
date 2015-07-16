Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BC2AA6013D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jul 2015 02:48:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6G2mTpL022852
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 Jul 2015 19:48:29 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 15 Jul 2015 19:48:29 -0700
Message-ID: <55A71B7C.8070604@windriver.com>
Date: Thu, 16 Jul 2015 10:48:28 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Joe MacDonald <Joe_MacDonald@mentor.com>
References: <1436172967-1489-1-git-send-email-rongqing.li@windriver.com>
	<20150715143626.GB29923@mentor.com>
In-Reply-To: <20150715143626.GB29923@mentor.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-networking] inetutils: fix tcpd path of rlogin rsh and rexec
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
X-List-Received-Date: Thu, 16 Jul 2015 02:48:31 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年07月15日 22:36, Joe MacDonald wrote:
> [[oe] [PATCH][meta-networking] inetutils: fix tcpd path of rlogin rsh and rexec] On 15.07.06 (Mon 16:56) rongqing.li@windriver.com wrote:
>
>> From: Jian Liu <jian.liu@windriver.com>
>>
>> rlogin, rsh and rexec xinet.d script, a wrong path is
>> being referenced under the server section.
>
> This seems like a sensible update, but rather than just shifting this
> around, can you update this patch to do something a bit more robust?
> I'm thinking along the lines of what the other servers do (and what's
> being done everywhere for systemd now):
>
>   73 do_install () {
>   [...]
>   95     sed -e 's,@BASE_SBINDIR@,${base_sbindir},g' \
>   96         -e 's,@SYSCONFDIR@,${sysconfdir},g' \
>   97         -e 's,@SBINDIR@,${sbindir},g' \
>   98         -i ${D}${systemd_unitdir}/system/*.service
>
> (source: meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb, etc.)
>
> So sed in the proper values of $(sbindir) (since that's where tcpd is
> installed by the tcp-wrappers recipe) after installing a template xinetd
> file.
>
> -J.

Ok, will send v2

-Roy

>
>>
>> server = /usr/bin/tcpd
>> instead of
>> server = /usr/sbin/tcpd
>>
>> tcpd is provided by tcp-wrappers
>>
>> Written-by: Herve.Patriarche <herve.patriarche@windriver.com>
>> Signed-off-by: Jian Liu <jian.liu@windriver.com>
>> ---
>>   .../inetutils/inetutils-1.9.2/rexec.xinetd.inetutils                    | 2 +-
>>   .../inetutils/inetutils-1.9.2/rlogin.xinetd.inetutils                   | 2 +-
>>   .../recipes-connectivity/inetutils/inetutils-1.9.2/rsh.xinetd.inetutils | 2 +-
>>   3 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rexec.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rexec.xinetd.inetutils
>> index 80aed36..7354360 100644
>> --- a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rexec.xinetd.inetutils
>> +++ b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rexec.xinetd.inetutils
>> @@ -14,7 +14,7 @@ service exec
>>   	group		= root
>>   	log_on_success	+= USERID
>>   	log_on_failure	+= USERID
>> -	server		= /usr/bin/tcpd
>> +	server		= /usr/sbin/tcpd
>>   	server_args	= /usr/sbin/in.rexecd
>>   	disable		= yes
>>   }
>> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rlogin.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rlogin.xinetd.inetutils
>> index 00dbf93..70493e6 100644
>> --- a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rlogin.xinetd.inetutils
>> +++ b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rlogin.xinetd.inetutils
>> @@ -14,7 +14,7 @@ service login
>>   	group		= root
>>   	log_on_success	+= USERID
>>   	log_on_failure	+= USERID
>> -	server		= /usr/bin/tcpd
>> +	server		= /usr/sbin/tcpd
>>   	server_args	= /usr/sbin/in.rlogind -a
>>   	disable		= yes
>>   }
>> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rsh.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rsh.xinetd.inetutils
>> index ad59b62..a842eb9 100644
>> --- a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rsh.xinetd.inetutils
>> +++ b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rsh.xinetd.inetutils
>> @@ -15,7 +15,7 @@ service shell
>>   	group		= root
>>   	log_on_success	+= USERID
>>   	log_on_failure	+= USERID
>> -	server		= /usr/bin/tcpd
>> +	server		= /usr/sbin/tcpd
>>   	server_args	= /usr/sbin/in.rshd -aL
>>   	disable		= yes
>>   }

-- 
Best Reagrds,
Roy | RongQing Li

