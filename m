Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 64A0C73E3B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jul 2015 01:31:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6H1VIS9017857
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 16 Jul 2015 18:31:19 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 16 Jul 2015 18:31:18 -0700
Message-ID: <55A85AE4.4070100@windriver.com>
Date: Fri, 17 Jul 2015 09:31:16 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Joe MacDonald <Joe_MacDonald@mentor.com>
References: <1436236091-31779-1-git-send-email-rongqing.li@windriver.com>
	<20150716144408.GB4432@mentor.com>
In-Reply-To: <20150716144408.GB4432@mentor.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-networking] ypbind-mt: get parameters from dhcp
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
X-List-Received-Date: Fri, 17 Jul 2015 01:31:21 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年07月16日 22:44, Joe MacDonald wrote:
> [[oe] [PATCH][meta-networking] ypbind-mt: get parameters from dhcp] On 15.07.07 (Tue 10:28) rongqing.li@windriver.com wrote:
>
>> From: Li Wang <li.wang@windriver.com>
>>
>> the script nis.sh is called by dhcp client,
>> it can get some parameters from dhcp.
>>
>> Signed-off-by: Li Wang <li.wang@windriver.com>
>> ---
>>   .../recipes-support/nis/ypbind-mt/nis.sh           | 41 ++++++++++++++++++++++
>>   .../recipes-support/nis/ypbind-mt/yp.conf          |  1 +
>>   .../recipes-support/nis/ypbind-mt_1.38.bb          |  6 ++++
>>   3 files changed, 48 insertions(+)
>>   create mode 100755 meta-networking/recipes-support/nis/ypbind-mt/nis.sh
>>   create mode 100644 meta-networking/recipes-support/nis/ypbind-mt/yp.conf
>>
>> diff --git a/meta-networking/recipes-support/nis/ypbind-mt/nis.sh b/meta-networking/recipes-support/nis/ypbind-mt/nis.sh
>> new file mode 100755
>> index 0000000..a06a977
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/nis/ypbind-mt/nis.sh
>> @@ -0,0 +1,41 @@
>> +#!/bin/bash
>
> I wasn't able to find anything bash-specific in this script, can you
> change this to /bin/sh, please?
>
>> +#
>> +# nis.sh: dhclient-script plugin for NIS settings,
>> +#         place in /etc/dhcp/dhclient.d and 'chmod +x nis.sh' to enable
>> +#
>> +
>> +CONF=/etc/yp.conf
>> +SAVECONF=${SAVEDIR}/${CONF##*/}.predhclient.${interface}
>
> Where's SAVEDIR set again?  It comes from the calling environment?
>
>> +
>> +nis_replace_conf() {
>> +        echo "$1" | diff -q ${CONF} - > /dev/null 2>&1
>> +        if [ $? -eq 1 ]; then
>> +            echo "$1" > ${CONF}
>> +#            restorecon ${CONF} >/dev/null 2>&1
>
> I'm not sure what to make of this, maybe you want to make a parameter to
> optionally run restorecon?  Or maybe a separate patch for meta-selinux
> with restorecon stuff in it?  Either way, please don't leave this as
> dead code.
>
>> +            service ypbind restart >/dev/null 2>&1
>> +        fi
>> +}
>> +
>> +nis_config() {
>> +    if [ -n "${new_nis_domain}" ] && [ -n "${new_nis_servers}" ] &&
>> +        [ -e ${CONF} ] && [ -d ${SAVEDIR} ]; then
>> +        local conf=$(grep -v '^domain .*  # added by /sbin/dhclient-script$' < ${CONF})
>> +
>> +        conf=$(echo "$conf"
>> +            for s in ${new_nis_servers}; do
>> +                echo "domain ${new_nis_domain} server ${s}  # added by /sbin/dhclient-script"
>> +            done)
>> +
>> +        [ -f ${SAVECONF} ] || touch ${SAVECONF}
>> +        nis_replace_conf "$conf"
>> +    fi
>> +}
>> +
>> +nis_restore() {
>> +    if [ -e ${CONF} ] && [ -f ${SAVECONF} ]; then
>> +        local conf=$(grep -v '^domain .*  # added by /sbin/dhclient-script$' < ${CONF})
>
> Would this really be necessary if you saved $CONF to $SAVECONF and
> restored it later?  (See below)
>
>> +
>> +        nis_replace_conf "$conf"
>> +        rm -f ${SAVECONF}
>
> Does anything get copied to $SAVECONF?  All I see is the one touch
> above, but wouldn't it be easier all around if you were making copies of
> the CONF file to restore later?
>
>> +    fi
>> +}
>> diff --git a/meta-networking/recipes-support/nis/ypbind-mt/yp.conf b/meta-networking/recipes-support/nis/ypbind-mt/yp.conf
>> new file mode 100644
>> index 0000000..792d600
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/nis/ypbind-mt/yp.conf
>> @@ -0,0 +1 @@
>> +#
>
> Presumably this is necessary to support the 'nis.sh' script, but since
> it's just an empty file, why not create it at do_install time (or better
> still just have the script handle a missing one in some sensible way and
> thus allow another layer to provide their own yp.conf if they need to)?
>
> I'd encourage you to look at:
>
> https://git.centos.org/raw/rpms!ypbind.git/5a592e88374f067679276488430ebdf51152c358/SOURCES!nis.sh;jsessionid=1xhm7099hzkgm1w0ke7bmqaut4
>
> since they seem to share a common ancestry anyway and adopt that (or
> something very like it) instead.
>
> -J.


thanks, I will adopt it

-Roy

>
>> diff --git a/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb b/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
>> index d25ef5c..f0c1cea 100644
>> --- a/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
>> +++ b/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
>> @@ -28,6 +28,8 @@ PROVIDES += "ypbind"
>>   SRC_URI = "http://www.linux-nis.org/download/ypbind-mt/${BP}.tar.bz2 \
>>              file://ypbind-yocto.init \
>>              file://ypbind.service \
>> +           file://yp.conf \
>> +           file://nis.sh \
>>   "
>>   SRC_URI[md5sum] = "094088c0e282fa7f3b3dd6cc51d0a4e1"
>>   SRC_URI[sha256sum] = "1930ce19f6ccfe10400f3497b31867f71690d2bcd3f5b575199fa915559b7746"
>> @@ -44,10 +46,14 @@ do_install_append () {
>>       install -d ${D}${sysconfdir}/init.d
>>       install -d ${D}${sysconfdir}/rcS.d
>>
>> +    install -m 0744 ${WORKDIR}/yp.conf ${D}${sysconfdir}/
>>       install -m 0755 ${WORKDIR}/ypbind-yocto.init ${D}${sysconfdir}/init.d/ypbind
>>
>>       install -d ${D}${systemd_unitdir}/system
>>       install -m 0644 ${WORKDIR}/ypbind.service ${D}${systemd_unitdir}/system
>> +
>> +    install -d ${D}/${sysconfdir}/dhcp/dhclient.d
>> +    install -m 755 ${WORKDIR}/nis.sh ${D}/${sysconfdir}/dhcp/dhclient.d/
>>   }
>>
>>
>> --
>> 1.9.1
>>

-- 
Best Reagrds,
Roy | RongQing Li

