Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NttUD-0003Nb-5O
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 03:04:59 +0100
Received: (qmail 27689 invoked by uid 1003); 23 Mar 2010 02:01:44 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 23 Mar 2010 02:01:44 -0000
Message-ID: <4BA82107.50201@balister.org>
Date: Mon, 22 Mar 2010 22:01:43 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.8) Gecko/20100301 Fedora/3.0.3-1.fc11 Thunderbird/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1269256016-13155-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1269256016-13155-11-git-send-email-marcin@juszkiewicz.com.pl>
In-Reply-To: <1269256016-13155-11-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][STABLE] shadow: use u-a on binaries that conflict with	util-linux-ng
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
X-List-Received-Date: Tue, 23 Mar 2010 02:05:05 -0000
X-List-Received-Date: Tue, 23 Mar 2010 02:05:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Philip Balister <philip@balister.org>


On 03/22/2010 07:06 AM, Marcin Juszkiewicz wrote:
> From: Koen Kooi<koen@openembedded.org>
>
> ---
>   recipes/shadow/shadow.inc |   27 +++++++++++++++++++++------
>   1 files changed, 21 insertions(+), 6 deletions(-)
>
> diff --git a/recipes/shadow/shadow.inc b/recipes/shadow/shadow.inc
> index 5e3d2f2..30bd92f 100644
> --- a/recipes/shadow/shadow.inc
> +++ b/recipes/shadow/shadow.inc
> @@ -11,7 +11,7 @@ LICENSE = "BSD"
>   SECTION = "base"
>   DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>
> -INC_PR = "r10"
> +INC_PR = "r13"
>
>   # Additional Policy files for PAM
>   PAM_SRC_URI = " \
> @@ -79,16 +79,30 @@ do_install_append() {
>     sed -i 's/MAIL_DIR/#MAIL_DIR/g' ${D}${sysconfdir}/login.defs
>     sed -i 's/#MAIL_FILE/MAIL_FILE/g' ${D}${sysconfdir}/login.defs
>
> -  mv ${D}${bindir}/passwd ${D}${bindir}/passwd.${PN}
> +  install -d ${D}${sbindir} ${D}${base_sbindir} ${D}${base_bindir}
> +  for i in passwd chfn newgrp chsh ; do
> +    mv ${D}${bindir}/$i ${D}${bindir}/$i.${PN}
> +  done
> +
>     mv ${D}${sbindir}/chpasswd ${D}${sbindir}/chpasswd.${PN}
> +  mv ${D}${sbindir}/vigr ${D}${base_sbindir}/vigr.${PN}
> +  mv ${D}${sbindir}/vipw ${D}${base_sbindir}/vipw.${PN}
> +  mv ${D}${bindir}/login ${D}${base_bindir}/login.${PN}
>
>     # Ensure we add a suitable securetty file to the package that has most common embedded TTYs defined.
>     install -m 0400 ${WORKDIR}/securetty ${D}${sysconfdir}/securetty
> +
>   }
>
>   pkg_postinst_${PN} () {
> -    update-alternatives --install ${bindir}/passwd passwd passwd.${PN} 100
> -    update-alternatives --install ${sbindir}/chpasswd chpasswd chpasswd.${PN} 100
> +    update-alternatives --install ${bindir}/passwd passwd passwd.${PN} 200
> +    update-alternatives --install ${sbindir}/chpasswd chpasswd chpasswd.${PN} 200
> +    update-alternatives --install ${bindir}/chfn chfn chfn.${PN} 200
> +    update-alternatives --install ${bindir}/newgrp newgrp newgrp.${PN} 200
> +    update-alternatives --install ${bindir}/chsh chsh chsh.${PN} 200
> +    update-alternatives --install ${base_bindir}/login login login.${PN} 200
> +    update-alternatives --install ${base_sbindir}/vipw vipw vipw.${PN} 200
> +    update-alternatives --install ${base_sbindir}/vigr vigr vigr.${PN} 200
>       if [ "x$D" != "x" ]; then
>           exit 1
>       fi
> @@ -97,6 +111,7 @@ pkg_postinst_${PN} () {
>   }
>
>   pkg_prerm_${PN} () {
> -    update-alternatives --remove passwd passwd.${PN}
> -    update-alternatives --remove chpasswd chpasswd.${PN}
> +    for i in passwd chpasswd chfn newgrp chsh login vipw vigr ; do
> +        update-alternatives --remove $i $i.${PN}
> +    done
>   }


