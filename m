Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 61C0460125
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 07:52:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7V7qAsR026467
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 00:52:10 -0700 (PDT)
Received: from [128.224.163.140] (128.224.163.140) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Wed, 31 Aug 2016 00:52:10 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1472629032-25950-1-git-send-email-mingli.yu@windriver.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <57C68BC3.3080401@windriver.com>
Date: Wed, 31 Aug 2016 15:48:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1472629032-25950-1-git-send-email-mingli.yu@windriver.com>
X-Originating-IP: [128.224.163.140]
Subject: Re: [meta-networking][PATCH] samba: add samba-pidl to RDEPENDS
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
X-List-Received-Date: Wed, 31 Aug 2016 07:52:10 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Please ignore this, sorry for noise.

Thanks,
Grace

On 2016年08月31日 15:37, mingli.yu@windriver.com wrote:
> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> * Add samba-pidl to RDEPENDS for samba as pidl
>    provided by samba depends on Parse::Pidl module
>    provided by samba-pidl, otherwise comes below error
>
>    root@super_micro-1:~# pidl -h
>    Can't locate Parse/Pidl.pm in @INC (you may
>    need to install the Parse::Pidl module) (@INC
>    contains: /usr/share/perl5 /etc/perl
>    /usr/lib64/perl/site_perl/5.22.1/
>    /usr/lib64/perl/site_perl/5.22.1
>    /usr/lib64/perl/vendor_perl/5.22.1/
>    /usr/lib64/perl/vendor_perl/5.22.1
>    /usr/lib64/perl/5.22.1/ /usr/lib64/perl/5.22.1
>    /usr/local/lib/site_perl .) at /usr/bin/pidl line 409.
>    BEGIN failed--compilation aborted at /usr/bin/pidl line 409.
>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>   meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> index e35d527..eebf71c 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> @@ -130,7 +130,7 @@ PACKAGES += "${PN}-python ${PN}-python-dbg ${PN}-pidl libwinbind libwinbind-dbg
>   PACKAGES =+ "libwbclient libnss-winbind winbind winbind-dbg libnetapi libsmbsharemodes \
>                libsmbclient libsmbclient-dev lib${PN}-base ${PN}-base ${PN}-ctdb-tests"
>
> -RDEPENDS_${PN} += "${PN}-base"
> +RDEPENDS_${PN} += "${PN}-base ${PN}-pidl"
>
>   FILES_${PN}-base = "${sbindir}/nmbd \
>                       ${sbindir}/smbd \
>

