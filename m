Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1905E71AC1
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Nov 2017 08:46:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vA28kWK0019157
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 2 Nov 2017 01:46:32 -0700 (PDT)
Received: from [128.224.163.194] (128.224.163.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 2 Nov 2017 01:46:31 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <20171102082543.3698-1-kai.kang@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <c48f52a6-7ec8-24ac-fb93-d8237a7aa7e3@windriver.com>
Date: Thu, 2 Nov 2017 16:52:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20171102082543.3698-1-kai.kang@windriver.com>
Subject: Re: [meta-networking] [PATCH] corosync: 2.4.2 -> 2.4.3
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
X-List-Received-Date: Thu, 02 Nov 2017 08:46:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Forgot layer info in title. :(

--Kai

On 2017年11月02日 16:25, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> Upgrade corosync from 2.4.2 to 2.4.3.
>
> * remove patch which is merged by upstream
> * disable autostart of corosync. It only works after configured and config file
>    /etc/corosync/corosync.conf exists.
> * use bb.utils.filter
> * corosync init script requires command pidof. But pidof from busybox doesn't
>    work well to filter calling process, so update runtime dependency
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   ...001-Include-fcntl.h-for-F_-and-O_-defines.patch | 28 ----------------------
>   .../{corosync_2.4.2.bb => corosync_2.4.3.bb}       | 19 +++++++--------
>   2 files changed, 9 insertions(+), 38 deletions(-)
>   delete mode 100644 meta-networking/recipes-extended/corosync/corosync/0001-Include-fcntl.h-for-F_-and-O_-defines.patch
>   rename meta-networking/recipes-extended/corosync/{corosync_2.4.2.bb => corosync_2.4.3.bb} (84%)
>
> diff --git a/meta-networking/recipes-extended/corosync/corosync/0001-Include-fcntl.h-for-F_-and-O_-defines.patch b/meta-networking/recipes-extended/corosync/corosync/0001-Include-fcntl.h-for-F_-and-O_-defines.patch
> deleted file mode 100644
> index fe4b0793f..000000000
> --- a/meta-networking/recipes-extended/corosync/corosync/0001-Include-fcntl.h-for-F_-and-O_-defines.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From 85ea47fedbc96ed9180e08b0d371d9966e3a88da Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 30 Aug 2017 17:28:55 -0700
> -Subject: [PATCH] Include fcntl.h for F_* and O_* defines
> -
> -Fixes errors like
> -utils.c:95:22: error: use of undeclared identifier 'O_WRONLY'
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - qdevices/utils.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/qdevices/utils.c b/qdevices/utils.c
> -index 41850b8c..87090853 100644
> ---- a/qdevices/utils.c
> -+++ b/qdevices/utils.c
> -@@ -39,6 +39,7 @@
> -
> - #include <err.h>
> - #include <errno.h>
> -+#include <fcntl.h>
> - #include <inttypes.h>
> - #include <libgen.h>
> - #include <stdio.h>
> ---
> -2.14.1
> -
> diff --git a/meta-networking/recipes-extended/corosync/corosync_2.4.2.bb b/meta-networking/recipes-extended/corosync/corosync_2.4.3.bb
> similarity index 84%
> rename from meta-networking/recipes-extended/corosync/corosync_2.4.2.bb
> rename to meta-networking/recipes-extended/corosync/corosync_2.4.3.bb
> index 33e74e2ff..52d2a1098 100644
> --- a/meta-networking/recipes-extended/corosync/corosync_2.4.2.bb
> +++ b/meta-networking/recipes-extended/corosync/corosync_2.4.3.bb
> @@ -7,11 +7,10 @@ SECTION = "base"
>   
>   inherit autotools pkgconfig systemd useradd
>   
> -SRC_URI = "http://build.clusterlabs.org/corosync/releases/${BP}.tar.gz \
> -           file://0001-Include-fcntl.h-for-F_-and-O_-defines.patch \
> -          "
> -SRC_URI[md5sum] = "547fa78704da53aa35912be58d31035f"
> -SRC_URI[sha256sum] = "f26e3011309fe4bcce94b1dc20ea8c462f19483a73f3ca62f13b925d011a4ba9"
> +SRC_URI = "http://build.clusterlabs.org/corosync/releases/${BP}.tar.gz"
> +
> +SRC_URI[md5sum] = "bf0ede13018aadc8a046183bc593b0e0"
> +SRC_URI[sha256sum] = "b1e7e422e8d2f7af8e5315fa329b1dbd1175fff32efaa55e8054584c80a2c597"
>   
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=a85eb4ce24033adb6088dd1d6ffc5e5d"
> @@ -22,7 +21,7 @@ SYSTEMD_SERVICE_${PN} = "corosync.service corosync-notifyd.service \
>                            ${@bb.utils.contains('PACKAGECONFIG', 'qdevice', 'corosync-qdevice.service', '', d)} \
>                            ${@bb.utils.contains('PACKAGECONFIG', 'qnetd', 'corosync-qnetd.service', '', d)} \
>   "
> -SYSTEMD_AUTO_ENABLE = "enable"
> +SYSTEMD_AUTO_ENABLE = "disable"
>   
>   INITSCRIPT_NAME = "corosync-daemon"
>   
> @@ -55,22 +54,22 @@ do_install_append() {
>       install -d ${D}${sysconfdir}/default/volatiles
>       echo "d root root 0755 ${localstatedir}/log/cluster none" > ${D}${sysconfdir}/default/volatiles/05_corosync
>   
> -    if ${@bb.utils.contains('PACKAGECONFIG', 'qnetd', 'true', 'false', d)}; then
> +    if [ ${@bb.utils.filter('PACKAGECONFIG', 'qnetd', d)} ]; then
>           chown -R coroqnetd:coroqnetd ${D}${sysconfdir}/${BPN}/qnetd
>           echo "d coroqnetd coroqnetd 0770 /var/run/corosync-qnetd none" >> ${D}${sysconfdir}/default/volatiles/05_corosync
>       fi
>   
> -    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> +    if [ ${@bb.utils.filter('DISTRO_FEATURES','systemd',d)} ]; then
>           install -d ${D}${sysconfdir}/tmpfiles.d
>           echo "d ${localstatedir}/log/cluster - - - -" > ${D}${sysconfdir}/tmpfiles.d/corosync.conf
>   
> -        if ${@bb.utils.contains('PACKAGECONFIG', 'qnetd', 'true', 'false', d)}; then
> +        if [ ${@bb.utils.filter('PACKAGECONFIG', 'qnetd', d)} ]; then
>               install -m 0644 ${S}/conf/tmpfiles.d/corosync-qnetd.conf ${D}${sysconfdir}/tmpfiles.d
>           fi
>       fi
>   }
>   
> -RDEPENDS_${PN} += "bash"
> +RDEPENDS_${PN} += "bash ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit-pidof', 'procps', d)}"
>   
>   FILES_${PN}-dbg += "${libexecdir}/lcrso/.debug"
>   FILES_${PN}-doc += "${datadir}/snmp/mibs/COROSYNC-MIB.txt"


-- 
Regards,
Neil | Kai Kang


