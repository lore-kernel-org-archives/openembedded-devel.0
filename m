Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9FE5660684
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Sep 2016 18:34:22 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id 15so2158700uai.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Sep 2016 11:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=eW/3i+Jiq2pACkdbE2PlXlCKyydaXf4hi6ljJk0O55Q=;
	b=UeLYBC1pOZfz+HN707Xi6SVcACNVyyDJKeW+meY+Bouiexsqgxq9/xWc5XOStOfqVd
	DOro/Qc+1yH5YT5cROOaK6uKqx2eOSQzsTySmLSHvSrNdZa5OzUzy/AE1000BI2bi2GD
	ZiQLov0LUI49zIHlbatz9aUvoSxVWew99MC8Ykwt7fWHOoJsFUSL52XgcBVU66kx3rsI
	8O4zamSdAk8awVHlhUd109djis1GUz2Ax0ZFqPMC4pLbHKjgo7BoT5fz8G3IICnwcC4S
	aosSt84zwyYdkWC/hX3Dtyk8FE0AGFSFRKd6FIMhv3Dwq0Oo21tG1Z672YQ7qlxExs62
	kiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=eW/3i+Jiq2pACkdbE2PlXlCKyydaXf4hi6ljJk0O55Q=;
	b=IGvu8moJk5wKoL1PF8LTAh5MB+Zq9ZIYlUM0GtK9sIDhF5NRGtSAFwht0Dnc40C+Og
	I5wr/4gqSMDmg+FUqCEtaGpT36WWDq1ETVMlG03DHNo+eCdM9xeYUiReg3+FIUMq4AzQ
	O95w+Q8bhCV9DhoDjRqGlpchDUm1NqsSc5/p4sTEAhheu9vwq/f2UMe4qA9lvGnx+sX7
	DJRqD2yjla/tbFUDbJO/zB5ev+ti77fG9MZ8LUlK2eejQpbVSCEzEbG8eC7L8TqlUpoK
	KJ8uCvY/jx5jRoZZgiW/4d0nhGdlbvJErTzHBas+3s/YDTJrsywttPQxp5HYSlcpGL4X
	q7fw==
X-Gm-Message-State: AA6/9Rlqsvtu0Cd4tZSonzD3d6x6d+7WJLDcHWfz4Ne2EcutsjnQWtQ+1BOkxM1Vu0ItTW9VQLVg2izXr1Pwfg==
X-Received: by 10.176.4.109 with SMTP id 100mr5958800uav.101.1474655663701;
	Fri, 23 Sep 2016 11:34:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.80.33 with HTTP; Fri, 23 Sep 2016 11:33:53 -0700 (PDT)
In-Reply-To: <1474634029-22896-1-git-send-email-mike.looijmans@topic.nl>
References: <1474634029-22896-1-git-send-email-mike.looijmans@topic.nl>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Sep 2016 11:33:53 -0700
Message-ID: <CAMKF1srhhYfYO69noEU30+66yDX8cLNbEB7tpJhkubKwjPoevw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] phytool: Add recipe
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
X-List-Received-Date: Fri, 23 Sep 2016 18:34:25 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 23, 2016 at 5:33 AM, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> A nice tool to directly read, write and interpret ethernet PHY data.
> Very useful when debugging PHY or MDIO problems, which ethtool does
> not do.
>
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
>  meta-networking/recipes-support/phytool/phytool.bb | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta-networking/recipes-support/phytool/phytool.bb
>
> diff --git a/meta-networking/recipes-support/phytool/phytool.bb b/meta-networking/recipes-support/phytool/phytool.bb
> new file mode 100644
> index 0000000..9d541b7
> --- /dev/null
> +++ b/meta-networking/recipes-support/phytool/phytool.bb
> @@ -0,0 +1,14 @@
> +SUMMARY = "PHY interface tool for Linux"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> +
> +PV = "1.0.1"
> +SRCREV = "1a3ea62a218206e9faf3b27fb5d01c85692024c8"
> +SRC_URI = "git://github.com/wkz/phytool.git"
> +
> +S = "${WORKDIR}/git"
> +
> +do_install() {
> +       install -d ${D}${prefix}/bin

perhaps use base_bindir here

> +       oe_runmake 'DESTDIR=${D}' 'PREFIX=${prefix}' install
> +}
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

