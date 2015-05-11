Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id D8CE56013D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 11:48:58 +0000 (UTC)
Received: (qmail 191 invoked by uid 1003); 11 May 2015 11:48:58 -0000
Received: from unknown (HELO ?192.168.11.121?)
	(philip@opensdr.com@108.44.122.151)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	11 May 2015 11:48:58 -0000
Message-ID: <5550972A.7000709@balister.org>
Date: Mon, 11 May 2015 07:48:58 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1431070955-7100-1-git-send-email-yi.zhao@windriver.com>
	<1431070955-7100-7-git-send-email-yi.zhao@windriver.com>
In-Reply-To: <1431070955-7100-7-git-send-email-yi.zhao@windriver.com>
Subject: Re: [meta-oe][PATCH 07/20] gpsd: fix PN -> BPN for multilib
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 May 2015 11:48:59 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

I've alos got an update in flight for gpsd. We are having trouble with
it, because the update brkoe navit. Now the bluez4 - 5 updte broke
another of the packages navit needs.

Martin, any chance we can combine this patch with my update and
blacklist navit?

Philip

On 05/08/2015 03:42 AM, Yi Zhao wrote:
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb
> index 93cf1ae..b37fc15 100644
> --- a/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb
> +++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb
> @@ -85,8 +85,8 @@ do_install_append() {
>  
>      #support for systemd
>      install -d ${D}${systemd_unitdir}/system/
> -    install -m 0644 ${WORKDIR}/${PN}.service ${D}${systemd_unitdir}/system/${PN}.service
> -    install -m 0644 ${S}/systemd/${PN}.socket ${D}${systemd_unitdir}/system/${PN}.socket
> +    install -m 0644 ${WORKDIR}/${BPN}.service ${D}${systemd_unitdir}/system/${BPN}.service
> +    install -m 0644 ${S}/systemd/${BPN}.socket ${D}${systemd_unitdir}/system/${BPN}.socket
>  }
>  
>  pkg_postinst_${PN}-conf() {
> 

