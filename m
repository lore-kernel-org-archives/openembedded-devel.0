Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 460F571144
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 02:19:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAB2JBbs022818
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Nov 2014 18:19:11 -0800 (PST)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Mon, 10 Nov 2014 18:19:11 -0800
Message-ID: <5461721A.6050307@windriver.com>
Date: Tue, 11 Nov 2014 10:19:06 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1414664583-26791-1-git-send-email-Chong.Lu@windriver.com>
In-Reply-To: <1414664583-26791-1-git-send-email-Chong.Lu@windriver.com>
X-Originating-IP: [128.224.162.204]
Subject: Re: [meta-oe][PATCH 1/2] samba: add winbind.service to winbind package
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
X-List-Received-Date: Tue, 11 Nov 2014 02:19:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

ping

//Chong

On 10/30/2014 06:23 PM, Chong Lu wrote:
> This solves the following warning:
>
> lib32-samba-3.6.24: lib32-samba: Files/directories were installed but not shipped
>    /lib/systemd/system/winbind.service [installed-vs-shipped]
>
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>   recipes-connectivity/samba/samba-basic.inc | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-connectivity/samba/samba-basic.inc b/meta-oe/recipes-connectivity/samba/samba-basic.inc
> index d0fa8e6..e9f891f 100644
> --- a/meta-oe/recipes-connectivity/samba/samba-basic.inc
> +++ b/meta-oe/recipes-connectivity/samba/samba-basic.inc
> @@ -40,6 +40,7 @@ FILES_winbind = "${sbindir}/winbindd \
>                    ${bindir}/wbinfo \
>                    ${bindir}/ntlm_auth \
>                    ${sysconfdir}/init.d/winbind \
> +                 ${systemd_unitdir}/system/winbind.service \
>   "
>   FILES_libwinbind = "${libdir}/idmap/*.so \
>                       ${libdir}/pdb \


