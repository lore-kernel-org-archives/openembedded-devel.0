Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id A429260767
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 May 2016 22:03:58 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id i5so12929544pag.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 May 2016 15:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=b4qrv2G66fDvDugt01D3hHul/FJ5SG6gcOuwwRFyl30=;
	b=UwDrviaiqBOExbMPe4OlVyDSUjqLP0z3PWDv09y/LlB25EE34HWbMgvhOxbDLN8g13
	H93/ggLxz4cgkfz6asD+U/l+DdDnU2Z+YY64Ui6ztPCYEKbOflfPVbCdW2c9JubPQwDJ
	KvBxGbZmNSJVthf+8rTxzy4ryV0vx7Di0RMS8Fvw5l1509+MOejQfjyYLyQ/HTdrRX4J
	HP0RmaQCxN2q9nrhbGJ/VUJ7yAzDoWj9ldX+D0ErlfiuktS7oKYwYbBPxiQPZ2SHfo1t
	WLyONlPe+OnPtV+EOLR7ZSgIRJxfLxIjmGM60wgqPiekEI/4XW7+z44r5vztypkI/1i5
	scdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=b4qrv2G66fDvDugt01D3hHul/FJ5SG6gcOuwwRFyl30=;
	b=l3xaBhc17v1PX+bNMAkS4jJsSl+I/p5WKPT8Kj9JFtRiKtd8qMlchXOwbuZkjN2vW7
	sgBBSJILNbad2isB01CtpSrR10IDvoTQR6MXY5BANjVNWh9B5HGfZxtNj0fZtOEPQ5po
	MJCd0QMqR53HbMdPzIWs1wdsEUEJlKRdrIBs4ii75Z5c3vp0NnkenqYubv7mgoSpFlT8
	GgR0o3CIgI9RQK4WQvP7ww3LNMb1I7YGLuUDTaicVscNeH9S7O9GSTwwQ9iBmbioH0Bx
	N6NCQ2iRtEWo1lpIbADsNKDQStbNpibNjjVzb4KU7wNzVwzx/zpxzhh8L3YbECbXxHww
	y8vQ==
X-Gm-Message-State: AOPr4FX/7OwxS/q3/kfLr47hahNAU1YLVx5KKMtQiWVlQJjUJ8dOuCg9OfUevUeOhQllLw==
X-Received: by 10.67.14.7 with SMTP id fc7mr38818318pad.1.1462658639027;
	Sat, 07 May 2016 15:03:59 -0700 (PDT)
Received: from Akusters-laptop.local ([2601:202:4000:1239:a93b:c15d:e6b7:11e9])
	by smtp.googlemail.com with ESMTPSA id
	wy7sm30330213pab.5.2016.05.07.15.03.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 May 2016 15:03:57 -0700 (PDT)
To: Otavio Salvador <otavio@ossystems.com.br>,
	Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
References: <1462543183-7080-1-git-send-email-otavio@ossystems.com.br>
From: akuster808 <akuster808@gmail.com>
Message-ID: <572E664C.1000104@gmail.com>
Date: Sat, 7 May 2016 15:03:56 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <1462543183-7080-1-git-send-email-otavio@ossystems.com.br>
Subject: Re: [meta-oe backport krogoth PATCH 01/22] net-snmp: enable ipv6 support
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
X-List-Received-Date: Sat, 07 May 2016 22:03:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 5/6/16 6:59 AM, Otavio Salvador wrote:

pulled in most of this series, excluding the ltrace and bb.utils changes.


- armin
> From: Zhu Yanjun <yanjun.zhu@windriver.com>
>
> Add packageconfig for ipv6 and enable it when it's defined in distro_features.
>
> Signed-off-by: Zhu Yanjun <yanjun.zhu@windriver.com>
> Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
>  meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> index 1a50932..ee8878f 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> @@ -39,6 +39,9 @@ PACKAGECONFIG ??= ""
>  PACKAGECONFIG[elfutils] = "--with-elf, --without-elf, elfutils"
>  PACKAGECONFIG[libnl] = "--with-nl, --without-nl, libnl"
>  
> +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
> +PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,,"
> +
>  EXTRA_OECONF = "--disable-embedded-perl \
>                  --with-perl-modules=no \
>                  --disable-manuals \


