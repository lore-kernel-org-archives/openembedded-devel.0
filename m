Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E54E270030
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2016 09:39:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u1I9dsb5015356
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2016 01:39:54 -0800 (PST)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 18 Feb 2016 01:39:53 -0800
To: <openembedded-devel@lists.openembedded.org>
References: <1453876257-30608-1-git-send-email-kai.kang@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <56C59168.4010600@windriver.com>
Date: Thu, 18 Feb 2016 17:39:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1453876257-30608-1-git-send-email-kai.kang@windriver.com>
Subject: Re: [meta-networking][PATCH] samba: update systemd service files
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
X-List-Received-Date: Thu, 18 Feb 2016 09:39:55 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2016年01月27日 14:30, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> Update systemd service files of samba. There are no '@BASE_BINDIR@' and
> '@SBINDIR@' in these service files, so drop the original replacement.
> Command kill is installed to /bin/kill, then correct in the service files.

Ping.

--Kai

>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   meta-networking/recipes-connectivity/samba/samba_4.1.12.bb | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
> index a51d31f..2e3f118 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
> @@ -112,9 +112,7 @@ do_install_append() {
>           for i in nmb smb winbind; do
>               install -m 0644 packaging/systemd/$i.service ${D}${systemd_unitdir}/system
>           done
> -        sed -e 's,@BASE_BINDIR@,${base_bindir},g' \
> -            -e 's,@SBINDIR@,${sbindir},g' \
> -            -i ${D}${systemd_unitdir}/system/*.service
> +        sed -i 's,\(ExecReload=\).*\(/kill\),\1${base_bindir}\2,' ${D}${systemd_unitdir}/system/*.service
>   
>   	install -d ${D}${sysconfdir}/tmpfiles.d
>   	echo "d ${localstatedir}/log/samba 0755 root root -" \


-- 
Regards,
Neil | Kai Kang


