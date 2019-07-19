Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id F04107F1D4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2019 20:45:10 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id q22so61130409iog.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2019 13:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LjUyIeM4gb068bP2oRsrZ1x03Mz1IUvGxFpPh7N4r9M=;
	b=kpukhXlf0myo8oVWwmjVPUmio9d8AGPcGSRFFZ0ISQmneqkJq2RfTIDKvJj3KAAfIc
	RIZ+7UjqroFb+A9ReAil/J1F+OgRUVKwOO7YdjA0mgJ8sHVJ1ES0mhtFr6+TBhfrIUsI
	jNKdq5cJNsSD7SMv5sMtz7HwFYwS/998sJToDjN9dtcAVQFYIpTvFMJUdhPDX6PtiygB
	uIXLRp72mWivh/vdPyyTxFg/eKJVxxzIuuhhIXz4CeDYnhG7LSsV475R+Fzs7jn1R/io
	Gd3R1KRZlFg6uHcaDUDR97QR4HL9CDBC3tQet79402R8gPmXZBInMgMkjBoZ5gmB2h/+
	WsSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LjUyIeM4gb068bP2oRsrZ1x03Mz1IUvGxFpPh7N4r9M=;
	b=Es/ajN2YEOg9BFpVYv0wMuAZR9hou3UTKBStC8v0J3mA4FwaepTLHyC0NiMP2QmIKY
	DJY+Nn8fGuNpl49KtLsVp+ZpNs/j9u6zPgVttgONsBk49t1G5Bn7KfSCWv4tVxYaQdqI
	ZQ2bHgX9JKpicBoNRZhKLKK1YrcFbxiLIq2smt/MjFz74/GZ2BUiA+fCkMfGHFTnkkko
	OaX8C0XEPvGgMKFcEtmXB7GahYf0pawVbOP7QgXtz3ZpuJzgSHM8Y710RUJSCwVDDfOA
	N6zUWTsLWvD32dotrGi+D2FNti3A+pepLMyyt/4pW4Nj8yCTeEy1PSdzXmMx9MYFdy6e
	jvKw==
X-Gm-Message-State: APjAAAWlbDOmK75RW+ceZi2yBW8pkOIYWr6GhrpBrwZRdW8ubW+urzql
	jy1VABWVStuU3ukswCeItmyxK4oo0wRUBKAzkZCpKQ==
X-Google-Smtp-Source: APXvYqxY0nDHW2wCM9Ju/JlS0pwqyfHXkxg6pdQReMY5egiihdbIwjzAMlLFdB4OrAmSgBCYhHGgsN4GePXWCOOo9nU=
X-Received: by 2002:a02:3093:: with SMTP id
	q141mr57848000jaq.128.1563569111973; 
	Fri, 19 Jul 2019 13:45:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190719134256.1854-1-alex.kiernan@gmail.com>
In-Reply-To: <20190719134256.1854-1-alex.kiernan@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 19 Jul 2019 21:45:00 +0100
Message-ID: <CAJTo0Lb7E-oe-X_mZS9ESDqOfQyGnJQ=D=SBAGpmCh=MOZsgQA@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] zstd: New recipe
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
X-List-Received-Date: Fri, 19 Jul 2019 20:45:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jul 2019 at 14:43, Alex Kiernan <alex.kiernan@gmail.com> wrote:
> +PACKAGE_BEFORE_PN += " \
> +    ${PN}-compress \
> +    ${PN}-decompress \
> +    ${PN}-frugal \

Is there a good reason to do this?

Ross

