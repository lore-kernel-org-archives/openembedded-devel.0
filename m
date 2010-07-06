Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OWF4t-0004Ag-TW
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Jul 2010 22:49:35 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OWF07-0000Ml-Ia from Tom_Rini@mentor.com ;
	Tue, 06 Jul 2010 13:44:19 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 6 Jul 2010 13:44:18 -0700
Received: from [172.30.80.199] ([172.30.80.199]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 6 Jul 2010 14:44:18 -0600
Message-ID: <4C3395A0.7060702@mentor.com>
Date: Tue, 06 Jul 2010 13:44:16 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1278447438-27251-1-git-send-email-stefan@datenfreihafen.org>
In-Reply-To: <1278447438-27251-1-git-send-email-stefan@datenfreihafen.org>
X-OriginalArrivalTime: 06 Jul 2010 20:44:18.0233 (UTC)
	FILETIME=[0109CA90:01CB1D4C]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Stefan Schmidt <stefan@buglabs.net>
Subject: Re: [PATCH][STABLE 1/3] shadow: Disable email checking completely
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
X-List-Received-Date: Tue, 06 Jul 2010 20:49:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Stefan Schmidt wrote:
> From: Stefan Schmidt <stefan@buglabs.net>
> 
> This allows faster login due to not checking for new emails. Adjust PR to 14 as
> stable is behind .dev here.
> 
> Signed-off-by: Stefan Schmidt <stefan@buglabs.net>

Acked-by: Tom Rini <tom_rini@mentor.com>

> ---
>  recipes/shadow/shadow.inc |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/shadow/shadow.inc b/recipes/shadow/shadow.inc
> index 30bd92f..55487df 100644
> --- a/recipes/shadow/shadow.inc
> +++ b/recipes/shadow/shadow.inc
> @@ -11,7 +11,7 @@ LICENSE = "BSD"
>  SECTION = "base"
>  DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>  
> -INC_PR = "r13"
> +INC_PR = "r14"
>  
>  # Additional Policy files for PAM
>  PAM_SRC_URI = " \
> @@ -79,6 +79,9 @@ do_install_append() {
>    sed -i 's/MAIL_DIR/#MAIL_DIR/g' ${D}${sysconfdir}/login.defs
>    sed -i 's/#MAIL_FILE/MAIL_FILE/g' ${D}${sysconfdir}/login.defs
>  
> +  # disable checking emails at all
> +  sed -i 's/MAIL_CHECK_ENAB/#MAIL_CHECK_ENAB/g' ${D}${sysconfdir}/login.defs
> +
>    install -d ${D}${sbindir} ${D}${base_sbindir} ${D}${base_bindir} 
>    for i in passwd chfn newgrp chsh ; do
>      mv ${D}${bindir}/$i ${D}${bindir}/$i.${PN}


-- 
Tom Rini
Mentor Graphics Corporation


