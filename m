Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6C93776504
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 01:04:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6V146Hv013491
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 Jul 2015 18:04:06 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 30 Jul 2015 18:03:46 -0700
Message-ID: <55BAC984.5@windriver.com>
Date: Fri, 31 Jul 2015 09:04:04 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Joe MacDonald <Joe_MacDonald@mentor.com>
References: <1438050989-15233-1-git-send-email-rongqing.li@windriver.com>
	<20150730165734.GD6457@mentor.com>
In-Reply-To: <20150730165734.GD6457@mentor.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] ypbind-mt: get parameters from dhcp
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
X-List-Received-Date: Fri, 31 Jul 2015 01:04:07 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年07月31日 00:57, Joe MacDonald wrote:
> [[oe] [PATCH 1/2] ypbind-mt: get parameters from dhcp] On 15.07.28 (Tue 10:36) rongqing.li@windriver.com wrote:
>
>> From: Li Wang <li.wang@windriver.com>
>>
>> adopt a script nis.sh from
>> https://git.centos.org/raw/rpms!ypbind.git/5a592e88374f067679276488430ebdf51152c358/SOURCES!nis.sh
>> it is dhclient-script plugin for NIS settings.
>>
>> Signed-off-by: Li Wang <li.wang@windriver.com>
>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
>> ---
>>   .../recipes-support/nis/ypbind-mt/nis.sh           | 108 +++++++++++++++++++++
>>   .../recipes-support/nis/ypbind-mt_1.38.bb          |   4 +
>>   .../recipes-support/nis/ypbind-mt_2.2.bb           |   4 +
>>   3 files changed, 116 insertions(+)
>>   create mode 100755 meta-networking/recipes-support/nis/ypbind-mt/nis.sh
>>
>> diff --git a/meta-networking/recipes-support/nis/ypbind-mt/nis.sh b/meta-networking/recipes-support/nis/ypbind-mt/nis.sh
>> new file mode 100755
>> index 0000000..a1e338c
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/nis/ypbind-mt/nis.sh
>> @@ -0,0 +1,108 @@
>> +#!/bin/sh
>> +#
>> +# nis.sh: dhclient-script plugin for NIS settings,
>> +#         place in /etc/dhcp/dhclient.d and 'chmod +x nis.sh' to enable
>> +#
>> +# Copyright (C) 2008 Red Hat, Inc.
>> +#
>> +# This program is free software; you can redistribute it and/or modify
>> +# it under the terms of the GNU General Public License as published by
>> +# the Free Software Foundation; either version 2 of the License, or
>> +# (at your option) any later version.
>> +#
>> +# This program is distributed in the hope that it will be useful,
>> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
>> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> +# GNU General Public License for more details.
>> +#
>> +# You should have received a copy of the GNU General Public License
>> +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
>> +#
>> +# Author(s): David Cantrell <dcantrell@redhat.com>
>> +
>> +CONF=/etc/yp.conf
>
> This should probably be substituted with @SYSCONFDIR@ so it's still
> functional for anyone who changes ${sysconfdir}.  Just thinking out loud

thanks, Joe

I will change it


> now, but what's the systemd equivalent here?  Do we already have one?
>

this script is not called by initvscript or systemd,  it is called by
dhclient once dhclient run and  gets configuration, so it is not related
to systemd

-Roy

> That's not a barrier to accepting this patch, either way.  I'd just like
> to see this hard-coded path be slightly less hard-coded.
>
> -J.
>
>> +SAVECONF=${SAVEDIR}/${CONF##*/}.predhclient.${interface}
>> +
>> +fix_context() {
>> +    if [ -x /sbin/restorecon ]; then
>> +        /sbin/restorecon ${1} >/dev/null 2>&1
>> +    fi
>> +}
>> +
>> +save_config_file() {
>> +    if [ ! -d ${SAVEDIR} ]; then
>> +        mkdir -p ${SAVEDIR}
>> +    fi
>> +
>> +    if [ -e ${CONF} ]; then
>> +        # cp+rm instead of mv: preserve SELinux context
>> +        # rhbz#509240
>> +        # Do not rely on restorecon.
>> +        cp -c ${CONF} ${SAVECONF}
>> +        rm ${CONF}
>> +    else
>> +        echo > ${SAVECONF}
>> +        # Try restorecon
>> +        fix_context ${SAVECONF}
>> +    fi
>> +}
>> +
>> +nis_config() {
>> +    if [ ! "${PEERNIS}" = "no" ]; then
>> +        if [ -n "${new_nis_domain}" ]; then
>> +            domainname "${new_nis_domain}"
>> +            save_config_file
>> +            let contents=0
>> +            echo '# generated by /sbin/dhclient-script' > ${CONF}
>> +            fix_context ${CONF}
>> +
>> +            if [ -n "${new_nis_servers}" ]; then
>> +                for i in ${new_nis_servers} ; do
>> +                    echo "domain ${new_nis_domain} server ${i}" >> ${CONF}
>> +                    let contents=contents+1
>> +                done
>> +            else
>> +                echo "domain ${new_nis_domain} broadcast" >> ${CONF}
>> +                let contents=contents+1
>> +            fi
>> +
>> +            if [ ${contents} -gt 0 ]; then
>> +                service ypbind condrestart >/dev/null 2>&1
>> +            fi
>> +        elif [ -n "${new_nis_servers}" ]; then
>> +            save_config_file
>> +            echo '# generated by /sbin/dhclient-script' > ${CONF}
>> +            fix_context ${CONF}
>> +            let contents=0
>> +
>> +            for i in ${new_nis_servers} ; do
>> +                echo "ypserver ${i}" >> ${CONF}
>> +                let contents=contents+1
>> +            done
>> +
>> +            if [ $contents -gt 0 ]; then
>> +                service ypbind condrestart >/dev/null 2>&1
>> +            fi
>> +        fi
>> +    fi
>> +}
>> +
>> +nis_restore() {
>> +    if [ ! "${PEERNIS}" = "no" ]; then
>> +        if [ -f ${SAVECONF} ]; then
>> +            rm -f ${CONF}
>> +            # cp+rm instead of mv: preserve SELinux context
>> +            # rhbz#509240
>> +            cp -c ${SAVECONF} ${CONF}
>> +            rm ${SAVECONF}
>> +            fix_context ${CONF} # Restorecon again to be sure.
>> +            service ypbind condrestart >/dev/null 2>&1
>> +        fi
>> +    fi
>> +}
>> +
>> +# Local Variables:
>> +# indent-tabs-mode: nil
>> +# sh-basic-offset: 4
>> +# show-trailing-whitespace: t
>> +# End:
>> diff --git a/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb b/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
>> index d25ef5c..5391b5b 100644
>> --- a/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
>> +++ b/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
>> @@ -28,6 +28,7 @@ PROVIDES += "ypbind"
>>   SRC_URI = "http://www.linux-nis.org/download/ypbind-mt/${BP}.tar.bz2 \
>>              file://ypbind-yocto.init \
>>              file://ypbind.service \
>> +           file://nis.sh \
>>   "
>>   SRC_URI[md5sum] = "094088c0e282fa7f3b3dd6cc51d0a4e1"
>>   SRC_URI[sha256sum] = "1930ce19f6ccfe10400f3497b31867f71690d2bcd3f5b575199fa915559b7746"
>> @@ -48,6 +49,9 @@ do_install_append () {
>>
>>       install -d ${D}${systemd_unitdir}/system
>>       install -m 0644 ${WORKDIR}/ypbind.service ${D}${systemd_unitdir}/system
>> +
>> +    install -d ${D}/${sysconfdir}/dhcp/dhclient.d
>> +    install -m 755 ${WORKDIR}/nis.sh ${D}/${sysconfdir}/dhcp/dhclient.d/
>>   }
>>
>>
>> diff --git a/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb b/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
>> index 4f8bf48..6d5ab2d 100644
>> --- a/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
>> +++ b/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
>> @@ -23,6 +23,7 @@ PNBLACKLIST[ypbind-mt] ?= "BROKEN: Depends on broken yp-tools"
>>   SRC_URI = "http://www.linux-nis.org/download/ypbind-mt/${BP}.tar.bz2 \
>>              file://ypbind-yocto.init \
>>              file://ypbind.service \
>> +           file://nis.sh \
>>   "
>>   SRC_URI[md5sum] = "54e2040d8266ae7d302d081ca310c8a8"
>>   SRC_URI[sha256sum] = "dc2f7d97c94dcab0acfdcd115cd8b464eb8c427e4bb0fe68404ae7465f517cd3"
>> @@ -45,6 +46,9 @@ do_install_append () {
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
>> 2.1.4
>>

-- 
Best Reagrds,
Roy | RongQing Li

