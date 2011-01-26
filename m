Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PiB3h-0005j2-2b
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 20:29:37 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PiB2v-0005mw-0Q from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 11:28:49 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 26 Jan 2011 11:28:48 -0800
Received: from [172.30.80.64] ([172.30.80.64]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 26 Jan 2011 12:28:47 -0700
Message-ID: <4D4075EB.7060500@mentor.com>
Date: Wed, 26 Jan 2011 12:28:43 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1296066116-10466-1-git-send-email-rep.dot.nop@gmail.com>
In-Reply-To: <1296066116-10466-1-git-send-email-rep.dot.nop@gmail.com>
X-OriginalArrivalTime: 26 Jan 2011 19:28:47.0623 (UTC)
	FILETIME=[40DA9170:01CBBD8F]
Subject: Re: [PATCH 1/2] busybox: add group to -passwd package
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
X-List-Received-Date: Wed, 26 Jan 2011 19:29:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/26/2011 11:21 AM, Bernhard Reutner-Fischer wrote:
> Signed-off-by: Bernhard Reutner-Fischer<rep.dot.nop@gmail.com>
> ---
>   recipes/busybox/busybox.inc      |    6 +++++-
>   recipes/busybox/busybox_1.1x.inc |    1 +
>   recipes/busybox/files/group      |   12 ++++++++++++
>   recipes/busybox/files/passwd     |    3 ---
>   recipes/busybox/files/shadow     |    3 ---
>   5 files changed, 18 insertions(+), 7 deletions(-)
>   create mode 100644 recipes/busybox/files/group

I assume the passwd/shadow changes are to keep them in sync with the 
group file so:

Acked-by: Tom Rini <tom_rini@mentor.com>

>
> diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
> index 03efc99..9d87d9f 100644
> --- a/recipes/busybox/busybox.inc
> +++ b/recipes/busybox/busybox.inc
> @@ -19,6 +19,7 @@ SRC_URI = "\
>     file://busybox-udhcpd \
>     file://default.script file://simple.script \
>     file://dhcp-hostname.patch \
> +  file://group \
>     file://hwclock.sh \
>     file://hwclock-default \
>     file://ifupdown-spurious-environ.patch \
> @@ -50,7 +51,7 @@ RDEPENDS_${PN} += "${PN}-mountall"
>   RRECOMMENDS_${PN} += "libgcc ${PN}-syslog"
>
>   FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
> -FILES_${PN}-passwd = "${sysconfdir}/passwd.${PN}"
> +FILES_${PN}-passwd = "${sysconfdir}/passwd.${PN} ${sysconfdir}/group.${PN}"
>   FILES_${PN}-shadow = "${sysconfdir}/shadow.${PN}"
>   FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog.${PN} \
>                         ${sysconfdir}/default/busybox-syslog"
> @@ -187,6 +188,7 @@ do_install () {
>
>   	if grep -q "CONFIG_PASSWD=y" ${WORKDIR}/defconfig; then
>   	    install -m 0644 ${WORKDIR}/passwd ${D}${sysconfdir}/passwd.${PN}
> +	    install -m 0644 ${WORKDIR}/group ${D}${sysconfdir}/group.${PN}
>   	    if grep -q "CONFIG_FEATURE_SHADOWPASSWDS=y" ${WORKDIR}/defconfig; then
>   	        install -m 0640 ${WORKDIR}/shadow ${D}${sysconfdir}/shadow.${PN}
>               fi
> @@ -280,9 +282,11 @@ pkg_prerm_${PN}-mountall () {
>
>   pkg_postinst_${PN}-passwd () {
>   	update-alternatives --install ${sysconfdir}/passwd default_passwd passwd.${PN} 50
> +	update-alternatives --install ${sysconfdir}/group default_group group.${PN} 50
>   }
>   pkg_prerm_${PN}-passwd () {
>   	update-alternatives --remove default_passwd passwd.${PN}
> +	update-alternatives --remove default_group group.${PN}
>   }
>
>   pkg_postinst_${PN}-shadow () {
> diff --git a/recipes/busybox/busybox_1.1x.inc b/recipes/busybox/busybox_1.1x.inc
> index 1078aac..9552d4d 100644
> --- a/recipes/busybox/busybox_1.1x.inc
> +++ b/recipes/busybox/busybox_1.1x.inc
> @@ -13,6 +13,7 @@ SRC_URI = "\
>     file://busybox-httpd \
>     file://busybox-udhcpd \
>     file://default.script file://simple.script \
> +  file://group \
>     file://hwclock.sh \
>     file://hwclock-default \
>     file://mount.busybox \
> diff --git a/recipes/busybox/files/group b/recipes/busybox/files/group
> new file mode 100644
> index 0000000..3dd8cdd
> --- /dev/null
> +++ b/recipes/busybox/files/group
> @@ -0,0 +1,12 @@
> +root:x:0:
> +daemon:x:1:
> +bin:x:2:
> +sys:x:3:
> +tty:x:5:
> +disk:x:6:
> +mail:x:8:
> +man:x:12:
> +www-data:x:33:
> +utmp:x:43:
> +nogroup:x:65534:
> +users:x:100:
> diff --git a/recipes/busybox/files/passwd b/recipes/busybox/files/passwd
> index 64c9ab6..34921c3 100644
> --- a/recipes/busybox/files/passwd
> +++ b/recipes/busybox/files/passwd
> @@ -2,10 +2,7 @@ root:x:0:0:root:/root:/bin/sh
>   daemon:x:1:1:daemon:/usr/sbin:/bin/sh
>   bin:x:2:2:bin:/bin:/bin/sh
>   sys:x:3:3:sys:/dev:/bin/sh
> -sync:x:4:65534:sync:/bin:/bin/sync
>   man:x:6:12:man:/var/cache/man:/bin/sh
>   mail:x:8:8:mail:/var/mail:/bin/sh
>   www-data:x:33:33:www-data:/var/www:/bin/sh
> -backup:x:34:34:backup:/var/backups:/bin/sh
> -irc:x:39:39:ircd:/var/run/ircd:/bin/sh
>   nobody:x:65534:65534:nobody:/nonexistent:/bin/sh
> diff --git a/recipes/busybox/files/shadow b/recipes/busybox/files/shadow
> index 25df693..e64a964 100644
> --- a/recipes/busybox/files/shadow
> +++ b/recipes/busybox/files/shadow
> @@ -2,10 +2,7 @@ root::14741:0:99999:7:::
>   daemon:*:14741:0:99999:7:::
>   bin:*:14741:0:99999:7:::
>   sys:*:14741:0:99999:7:::
> -sync:*:14741:0:99999:7:::
>   man:*:14741:0:99999:7:::
>   mail:*:14741:0:99999:7:::
>   www-data:*:14741:0:99999:7:::
> -backup:*:14741:0:99999:7:::
> -irc:*:14741:0:99999:7:::
>   nobody:*:14741:0:99999:7:::


-- 
Tom Rini
Mentor Graphics Corporation


