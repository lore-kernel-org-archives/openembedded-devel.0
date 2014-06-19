Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 313DF6A451
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 08:51:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5J8pOKG011304
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 19 Jun 2014 01:51:24 -0700 (PDT)
Received: from [128.224.162.137] (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Thu, 19 Jun 2014 01:51:23 -0700
Message-ID: <53A2A49A.8040903@windriver.com>
Date: Thu, 19 Jun 2014 16:51:38 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1403153175-10707-1-git-send-email-rongqing.li@windriver.com>
	<53A29291.1010700@dominion.thruhere.net>
	<53A29E1D.9080307@windriver.com> <20140619084640.GM2117@jama>
In-Reply-To: <20140619084640.GM2117@jama>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH][meta-oe] dialog: use pkg-config to detect ncurses
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
X-List-Received-Date: Thu, 19 Jun 2014 08:51:28 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/19/2014 04:46 PM, Martin Jansa wrote:
> On Thu, Jun 19, 2014 at 04:23:57PM +0800, Rongqing Li wrote:
>>
>>
>> On 06/19/2014 03:34 PM, Koen Kooi wrote:
>>>> +Subject: [PATCH] use pkg-config for ncurses detection. +
>>>>> +Upstream-Status: Inappropriate [configuration]
>>> Why is it inappropriate?
>>
>>
>> I think we should fix the configure.in, but this configure.in can not
>> work with oe-core, the dialog bb file runs configure directly, and
>> I do this fix in configure directly, so it is Inappropriate
>
> Can you please fix dialog-static as well? It probably doesn't even work with B!=S.
>


Yes, I fixed it in this patch

-Roy

> | DEBUG: Executing shell function do_configure
> | gnu-configize: 'configure.ac' or 'configure.in' is required
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_configure (log file is located at /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/dialog-static/1.1-20120706-r0/temp/log.do_configure.20677)
> NOTE: recipe dialog-static-1.1-20120706-r0: task do_configure: Failed
>
> Otherwise it will be PNBLACKLISTED this weekend (together with a lot of other unmaintained recipes)
>
>
>

-- 
Best Reagrds,
Roy | RongQing Li

