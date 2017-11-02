Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3615B782A3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Nov 2017 11:22:53 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b9so10634642wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Nov 2017 04:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=psHzYmm0vcyLvXqxsWGtXe7TJ0H4kdZD9BYsI8liz0k=;
	b=iFKv3FFwTBKM1OmpIToZkJP5+29JCWsttXpVCL54meYYkyvxbQ/psA5vT8/dMsRwTs
	12A5JPJ69wnsMT7+xUIF6Dk1n6XrWqKyjuR6ZU1cuNQhp22H97CG5cp7EmfOGBv5PjUZ
	kmX62oOO5vAt3XsicD+2gDhPWkPf+Bf+TewTlMJeNosH/nEJ7sP2wYPPOdkrOgZuWCDO
	jxqp/m0HjSggwb7G89O8x2OUtL9/ecegbKnQBMqeW6IsobN5l+RElT7JtGF9peVmGYaV
	OkOnOPb1gSTp/+RUwff6JUJw1FfnzSA1QIOdnnoSlkWSXn+f3v5OzDQVgyOogddEGvDN
	6+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=psHzYmm0vcyLvXqxsWGtXe7TJ0H4kdZD9BYsI8liz0k=;
	b=tdqrbMINZZ+lKXPYx9f4uTYyCE6QWH2x40837WRhUcSHLTNPdB9OpsANhaQZbRARHn
	v46rZ8Pd94YW2bHtNYrGy/VWLw5EvEbhCXDLgJovL433WJaYL4SynjQxOpWKLeZN1BiH
	tSyqNF7k5nVX08f4atHw0RYyIs1FB7SKpJwHH87JdNVien5SCGMRA7TLndORcyANs3La
	EfnNpYNf2n7YesgS6c0yIjvjvhVQowXxF0pkj9IytHtCZuvzlFOyS45yOFhFnM27DekQ
	AjN/F7QCM7Yo4IyU5PwJkUzSjz1rgPL9d22ykqDWUX9Pm5NRv2fRtwrvIYrtqC5KVqvD
	jkTw==
X-Gm-Message-State: AJaThX7A7nd6MMA0wwrA3QREUTwyxtX+4BlD4cXGTPD3mqdkVei8OqHa
	0IreNTcfUjTN/diMUihET/NJ09Rea2lMeOz2ytBacg==
X-Google-Smtp-Source: ABhQp+TfR68Tj9pGshX3JQ4aNgl4CGUpq8/hcCMihBnaVEVBVwVm7uaXhVcfuytG/q6xkdE2AfPAU5IuBHKSyjm0nLc=
X-Received: by 10.28.228.197 with SMTP id b188mr1135089wmh.59.1509621773286;
	Thu, 02 Nov 2017 04:22:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Thu, 2 Nov 2017 04:22:52 -0700 (PDT)
In-Reply-To: <c48f52a6-7ec8-24ac-fb93-d8237a7aa7e3@windriver.com>
References: <20171102082543.3698-1-kai.kang@windriver.com>
	<c48f52a6-7ec8-24ac-fb93-d8237a7aa7e3@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 2 Nov 2017 12:22:52 +0100
Message-ID: <CA+chaQcrgvC2J3CrCCmpZLRQJ_H2=iYvK3dRvAyAxODp0BxbHQ@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Thu, 02 Nov 2017 11:22:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Does this fix the textrel QA issue reported in every world build in last
couple months?

http://errors.yoctoproject.org/Errors/Details/157987/

On Thu, Nov 2, 2017 at 9:52 AM, Kang Kai <Kai.Kang@windriver.com> wrote:

> Forgot layer info in title. :(
>
> --Kai
>
>
> On 2017=E5=B9=B411=E6=9C=8802=E6=97=A5 16:25, kai.kang@windriver.com wrot=
e:
>
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Upgrade corosync from 2.4.2 to 2.4.3.
>>
>> * remove patch which is merged by upstream
>> * disable autostart of corosync. It only works after configured and
>> config file
>>    /etc/corosync/corosync.conf exists.
>> * use bb.utils.filter
>> * corosync init script requires command pidof. But pidof from busybox
>> doesn't
>>    work well to filter calling process, so update runtime dependency
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   ...001-Include-fcntl.h-for-F_-and-O_-defines.patch | 28
>> ----------------------
>>   .../{corosync_2.4.2.bb =3D> corosync_2.4.3.bb}       | 19 +++++++-----=
---
>>   2 files changed, 9 insertions(+), 38 deletions(-)
>>   delete mode 100644 meta-networking/recipes-extend
>> ed/corosync/corosync/0001-Include-fcntl.h-for-F_-and-O_-defines.patch
>>   rename meta-networking/recipes-extended/corosync/{corosync_2.4.2.bb =
=3D>
>> corosync_2.4.3.bb} (84%)
>>
>> diff --git a/meta-networking/recipes-extended/corosync/corosync/0001-
>> Include-fcntl.h-for-F_-and-O_-defines.patch
>> b/meta-networking/recipes-extended/corosync/corosync/0001-
>> Include-fcntl.h-for-F_-and-O_-defines.patch
>> deleted file mode 100644
>> index fe4b0793f..000000000
>> --- a/meta-networking/recipes-extended/corosync/corosync/0001-
>> Include-fcntl.h-for-F_-and-O_-defines.patch
>> +++ /dev/null
>> @@ -1,28 +0,0 @@
>> -From 85ea47fedbc96ed9180e08b0d371d9966e3a88da Mon Sep 17 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Wed, 30 Aug 2017 17:28:55 -0700
>> -Subject: [PATCH] Include fcntl.h for F_* and O_* defines
>> -
>> -Fixes errors like
>> -utils.c:95:22: error: use of undeclared identifier 'O_WRONLY'
>> -
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> - qdevices/utils.c | 1 +
>> - 1 file changed, 1 insertion(+)
>> -
>> -diff --git a/qdevices/utils.c b/qdevices/utils.c
>> -index 41850b8c..87090853 100644
>> ---- a/qdevices/utils.c
>> -+++ b/qdevices/utils.c
>> -@@ -39,6 +39,7 @@
>> -
>> - #include <err.h>
>> - #include <errno.h>
>> -+#include <fcntl.h>
>> - #include <inttypes.h>
>> - #include <libgen.h>
>> - #include <stdio.h>
>> ---
>> -2.14.1
>> -
>> diff --git a/meta-networking/recipes-extended/corosync/corosync_2.4.2.bb
>> b/meta-networking/recipes-extended/corosync/corosync_2.4.3.bb
>> similarity index 84%
>> rename from meta-networking/recipes-extended/corosync/corosync_2.4.2.bb
>> rename to meta-networking/recipes-extended/corosync/corosync_2.4.3.bb
>> index 33e74e2ff..52d2a1098 100644
>> --- a/meta-networking/recipes-extended/corosync/corosync_2.4.2.bb
>> +++ b/meta-networking/recipes-extended/corosync/corosync_2.4.3.bb
>> @@ -7,11 +7,10 @@ SECTION =3D "base"
>>     inherit autotools pkgconfig systemd useradd
>>   -SRC_URI =3D "http://build.clusterlabs.org/corosync/releases/${BP}.tar=
.gz
>> \
>> -           file://0001-Include-fcntl.h-for-F_-and-O_-defines.patch \
>> -          "
>> -SRC_URI[md5sum] =3D "547fa78704da53aa35912be58d31035f"
>> -SRC_URI[sha256sum] =3D "f26e3011309fe4bcce94b1dc20ea8
>> c462f19483a73f3ca62f13b925d011a4ba9"
>> +SRC_URI =3D "http://build.clusterlabs.org/corosync/releases/${BP}.tar.g=
z"
>> +
>> +SRC_URI[md5sum] =3D "bf0ede13018aadc8a046183bc593b0e0"
>> +SRC_URI[sha256sum] =3D "b1e7e422e8d2f7af8e5315fa329b1
>> dbd1175fff32efaa55e8054584c80a2c597"
>>     LICENSE =3D "BSD"
>>   LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da85eb4ce24
>> 033adb6088dd1d6ffc5e5d"
>> @@ -22,7 +21,7 @@ SYSTEMD_SERVICE_${PN} =3D "corosync.service
>> corosync-notifyd.service \
>>                            ${@bb.utils.contains('PACKAGECONFIG',
>> 'qdevice', 'corosync-qdevice.service', '', d)} \
>>                            ${@bb.utils.contains('PACKAGECONFIG',
>> 'qnetd', 'corosync-qnetd.service', '', d)} \
>>   "
>> -SYSTEMD_AUTO_ENABLE =3D "enable"
>> +SYSTEMD_AUTO_ENABLE =3D "disable"
>>     INITSCRIPT_NAME =3D "corosync-daemon"
>>   @@ -55,22 +54,22 @@ do_install_append() {
>>       install -d ${D}${sysconfdir}/default/volatiles
>>       echo "d root root 0755 ${localstatedir}/log/cluster none" >
>> ${D}${sysconfdir}/default/volatiles/05_corosync
>>   -    if ${@bb.utils.contains('PACKAGECONFIG', 'qnetd', 'true',
>> 'false', d)}; then
>> +    if [ ${@bb.utils.filter('PACKAGECONFIG', 'qnetd', d)} ]; then
>>           chown -R coroqnetd:coroqnetd ${D}${sysconfdir}/${BPN}/qnetd
>>           echo "d coroqnetd coroqnetd 0770 /var/run/corosync-qnetd none"
>> >> ${D}${sysconfdir}/default/volatiles/05_corosync
>>       fi
>>   -    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false=
',d)};
>> then
>> +    if [ ${@bb.utils.filter('DISTRO_FEATURES','systemd',d)} ]; then
>>           install -d ${D}${sysconfdir}/tmpfiles.d
>>           echo "d ${localstatedir}/log/cluster - - - -" >
>> ${D}${sysconfdir}/tmpfiles.d/corosync.conf
>>   -        if ${@bb.utils.contains('PACKAGECONFIG', 'qnetd', 'true',
>> 'false', d)}; then
>> +        if [ ${@bb.utils.filter('PACKAGECONFIG', 'qnetd', d)} ]; then
>>               install -m 0644 ${S}/conf/tmpfiles.d/corosync-qnetd.conf
>> ${D}${sysconfdir}/tmpfiles.d
>>           fi
>>       fi
>>   }
>>   -RDEPENDS_${PN} +=3D "bash"
>> +RDEPENDS_${PN} +=3D "bash ${@bb.utils.contains('DISTRO_FEATURES',
>> 'sysvinit', 'sysvinit-pidof', 'procps', d)}"
>>     FILES_${PN}-dbg +=3D "${libexecdir}/lcrso/.debug"
>>   FILES_${PN}-doc +=3D "${datadir}/snmp/mibs/COROSYNC-MIB.txt"
>>
>
>
> --
> Regards,
> Neil | Kai Kang
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

