Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NPueD-0006vI-FL
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Dec 2009 10:15:20 +0100
Received: from [85.210.12.93] (helo=[192.168.2.155])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NPucJ-0007Zt-9K
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Dec 2009 09:13:19 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1262160936-28480-1-git-send-email-camelguo@gmail.com>
References: <>  <1262160936-28480-1-git-send-email-camelguo@gmail.com>
Date: Wed, 30 Dec 2009 09:13:16 +0000
Message-ID: <1262164396.2553.2.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.12.93
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
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
X-List-Received-Date: Wed, 30 Dec 2009 09:15:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This patch is wrong.  If you make this change then base-files will gain
a whole load of files which are not wanted for micro.

p.

On Wed, 2009-12-30 at 16:15 +0800, Guo Hongruan wrote:
> 1. Remove the *_micro variable overridding;
> 2. Remove the micro/micro-uclibc specific installation decision, which causes the installation of base-file failed when DISTRO=micro/micro-uclibc.
> ---
>  recipes/base-files/base-files_3.0.14.bb |   70 ++++++++++++++-----------------
>  1 files changed, 31 insertions(+), 39 deletions(-)
> 
> diff --git a/recipes/base-files/base-files_3.0.14.bb b/recipes/base-files/base-files_3.0.14.bb
> index 483aef7..61bb71e 100644
> --- a/recipes/base-files/base-files_3.0.14.bb
> +++ b/recipes/base-files/base-files_3.0.14.bb
> @@ -46,12 +46,7 @@ dirs755 = "/bin /boot /dev ${sysconfdir} ${sysconfdir}/default \
>  	   /media/union /media/realroot /media/hdd \
>  	   /media/mmc1"
>  
> -dirs755_micro = "/dev /proc /sys ${sysconfdir}"
> -dirs2775_micro = ""
> -dirs1777_micro = "/tmp"
> -
>  media = "card cf net ram"
> -media_micro = ""
>  
>  volatiles = "cache run log lock tmp"
>  conffiles = "${sysconfdir}/debian_version ${sysconfdir}/host.conf \
> @@ -93,40 +88,38 @@ do_install () {
>  		echo ${hostname} > ${D}${sysconfdir}/hostname
>  	fi
>  
> -        if [ "${DISTRO}" != "micro" -a "${DISTRO}" != "micro-uclibc" ]; then
> -                install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}  
> -
> -                if [ -n "${DISTRO_NAME}" ]; then
> -        		echo -n "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue
> -        		echo -n "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue.net
> -        		if [ -n "${DISTRO_VERSION}" ]; then
> -        			echo -n "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue
> -        			echo -n "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue.net
> -        		fi
> -        		echo "\n \l" >> ${D}${sysconfdir}/issue
> -        		echo >> ${D}${sysconfdir}/issue
> -        		echo "%h"    >> ${D}${sysconfdir}/issue.net
> -        		echo >> ${D}${sysconfdir}/issue.net
> -        	else
> - 	                install -m 0644 ${WORKDIR}/issue ${D}${sysconfdir}/issue
> -                        install -m 0644 ${WORKDIR}/issue.net ${D}${sysconfdir}/issue.net
> -                fi
> +	install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}  
> +
> +	if [ -n "${DISTRO_NAME}" ]; then
> +		echo -n "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue
> +		echo -n "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue.net
> +		if [ -n "${DISTRO_VERSION}" ]; then
> +			echo -n "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue
> +			echo -n "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue.net
> +		fi
> +		echo "\n \l" >> ${D}${sysconfdir}/issue
> +		echo >> ${D}${sysconfdir}/issue
> +		echo "%h"    >> ${D}${sysconfdir}/issue.net
> +		echo >> ${D}${sysconfdir}/issue.net
> +	else
> +		install -m 0644 ${WORKDIR}/issue ${D}${sysconfdir}/issue
> +		install -m 0644 ${WORKDIR}/issue.net ${D}${sysconfdir}/issue.net
> +	fi
> +
> +	install -m 0644 ${WORKDIR}/fstab ${D}${sysconfdir}/fstab
> +	install -m 0644 ${WORKDIR}/filesystems ${D}${sysconfdir}/filesystems
> +	install -m 0644 ${WORKDIR}/usbd ${D}${sysconfdir}/default/usbd
> +	install -m 0644 ${WORKDIR}/profile ${D}${sysconfdir}/profile
> +	install -m 0755 ${WORKDIR}/share/dot.profile ${D}${sysconfdir}/skel/.profile
> +	install -m 0755 ${WORKDIR}/share/dot.bashrc ${D}${sysconfdir}/skel/.bashrc
> +	install -m 0644 ${WORKDIR}/inputrc ${D}${sysconfdir}/inputrc
> +	install -m 0644 ${WORKDIR}/motd ${D}${sysconfdir}/motd
> +	for license in BSD GPL-2 LGPL-2 LGPL-2.1 Artistic GPL-3 LGPL-3 GFDL-1.2; do
> +		install -m 0644 ${WORKDIR}/licenses/$license ${D}${datadir}/common-licenses/
> +	done
>  
> -                install -m 0644 ${WORKDIR}/fstab ${D}${sysconfdir}/fstab
> -        	install -m 0644 ${WORKDIR}/filesystems ${D}${sysconfdir}/filesystems
> -        	install -m 0644 ${WORKDIR}/usbd ${D}${sysconfdir}/default/usbd
> -        	install -m 0644 ${WORKDIR}/profile ${D}${sysconfdir}/profile
> -        	install -m 0755 ${WORKDIR}/share/dot.profile ${D}${sysconfdir}/skel/.profile
> -        	install -m 0755 ${WORKDIR}/share/dot.bashrc ${D}${sysconfdir}/skel/.bashrc
> -        	install -m 0644 ${WORKDIR}/inputrc ${D}${sysconfdir}/inputrc
> -        	install -m 0644 ${WORKDIR}/motd ${D}${sysconfdir}/motd
> -        	for license in BSD GPL-2 LGPL-2 LGPL-2.1 Artistic GPL-3 LGPL-3 GFDL-1.2; do
> -	        	install -m 0644 ${WORKDIR}/licenses/$license ${D}${datadir}/common-licenses/
> -        	done
> -
> -	        ln -sf /proc/mounts ${D}${sysconfdir}/mtab
> -        	install -m 0644 ${WORKDIR}/host.conf ${D}${sysconfdir}/host.conf
> -        fi
> +	ln -sf /proc/mounts ${D}${sysconfdir}/mtab
> +	install -m 0644 ${WORKDIR}/host.conf ${D}${sysconfdir}/host.conf
>  
>  	install -m 0644 ${WORKDIR}/nsswitch.conf ${D}${sysconfdir}/nsswitch.conf
>  }
> @@ -168,7 +161,6 @@ PACKAGE_ARCH_rt3000 = "rt3000"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  CONFFILES_${PN} = "${sysconfdir}/fstab ${sysconfdir}/hostname"
> -CONFFILES_${PN}_micro = ""
>  CONFFILES_${PN}_nylon = "${sysconfdir}/resolv.conf ${sysconfdir}/fstab ${sysconfdir}/hostname"
>  CONFFILES_${PN}_slugos = "${sysconfdir}/resolv.conf ${sysconfdir}/fstab ${sysconfdir}/hostname"
>  




