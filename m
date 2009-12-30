Received: from mail-px0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NPtfF-0001pd-J0
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Dec 2009 09:12:20 +0100
Received: by pxi12 with SMTP id 12so7024283pxi.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2009 00:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=A6tUurGAT65OrYGC8hRZkpjAucvsWYmtJ36Y69p6ZGo=;
	b=Vzl6v2pReZbtBTvS7l41tX7ndyi0kym+jDeFMI7ZZZqaHf0D7oxS1HSiZDlz1h7nkQ
	m57bhhAZLaVjJm++LXy97XylVIjcbo7Dmol7+VKAglpvSsgLgb+Um58GcgbxfeGLQV6W
	ZrSJDMGKymHMHvsgKQJ/RAfaIDDL8lzB0hQNU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=nA80COCs65FunK6v5bpABy7iO6F7dIHL80fdncDLqL1FQCh+L5pP14iP8KdDjbdSU+
	FkUnmWsfRHASl3i/mA/aIa9ldkbDbVpxH3iL4KE3et53iywW9ZP+OQG+NJY+u1Q2lLqR
	KoUgsWcO8m5ek7zPx8q0dgZxzGkzsFhTfz/g4=
Received: by 10.141.89.3 with SMTP id r3mr12656667rvl.283.1262160617855;
	Wed, 30 Dec 2009 00:10:17 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.101.56])
	by mx.google.com with ESMTPS id 20sm13311239pzk.9.2009.12.30.00.10.14
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 30 Dec 2009 00:10:16 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <op.u5mptvjzmn1qzu@guohr-laptop-ubuntu>
	<1262030369.28755.266.camel@lenovo.internal.reciva.com>
Date: Wed, 30 Dec 2009 16:10:08 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u5qrm6q6mn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <1262030369.28755.266.camel@lenovo.internal.reciva.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Install base-file failed due to lack of usbd
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Dec 2009 08:12:21 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

Hi,
    After applying the following patch, the failure did disappear.

By the way, I think the package's recipes (with the exception of the  =

recipes in tasks/meta/images directories) should be distro-independent. =
We  =

should not add the DISTRO into OVERRIDE.

Thanks a lot!

diff --git a/recipes/base-files/base-files_3.0.14.bb  =

b/recipes/base-files/base-files_3.0.14.bb
index 483aef7..61bb71e 100644
--- a/recipes/base-files/base-files_3.0.14.bb
+++ b/recipes/base-files/base-files_3.0.14.bb
@@ -46,12 +46,7 @@ dirs755 =3D "/bin /boot /dev ${sysconfdir}  =

${sysconfdir}/default \
            /media/union /media/realroot /media/hdd \
            /media/mmc1"

-dirs755_micro =3D "/dev /proc /sys ${sysconfdir}"
-dirs2775_micro =3D ""
-dirs1777_micro =3D "/tmp"
-
  media =3D "card cf net ram"
-media_micro =3D ""

  volatiles =3D "cache run log lock tmp"
  conffiles =3D "${sysconfdir}/debian_version ${sysconfdir}/host.conf \
@@ -93,40 +88,38 @@ do_install () {
                 echo ${hostname} > ${D}${sysconfdir}/hostname
         fi

-        if [ "${DISTRO}" !=3D "micro" -a "${DISTRO}" !=3D "micro-uclibc=
" ];  =

then
-                install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}
-
-                if [ -n "${DISTRO_NAME}" ]; then
-                       echo -n "${DISTRO_NAME} " >>  =

${D}${sysconfdir}/issue
-                       echo -n "${DISTRO_NAME} " >>  =

${D}${sysconfdir}/issue.net
-                       if [ -n "${DISTRO_VERSION}" ]; then
-                               echo -n "${DISTRO_VERSION} " >>  =

${D}${sysconfdir}/issue
-                               echo -n "${DISTRO_VERSION} " >>  =

${D}${sysconfdir}/issue.net
-                       fi
-                       echo "\n \l" >> ${D}${sysconfdir}/issue
-                       echo >> ${D}${sysconfdir}/issue
-                       echo "%h"    >> ${D}${sysconfdir}/issue.net
-                       echo >> ${D}${sysconfdir}/issue.net
-               else
-                       install -m 0644 ${WORKDIR}/issue  =

${D}${sysconfdir}/issue
-                        install -m 0644 ${WORKDIR}/issue.net  =

${D}${sysconfdir}/issue.net
-                fi
+       install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}
+
+       if [ -n "${DISTRO_NAME}" ]; then
+               echo -n "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue
+               echo -n "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue.net=

+               if [ -n "${DISTRO_VERSION}" ]; then
+                       echo -n "${DISTRO_VERSION} " >>  =

${D}${sysconfdir}/issue
+                       echo -n "${DISTRO_VERSION} " >>  =

${D}${sysconfdir}/issue.net
+               fi
+               echo "\n \l" >> ${D}${sysconfdir}/issue
+               echo >> ${D}${sysconfdir}/issue
+               echo "%h"    >> ${D}${sysconfdir}/issue.net
+               echo >> ${D}${sysconfdir}/issue.net
+       else
+               install -m 0644 ${WORKDIR}/issue ${D}${sysconfdir}/issue=

+               install -m 0644 ${WORKDIR}/issue.net  =

${D}${sysconfdir}/issue.net
+       fi
+
+       install -m 0644 ${WORKDIR}/fstab ${D}${sysconfdir}/fstab
+       install -m 0644 ${WORKDIR}/filesystems  =

${D}${sysconfdir}/filesystems
+       install -m 0644 ${WORKDIR}/usbd ${D}${sysconfdir}/default/usbd
+       install -m 0644 ${WORKDIR}/profile ${D}${sysconfdir}/profile
+       install -m 0755 ${WORKDIR}/share/dot.profile  =

${D}${sysconfdir}/skel/.profile
+       install -m 0755 ${WORKDIR}/share/dot.bashrc  =

${D}${sysconfdir}/skel/.bashrc
+       install -m 0644 ${WORKDIR}/inputrc ${D}${sysconfdir}/inputrc
+       install -m 0644 ${WORKDIR}/motd ${D}${sysconfdir}/motd
+       for license in BSD GPL-2 LGPL-2 LGPL-2.1 Artistic GPL-3 LGPL-3  =

GFDL-1.2; do
+               install -m 0644 ${WORKDIR}/licenses/$license  =

${D}${datadir}/common-licenses/
+       done

-                install -m 0644 ${WORKDIR}/fstab ${D}${sysconfdir}/fsta=
b
-               install -m 0644 ${WORKDIR}/filesystems  =

${D}${sysconfdir}/filesystems
-               install -m 0644 ${WORKDIR}/usbd  =

${D}${sysconfdir}/default/usbd
-               install -m 0644 ${WORKDIR}/profile  =

${D}${sysconfdir}/profile
-               install -m 0755 ${WORKDIR}/share/dot.profile  =

${D}${sysconfdir}/skel/.profile
-               install -m 0755 ${WORKDIR}/share/dot.bashrc  =

${D}${sysconfdir}/skel/.bashrc
-               install -m 0644 ${WORKDIR}/inputrc  =

${D}${sysconfdir}/inputrc
-               install -m 0644 ${WORKDIR}/motd ${D}${sysconfdir}/motd
-               for license in BSD GPL-2 LGPL-2 LGPL-2.1 Artistic GPL-3 =
 =

LGPL-3 GFDL-1.2; do
-                       install -m 0644 ${WORKDIR}/licenses/$license  =

${D}${datadir}/common-licenses/
-               done
-
-               ln -sf /proc/mounts ${D}${sysconfdir}/mtab
-               install -m 0644 ${WORKDIR}/host.conf  =

${D}${sysconfdir}/host.conf
-        fi
+       ln -sf /proc/mounts ${D}${sysconfdir}/mtab
+       install -m 0644 ${WORKDIR}/host.conf ${D}${sysconfdir}/host.conf=


         install -m 0644 ${WORKDIR}/nsswitch.conf  =

${D}${sysconfdir}/nsswitch.conf
  }
@@ -168,7 +161,6 @@ PACKAGE_ARCH_rt3000 =3D "rt3000"
  PACKAGE_ARCH =3D "${MACHINE_ARCH}"

  CONFFILES_${PN} =3D "${sysconfdir}/fstab ${sysconfdir}/hostname"
-CONFFILES_${PN}_micro =3D ""
  CONFFILES_${PN}_nylon =3D "${sysconfdir}/resolv.conf ${sysconfdir}/fst=
ab  =

${sysconfdir}/hostname"
  CONFFILES_${PN}_slugos =3D "${sysconfdir}/resolv.conf ${sysconfdir}/fs=
tab  =

${sysconfdir}/hostname"



=E5=9C=A8 Tue, 29 Dec 2009 03:59:29 +0800=EF=BC=8CPhil Blundell <philb@g=
nu.org> =E5=86=99=E9=81=93:

> On Mon, 2009-12-28 at 11:40 +0800, Guo Hongruan wrote:
>> Hi guys,
>>     the installation of base-file failed due to lack of usbd. I found=
  =

>> this
>> bug when
>> 1. MACHINE=3Dqemumips and DISTRO=3Dmicro (using eglibc)
>> 2. MACHINE=3Dqemuarm and DISTRO=3Dmicro (using eglibc)
>>
>> install: cannot create regular file
>> `/media/work-disk/workdir/oe-qemumips-micro-eglibc/work/qemumips-oe-l=
inux/base-files-3.0.14-r89/image/etc/default/usbd':
>> No such file or directory
>
> This is a bit weird, because the only install command that mentions us=
bd
> is wrapped in an 'if [ ${DISTRO} !=3D micro ] ...' conditional.  It al=
so
> worked fine for me last time I tried, and I test with qemuarm and micr=
o
> fairly often.  Do you have any local changes to your tree?
>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=



-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


