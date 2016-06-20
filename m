Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 39E3973174
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jun 2016 02:04:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u5K241iN021390
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jun 2016 19:04:02 -0700 (PDT)
Received: from [128.224.162.188] (128.224.162.188) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 19 Jun 2016 19:04:01 -0700
Message-ID: <57674F0F.6090700@windriver.com>
Date: Mon, 20 Jun 2016 10:03:59 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1465355197-28010-1-git-send-email-wenzong.fan@windriver.com>
	<20160613203211.GC2580@jama>
In-Reply-To: <20160613203211.GC2580@jama>
Subject: Re: [PATCH][meta-oe] krb5: add systemd support
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
X-List-Received-Date: Mon, 20 Jun 2016 02:04:02 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 06/14/2016 04:32 AM, Martin Jansa wrote:
> On Tue, Jun 07, 2016 at 11:06:37PM -0400, wenzong.fan@windriver.com wrote:
>> From: Wenzong Fan <wenzong.fan@windriver.com>
>>
>> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>> ---
>>   .../krb5/krb5/krb5-admin-server.service            | 14 +++++++++++
>>   .../krb5/krb5/krb5-kdc.service                     | 13 ++++++++++
>>   meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb   | 29 +++++++++++++++-------
>>   3 files changed, 47 insertions(+), 9 deletions(-)
>>   create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/krb5-admin-server.service
>>   create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/krb5-kdc.service
>>
>> diff --git a/meta-oe/recipes-connectivity/krb5/krb5/krb5-admin-server.service b/meta-oe/recipes-connectivity/krb5/krb5/krb5-admin-server.service
>> new file mode 100644
>> index 0000000..1b42716
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/krb5/krb5/krb5-admin-server.service
>> @@ -0,0 +1,14 @@
>> +[Unit]
>> +Description=MIT Kerberos KDC administrative daemon
>> +After=syslog.target network.target
>> +ConditionPathExists=/etc/krb5.conf
>> +
>> +[Service]
>> +Type=forking
>> +ExecStartPre=/bin/sh -c "test ! -f /var/log/kadmind.log || test ! -x /sbin/restorecon || /sbin/restorecon -F /var/log/kadmind.log"
>> +ExecStart=/usr/sbin/kadmind
>> +SuccessExitStatus=1 2 SIGKILL
>> +TimeoutStopSec=30
>> +
>> +[Install]
>> +WantedBy=multi-user.target
>> diff --git a/meta-oe/recipes-connectivity/krb5/krb5/krb5-kdc.service b/meta-oe/recipes-connectivity/krb5/krb5/krb5-kdc.service
>> new file mode 100644
>> index 0000000..d5e5a95
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/krb5/krb5/krb5-kdc.service
>> @@ -0,0 +1,13 @@
>> +[Unit]
>> +Description=MIT Kerberos KDC
>> +After=syslog.target network.target
>> +ConditionPathExists=/etc/krb5.conf
>> +
>> +[Service]
>> +Type=forking
>> +ExecStart=/usr/sbin/krb5kdc
>> +SuccessExitStatus=1 2 SIGKILL
>> +TimeoutStopSec=30
>> +
>> +[Install]
>> +WantedBy=multi-user.target
>> diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
>> index 0c566cb..d60e332 100644
>> --- a/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
>> +++ b/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
>> @@ -17,7 +17,7 @@ LICENSE = "MIT"
>>   LIC_FILES_CHKSUM = "file://${S}/../NOTICE;md5=f64248328d2d9928e1f04158b5243e7f"
>>   DEPENDS = "ncurses util-linux e2fsprogs e2fsprogs-native"
>>
>> -inherit autotools-brokensep binconfig perlnative
>> +inherit autotools-brokensep binconfig perlnative systemd
>>
>>   SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
>>   SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}-signed.tar \
>> @@ -32,6 +32,8 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}-signed.tar
>>              file://etc/init.d/krb5-admin-server \
>>              file://etc/default/krb5-kdc \
>>              file://etc/default/krb5-admin-server \
>> +           file://krb5-kdc.service \
>> +           file://krb5-admin-server.service \
>>              file://krb5-CVE-2016-3119.patch;striplevel=2 \
>>              file://0001-Work-around-uninitialized-warning-in-cc_kcm.c.patch;striplevel=2 \
>>   "
>> @@ -40,6 +42,9 @@ SRC_URI[sha256sum] = "e528c30b0209c741f6f320cb83122ded92f291802b6a1a1dc1a01dcdb3
>>
>>   S = "${WORKDIR}/${BP}/src"
>>
>> +SYSTEMD_SERVICE_${PN} = "krb5-admin-server.service krb5-kdc.service"
>> +SYSTEMD_AUTO_ENABLE = "disable"
>> +
>>   PACKAGECONFIG ??= "openssl"
>>   PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
>>   PACKAGECONFIG[openssl] = "--with-pkinit-crypto-impl=openssl,,openssl"
>> @@ -79,20 +84,26 @@ do_configure() {
>>   }
>>
>>   do_install_append() {
>> -    mkdir -p ${D}/${sysconfdir}/init.d ${D}/${sysconfdir}/default
>> -    install -m 0755 ${WORKDIR}/etc/init.d/* ${D}/${sysconfdir}/init.d
>> -    install -m 0644 ${WORKDIR}/etc/default/* ${D}/${sysconfdir}/default
>> -
>>       rm -rf ${D}/${localstatedir}/run
>> -    mkdir -p ${D}/${sysconfdir}/default/volatiles
>> -    echo "d root root 0755 ${localstatedir}/run/krb5kdc none" \
>> -           > ${D}${sysconfdir}/default/volatiles/87_krb5
>> +
>> +    if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
>
> Don't use base_contains
>
> Did you test this change in master? You would see this note:

No, I tested it base on "krogoth". I'll update it and try to run build 
on master.
(Python 3 causes some failures on my host, so I just tested it with 
krogoth ...)

Thanks
Wenzong

>
> NOTE: /OE/build/oe-core/meta-openembedded/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb: base_contains is deprecated, please use bb.utils.contains instead.
>
>> +        mkdir -p ${D}/${sysconfdir}/init.d ${D}/${sysconfdir}/default
>> +        install -m 0755 ${WORKDIR}/etc/init.d/* ${D}/${sysconfdir}/init.d
>> +        install -m 0644 ${WORKDIR}/etc/default/* ${D}/${sysconfdir}/default
>> +
>> +        mkdir -p ${D}/${sysconfdir}/default/volatiles
>> +        echo "d root root 0755 ${localstatedir}/run/krb5kdc none" \
>> +              > ${D}${sysconfdir}/default/volatiles/87_krb5
>> +    fi
>>       if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
>>           install -d ${D}${sysconfdir}/tmpfiles.d
>>           echo "d /run/krb5kdc - - - -" \
>>                 > ${D}${sysconfdir}/tmpfiles.d/krb5.conf
>> -    fi
>>
>> +        install -d ${D}${systemd_unitdir}/system
>> +        install -m 0644 ${WORKDIR}/krb5-admin-server.service ${D}${systemd_unitdir}/system
>> +        install -m 0644 ${WORKDIR}/krb5-kdc.service ${D}${systemd_unitdir}/system
>> +    fi
>>   }
>>
>>   pkg_postinst_${PN} () {
>> --
>> 2.8.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>

