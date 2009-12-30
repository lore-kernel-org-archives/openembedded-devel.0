Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NPv44-00049L-4A
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Dec 2009 10:42:03 +0100
Received: by pzk30 with SMTP id 30so8241337pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2009 01:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=GRaGVwSCglReEA5A/exYQlY2gWwp5Pr4ctjnSHGndb4=;
	b=cNNayOX+0SDZ+cUPAS9AOVno+s3AlYZl2flbcWHgQ0Jx+jJCMU32lb/u/ux2iH6ZOO
	eCwi7nB9Wm8hYABsYwcpHLFypCvcMXdjLUBwLy1mpQEjD6jINYuneeHJZJ7X/VwQpjEO
	nRJD8agUqKMZHv7hpKJVKNEQVqQd8sscJa/sQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=bewrLwu9lOGKusrC3QPIz94ZTp8KwARjjSoGuGsH1HXB4H835TergUQMh8qOfZZsj5
	31VGUwm0d18fC/z53696p3ZeefkY2f1H43HT/sY7MSnjqQEbiWMxKr0TZIwnVFsPzGq0
	6KQkJZ76IJjlbV5frRSbWPnxrxPMXFxWDKexQ=
Received: by 10.114.214.36 with SMTP id m36mr12296340wag.10.1262166000813;
	Wed, 30 Dec 2009 01:40:00 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.101.56])
	by mx.google.com with ESMTPS id 23sm13401464pzk.4.2009.12.30.01.39.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 30 Dec 2009 01:40:00 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <> <1262160936-28480-1-git-send-email-camelguo@gmail.com>
	<1262164396.2553.2.camel@lenovo.internal.reciva.com>
Date: Wed, 30 Dec 2009 17:39:52 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u5qvsqdlmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <1262164396.2553.2.camel@lenovo.internal.reciva.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.222.192
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Remove the micro distro specific overridding of variables
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
X-List-Received-Date: Wed, 30 Dec 2009 09:42:03 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

I searched the whole openembedded directory and found the following  =

references of micro as DISTRO overriding.
recipes/base-passwd/base-passwd_3.5.20.bb:do_install_micro () {
recipes/sysvinit/sysvinit_2.86.bb:RRECOMMENDS_${PN}_micro =3D ""

Through the above references, I can say that the initial motion of using=
  =

micro as overriding is trying to keep the image as small as possible. To=
  =

achieve the goal, the initial author added the check/overriding of  =

micro/micro-uclibc. But how many space will be saved by just no installi=
ng  =

the several plain text files? I think the basic unit of installation  =

should be package not file. To keep the image small, we should control t=
he  =

packages installed.

If someone realy does not want to install some files in  =

base-file/base-passwd/sysvinit to keep the image smaller, they can  =

rewrites the corresponding recipes and put them into their private bb fi=
le  =

collection.

=E5=9C=A8 Wed, 30 Dec 2009 17:13:16 +0800=EF=BC=8CPhil Blundell <philb@g=
nu.org> =E5=86=99=E9=81=93:

> This patch is wrong.  If you make this change then base-files will gai=
n
> a whole load of files which are not wanted for micro.
>
> p.
>
> On Wed, 2009-12-30 at 16:15 +0800, Guo Hongruan wrote:
>> 1. Remove the *_micro variable overridding;
>> 2. Remove the micro/micro-uclibc specific installation decision, whic=
h  =

>> causes the installation of base-file failed when  =

>> DISTRO=3Dmicro/micro-uclibc.
>> ---
>>  recipes/base-files/base-files_3.0.14.bb |   70  =

>> ++++++++++++++-----------------
>>  1 files changed, 31 insertions(+), 39 deletions(-)
>>
>> diff --git a/recipes/base-files/base-files_3.0.14.bb  =

>> b/recipes/base-files/base-files_3.0.14.bb
>> index 483aef7..61bb71e 100644
>> --- a/recipes/base-files/base-files_3.0.14.bb
>> +++ b/recipes/base-files/base-files_3.0.14.bb
>> @@ -46,12 +46,7 @@ dirs755 =3D "/bin /boot /dev ${sysconfdir}  =

>> ${sysconfdir}/default \
>>  	   /media/union /media/realroot /media/hdd \
>>  	   /media/mmc1"
>>
>> -dirs755_micro =3D "/dev /proc /sys ${sysconfdir}"
>> -dirs2775_micro =3D ""
>> -dirs1777_micro =3D "/tmp"
>> -
>>  media =3D "card cf net ram"
>> -media_micro =3D ""
>>
>>  volatiles =3D "cache run log lock tmp"
>>  conffiles =3D "${sysconfdir}/debian_version ${sysconfdir}/host.conf =
\
>> @@ -93,40 +88,38 @@ do_install () {
>>  		echo ${hostname} > ${D}${sysconfdir}/hostname
>>  	fi
>>
>> -        if [ "${DISTRO}" !=3D "micro" -a "${DISTRO}" !=3D "micro-ucl=
ibc"  =

>> ]; then
>> -                install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}
>> -
>> -                if [ -n "${DISTRO_NAME}" ]; then
>> -        		echo -n "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue
>> -        		echo -n "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue.net
>> -        		if [ -n "${DISTRO_VERSION}" ]; then
>> -        			echo -n "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue
>> -        			echo -n "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue.n=
et
>> -        		fi
>> -        		echo "\n \l" >> ${D}${sysconfdir}/issue
>> -        		echo >> ${D}${sysconfdir}/issue
>> -        		echo "%h"    >> ${D}${sysconfdir}/issue.net
>> -        		echo >> ${D}${sysconfdir}/issue.net
>> -        	else
>> - 	                install -m 0644 ${WORKDIR}/issue  =

>> ${D}${sysconfdir}/issue
>> -                        install -m 0644 ${WORKDIR}/issue.net  =

>> ${D}${sysconfdir}/issue.net
>> -                fi
>> +	install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}
>> +
>> +	if [ -n "${DISTRO_NAME}" ]; then
>> +		echo -n "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue
>> +		echo -n "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue.net
>> +		if [ -n "${DISTRO_VERSION}" ]; then
>> +			echo -n "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue
>> +			echo -n "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue.net
>> +		fi
>> +		echo "\n \l" >> ${D}${sysconfdir}/issue
>> +		echo >> ${D}${sysconfdir}/issue
>> +		echo "%h"    >> ${D}${sysconfdir}/issue.net
>> +		echo >> ${D}${sysconfdir}/issue.net
>> +	else
>> +		install -m 0644 ${WORKDIR}/issue ${D}${sysconfdir}/issue
>> +		install -m 0644 ${WORKDIR}/issue.net ${D}${sysconfdir}/issue.net
>> +	fi
>> +
>> +	install -m 0644 ${WORKDIR}/fstab ${D}${sysconfdir}/fstab
>> +	install -m 0644 ${WORKDIR}/filesystems ${D}${sysconfdir}/filesystem=
s
>> +	install -m 0644 ${WORKDIR}/usbd ${D}${sysconfdir}/default/usbd
>> +	install -m 0644 ${WORKDIR}/profile ${D}${sysconfdir}/profile
>> +	install -m 0755 ${WORKDIR}/share/dot.profile  =

>> ${D}${sysconfdir}/skel/.profile
>> +	install -m 0755 ${WORKDIR}/share/dot.bashrc  =

>> ${D}${sysconfdir}/skel/.bashrc
>> +	install -m 0644 ${WORKDIR}/inputrc ${D}${sysconfdir}/inputrc
>> +	install -m 0644 ${WORKDIR}/motd ${D}${sysconfdir}/motd
>> +	for license in BSD GPL-2 LGPL-2 LGPL-2.1 Artistic GPL-3 LGPL-3  =

>> GFDL-1.2; do
>> +		install -m 0644 ${WORKDIR}/licenses/$license  =

>> ${D}${datadir}/common-licenses/
>> +	done
>>
>> -                install -m 0644 ${WORKDIR}/fstab  =

>> ${D}${sysconfdir}/fstab
>> -        	install -m 0644 ${WORKDIR}/filesystems  =

>> ${D}${sysconfdir}/filesystems
>> -        	install -m 0644 ${WORKDIR}/usbd ${D}${sysconfdir}/default/u=
sbd
>> -        	install -m 0644 ${WORKDIR}/profile ${D}${sysconfdir}/profil=
e
>> -        	install -m 0755 ${WORKDIR}/share/dot.profile  =

>> ${D}${sysconfdir}/skel/.profile
>> -        	install -m 0755 ${WORKDIR}/share/dot.bashrc  =

>> ${D}${sysconfdir}/skel/.bashrc
>> -        	install -m 0644 ${WORKDIR}/inputrc ${D}${sysconfdir}/inputr=
c
>> -        	install -m 0644 ${WORKDIR}/motd ${D}${sysconfdir}/motd
>> -        	for license in BSD GPL-2 LGPL-2 LGPL-2.1 Artistic GPL-3  =

>> LGPL-3 GFDL-1.2; do
>> -	        	install -m 0644 ${WORKDIR}/licenses/$license  =

>> ${D}${datadir}/common-licenses/
>> -        	done
>> -
>> -	        ln -sf /proc/mounts ${D}${sysconfdir}/mtab
>> -        	install -m 0644 ${WORKDIR}/host.conf  =

>> ${D}${sysconfdir}/host.conf
>> -        fi
>> +	ln -sf /proc/mounts ${D}${sysconfdir}/mtab
>> +	install -m 0644 ${WORKDIR}/host.conf ${D}${sysconfdir}/host.conf
>>
>>  	install -m 0644 ${WORKDIR}/nsswitch.conf  =

>> ${D}${sysconfdir}/nsswitch.conf
>>  }
>> @@ -168,7 +161,6 @@ PACKAGE_ARCH_rt3000 =3D "rt3000"
>>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>
>>  CONFFILES_${PN} =3D "${sysconfdir}/fstab ${sysconfdir}/hostname"
>> -CONFFILES_${PN}_micro =3D ""
>>  CONFFILES_${PN}_nylon =3D "${sysconfdir}/resolv.conf ${sysconfdir}/f=
stab  =

>> ${sysconfdir}/hostname"
>>  CONFFILES_${PN}_slugos =3D "${sysconfdir}/resolv.conf  =

>> ${sysconfdir}/fstab ${sysconfdir}/hostname"
>>
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


