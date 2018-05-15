Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 722DF74F28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2018 09:31:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4F9V6b8001729
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2018 02:31:06 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 15 May 2018 02:31:05 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <cover.1495783956.git.hongxu.jia@windriver.com>
	<a35cb7f645372cbc1f904b55496e70db43283761.1495783956.git.hongxu.jia@windriver.com>
	<CABZSBQd=VTdvDa38uJGD=BQkbZQZ_t=ZUjmg27WdyPsGNkOSHw@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <a23668c1-e08a-835c-3a47-4ca2a40c9659@windriver.com>
Date: Tue, 15 May 2018 17:33:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CABZSBQd=VTdvDa38uJGD=BQkbZQZ_t=ZUjmg27WdyPsGNkOSHw@mail.gmail.com>
X-Originating-IP: [128.224.162.218]
Subject: Re: [meta-oe][PATCH 4/4] lvm2/libdevmapper: fix invoking lvcreate failed
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
X-List-Received-Date: Tue, 15 May 2018 09:31:05 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

I think I've got to reply. But frankly, I don't have any idea how to 
solve this circular dependency problem.

Normally we have two ways to solve circular dependency problems:
1) Add some new recipe to replace one in the chain
2) Break some recipe in the chain into multiple recipes, giving them 
different dependencies

In this systemd/cryptsetup/libdevmapper case, I don't think the above 
approaches would work.

Hope someone in the mailing list could give me some suggestions.

Best Regards,
Chen Qi

On 05/11/2018 10:48 PM, Chris Patterson wrote:
> Sorry to resurrect such an old thread... :)
>
> The dependency on udev brings back the c the libdevmapper circular
> dependency when systemd is used with cryptsetup.  (systemd ->
> cryptsetup -> libdevmapper -> udev|systemd).
>
> Any thoughts on how to properly fix that (other than removing udev
> from PACKAGECONFIG)?
>
> On Fri, May 26, 2017 at 3:37 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> Previously, libdevmapper is separated from lvm2 in the following commit:
>> ---
>> commit 7f17da154372b5ec33947766783444961e8aa67c
>> Author: Chen Qi <Qi.Chen@windriver.com>
>> Date:   Mon Apr 24 16:06:41 2017 +0800
>>
>>      lvm2: separate libdevmapper to avoid circular dependency
>> ---
>>
>> It caused invoking lvcreate failed:
>> ---
>> root@qemux86-64:~# lvm pvcreate /dev/sda
>>    Physical volume "/dev/sda" successfully created.
>> root@qemux86-64:~# lvm vgcreate -s 4096K wrl /dev/sda
>>    Volume group "wrl" successfully created
>> root@qemux86-64:~# lvm lvcreate -n swap -L 2293648K -y --type linear wrl
>>    Rounding up size to full physical extent 2.19 GiB
>>    /dev/wrl/swap: not found: device not cleared
>>    Aborting. Failed to wipe start of new LV.
>> ---
>>
>> The lvm2 and libdevmapper should use the same PACKAGECONFIG
>> and EXTRA_OECONF.
>>
>> And do not manually remove useless files.
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   .../recipes-support/lvm2/libdevmapper_2.02.166.bb  | 21 ++-----------
>>   meta-oe/recipes-support/lvm2/lvm2.inc              | 26 +++++++++++++++-
>>   .../0001-explicitly-do-not-install-libdm.patch     | 36 ++++++++++++++++++++++
>>   meta-oe/recipes-support/lvm2/lvm2_2.02.171.bb      | 31 ++-----------------
>>   4 files changed, 65 insertions(+), 49 deletions(-)
>>   create mode 100644 meta-oe/recipes-support/lvm2/lvm2/0001-explicitly-do-not-install-libdm.patch
>>
>> diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.02.166.bb b/meta-oe/recipes-support/lvm2/libdevmapper_2.02.166.bb
>> index fd1fc2c..3cf939d 100644
>> --- a/meta-oe/recipes-support/lvm2/libdevmapper_2.02.166.bb
>> +++ b/meta-oe/recipes-support/lvm2/libdevmapper_2.02.166.bb
>> @@ -5,27 +5,10 @@ SRC_URI[sha256sum] = "e120b066b85b224552efda40204488c5123de068725676fd6e5c8bc655
>>
>>   DEPENDS += "autoconf-archive-native"
>>
>> -PACKAGECONFIG = ""
>> -
>> -# Unset user/group to unbreak install.
>> -EXTRA_OECONF = "--with-user= \
>> -                --with-group= \
>> -                --enable-pkgconfig \
>> -                --with-usrlibdir=${libdir} \
>> -"
>> -
>>   TARGET_CC_ARCH += "${LDFLAGS}"
>>
>> -do_install_append() {
>> -    # Remove things unrelated to libdevmapper
>> -    rm -rf ${D}${sysconfdir}
>> -    for i in `ls ${D}${sbindir}/*`; do
>> -       if [ $i != ${D}${sbindir}/dmsetup ]; then
>> -           rm $i
>> -       fi
>> -    done
>> -    # Remove docs
>> -    rm -rf ${D}${datadir}
>> +do_install() {
>> +    oe_runmake 'DESTDIR=${D}' -C libdm install
>>   }
>>
>>   RRECOMMENDS_${PN}_append_class-target = " lvm2-udevrules"
>> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
>> index cb5a9e0..c2dac95 100644
>> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
>> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
>> @@ -18,11 +18,18 @@ S = "${WORKDIR}/LVM2.${PV}"
>>
>>   inherit autotools-brokensep pkgconfig systemd
>>
>> +LVM2_PACKAGECONFIG = "dmeventd lvmetad"
>> +LVM2_PACKAGECONFIG_append_class-target = " \
>> +    ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
>> +    thin-provisioning-tools \
>> +    udev \
>> +"
>> +
>>   # odirect is always enabled because there currently is a bug in
>>   # lib/device/dev-io.c which prevents compiling without it. It is
>>   # better to stick to configurations that were actually tested by
>>   # upstream...
>> -PACKAGECONFIG_append = " odirect"
>> +PACKAGECONFIG ??= "odirect ${LVM2_PACKAGECONFIG}"
>>
>>   PACKAGECONFIG[dmeventd] = "--enable-dmeventd,--disable-dmeventd"
>>   PACKAGECONFIG[lvmetad] = "--enable-lvmetad,--disable-lvmetad"
>> @@ -31,3 +38,20 @@ PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline"
>>   PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
>>   PACKAGECONFIG[thin-provisioning-tools] = "--with-thin=internal,--with-thin=none,,thin-provisioning-tools"
>>   PACKAGECONFIG[udev] = "--enable-udev_sync --enable-udev_rules --with-udevdir=${nonarch_base_libdir}/udev/rules.d,--disable-udev_sync --disable-udev_rules,udev"
>> +
>> +# Unset user/group to unbreak install.
>> +EXTRA_OECONF = "--with-user= \
>> +                --with-group= \
>> +                --enable-realtime \
>> +                --enable-applib \
>> +                --enable-cmdlib \
>> +                --enable-pkgconfig \
>> +                --with-usrlibdir=${libdir} \
>> +                --with-systemdsystemunitdir=${systemd_system_unitdir} \
>> +                --disable-thin_check_needs_check \
>> +                --with-thin-check=${sbindir}/thin_check \
>> +                --with-thin-dump=${sbindir}/thin_dump \
>> +                --with-thin-repair=${sbindir}/thin_repair \
>> +                --with-thin-restore=${sbindir}/thin_restore \
>> +"
>> +
>> diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-explicitly-do-not-install-libdm.patch b/meta-oe/recipes-support/lvm2/lvm2/0001-explicitly-do-not-install-libdm.patch
>> new file mode 100644
>> index 0000000..e85818d
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/lvm2/lvm2/0001-explicitly-do-not-install-libdm.patch
>> @@ -0,0 +1,36 @@
>> +From 0a8e466fcf99622896e070c5133165e4278e8cfb Mon Sep 17 00:00:00 2001
>> +From: Hongxu Jia <hongxu.jia@windriver.com>
>> +Date: Thu, 25 May 2017 05:27:11 -0400
>> +Subject: [PATCH] explicitly do not install libdm
>> +
>> +Already have package libdevmapper which split from lvm2,
>> +explicitly do not do the installation here.
>> +
>> +Upstream-Status: Inappropriate [meta-oe specific]
>> +
>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> +---
>> + libdm/Makefile.in | 6 ++++--
>> + 1 file changed, 4 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/libdm/Makefile.in b/libdm/Makefile.in
>> +index 3c9a4ce..45c91c6 100644
>> +--- a/libdm/Makefile.in
>> ++++ b/libdm/Makefile.in
>> +@@ -77,9 +77,11 @@ ifeq ("@PKGCONFIG@", "yes")
>> +   INSTALL_TYPE += install_pkgconfig
>> + endif
>> +
>> +-install: $(INSTALL_TYPE) install_include
>> ++install:
>> ++      echo "Do not install device mappler in lvm2"
>> +
>> +-install_device-mapper: install
>> ++install_device-mapper:
>> ++      echo "Do not install device mappler in lvm2"
>> +
>> + install_include: $(srcdir)/libdevmapper.h
>> +       $(INSTALL_DATA) -D $< $(includedir)/$(<F)
>> +--
>> +2.8.1
>> +
>> diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.02.171.bb b/meta-oe/recipes-support/lvm2/lvm2_2.02.171.bb
>> index 38c4414..84881e7 100644
>> --- a/meta-oe/recipes-support/lvm2/lvm2_2.02.171.bb
>> +++ b/meta-oe/recipes-support/lvm2/lvm2_2.02.171.bb
>> @@ -3,32 +3,9 @@ require lvm2.inc
>>   SRC_URI[md5sum] = "153b7bb643eb26073274968e9026fa8f"
>>   SRC_URI[sha256sum] = "b815a711a2fabaa5c3dc1a4a284df0268bf0f325f0fc0f5c9530c9bbb54b9964"
>>
>> -DEPENDS += "autoconf-archive-native"
>> -
>> -LVM2_PACKAGECONFIG = "dmeventd lvmetad"
>> -LVM2_PACKAGECONFIG_append_class-target = " \
>> -    ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
>> -    thin-provisioning-tools \
>> -    udev \
>> -"
>> +SRC_URI += "file://0001-explicitly-do-not-install-libdm.patch"
>>
>> -PACKAGECONFIG ??= "${LVM2_PACKAGECONFIG}"
>> -
>> -# Unset user/group to unbreak install.
>> -EXTRA_OECONF = "--with-user= \
>> -                --with-group= \
>> -                --enable-realtime \
>> -                --enable-applib \
>> -                --enable-cmdlib \
>> -                --enable-pkgconfig \
>> -                --with-usrlibdir=${libdir} \
>> -                --with-systemdsystemunitdir=${systemd_system_unitdir} \
>> -                --disable-thin_check_needs_check \
>> -                --with-thin-check=${sbindir}/thin_check \
>> -                --with-thin-dump=${sbindir}/thin_dump \
>> -                --with-thin-repair=${sbindir}/thin_repair \
>> -                --with-thin-restore=${sbindir}/thin_restore \
>> -"
>> +DEPENDS += "autoconf-archive-native"
>>
>>   CACHED_CONFIGUREVARS += "MODPROBE_CMD=${base_sbindir}/modprobe"
>>
>> @@ -45,10 +22,6 @@ do_install_append() {
>>           mv ${D}${sysconfdir}/rc.d/init.d ${D}${sysconfdir}/init.d
>>           rm -rf ${D}${sysconfdir}/rc.d
>>       fi
>> -    # Remove things related to libdevmapper
>> -    rm -f ${D}${sbindir}/dmsetup
>> -    rm -f ${D}${libdir}/libdevmapper.so.*
>> -    rm -f ${D}${libdir}/libdevmapper.so ${D}${libdir}/pkgconfig/devmapper.pc ${D}${includedir}/libdevmapper.h
>>   }
>>
>>   PACKAGE_BEFORE_PN = "${PN}-scripts ${PN}-udevrules"
>> --
>> 2.8.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



