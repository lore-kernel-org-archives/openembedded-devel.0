Return-Path: <eduardo@monkey.io>
Received: from mail-yw0-f169.google.com (mail-yw0-f169.google.com
	[209.85.161.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5406275D22
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Apr 2016 16:38:18 +0000 (UTC)
Received: by mail-yw0-f169.google.com with SMTP id g3so63655605ywa.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2016 09:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=monkey-io.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=C9i6oBJ9/LIFLXBPhCf6WgHl7jrEfV51TaoTJTxec7Q=;
	b=vWBTgndHdJ/1gEMELwStLHeTz4A2WeocZDUKbsop7GVgnaO5PpxR6UgM31r9UjfnG/
	3sBlN/3o5bzQQoV7QzhH6KkNDASYKu2sGIxJNFNnvsKOrmZqf90jPLB/0A0uzaE/lnCS
	wvwD8vB0Cno5++9M1GYFUd73RspkZv/0ylHtuOep4tlSEUuF0Ybo3WaZnP1uOSjFNzSg
	TrGoBuNb6R4hx2BvvVWirj70p0LX+xfTv9gRBpnf7bEMVQPp4NCvfnM9zgYV0cipo3gS
	J8+81xMFG1r4s4VjFuOcFOtGb5G8ML7kvJKaat6WdglUHsu1guY1xVgsJ1FxhdsQrQC0
	NH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=C9i6oBJ9/LIFLXBPhCf6WgHl7jrEfV51TaoTJTxec7Q=;
	b=P/EQ94g7SrhVPb3vjkf+tmdOvbeA6zokTAbxhawMGR2uEPr6yqrsevN/iF0Z45rxQ3
	KIBZLtxo0L7kWUkwgIE7eDzTzelxFuviEZLaLt0sgf9tCxFpKyhN3MTVEe8GOljFFgoz
	fthNiA9QQV+baHzg3bum/6YmYGixAag3U+ZVR29+Ge6n9RKRQSeiQ6S6FEdSpC8Er5lo
	BN48V5dJXLWb5zmM1RknXd0uivuiNndn+qAyAB6PpSYgnGNQMOy4P3CbArFVOM9vJoHy
	8jSnX88rrG+zvS+wqasIz7AyvUrHyaBB0wOROCHX2SgQiY8rUGclYgZXCCxpwdgRSblw
	3CsA==
X-Gm-Message-State: AD7BkJK7IXZYx/l8PIPwCpbU6DZdHApqmg8bMMtSxFasfHXuGApBGYPlr4NnlClXhkKFSvYx+PQHFeQ1rxKa9w==
MIME-Version: 1.0
X-Received: by 10.37.231.85 with SMTP id e82mr3113986ybh.130.1459960698487;
	Wed, 06 Apr 2016 09:38:18 -0700 (PDT)
Received: by 10.13.236.200 with HTTP; Wed, 6 Apr 2016 09:38:18 -0700 (PDT)
In-Reply-To: <5704E88E.2070402@felipetonello.com>
References: <1459750358-12047-1-git-send-email-eduardo@monkey.io>
	<5704E88E.2070402@felipetonello.com>
Date: Wed, 6 Apr 2016 10:38:18 -0600
Message-ID: <CAEaCVQjOC2sp3MWAntW4LU6mdDyb-T-CxJCBuXw1ivz3tiaHhA@mail.gmail.com>
From: Eduardo Silva <eduardo@monkey.io>
To: Felipe Ferreri Tonello <eu@felipetonello.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] fluentbit: add new recipe
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
X-List-Received-Date: Wed, 06 Apr 2016 16:38:23 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 6, 2016 at 4:44 AM, Felipe Ferreri Tonello <eu@felipetonello.com
> wrote:

> Hi Eduardo,
>
> On 04/04/16 07:12, Eduardo Silva wrote:
> > Fluent Bit is an open source data collector for Embedded Linux, this
> > patch adds the recipe for version 0.7.2.
> >
> >   Project web site: http://fluentbit.io
> >   Documentation   : http://fluentbit.io/documentation/
> >
> > Signed-off-by: Eduardo Silva <eduardo@monkey.io>
> > ---
> >  meta-oe/recipes-extended/fluentbit/fluentbit_0.7.2.bb | 15
> +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >  create mode 100644 meta-oe/recipes-extended/fluentbit/
> fluentbit_0.7.2.bb
>
> If the project package is called fluent-bit, why did you name the recipe
> fluentbit?
>

just to follow the convention of RPM and DEB packages.

regards,

