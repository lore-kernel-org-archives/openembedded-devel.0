Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 1274660030
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Dec 2014 16:19:47 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1XvqAx-00070G-0v for openembedded-devel@lists.openembedded.org;
	Tue, 02 Dec 2014 17:19:43 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Dec 2014 17:19:43 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Dec 2014 17:19:43 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 02 Dec 2014 17:19:34 +0100
Message-ID: <m5koqm$ahc$1@ger.gmane.org>
References: <20141121140331.GA20204@mentor.com>	<1417075397-2168-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<20141130205502.GS3886@mentor.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
In-Reply-To: <20141130205502.GS3886@mentor.com>
Subject: Re: [meta-networking][PATCH v2] open-iscsi : add recipe
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
X-List-Received-Date: Tue, 02 Dec 2014 16:19:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Joe MacDonald schreef op 30-11-14 21:55:
> Merged, thanks.  I made one minor tweak to the "add includes" patch to 
> remove trailing whitespace.

None of the review comments were addressed, the hardcoded paths one is a
serious bug :/

> 
> -J.
> 
> [[oe] [meta-networking][PATCH v2] open-iscsi : add recipe] On 14.11.27
> (Thu 16:03) Li xin wrote:
> 
>> Open-iSCSI project is a high performance, transport independent,
>> multi-platform implementation of RFC3720.
>> 
>> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com> --- 
>> .../files/iscsi_sysfs.c-add-include-files.patch    | 26
>> +++++++++++++++++ .../open-iscsi/files/open-iscsi.service            |
>> 18 ++++++++++++ .../open-iscsi/open-iscsi_2.0-871.bb               | 34
>> ++++++++++++++++++++++ 3 files changed, 78 insertions(+) create mode
>> 100644
>> meta-networking/recipes-daemons/open-iscsi/files/iscsi_sysfs.c-add-include-files.patch
>>
>> 
create mode 100644
meta-networking/recipes-daemons/open-iscsi/files/open-iscsi.service
>> create mode 100644
>> meta-networking/recipes-daemons/open-iscsi/open-iscsi_2.0-871.bb
>> 
>> diff --git
>> a/meta-networking/recipes-daemons/open-iscsi/files/iscsi_sysfs.c-add-include-files.patch
>> b/meta-networking/recipes-daemons/open-iscsi/files/iscsi_sysfs.c-add-include-files.patch
>>
>> 
new file mode 100644
>> index 0000000..43c1c36 --- /dev/null +++
>> b/meta-networking/recipes-daemons/open-iscsi/files/iscsi_sysfs.c-add-include-files.patch
>>
>> 
@@ -0,0 +1,26 @@
>> +From e8ecb307b6402b39d033e20f4df4f3374e7c0685 Mon Sep 17 00:00:00
>> 2001 +From: Li xin <lixin.fnst@cn.fujitsu.com> +Date: Fri, 21 Nov 2014
>> 12:02:51 +0900 +Subject: [PATCH] usr/iscsi_sysfs.c : add include files 
>> + +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com> +--- +
>> usr/iscsi_sysfs.c | 2 ++ + 1 file changed, 2 insertions(+) + +diff
>> --git a/usr/iscsi_sysfs.c b/usr/iscsi_sysfs.c +index cb9a5a1..f6bd78a
>> 100644 +--- a/usr/iscsi_sysfs.c ++++ b/usr/iscsi_sysfs.c +@@ -14,6
>> +14,8 @@ +  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
>> the GNU +  * General Public License for more details. +  */ ++#include
>> <sys/types.h> ++#include <sys/stat.h> + #include <fcntl.h> + #include
>> <unistd.h> + #include <stdlib.h> +-- +1.8.4.2 + diff --git
>> a/meta-networking/recipes-daemons/open-iscsi/files/open-iscsi.service
>> b/meta-networking/recipes-daemons/open-iscsi/files/open-iscsi.service 
>> new file mode 100644 index 0000000..debb2d6 --- /dev/null +++
>> b/meta-networking/recipes-daemons/open-iscsi/files/open-iscsi.service 
>> @@ -0,0 +1,18 @@ +[Unit] +Description=Open-iSCSI 
>> +Documentation=man:iscsid(8) man:iscsiadm(8) +After=network.target + 
>> +[Service] +Type=forking +PIDFile=/var/run/iscsid.pid 
>> +ExecStartPre=-/sbin/modprobe -q iscsi_tcp 
>> +ExecStartPre=-/sbin/modprobe -q ib_iser +ExecStart=/usr/sbin/iscsid -p
>> /var/run/iscsid.pid +ExecStartPost=-/usr/sbin/iscsiadm -m node
>> --loginall=automatic +ExecStopPost=/bin/sync 
>> +ExecStopPost=-/sbin/modprobe -r ib_iser +ExecStopPost=-/sbin/modprobe
>> -r iscsi_tcp + +[Install] +WantedBy=multi-user.target diff --git
>> a/meta-networking/recipes-daemons/open-iscsi/open-iscsi_2.0-871.bb
>> b/meta-networking/recipes-daemons/open-iscsi/open-iscsi_2.0-871.bb new
>> file mode 100644 index 0000000..99f8657 --- /dev/null +++
>> b/meta-networking/recipes-daemons/open-iscsi/open-iscsi_2.0-871.bb @@
>> -0,0 +1,34 @@ +DESCRIPTION = "Open-iSCSI project is a high performance,
>> transport \ +independent, multi-platform implementation of RFC3720." 
>> +HOMEPAGE = "http://www.open-iscsi.org/" +LICENSE = "GPL-2.0" 
>> +LIC_FILES_CHKSUM =
>> "file://COPYING;md5=393a5ca445f6965873eca0259a17f833" + +SRC_URI =
>> "http://www.open-iscsi.org/bits/${BP}.tar.gz" +SRC_URI[md5sum] =
>> "0c403e8c9ad41607571ba0e6e8ff196e" +SRC_URI[sha256sum] =
>> "bcea8746ae82f2ada7bc05d2aa59bcda1ca0d5197f05f2e16744aae59f0a7dcb" 
>> +SRC_URI += "file://iscsi_sysfs.c-add-include-files.patch \ +
>> file://open-iscsi.service" + +TARGET_CC_ARCH += "${LDFLAGS}" + 
>> +do_compile () { +    oe_runmake user +} + +do_install_append () { +
>> if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)};
>> then +        install -d ${D}${systemd_unitdir}/system +        install
>> -m 0644 ${WORKDIR}/open-iscsi.service ${D}${systemd_unitdir}/system/ +
>> fi +} + +do_install () { +    oe_runmake DESTDIR="${D}" install_user 
>> +} + +inherit
>> ${@base_contains('VIRTUAL-RUNTIME_init_manager','systemd','systemd','',d)}
>>
>> 
+
>> +SYSTEMD_PACKAGES = "${PN}" +SYSTEMD_SERVICE_${PN} =
>> "open-iscsi.service" +SYSTEMD_AUTO_ENABLE = "enable" -- 1.8.4.2
>> 
>> 
>> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFUfeaWMkyGM64RGpERAjs1AJ9GBotz/SKNVovuZeTajFipaC/gbwCeLOTG
0IdRSUGTf1eYpvVHW9lmvPI=
=T/wZ
-----END PGP SIGNATURE-----


