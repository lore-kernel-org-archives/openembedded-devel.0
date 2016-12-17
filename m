Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3605877406
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 13:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id C2C4431C2F67;
	Sat, 17 Dec 2016 14:33:07 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id MXyCMhfv7n0t; Sat, 17 Dec 2016 14:33:05 +0100 (CET)
Received: from [172.22.22.61] (55d4656a.access.ecotel.net [85.212.101.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 87DDE31C2D2E;
	Sat, 17 Dec 2016 14:33:05 +0100 (CET)
To: Joe MacDonald <joe_macdonald@mentor.com>,
	openembedded-devel@lists.openembedded.org
References: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
	<1481940923-12914-5-git-send-email-joe_macdonald@mentor.com>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <34560173-174e-2709-99a9-17c695f65731@opendreambox.org>
Date: Sat, 17 Dec 2016 14:33:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <1481940923-12914-5-git-send-email-joe_macdonald@mentor.com>
Subject: Re: [meta-networking][PATCH 04/11] samba: add smbclient package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 17 Dec 2016 13:33:07 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 17.12.2016 03:15, Joe MacDonald wrote:
> From: Andreas Oberritter <obi@opendreambox.org>
> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> ---
>  .../recipes-connectivity/samba/samba_4.4.5.bb         | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> index c9e0953..37dabb6 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> @@ -143,10 +143,10 @@ do_install_append() {
>      rm -rf ${D}/run ${D}${localstatedir}/run ${D}${localstatedir}/log
>  }
>  
> -PACKAGES =+ "${PN}-python ${PN}-pidl libwinbind libwinbind-krb5-locator"
> -PACKAGES =+ "libwbclient libnss-winbind winbind libnetapi libsmbsharemodes \
> -             libsmbclient lib${BPN}-base ${PN}-base ${PN}-ctdb-tests"
> -
> +PACKAGES =+ "${PN}-python ${PN}-pidl libwinbind libwinbind-krb5-locator \
> +             libwbclient libnss-winbind winbind libnetapi libsmbsharemodes \
> +             libsmbclient lib${PN}-base ${PN}-base ${PN}-ctdb-tests \
                                  ^
This partially reverts commit 8f92aa970a34fa5af019c164d9e650de8fe511d3.

Regards,
Andreas

> +             smbclient"
>  
>  RDEPENDS_${PN} += "${PN}-base"
>  
> @@ -301,5 +301,16 @@ FILES_${PN}-python = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.so \
>                        ${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/web_server/* \
>  "
>  
> +FILES_smbclient = "${bindir}/cifsdd \
> +                   ${bindir}/rpcclient \
> +                   ${bindir}/smbcacls \
> +                   ${bindir}/smbclient \
> +                   ${bindir}/smbcquotas \
> +                   ${bindir}/smbget \
> +                   ${bindir}/smbspool \
> +                   ${bindir}/smbtar \
> +                   ${bindir}/smbtree \
> +                   ${libdir}/samba/smbspool_krb5_wrapper"
> +
>  RDEPENDS_${PN}-pidl_append = " perl"
>  FILES_${PN}-pidl = "${bindir}/pidl ${datadir}/perl5/Parse"
> 


