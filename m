Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2BA096025F
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Mar 2020 01:36:20 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id y1so1578963plp.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Mar 2020 17:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=YNBNWiSGDvakVUUFXcB9DxmMzLUzrlJtxW5bM8KtdKg=;
	b=oMeLYzQR/4G9hQUCvdPH0C+hnURA7rQAQ8RvzruntH2HGxL7v0kp4qBdw2mqDCe3B7
	lbmPaVk88jMbC4Fi04FiGHdMx9S2OPecyhEbkdQHDtWCOD8xA6jqSrG/xM/sf77vuXKm
	3WJfQ3nTgoX6t86VHLjpVIbwggh+kFjo8DcEp6QWOLdnciftHuxLr2GGZ9SPTWRPfHpp
	prBM6F7lZ7VJoYndTPftGf5eSxqc4LMU50Lrmlv52FdwzU8bD7xOqnqWqG/RaKeuJs6T
	IkIiBr90Rvk8haed5a008t73/njftvWKHOku3Tp090Idsp+bd9xWUoFZfNZFl4K1Pnrg
	qP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=YNBNWiSGDvakVUUFXcB9DxmMzLUzrlJtxW5bM8KtdKg=;
	b=KIu6mw8ACtmZXGznMGHUvYeOxRjKy9vbY4zp6pB+1rn7tEOvWdqe1VvaxlTSgq3ddJ
	+i0ELdAijveZhmxOpXtvB8eKw0gFPZ7hQr9EQx+krWkayTDLS5BMJ+CoyqXhMEPR6VOW
	bV3RAZ2gylXhsQcNQyDEEfiaE+a2hFnyRcgCXTsY2POsBnKQ1ubPlApbZLxoL+M6REbH
	ztp90foFaHG5cO4dcGzzFVFfbpFH7/C3enB+rDr0ThS15BA9L/kfeFpIkLqMkxanNeEq
	sIzKuyj90B6clVttoFFn0Xc3C0n6VTsBVAbTt+HWyoyagQpwCrEuT0NjTfbL+jIaiH5x
	1wZw==
X-Gm-Message-State: ANhLgQ2RF6ueppatXWksvGwMA7K/QwT0NgCivMLLq63iRRxUYgbxXcGB
	n7ouabcPpdiF7aZtI8386GCTlGdaBcg=
X-Google-Smtp-Source: ADFU+vsQF59dP4l4ygGoeZ0Sw/NqSMsLaQLDjOAlKALBpZb/XmhnDvqIlbzYzJ/mqOJfp4I4BYvBEQ==
X-Received: by 2002:a17:90a:32aa:: with SMTP id
	l39mr5917657pjb.184.1583544980919; 
	Fri, 06 Mar 2020 17:36:20 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:39eb:a2f5:6fb2:abe0?
	([2601:646:9200:4e0:39eb:a2f5:6fb2:abe0])
	by smtp.gmail.com with ESMTPSA id
	b16sm8695097pff.25.2020.03.06.17.36.20
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 06 Mar 2020 17:36:20 -0800 (PST)
To: "Jeremy A. Puhlman" <jpuhlman@mvista.com>,
	openembedded-devel@lists.openembedded.org
References: <20200305223937.12418-1-jpuhlman@mvista.com>
	<20200305223937.12418-4-jpuhlman@mvista.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <74c7eed5-4a2b-aeb2-2c4f-b89f335897a0@gmail.com>
Date: Fri, 6 Mar 2020 17:36:19 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200305223937.12418-4-jpuhlman@mvista.com>
Subject: Re: [meta-networking][PATCH 4/7] net-snmp: fix reproducibilty issues in net-snmp-config
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
X-List-Received-Date: Sat, 07 Mar 2020 01:36:22 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jeremy

On 3/5/20 2:39 PM, Jeremy A. Puhlman wrote:
> From: Jeremy Puhlman <jpuhlman@mvista.com>
> 
> Both STAGING_HOST_DIR and -fmacro-prefix-map path to WORKDIR were
> encoded in the config.
> 
> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> ---
>   meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
> index 317350e94..91c50c4e3 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
> @@ -124,11 +124,13 @@ do_install_append() {
>           -i ${D}${bindir}/net-snmp-create-v3-user
>       sed -e 's@^NSC_SRCDIR=.*@NSC_SRCDIR=.@g' \
>           -e 's@[^ ]*-fdebug-prefix-map=[^ "]*@@g' \
> +        -e 's@[^ ]*-fmacro-prefix-map=[^ "]*@@g' \
>           -e 's@[^ ]*--sysroot=[^ "]*@@g' \
>           -e 's@[^ ]*--with-libtool-sysroot=[^ "]*@@g' \
>           -e 's@[^ ]*--with-install-prefix=[^ "]*@@g' \
>           -e 's@[^ ]*PKG_CONFIG_PATH=[^ "]*@@g' \
>           -e 's@[^ ]*PKG_CONFIG_LIBDIR=[^ "]*@@g' \
> +        -e 's@${STAGING_DIR_HOST}@@g' \

This is causing problems, indirectly like

https://errors.yoctoproject.org/Errors/Details/393851/
https://errors.yoctoproject.org/Errors/Details/393852/
https://errors.yoctoproject.org/Errors/Details/393853/

Since its editing out the paths, whats left is just /usr/lib
and that gets added to compiler commandline as -L/usr/lib which
thankfully gets caught by Build QA

perhaps this regexp can be made less greedy

