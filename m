Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MVhTY-0003jP-SH
	for openembedded-devel@openembedded.org; Tue, 28 Jul 2009 09:51:56 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MVhFG-0006XY-C3
	for openembedded-devel@openembedded.org; Tue, 28 Jul 2009 07:37:10 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 28 Jul 2009 07:37:10 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 28 Jul 2009 07:37:10 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 28 Jul 2009 09:36:59 +0200
Message-ID: <h4m9qr$9bc$1@ger.gmane.org>
References: <5e088bd90907271310o13787c35j5412c20fa1039912@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.1pre) Gecko/20090712 Shredder/3.0b3pre
In-Reply-To: <5e088bd90907271310o13787c35j5412c20fa1039912@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] policykit: install missing PolicyKit.conf
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
X-List-Received-Date: Tue, 28 Jul 2009 07:51:57 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I applied all three patches, but I noticed some problems:

* patch 3 was linewrapped
* patchwork hates the gitweb-export-pasted-into-gmail and duplicated 
descriptions

I fixed those manually, could you next time try using git-format-patch 
and git-send-email? I use the following to send my patches using gmail: 
http://git.or.cz/gitwiki/GitTips#Usingmsmtptosendyourpatches

regards,

Koen


On 27-07-09 22:10, Steve Sakoman wrote:
> From: Steve Sakoman<steve@sakoman.com>
> Date: Mon, 27 Jul 2009 19:38:05 +0000 (-0700)
> Subject: policykit: install missing PolicyKit.conf
> X-Git-Url: http://www.sakoman.net/cgi-bin/gitweb.cgi?p=openembedded.git;a=commitdiff_plain;h=98b71f9ab5b8578b77bb45887e72681ce16a2910
>
> policykit: install missing PolicyKit.conf
> ---
>
> diff --git a/recipes/policykit/policykit/PolicyKit.conf
> b/recipes/policykit/policykit/PolicyKit.conf
> new file mode 100644
> index 0000000..ed502ac
> --- /dev/null
> +++ b/recipes/policykit/policykit/PolicyKit.conf
> @@ -0,0 +1,13 @@
> +<?xml version="1.0" encoding="UTF-8"?>  <!-- -*- XML -*- -->
> +
> +<!DOCTYPE pkconfig PUBLIC "-//freedesktop//DTD PolicyKit Configuration 1.0//EN"
> +"http://hal.freedesktop.org/releases/PolicyKit/1.0/config.dtd">
> +
> +<!-- See the manual page PolicyKit.conf(5) for file format -->
> +
> +<config version="0.1">
> +<match user="root">
> +<return result="yes"/>
> +</match>
> +<define_admin_auth group="admin"/>
> +</config>
> diff --git a/recipes/policykit/policykit_0.9.bb
> b/recipes/policykit/policykit_0.9.bb
> index 28cbb11..2a31701 100644
> --- a/recipes/policykit/policykit_0.9.bb
> +++ b/recipes/policykit/policykit_0.9.bb
> @@ -1,9 +1,11 @@
>   HOMEPAGE = "http://www.packagekit.org/"
>   DEPENDS = "libpam expat dbus-glib"
>
> -PR = "r4"
> +PR = "r5"
>
> -SRC_URI = "http://hal.freedesktop.org/releases/PolicyKit-${PV}.tar.gz"
> +SRC_URI = "http://hal.freedesktop.org/releases/PolicyKit-${PV}.tar.gz \
> +           file://PolicyKit.conf \
> +          "
>
>   EXTRA_OECONF = "--with-authfw=pam --with-os-type=moblin
> --disable-man-pages --disable-gtk-doc"
>
> @@ -11,6 +13,10 @@ S = "${WORKDIR}/PolicyKit-${PV}"
>
>   inherit autotools pkgconfig
>
> +do_install_append () {
> +	install -m 0644 ${WORKDIR}/PolicyKit.conf
> ${D}${sysconfdir}/PolicyKit/PolicyKit.conf
> +}
> +
>   do_stage() {
>           autotools_stage_all
>   }




