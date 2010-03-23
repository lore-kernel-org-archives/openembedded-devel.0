Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NttU4-0003G8-Mi
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 03:04:49 +0100
Received: (qmail 3673 invoked by uid 1003); 23 Mar 2010 02:01:36 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 23 Mar 2010 02:01:36 -0000
Message-ID: <4BA820FF.2000805@balister.org>
Date: Mon, 22 Mar 2010 22:01:35 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.8) Gecko/20100301 Fedora/3.0.3-1.fc11 Thunderbird/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1269256016-13155-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1269256016-13155-10-git-send-email-marcin@juszkiewicz.com.pl>
In-Reply-To: <1269256016-13155-10-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][STABLE] shadow: run pwconv and grpconv in postinst
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
X-List-Received-Date: Tue, 23 Mar 2010 02:04:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Philip Balister <philip@balister.org>


On 03/22/2010 07:06 AM, Marcin Juszkiewicz wrote:
> From: Koen Kooi<koen@openembedded.org>
>
> * this converts oldstyle formats to the proper one
> ---
>   recipes/shadow/shadow.inc |    7 ++++++-
>   1 files changed, 6 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/shadow/shadow.inc b/recipes/shadow/shadow.inc
> index 9da5845..5e3d2f2 100644
> --- a/recipes/shadow/shadow.inc
> +++ b/recipes/shadow/shadow.inc
> @@ -11,7 +11,7 @@ LICENSE = "BSD"
>   SECTION = "base"
>   DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>
> -INC_PR = "r9"
> +INC_PR = "r10"
>
>   # Additional Policy files for PAM
>   PAM_SRC_URI = " \
> @@ -89,6 +89,11 @@ do_install_append() {
>   pkg_postinst_${PN} () {
>       update-alternatives --install ${bindir}/passwd passwd passwd.${PN} 100
>       update-alternatives --install ${sbindir}/chpasswd chpasswd chpasswd.${PN} 100
> +    if [ "x$D" != "x" ]; then
> +        exit 1
> +    fi
> +	pwconv
> +	grpconv
>   }
>
>   pkg_prerm_${PN} () {


