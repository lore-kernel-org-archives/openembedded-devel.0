Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PqRMe-000524-Lc
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 15:31:20 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PqRLS-0001q1-QM from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 06:30:06 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 18 Feb 2011 06:30:06 -0800
Received: from [172.30.80.148] ([172.30.80.148]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 18 Feb 2011 07:30:05 -0700
Message-ID: <4D5E8268.901@mentor.com>
Date: Fri, 18 Feb 2011 07:30:00 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1298032254-26236-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1298032254-26236-1-git-send-email-eric@eukrea.com>
X-OriginalArrivalTime: 18 Feb 2011 14:30:05.0669 (UTC)
	FILETIME=[5609A950:01CBCF78]
Subject: Re: [PATCH] shadow: fix rpath issues
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
X-List-Received-Date: Fri, 18 Feb 2011 14:31:20 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/18/2011 05:30 AM, Eric Bénard wrote:
> * add --disable-rpath (not enough with angstrom 2008.1)
> * fix build problems with rpath on older libtool
> * bump INC_PR
>
> Signed-off-by: Eric Bénard<eric@eukrea.com>
> ---
>   recipes/shadow/shadow.inc |    9 ++++++++-
>   1 files changed, 8 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/shadow/shadow.inc b/recipes/shadow/shadow.inc
> index 1b105c5..d688064 100644
> --- a/recipes/shadow/shadow.inc
> +++ b/recipes/shadow/shadow.inc
> @@ -13,7 +13,7 @@ DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>
>   PACKAGE_ARCH_${PN} = "${MACHINE_ARCH}"
>
> -INC_PR = "r18"
> +INC_PR = "r19"
>
>   # Additional Policy files for PAM
>   PAM_SRC_URI = " \
> @@ -39,6 +39,7 @@ EXTRA_OECONF += "\
>       --without-audit \
>       --without-selinux \
>       --without-libcrack \
> +    --disable-rpath \
>       ${@base_contains('DISTRO_FEATURES', 'pam', '--with-libpam', '--without-libpam', d)} \
>   "
>
> @@ -70,6 +71,12 @@ shadow_cv_passwd_dir=${bindir}
>   END
>   }
>
> +do_configure_append () {
> +    # use same fix as libiconv
> +    sed -i -e  s/^hardcode_libdir_flag_spec/#hardcode_libdir_flag_spec/ \
> +           -e s/^runpath_var/#runpath_var/ ${S}/*-libtool
> +}
> +
>   do_install_append() {
>     # Ensure that /etc/skel is created so any default files that we want copied into new users home
>     # dirs can be put in there later (ideal for .xinitrc for example).

The equiv I found in poky is:
do_configure_append() {
     # Fix RPATH issues.
     sed -i ${S}/config.status -e 
s,^\\\(hardcode_into_libs=\\\).*$,\\1\'no\',
     ${S}/config.status
}

Any preference?  Aside from I think we should be internally consistent 
in these fixes, so long as it's fixed...

-- 
Tom Rini
Mentor Graphics Corporation


