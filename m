Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id B6F6D7F35D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2019 01:04:47 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 205so8316928pfw.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2019 18:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:user-agent:mime-version:content-transfer-encoding;
	bh=rf20JUsItNN0QmUw59F0O/GjZlyayFhKhM+XJRYfnIY=;
	b=GxkTEujLtmmFUvtsxbtgW87/tal1/lnqLEoAe8QKDRCkT0cM9+9D3GL2TkVJO6DFLc
	fNgSaRXDvBffnLa41bNhqOCSscBEfu9YB1PlmncI31k7/bUzWwEsjyeMU3li+xoYTfj/
	89n1wWX3CRTnGihMPWdbIDRggoO2nTwlQ+gm7mNSkCe23Ma+RZCq++R75qJO61wCensw
	ByC6ELsUTMeBjrW7n8JAvsl8aIfZ1GULFy1IxBum+7JpmggpxNWSi7ED52+gJuwfS8w0
	AZ3KDoPh1/sapFXuElEDM9hTy3b8MDOLR3HZRht/+ozKj+9akoZHu3ylbmE7iLiEr1PY
	5Mtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=rf20JUsItNN0QmUw59F0O/GjZlyayFhKhM+XJRYfnIY=;
	b=sjxQsijCbVtGraEIuh8D3Hw07fu4nGbaBk18bsFUAC+PnvFtoSA0xv/vQdTj/sZU1B
	romxxFft2P5oszNEybTjKcn16NIMhFHaMe1W2EBDaNmu1PZHiFcAsviuIA8WvlSZNAFS
	JHZ+75UcjGTSmTyO9IDWQ1rN7/mAs9533Ozq3wwlwVILPbCTnodhwDpizQxjLd5r+o3s
	dLNjo7EeQWPngc/4QHWodIezueL9qHaeN8DDeP1KZlE05r1wOMz41J7HS+Zbs2l3L1VK
	Cv6XManCOVDNZ8lAcyzV3eF6yp+ZOXPW8qDYkmu0RRAC3XtQHxKl0z8WuMQp5gG0I1ar
	gE7w==
X-Gm-Message-State: APjAAAUAoccpdedQ5poT61TaurDaUUhu3uxJVtcsWrYd3yvTCz9Hxcoj
	Hbb1jNhRn4jkWjw3rE7XfjYL8RPP90M=
X-Google-Smtp-Source: APXvYqxIYrucxqn8fzD0A+q2x0xX863rTJKDtYVMau5xcczzKRDWZU4Jd2PRWj39D2LN4ul5EFpi+A==
X-Received: by 2002:a63:4181:: with SMTP id o123mr6828850pga.301.1570928688533;
	Sat, 12 Oct 2019 18:04:48 -0700 (PDT)
Received: from tyche ([2601:646:8500:1c20::3d0e])
	by smtp.gmail.com with ESMTPSA id
	k17sm6367317pgh.30.2019.10.12.18.04.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 12 Oct 2019 18:04:47 -0700 (PDT)
Message-ID: <cf9719c92e3cee65d9bda6d2a68fd7bbefa215c0.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Trevor Gamblin <Trevor.Gamblin@windriver.com>, 
	openembedded-devel@lists.openembedded.org
Date: Sat, 12 Oct 2019 18:04:47 -0700
In-Reply-To: <20191011151148.39463-1-Trevor.Gamblin@windriver.com>
References: <20191011151148.39463-1-Trevor.Gamblin@windriver.com>
Organization: HIMVIS LLC
User-Agent: Evolution 3.34.1 
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] rsyslog: upgrade from 8.1908.0 to 8.1910.0
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
X-List-Received-Date: Sun, 13 Oct 2019 01:04:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Trevor

I have taken the security fix patch for master and then backported it
to zeus. that means this patch now needs to be rebased on top of latest
master, can you resend it after rebase please ?

On Fri, 2019-10-11 at 11:11 -0400, Trevor Gamblin wrote:
> From: Trevor Gamblin <trevor.gamblin@windriver.com>
> 
> Upgrade to latest version for CVE-2019-17040 fix plus
> other upstream bug fixes.
> 
> [GitHub Issue] -- https://github.com/rsyslog/rsyslog/pull/3875
> 
> CVE: CVE-2019-17040
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>  .../rsyslog/{rsyslog_8.1908.0.bb => rsyslog_8.1910.0.bb}      | 4
> ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.1908.0.bb =>
> rsyslog_8.1910.0.bb} (98%)
> 
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1908.0.bb
> b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
> similarity index 98%
> rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.1908.0.bb
> rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
> index bbb4b119a..f50f9a34b 100644
> --- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1908.0.bb
> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
> @@ -29,8 +29,8 @@ SRC_URI_append_libc-musl = " \
>      file://0001-Include-sys-time-h.patch \
>  "
>  
> -SRC_URI[md5sum] = "6e9aa4ef4cad8ae49affa0a786cc9e2f"
> -SRC_URI[sha256sum] =
> "f8c8e53b651e03a011667c60bd2d4dba7a7cb6ec04b247c8ea8514115527863b"
> +SRC_URI[md5sum] = "6d4d94359d083f449f089b8dbb93c423"
> +SRC_URI[sha256sum] =
> "0219ee692f31a39743acb62aaf4196b644ce94edf386df4605fd6a11a4fe0c93"
>  
>  UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/releases"
>  UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
> -- 
> 2.18.1
> 


