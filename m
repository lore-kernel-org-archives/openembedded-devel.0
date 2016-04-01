Return-Path: <eduardo@monkey.io>
Received: from mail-yw0-f172.google.com (mail-yw0-f172.google.com
	[209.85.161.172])
	by mail.openembedded.org (Postfix) with ESMTP id 52CAA60110
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Apr 2016 16:53:40 +0000 (UTC)
Received: by mail-yw0-f172.google.com with SMTP id d68so35390131ywe.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2016 09:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=monkey-io.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=5ypqdIrtfplWIBJvUTdT2ZzDp2yo7d/6Bw++TT57C2w=;
	b=ouqGyCZzUiGCEHTvz3qfJ8lnPP7JfwBcK7xlX7mkCiNADBqs1zx3LFCANqVUHRYV9n
	jLxcFDtt7qvRTwOWkOYNfRzjP/oK0HIqANKd3hWivpdAA21d65hErnmgg6nTF/SKDFxE
	q08xo8GuVVeajEEoNsc3sBKdvpayfqf2SwTjQTvNBQFHi3nElG/jSPb0KlpLi85yHtzq
	4kjWIsEXjsmC+WNdYF9YWjzBG1lYUTR/sM9hKdZxP4BoTo84k7sF8nn71dOBuDIiO3wI
	QTFpuROoGNSMfvGVE7CI6l5Uplievl8pqXqhUsuuvFnKOpkoqS8TsKZ8eAZzy8y0KQqR
	GD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=5ypqdIrtfplWIBJvUTdT2ZzDp2yo7d/6Bw++TT57C2w=;
	b=L0qFTiU/0yKDemc+audBP9E13gQ0lNoqki31NLsTge5FgLKUt0YbmePu2EScILd/ip
	1VyVk4TdgIiD9aehXyx2xO5PpTceGNyVH7NmPqn7GJnqgbLaiHTfgb0lZXhvkZ/7XeeC
	3Jjrdd2Y6/+6S7YeOf8YMt7nzhz1YDmru38RtqAElgQa+cpnz3vNmZhii6XlMfUDEO5R
	At8yKyAo8pPE7pTZMDC7WpVqmyuPG8SLNzANIVpgHAnDR/reOSnXwBA1MGGgqvEEVB65
	7qvUM5vDfzbamVNwshzG4RdZmQ0xKVS95lDSNZw44TOpmzyiD/E9HSdBCChFEeEydfI6
	j9Eg==
X-Gm-Message-State: AD7BkJIKV0KnLH+ScCD4Yak+Klc/cF47MOmvopA02vV3xaSTKTgVWKTYKpBPJnd4i410O9dBEBFs5wiNChCoVA==
MIME-Version: 1.0
X-Received: by 10.129.31.139 with SMTP id f133mr3492296ywf.288.1459529621134; 
	Fri, 01 Apr 2016 09:53:41 -0700 (PDT)
Received: by 10.13.203.1 with HTTP; Fri, 1 Apr 2016 09:53:41 -0700 (PDT)
In-Reply-To: <20160401133809.GF2567@jama>
References: <1459406572-8144-1-git-send-email-eduardo@monkey.io>
	<20160401133809.GF2567@jama>
Date: Fri, 1 Apr 2016 10:53:41 -0600
Message-ID: <CAEaCVQjmZGJOX332YqUH8eLOAGURiKXS4-f40P6KqNE7FgZ9qQ@mail.gmail.com>
From: Eduardo Silva <eduardo@monkey.io>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] fluentbit: add new recipe
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
X-List-Received-Date: Fri, 01 Apr 2016 16:53:43 -0000
Content-Type: text/plain; charset=UTF-8

> +LIC_FILES_CHKSUM =
"file://${S}/LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"

>
> LIC_FILES_CHKSUM is relative to ${S}, so LIC_FILES_CHKSUM =
> "file://LICENSE.. should work fine
>
>
Thanks, I have updated my local copy


> > +
> > +RDEPENDS_${PN} = "zlib"
>
> If it does link with libz then the runtime dependency should be added
> automatically by shlibs code in package.bbclass if it's not the case
> can you add comment explaining why it needs to be added explicitly?
>
>
I added that because I got a QA warning message:

WARNING: QA Issue: fluentbit-dev rdepends on zlib, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: fluentbit rdepends on zlib, but it isn't a build
dependency? [build-deps]

what's your suggestion in this case ?

best



> > +
> > +inherit cmake
> > --
> > 2.5.0
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>


-- 
Eduardo Silva
Monkey Software

