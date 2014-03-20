Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9D3006E9A3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2014 06:11:42 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id uy17so1161616igb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Mar 2014 23:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=G1Ti8KYQVpjVP/CFSYYpQh6FRoy28WPFemFJ+FNnyxA=;
	b=SOFlDuwjkTh28dMHcoHTGZu71VciEdSTxi3wJVGK14L2am1oIO687pvW9oYHTlvImy
	QwJ/YdBhBxOUKiQ4EXNdlduou6ej6FeqDAKcue53kLb++i8VPWGVIi++r1pcp2YXSPDD
	HkIhtaVL1qWetrhps2djQzV8CpNiqI87PrRj0BfYso2Wgay92BEi3WXZu0LTlYdXL6zK
	n1CORx+WZSqwHRVgohADb6kkYw/bR/zQlCePrprRlSme8y/hARwY172Lsi6XY04If2C6
	L4bS5DtqYVlpoXU4Y3ECdS+FhhD1WBCsjYXQSkwFbCFCuzqucgsgci1Jm43umgyufnk5
	2y8A==
X-Received: by 10.42.61.4 with SMTP id s4mr256497ich.58.1395295903393; Wed, 19
	Mar 2014 23:11:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.224.136 with HTTP; Wed, 19 Mar 2014 23:11:12 -0700 (PDT)
In-Reply-To: <1395117284-22655-1-git-send-email-stephen.arnold42@gmail.com>
References: <1395117284-22655-1-git-send-email-stephen.arnold42@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Mar 2014 23:11:12 -0700
Message-ID: <CAMKF1sqUgd3VyHWGns38yh=Q3svQsvErOPt7QgV0kA73rvJYVg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH v3] recipes-xfce/libxfce4ui: depends and autotools fixes
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
X-List-Received-Date: Thu, 20 Mar 2014 06:11:44 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 17, 2014 at 9:34 PM, Stephen Arnold
<stephen.arnold42@gmail.com> wrote:
> -EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
> +EXTRA_OECONF += "--enable-maintainer-mode --disable-debug  --with-vendor-info=${DISTRO}"
>
> -do_configure_prepend() {
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[gladeui] = "--enable-gladeui,--disable-gladeui,glade3"
> +PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
> +
> +do_src_prepare() {
>         NOCONFIGURE=yes ./autogen.sh
>  }
>
> @@ -27,3 +31,5 @@ FILES_${PN}-dev += "${libdir}/glade3/modules/*.la \
>  PACKAGES += "${PN}-glade"
>  FILES_${PN}-glade = "${libdir}/glade3 \
>                       ${datadir}/glade3"
> +
> +addtask do_src_prepare before do_configure after do_patch


well just override complete do_configure since you are regenerating everything
something like below might do the trick.

do_configure() {
        ./autogen.sh --noconfigure
        oe_runconf
}

