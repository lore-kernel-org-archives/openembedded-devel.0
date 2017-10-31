Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id BA8CA6E668
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 01:31:06 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id r79so14411593wrb.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Oct 2017 18:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BtSj2VAW2h8N0NfgTStHc0nqhye/l7K8mhn9d6PgYCs=;
	b=esgspr2h8cVQrhHXCtPoklmfaCzHrWtiqHDMBagOUEGB5UU8Kd75I5QBp8XiU9ctHo
	AIaakCCo3W7NG+HFbcFVkr/Lzmd4Q2d2YjlsnMgs5/mlF6C0eotjR6fRCN/hBZKZit1W
	wkFR4lN5PT2q7CrO6Fnz84neHo2APV3t55TcRc0e/MRVDOXqu0F9WLw5LKINktM9rpwx
	lX5YeTHBf8yhz2iyP5Bmk/Oc5OBJdnPjzMaYDnWWAqcF8LW1t+ZaAFm51Tx40/QTwCKu
	R9nbc9a6uIp/PmcWDpObWxDLR54J9ciJ651JhRUKzZpjEGWzUt09CVaQBK5WOoandObs
	om8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BtSj2VAW2h8N0NfgTStHc0nqhye/l7K8mhn9d6PgYCs=;
	b=XNEX/69VnJCs0+CWkU5W2ijTBC5JytlICoMt6qvKxYlUHVqu+MoCRRAbG7ZilDQG4K
	IzlGNjLwSGdROk+H3IdP5X/r7JuNVDbgaoVaqJqnYmAOXay740pq5QW1G+GqnlgcbvER
	lyai/bOKXzec68VgQQSu8NPEO5MiSuk86ilMweoTq8fBASSzmu+Ivp/HSaLT8cYPXOmZ
	h2dBR+CiSemUfzE136nGO5x7cAf/iz+P40jtEA+u6mLHFUBXsBgLH1WEqEQ5S4KDRPpY
	oN41ASMitXuTOGVtjNfSkdd2BQjvF6BVaE+OP6QtaxtsC0VpqyaCMRbRzRNre29zn1ea
	t5mQ==
X-Gm-Message-State: AMCzsaXl+cZ2Q20/vevBsbRLYW7S3ijgyjyU04tNQoTn7Sf8YbxfqkEn
	9Q5UjkWUgMZy3kkRgdIdxZdgXARgyYAFjxxrQVw=
X-Google-Smtp-Source: ABhQp+SOhYVw9Dbq/uxScYl4PCb80vw3LO/kECYsUaQq7juh94xg7qXNETmZ3g9B7DiEPxBrc9/5axqpVwgnSle6ZNA=
X-Received: by 10.223.146.197 with SMTP id 63mr200965wrn.180.1509413467659;
	Mon, 30 Oct 2017 18:31:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.166.19 with HTTP; Mon, 30 Oct 2017 18:31:07 -0700 (PDT)
In-Reply-To: <1505920293-28115-3-git-send-email-derek@asterius.io>
References: <1505920293-28115-1-git-send-email-derek@asterius.io>
	<1505920293-28115-3-git-send-email-derek@asterius.io>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 30 Oct 2017 18:31:07 -0700
Message-ID: <CAJ86T=Wc6-kb_YFATTj58XCeUYfGAkMsoBAuh=yiws5md2L3dg@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 3/3] php: add libgcc to the runtime depends
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
X-List-Received-Date: Tue, 31 Oct 2017 01:31:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 20, 2017 at 8:11 AM, Derek Straka <derek@asterius.io> wrote:
> Avoids issues with 'libgcc_s.so.1 must be installed for pthread_cancel to work'

Does passing the "--enable-libgcc" php configure option fix that too?
If so, maybe it's a better fix?

> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  meta-oe/recipes-devtools/php/php.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
> index 0e55020..283d630 100644
> --- a/meta-oe/recipes-devtools/php/php.inc
> +++ b/meta-oe/recipes-devtools/php/php.inc
> @@ -203,6 +203,7 @@ MODPHP_PACKAGE = "${@bb.utils.contains('PACKAGECONFIG', 'apache2', '${PN}-modphp
>
>  PACKAGES = "${PN}-dbg ${PN}-cli ${PN}-cgi ${PN}-fpm ${PN}-fpm-apache2 ${PN}-pear ${PN}-phar ${MODPHP_PACKAGE} ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}"
>
> +RDEPENDS_${PN} += "libgcc"
>  RDEPENDS_${PN}-pear = "${PN}"
>  RDEPENDS_${PN}-phar = "${PN}-cli"
>  RDEPENDS_${PN}-cli = "${PN}"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

