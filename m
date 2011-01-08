Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pbi0m-0002UI-WE
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Jan 2011 00:15:53 +0100
Received: by pwi8 with SMTP id 8so2605511pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Jan 2011 15:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=jumzajDUT6cnDrg26TE1Y5qtlF7Y8NVwrkbRLvbqLwk=;
	b=qThNgoBi0gkchVwZeLzeMz6pKfjEFlxLAXO7C592mdk6ukX2Q/gUEUrlCDsOkyyoZG
	cYOj/TLUr2phN/DOJipW7bIMyXtb0V0Yj403J8zXOpV9h1RKtaBopTsLOxZWd2myZUSO
	Eu9WkoVpKjR22+Ndmx693VMPbpKF4aZzsRsBM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=KSeHGG6t4aLoroj9T4bm8MfeJIs8VlWHSsVdqm3Vi5xXVQ3oOVHHrehz7PdmFtY7Bj
	phF/aaDdjcBY1tGJa3DeitQQG7W3QQYvDWwaU/W3TD2ys7276VKn4ekaQral9dsDDNsc
	rWjX5UopFPTvbgZRtRFwH13KyXwaZn5HyKLrM=
Received: by 10.142.246.11 with SMTP id t11mr2915549wfh.362.1294528524374;
	Sat, 08 Jan 2011 15:15:24 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id v19sm5006075wfh.0.2011.01.08.15.15.22
	(version=SSLv3 cipher=RC4-MD5); Sat, 08 Jan 2011 15:15:23 -0800 (PST)
Message-ID: <4D28EFFE.1010707@gmail.com>
Date: Sat, 08 Jan 2011 15:15:10 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294241612-28405-1-git-send-email-Martin.Jansa@gmail.com>
	<1294241612-28405-2-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1294241612-28405-2-git-send-email-Martin.Jansa@gmail.com>
Subject: Re: [PATCH 2/2] mysql5-native: put make install to do_install after autotools_stage_all was removed with do_stage in eaf0fc03acfb262bcd614a14086a1b28ec850f46
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
X-List-Received-Date: Sat, 08 Jan 2011 23:15:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 1/5/2011 7:33 AM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>   recipes/mysql/mysql5-native_5.1.40.bb |    4 ++++
>   1 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/mysql/mysql5-native_5.1.40.bb b/recipes/mysql/mysql5-native_5.1.40.bb
> index 40d07ec..8001783 100644
> --- a/recipes/mysql/mysql5-native_5.1.40.bb
> +++ b/recipes/mysql/mysql5-native_5.1.40.bb
> @@ -12,6 +12,10 @@ EXTRA_OEMAKE = ""
>   EXTRA_OECONF = " --with-embedded-server "
>
>   do_install() {
> +        oe_runmake 'DESTDIR=${D}' install
> +        mv -f ${D}${libdir}/mysql/* ${D}${libdir}
> +        rmdir ${D}${libdir}/mysql
> +
>           install -d ${D}${bindir}
>           install -m 0755 sql/gen_lex_hash ${D}${bindir}/
>   }



