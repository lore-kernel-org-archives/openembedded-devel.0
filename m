Return-Path: <Zhenbo.Gao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B457F605BA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 May 2016 09:01:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4P91clw018269
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 May 2016 02:01:38 -0700 (PDT)
Received: from [128.224.162.191] (128.224.162.191) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 25 May 2016 02:01:38 -0700
To: Koen Kooi <koen@dominion.thruhere.net>
References: <1464159700-16254-1-git-send-email-zhenbo.gao@windriver.com>
	<D9C8A333-331C-4D27-A60D-EDB3DDC244D3@dominion.thruhere.net>
	<57456517.1030405@windriver.com>
	<94DE3B87-251D-431D-9BD2-AA3B841C130D@dominion.thruhere.net>
From: zhenbo <zhenbo.gao@windriver.com>
Message-ID: <574569EC.7050601@windriver.com>
Date: Wed, 25 May 2016 17:01:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <94DE3B87-251D-431D-9BD2-AA3B841C130D@dominion.thruhere.net>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] networkmanager: add alias for networkmanager
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 May 2016 09:01:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2016年05月25日 16:43, Koen Kooi wrote:
>> Op 25 mei 2016, om 10:40 heeft zhenbo <zhenbo.gao@windriver.com> het volgende geschreven:
>>
>>
>>
>> On 2016年05月25日 16:11, Koen Kooi wrote:
>>>> Op 25 mei 2016, om 09:01 heeft Zhenbo Gao <zhenbo.gao@windriver.com> het volgende geschreven:
>>>>
>>>> connman get conflicts with networkmanager when building
>>>> the project.
>>> What’s the conflict? I’m hesitant to add yet another virtual since history has shown that most OE people can’t deal with the consequences and maintenance load for keeping the virtuals working
>> Hi Koen Kooi,
>>
>> Thanks for replying this mail.
>>
>> When my project includes xfce and self-hosted at the same time, the compile step will fail and the error information shows that networkmanager get conflict with connman:
>> ---
>> ...
>> Computing transaction...error: Can't install xfce4-power-manager-1.4.4-r0.0@corei7_64: unable to install provider for networkmanager:
>> error:     networkmanager-1.0.4-r0.0@corei7_64 conflicts with connman-1.30-r0.0@corei7_64
>> ...
>> The dependence relationship is:
>> xfce4-power-manager --> networkmanager
>> packagegroup-self-hosted --> connman
> So fix packagegroup-self-hosted to not specify a connection manager, crippling the connman and nm recipes with a virtual isn’t the solution.
>
Ok, i will give a try.  thanks for your feedback and suggestion.

Zhenbo
>> Thanks,
>> Zhenbo
>>
>>>> here introduce alias virtual/networkmanager for these
>>>> two recipes, so setting PREFERRED_PROVIDER to the proper
>>>> one can solve the conflicts.
>>>>
>>>> this patch is for networkmanager recipe.
>>>>
>>>> Signed-off-by: Zhenbo Gao <zhenbo.gao@windriver.com>
>>>> ---
>>>> meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb    | 1 +
>>>> meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb | 2 +-
>>>> 2 files changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
>>>> index 831ddf0..efd4d08 100644
>>>> --- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
>>>> +++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
>>>> @@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b \
>>>> "
>>>>
>>>> DEPENDS = "libnl dbus dbus-glib libgudev util-linux libndp libnewt polkit"
>>>> +PROVIDES = "virtual/networkmanager"
>>>>
>>>> inherit gnomebase gettext systemd bluetooth bash-completion vala gobject-introspection
>>>>
>>>> diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb
>>>> index 2070db2..59e1d40 100644
>>>> --- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb
>>>> +++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb
>>>> @@ -34,7 +34,7 @@ FILES_xfce4-powermanager-plugin = " \
>>>> "
>>>>
>>>> RDEPENDS_xfce4-powermanager-plugin = "${PN}"
>>>> -RDEPENDS_${PN} = "networkmanager ${@bb.utils.contains('DISTRO_FEATURES','systemd','','consolekit',d)}"
>>>> +RDEPENDS_${PN} = "virtual/networkmanager ${@bb.utils.contains('DISTRO_FEATURES','systemd','','consolekit',d)}"
>>>>
>>>> # xfce4-brightness-plugin was replaced by xfce4-powermanager-plugin
>>>> RPROVIDES_xfce4-powermanager-plugin += "xfce4-brightness-plugin"
>>>> -- 
>>>> 1.9.1
>>>>


