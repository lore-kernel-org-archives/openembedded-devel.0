Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
	[209.85.216.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6B7907F9A3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Nov 2019 16:46:15 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id gc1so5333066pjb.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Nov 2019 08:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=BmP2Tt7TMY8WkZ4/AI/em/+8hnHF4zSjjSjTgbHkFac=;
	b=LHc+dLXDsWteLSryJyEvfcWZKIAANa6RZ8F4Nf96gs3zRlY+Lhdq0CUyh/ybCoaH4z
	tOziEp6Nom/CdRff0nuc++pBx/21xoKWCTy3Gq/CqoTqBI6yxQp7rss8E7vLX/zkNhL8
	dqZMApsi+G2VhTPizt6/C12L6DZgbojNb2BpAyqh11dgPrV7QS0Dhz/2lJQARrd61oU9
	NK5L5zRqjbh4ANTNVZE7bfptLE/UmnWRugFTyOHeMNBDcrnhMWfH1QQoU670qzsQS8fc
	DcC51G3JJCFbJ6wRil9S2Wxa/zFEyPWvTgbjHGFSrtLnZuB3roIUZR48mJvaP7FYa0pE
	ncWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=BmP2Tt7TMY8WkZ4/AI/em/+8hnHF4zSjjSjTgbHkFac=;
	b=jSV8dboIqFq5krJhOsHO19fnHAOhlR3iN1NEsztAsnVjyU7RKn6Kll2lyISY3SKh3u
	BsiQOazmLXkTA5CvjoWK9yeP2IWtp4sIIPuQvEpYBtQfr+/++4RF9+RpB2AWRS31aq3f
	s/r4OCB+WOXxs7+qHxW7ajbLgunejom2luvz218BXVNZCYFVMkNCVWi6G7VRn5T0rSL+
	DMzG2r/VYAHkK3egiJD4QL/3a0EqkZIDs+3Rth4z2Ur68A7Gvbjb+qNDa/mpN63jkgLg
	o0xsRFf3I3oLC7VMfvlYsjprDvNQWx8SQjHEWbjk3LJvu298NkqSg5gtAtAJzhEanY/y
	ZzUw==
X-Gm-Message-State: APjAAAWI1no5eDC/w8+abkV8lLVNG1gpl32MenNyNDT2tCFIASkZpewP
	zWvyjLl+Dch845/YDbaZrvxmTjN5
X-Google-Smtp-Source: APXvYqzC1fqmLKFGR7iDMIN9OkjoEVNs/kdmQjCeSGrx3J82HOIlVD/TJcCfDrjemen3dLg2AIHz6Q==
X-Received: by 2002:a17:902:7898:: with SMTP id
	q24mr24816834pll.3.1574613976198; 
	Sun, 24 Nov 2019 08:46:16 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:69ac:e4d2:e89f:98da?
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id
	f13sm5155663pfa.57.2019.11.24.08.46.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Nov 2019 08:46:15 -0800 (PST)
To: Niko Mauno <niko.mauno@iki.fi>, openembedded-devel@lists.openembedded.org
References: <20191123134631.81271-1-niko.mauno@iki.fi>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <2c4e2cac-ff7b-d598-b0a8-f2d8de2d1201@gmail.com>
Date: Sun, 24 Nov 2019 08:46:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191123134631.81271-1-niko.mauno@iki.fi>
Subject: Re: [meta-oe][warrior][PATCH 1/2] gitpkgv.bbclass: Use --git-dir option
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
X-List-Received-Date: Sun, 24 Nov 2019 16:46:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

wrong ml

On 11/23/19 5:46 AM, Niko Mauno wrote:
> From: "niko.mauno@vaisala.com" <niko.mauno@vaisala.com>
>
> Avoid redundant shell working directory change by resorting to
> '--git-dir' option for git command instead.
>
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/classes/gitpkgv.bbclass | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/meta-oe/classes/gitpkgv.bbclass b/meta-oe/classes/gitpkgv.bbclass
> index 2d9680a35..22609f584 100644
> --- a/meta-oe/classes/gitpkgv.bbclass
> +++ b/meta-oe/classes/gitpkgv.bbclass
> @@ -87,10 +87,8 @@ def get_git_pkgv(d, use_tags):
>  
>                  if not os.path.exists(rev_file) or os.path.getsize(rev_file)==0:
>                      commits = bb.fetch2.runfetchcmd(
> -                        "cd %(repodir)s && "
> -                        "git rev-list %(rev)s -- 2> /dev/null "
> -                        "| wc -l" % vars,
> -                        d, quiet=True).strip().lstrip('0')
> +                        "git --git-dir=%(repodir)s rev-list %(rev)s -- 2>/dev/null | wc -l"
> +                        % vars, d, quiet=True).strip().lstrip('0')
>  
>                      if commits != "":
>                          oe.path.remove(rev_file, recurse=False)
> @@ -105,9 +103,8 @@ def get_git_pkgv(d, use_tags):
>                  if use_tags:
>                      try:
>                          output = bb.fetch2.runfetchcmd(
> -                            "cd %(repodir)s && "
> -                            "git describe %(rev)s 2>/dev/null" % vars,
> -                            d, quiet=True).strip()
> +                            "git --git-dir=%(repodir)s describe %(rev)s 2>/dev/null"
> +                            % vars, d, quiet=True).strip()
>                          ver = gitpkgv_drop_tag_prefix(output)
>                      except Exception:
>                          ver = "0.0-%s-g%s" % (commits, vars['rev'][:7])


