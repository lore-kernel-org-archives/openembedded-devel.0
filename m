Received: from stoexhub01.domain01.net ([83.145.59.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1ROPPe-0006Zx-Q4
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Nov 2011 08:51:07 +0100
Received: from ad.chargestorm.se (193.235.91.228) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server (TLS) id 8.3.137.0;
	Thu, 10 Nov 2011 08:44:48 +0100
Date: Thu, 10 Nov 2011 08:44:49 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20111110074449.GB3933@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1320866629-22073-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1320866629-22073-1-git-send-email-Martin.Jansa@gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH][meta-oe] systemd: add postrm u-a calls
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
X-List-Received-Date: Thu, 10 Nov 2011 07:51:07 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Martin Jansa <martin.jansa@gmail.com> [111109 20:25]:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-core/systemd/systemd_git.bb |   11 +++++++++--
>  1 files changed, 9 insertions(+), 2 deletions(-)

> diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
> index 90862a3..d1d4306 100644
> --- a/meta-oe/recipes-core/systemd/systemd_git.bb
> +++ b/meta-oe/recipes-core/systemd/systemd_git.bb
> @@ -14,7 +14,7 @@ inherit gitpkgv
>  # TODO:
>  # u-a for runlevel and telinit
> -# u-a prerm

Here on your todo list, it stated u-a for prerm, but you applied it to
the postrm. In this case, it probably doesn't really matter, but I'd
still guess that it would make more sense to remove the u-a before
removing the binaries. Although, I don't think it'll actually cause any
problems in this case.

Cheers,
Anders

>  pkg_postinst_systemd () {
>  update-alternatives --install ${base_sbindir}/init init ${base_bindir}/systemd 300
> @@ -117,3 +116,11 @@ update-alternatives --install ${base_sbindir}/reboot reboot ${base_bindir}/syste
>  update-alternatives --install ${base_sbindir}/shutdown shutdown ${base_bindir}/systemctl 300
>  update-alternatives --install ${base_sbindir}/poweroff poweroff ${base_bindir}/systemctl 300
>  }
> +
> +pkg_postrm_systemd () {
> +update-alternatives --remove init ${base_bindir}/systemd
> +update-alternatives --remove halt ${base_bindir}/systemctl
> +update-alternatives --remove reboot ${base_bindir}/systemctl
> +update-alternatives --remove shutdown ${base_bindir}/systemctl
> +update-alternatives --remove poweroff ${base_bindir}/systemctl
> +}
-- 
Anders Darander
ChargeStorm AB / eStorm AB


