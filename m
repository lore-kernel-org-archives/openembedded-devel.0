Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id E8232788C2;
	Mon, 20 Nov 2017 09:07:08 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id b189so16917597wmd.5;
	Mon, 20 Nov 2017 01:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=xzuN1PAxZ/8b+XBuoqZgRQYynORUSQjb9r5aY0YzVoY=;
	b=TBLuPR2NkESnEkO2wsCvY1A8Nu1j+0U9CbdjoGCIV708GLOHgq3YtFyu7Ca94ZT96z
	t6UOjCPg822UgdR0pYnGVe7kgIqjeCbpLHk5BSDFF69tz9bBdsmxuY3WTvJKLWIGKAf7
	MtQo9wfy0pbMcUexSMg+qY7kvUx+QBBOVXa4W2bThOL5aPnfwHlGJtgMnk8AuzQPLVSO
	OtYLiGY0XQ4AmtN3gAnzX4d5zEaqYJ+0z3r3nphtS/dUwGeTPUhhOJpBv5MKFi9aKQKW
	FTmp1aBonaKT/gRS5t0qrzEqisuQDEhgeIwH2zNwsJPl49VCsypW9kXXfP63JV2l4yNG
	P3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=xzuN1PAxZ/8b+XBuoqZgRQYynORUSQjb9r5aY0YzVoY=;
	b=B5dAZ+jwx8Vl8XqKcPthTZhdpEXyEppIN2RIb4+BEABz73dTL7Scowgalj0tFu0q+j
	5XA+vGS00el6TPEGmsQxWiBaIFqlr1z5H4ObNK2XbA0s6BxxO8vUMK7VPJF3X3pJZcDp
	Xqs8okeEjeWSegn7D84Fns5vyXebqdyxAKzxaiNiYcOYYbtxeVZsoByU6Tbz3MwykjzJ
	2elgrYOUJ+LD3izKbz6G5KaY97MrL3QmdQ9WcfdBGXVoz83CV3D/+AcoF9JXgS3hJnZb
	wNqaaUYEFHqUorThmRLSxgjyRbHR+wK8mDTjDCdUxh2iL3UVbCO9o5GAYb4cG4k/ab/g
	nCxQ==
X-Gm-Message-State: AJaThX5BaIf1FIQp5e6n/5JCsqPC5yh6bdxJ0CCKPyWdWpWXS1+yRYrP
	w0omvZTKW3Qetgo/bTH2DZ5QB/wlFcL5GVCWW24=
X-Google-Smtp-Source: AGs4zMY6eBrhc3XSDF3Kpc+Sv1jN/F93JxVu20OcgagnBHdcNpVaJ5gkELrTEkEacn4L+ltQ11/rT52RM/ZwsEh8L5c=
X-Received: by 10.28.18.145 with SMTP id 139mr1414905wms.43.1511168829711;
	Mon, 20 Nov 2017 01:07:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.112.12 with HTTP; Mon, 20 Nov 2017 01:07:09 -0800 (PST)
In-Reply-To: <31babd29-5bc3-2a7c-215b-6c811de9bb33@windriver.com>
References: <151112655849.28895.8951102454646542771@git.openembedded.org>
	<20171119212238.E418E2349AE@git.openembedded.org>
	<31babd29-5bc3-2a7c-215b-6c811de9bb33@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 20 Nov 2017 10:07:09 +0100
Message-ID: <CA+chaQe8mZWW=XfEhH1g=hnwnu4EP+=cFmOCn_nJdKwf1O1kxQ@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Joe MacDonald <joe_macdonald@mentor.com>,
	Sean Hudson <darknighte@gmail.com>, akuster808 <akuster808@gmail.com>, 
	"openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [oe-commits] [meta-openembedded] 05/67: postfix: fix send mail failure and eliminate warning
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
X-List-Received-Date: Mon, 20 Nov 2017 09:07:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yi,

Joe is maintainer of meta-networking. meta-oe is now maintained by Armin
and Sean.

Including all 3 and the ML where it belongs.

Regards,

On Mon, Nov 20, 2017 at 1:03 AM, Yi Zhao <yi.zhao@windriver.com> wrote:

> Hi Marting,
>
>
> Could you drop this patch since it could cause a build error on the host
> which didn't install postfix. You can apply my postfix update to 3.24 pat=
ch
> directly.
>
>
> Thanks,
>
> Yi
>
>
>
> =E5=9C=A8 2017=E5=B9=B411=E6=9C=8820=E6=97=A5 05:22, git@git.openembedded=
.org =E5=86=99=E9=81=93:
>
>> This is an automated email from the git hooks/post-receive script.
>>
>> armin_kuster pushed a commit to branch master-next
>> in repository meta-openembedded.
>>
>> commit baeae27a9c81a64ab7eadc57541bf087a115a43a
>> Author: Yi Zhao <yi.zhao@windriver.com>
>> AuthorDate: Thu Oct 26 14:43:31 2017 -0700
>>
>>      postfix: fix send mail failure and eliminate warning
>>           * Update main.cf for postfix 3.x to eliminate startup warning
>>      * Set daemon_directory from ${libexecdir} to ${libexecdir}/postfix
>>      * Using absolute path for newaliases and postmap to generate the
>> correct
>>        db file in pkg_postinst
>>      * Remove duplicate SRC_URI lines in postfix_3.2.2.bb
>>           (LOCAL REV: NOT UPSTREAM) -- will sent to oe-devel later
>>           Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>           * Move use of newaliases and postmap on host to install phase
>>        because absolute path might not exist at rootfs build time.
>>           Signed-off-by: Joe Slater <jslater@windriver.com>
>>      Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>   .../postfix/files/{main.cf_2.0 =3D> main.cf}         |  3 +++
>>   .../recipes-daemons/postfix/postfix.inc            | 28
>> ++++++++++++----------
>>   .../recipes-daemons/postfix/postfix_3.2.2.bb       | 17 ++++---------
>>   3 files changed, 22 insertions(+), 26 deletions(-)
>>
>> diff --git a/meta-networking/recipes-daemons/postfix/files/main.cf_2.0
>> b/meta-networking/recipes-daemons/postfix/files/main.cf
>> similarity index 98%
>> rename from meta-networking/recipes-daemons/postfix/files/main.cf_2.0
>> rename to meta-networking/recipes-daemons/postfix/files/main.cf
>> index dc7feb5..2371ace 100644
>> --- a/meta-networking/recipes-daemons/postfix/files/main.cf_2.0
>> +++ b/meta-networking/recipes-daemons/postfix/files/main.cf
>> @@ -1,3 +1,6 @@
>> +compatibility_level =3D 2
>> +smtputf8_enable =3D no
>> +
>>   # Configure your domain and accounts
>>   #mydomain=3Dsample.com
>>   #FQDN from gethostname
>> diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc
>> b/meta-networking/recipes-daemons/postfix/postfix.inc
>> index a588bd3..8dad45f 100644
>> --- a/meta-networking/recipes-daemons/postfix/postfix.inc
>> +++ b/meta-networking/recipes-daemons/postfix/postfix.inc
>> @@ -18,7 +18,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D64375f3743
>> 1336ea1b1b3005fe3fa354"
>>   SRC_URI =3D "ftp://ftp.porcupine.org/mirrors/postfix-release/official/
>> postfix-${PV}.tar.gz \
>>       file://makedefs.patch \
>>       file://install.patch \
>> -    file://main.cf_2.0 \
>> +    file://main.cf \
>>       file://postfix \
>>       file://internal_recipient \
>>       file://postfix.service \
>> @@ -135,7 +135,7 @@ SYSTEMD_SERVICE_${PN} =3D "postfix.service"
>>   do_install () {
>>       sh ./postfix-install 'install_root=3D${D}' \
>>           'config_directory=3D${sysconfdir}/postfix' \
>> -        'daemon_directory=3D${libexecdir}' \
>> +        'daemon_directory=3D${libexecdir}/postfix' \
>>           'command_directory=3D${sbindir}' \
>>           'queue_directory=3D${localstatedir}/spool/postfix' \
>>           'sendmail_path=3D${sbindir}/sendmail.postfix' \
>> @@ -149,8 +149,8 @@ do_install () {
>>       mv ${D}${sysconfdir}/postfix/main.cf ${D}${sysconfdir}/postfix/sam=
p
>> le-main.cf
>>       install -m 755 ${S}/bin/smtp-sink ${D}/${sbindir}/
>>       install -d ${D}${sysconfdir}/init.d
>> -    install -m 644 ${WORKDIR}/main.cf_2.0 ${D}${sysconfdir}/postfix/mai=
n
>> .cf
>> -    sed -i 's#@LIBEXECDIR@#${libexecdir}#' ${D}${sysconfdir}/postfix/
>> main.cf
>> +    install -m 644 ${WORKDIR}/main.cf ${D}${sysconfdir}/postfix/main.cf
>> +    sed -i 's#@LIBEXECDIR@#${libexecdir}/postfix#'
>> ${D}${sysconfdir}/postfix/main.cf
>>         install -m 755 ${WORKDIR}/check_hostname.sh ${D}${sbindir}/
>>   @@ -159,11 +159,11 @@ do_install () {
>>         install -d ${D}${systemd_unitdir}/system
>>       install -m 0644 ${WORKDIR}/postfix.service
>> ${D}${systemd_unitdir}/system
>> -    sed -i -e 's#@LIBEXECDIR@#${libexecdir}#g'
>> ${D}${systemd_unitdir}/system/postfix.service
>> +    sed -i -e 's#@LIBEXECDIR@#${libexecdir}/postfix#g'
>> ${D}${systemd_unitdir}/system/postfix.service
>>       sed -i -e 's#@LOCALSTATEDIR@#${localstatedir}#g'
>> ${D}${systemd_unitdir}/system/postfix.service
>>       sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system=
/
>> postfix.service
>>   -    install -m 0755 ${WORKDIR}/aliasesdb ${D}${libexecdir}
>> +    install -m 0755 ${WORKDIR}/aliasesdb ${D}${libexecdir}/postfix
>>         install -m 770 -d ${D}${localstatedir}/spool/postfix
>>       chown postfix:postfix ${D}${localstatedir}/spool/postfix
>> @@ -217,6 +217,12 @@ do_install_append_class-native() {
>>   do_install_append_class-target() {
>>       # Remove references to buildmachine paths in target makedefs.out
>>       sed -i 's:-fdebug-prefix-map[^ ]*::g; s:--sysroot=3D${STAGING_DIR_=
TARGET}::g'
>> ${D}/etc/postfix/makedefs.out
>> +    # Since we are building recipe postfix, newaliases and postmap come
>> from our sysroot_native.
>> +    touch ${D}/etc/aliases
>> +    newaliases -C ${D}/etc/postfix/main.cf -oA${D}/etc/aliases
>> +    touch ${D}/etc/postfix/virtual_alias
>> +    postmap -c ${D}/etc/postfix ${D}/etc/postfix/virtual_alias
>> +
>>   }
>>     NATIVE_INSTALL_WORKS =3D "1"
>> @@ -240,13 +246,8 @@ pkg_postinst_${PN} () {
>>           touch /etc/postfix/virtual_alias
>>           postmap /etc/postfix/virtual_alias
>>       else
>> -        touch $D/etc/aliases
>> -        newaliases -C $D/etc/postfix/main.cf -oA$D/etc/aliases
>> -        touch $D/etc/postfix/virtual_alias
>> -        postmap -c $D/etc/postfix $D/etc/postfix/virtual_alias
>> -
>>           if ${@'true' if 'linuxstdbase' in d.getVar('DISTROOVERRIDES',
>> False) else 'false'}; then
>> -            # /usr/lib/sendmial is required by LSB core test
>> +            # /usr/lib/sendmail is required by LSB core test
>>               [ ! -L $D/usr/lib/sendmail ] && ln -sf ${sbindir}/sendmail
>> $D/usr/lib/
>>           fi
>>       fi
>> @@ -255,4 +256,5 @@ pkg_postinst_${PN} () {
>>   # Exclude .debug directories from the main package
>>   FILES_${PN} =3D "${sysconfdir} ${localstatedir} ${bindir}/* ${sbindir}=
/* \
>>                  ${libexecdir}/* ${systemd_unitdir}/*"
>> -FILES_${PN}-dbg +=3D "${libexecdir}/.debug"
>> +CONFFILES_${PN} =3D "/etc/aliases /etc/postfix/virtual_alias*"
>> +FILES_${PN}-dbg +=3D "${libexecdir}/postfix/.debug"
>> diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb
>> b/meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb
>> index 439ede9..89af406 100644
>> --- a/meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb
>> +++ b/meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb
>> @@ -1,18 +1,9 @@
>>   require postfix.inc
>>   -SRC_URI =3D "ftp://ftp.porcupine.org/mirrors/postfix-release/official=
/
>> postfix-${PV}.tar.gz \
>> -           file://makedefs.patch \
>> -           file://install.patch \
>> -           file://main.cf_2.0 \
>> -           file://postfix \
>> -           file://internal_recipient \
>> -           file://postfix.service \
>> -           file://aliasesdb \
>> -           file://check_hostname.sh \
>> -           file://0001-Check-for-glibc-before-setting-CANT_USE_SEND_REC=
V_MS.patch
>> \
>> -           file://0001-makedefs-Use-native-compiler-to-build-makedefs.t=
est.patch
>> \
>> -           file://postfix-install.patch \
>> -           file://icu-config.patch \
>> +SRC_URI +=3D "file://0001-Check-for-glibc-before-setting-CANT_USE_SEND_=
RECV_MS.patch
>> \
>> +            file://0001-makedefs-Use-native-compiler-to-build-makedefs.=
test.patch
>> \
>> +            file://postfix-install.patch \
>> +            file://icu-config.patch \
>>              "
>>   SRC_URI[md5sum] =3D "aea073a9b0bea5bdb590460a270a4aa0"
>>   SRC_URI[sha256sum] =3D "d06849418d119d09366997b2b481b
>> b23f737629769b4e4a52da42fb3ad8b0576"
>>
>>
>

