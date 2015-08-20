Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4BCCD73E11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 01:50:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7K1odJo024235
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 18:50:39 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 19 Aug 2015 18:50:38 -0700
Message-ID: <55D5326D.1080804@windriver.com>
Date: Thu, 20 Aug 2015 09:50:37 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1439868248-25769-1-git-send-email-joe_macdonald@mentor.com>	<55D2A776.4020701@windriver.com>
	<20150819190146.GA5444@deserted.net>
In-Reply-To: <20150819190146.GA5444@deserted.net>
Subject: Re: [meta-networking][PATCH] netcf: support multilib builds
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
X-List-Received-Date: Thu, 20 Aug 2015 01:50:41 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年08月20日 03:01, Joe MacDonald wrote:
> [Re: [oe] [meta-networking][PATCH] netcf: support multilib builds] On 15.08.18 (Tue 11:33) Rongqing Li wrote:
>
>>
>>
>> On 2015年08月18日 11:24, Joe MacDonald wrote:
>>> When doing a multilib build, /usr/lib is still created but not collected
>>> into FILES_${PN} by default, resulting in a QA error.  Adding both
>>> ${libdir} and ${nonarch_libdir} catches all scenarios.
>>>
>>> It also turns out that the previous do_install_append would throw an error
>>> in a multilib build since systemd always installs to .../lib/... but
>>> ${libdir] would point at .../lib64/...
>>>
>>> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
>>> ---
>>>   meta-networking/recipes-support/netcf/netcf_git.bb | 14 ++++++++++++--
>>>   1 file changed, 12 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta-networking/recipes-support/netcf/netcf_git.bb b/meta-networking/recipes-support/netcf/netcf_git.bb
>>> index d47bb3b..8a8963e 100644
>>> --- a/meta-networking/recipes-support/netcf/netcf_git.bb
>>> +++ b/meta-networking/recipes-support/netcf/netcf_git.bb
>>> @@ -32,12 +32,22 @@ do_configure_prepend() {
>>>   do_install_append() {
>>>       if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
>>>          install -d ${D}${systemd_unitdir}/system
>>> -       mv ${D}${libdir}/systemd/system/* ${D}${systemd_unitdir}/system/
>>> -       rm -rf ${D}${libdir}/systemd/
>>> +       if [ -d "${D}${libdir}/systemd/system" ]; then
>>> +           mv ${D}${libdir}/systemd/system/* ${D}${systemd_unitdir}/system/
>>> +           rm -rf ${D}${libdir}/systemd/
>>> +       else
>>> +           mv ${D}${nonarch_libdir}/systemd/system/* ${D}${systemd_unitdir}/system/
>>> +           rm -rf ${D}${nonarch_libdir}/systemd/
>>> +       fi
>>>       else
>>>          mv ${D}${sysconfdir}/rc.d/init.d/ ${D}${sysconfdir}
>>>          rm -rf ${D}${sysconfdir}/rc.d/
>>>       fi
>>>   }
>>>
>>> +FILES_${PN} += " \
>>> +        ${libdir} \
>>> +        ${nonarch_libdir} \
>>> +        "
>>> +
>>
>> a similar fix has been submitted,
>>
>> 【oe] [PATCH][meta-networking] netcf: align the systemd file path with
>> Makefile
>
> I looked at that fix but from what I can tell it unconditionally deletes
> the 32-bit netcf shared and static libs in a multilib configuration.
> That squelches the QA warning, but it's probably not what we want.
>

Ok, thanks

-Roy

> -J.
>
>>
>>
>> －Roy
>>
>>>   SYSTEMD_SERVICE_${PN} = "netcf-transaction.service"
>>>
>>
>> --
>> Best Reagrds,
>> Roy | RongQing Li
>>
>>

-- 
Best Reagrds,
Roy | RongQing Li

