Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 26A6676E04
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 16:22:47 +0000 (UTC)
Received: by padhy1 with SMTP id hy1so5416658pad.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 09:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=/GuBojfYhXMquu7I1UvTJL9ecMuTo2PWLoWCLv0qnvc=;
	b=c694DyFOX6zhIwsY3+uP8Zai1Z9Fu4fvy2xhzle2dlW4nnYd4ee2tNvqoWkW2UGbBJ
	uLvHq9Sh5MLy07S0YzoV++8L9SG3HGildtyPYSif7MOoL273w9sBixFUQLx5KEcMgW5W
	mjeuiQKnLHYGvPFHsy4EeTu1PwsWJyNiexHrg3EWVzzrqRMuFpE7IoAOHc5G7zwRv2bg
	pC1LCyx5UgbO5yp4iaD6xA3riJcbDh6U8ibqeqPZAIn6eqkuE3PMHxFVdD6koYxfBE+p
	XxWLdTPVG8+WR3ix+yz2bcgkthQ+K7DkwJZib2j3RDOMcbpSqNB7RL3ZF+0R1JokvZde
	ot7A==
X-Received: by 10.68.179.101 with SMTP id df5mr35470209pbc.73.1446049367817;
	Wed, 28 Oct 2015 09:22:47 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:64b8:1072:ca0d:242?
	([2601:202:4000:1239:64b8:1072:ca0d:242])
	by smtp.googlemail.com with ESMTPSA id
	nj1sm46318720pbc.2.2015.10.28.09.22.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Oct 2015 09:22:47 -0700 (PDT)
To: Roy Li <rongqing.li@windriver.com>
References: <1445914005-23569-1-git-send-email-rongqing.li@windriver.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5630F654.6010009@gmail.com>
Date: Wed, 28 Oct 2015 09:22:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1445914005-23569-1-git-send-email-rongqing.li@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 1/3] dovecot: add PACKAGECONFIG for lz4
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
X-List-Received-Date: Wed, 28 Oct 2015 16:22:49 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Roy,

Should any of these be back ported to Fido and Dizzy?

- armin

On 10/26/2015 07:46 PM, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
> 
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  meta-networking/recipes-support/dovecot/dovecot_2.2.18.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.18.bb b/meta-networking/recipes-support/dovecot/dovecot_2.2.18.bb
> index 9b5f536..a01ef83 100644
> --- a/meta-networking/recipes-support/dovecot/dovecot_2.2.18.bb
> +++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.18.bb
> @@ -23,6 +23,7 @@ PACKAGECONFIG ??= " \
>  
>  PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,"
>  PACKAGECONFIG[ldap] = "--with-ldap=plugin,--without-ldap,openldap,"
> +PACKAGECONFIG[lz4] = "--with-lz4,--without-lz4,lz4,"
>  
>  # From native build in armv7a-hf/eglibc
>  CACHED_CONFIGUREVARS += "i_cv_signed_size_t=no \
> 

