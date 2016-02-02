Return-Path: <mbc@koumoul.net>
Received: from mail-yk0-f195.google.com (mail-yk0-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id C34BE771E8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Feb 2016 15:19:55 +0000 (UTC)
Received: by mail-yk0-f195.google.com with SMTP id z13so4219932ykd.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Feb 2016 07:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=wIjV3z2f6OizXiRJHTewcjj/xGIZukefMU0MK9UaQ3A=;
	b=euWxOiAmqwKprMG7oNnV0/kj32siWyQNn3Dm9Q9Y9IT/RKC8/mVWhRg4mz08OLgHGt
	wPZVdaU7xqiI8I4HHTpnNpLsuAru1tQ7sbXHYk8PM+OTYCW/euwkpnHNeGDKBH3beLpk
	EiABtIemSWy6HdF/oRVVrOx/+AYSN2VlpbEb0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=wIjV3z2f6OizXiRJHTewcjj/xGIZukefMU0MK9UaQ3A=;
	b=ihsq17dDq6qLEG2dwAYyUKhxvEYUBqeux5yzcbV6bBU8WC8L8NTzIfS/jovAfUWMz4
	K+p9vc7VDQ2LfPRGFsB9ZniDog1LFBLsf9gWqB2W4jD1T/i0KY/7lAiT0hm61MLP331v
	3SHNerODLSoAdk5BecFcggzVKHPFMn50hf6T1o+c9561AiUebVKNuF41C83NwegxJqAv
	l5Y3J4E6Xb1+NbiiBk2QC2E0JDJ73myoGuwX95g5uBahtNkrjeH48jOtNtfLLJuKxZse
	Ngp2H7Dcoz2eQQR+mWamw5Nm3u2/C+WFI7MpQoEVIrGOyKn9mDIJv1CjKWhSkPa6EReU
	qEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type;
	bh=wIjV3z2f6OizXiRJHTewcjj/xGIZukefMU0MK9UaQ3A=;
	b=kjw2PNZOZKJJdcaqmLptj/8IHo2rMHzRocNqvt/4xDph1KWDymHzhnzWMYmmamzG1R
	VHoAln2BF6FhepXkMUTXO8zfqS+LiHTdnyrfUBWfN93q+r0OSBbe5r5SJUEIwKrtAxtj
	+vDb6JNlgdFQ5OF4b/AbYqUiSKu1QU/jM3JMDwweV9zIHnZUViqDP5PIaP1yBmz1oSic
	J6s35vDgk1sLlCjZWtM5kxvUU7oOXzH3ojJ5RfDX6/BzQ6BMYxRSJCCe5gS3s6FjsN8K
	iNZI9BAU3lG/GwUEM6IPnQIfXd1XwkzTJEW2+8BgGsj6rUf96VPGAShSacqTBMdcJzdS
	LjWQ==
X-Gm-Message-State: AG10YORaoMxskApsqprHfGI07vtBY2x9kD7VKuUK4T1P03mqRDqnbeYWqwnFBCG23zznKjxXRCyoYeH6u4QO4g==
MIME-Version: 1.0
X-Received: by 10.37.68.69 with SMTP id r66mr4627969yba.14.1454426396312; Tue,
	02 Feb 2016 07:19:56 -0800 (PST)
Reply-To: manuel.bachmann@iot.bzh
Sender: mbc@koumoul.net
Received: by 10.129.123.4 with HTTP; Tue, 2 Feb 2016 07:19:56 -0800 (PST)
X-Originating-IP: [46.18.96.42]
In-Reply-To: <20160201150710.GC2639@jama>
References: <1453474271-26539-1-git-send-email-manuel.bachmann@iot.bzh>
	<20160201150710.GC2639@jama>
Date: Tue, 2 Feb 2016 16:19:56 +0100
X-Google-Sender-Auth: NsvCHenuoTklS3VHPpzOp65OLGg
Message-ID: <CANTDXNfeXMtnAw4bM6kMe9S7fy9nexs+x7wD1KGPOM_T5+qVyg@mail.gmail.com>
From: "Manuel Bachmann [ IoT.bzh ]" <mbc@iot.bzh>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2][meta-multimedia] gupnp: Update to 0.20.14
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
X-List-Received-Date: Tue, 02 Feb 2016 15:19:58 -0000
Content-Type: text/plain; charset=UTF-8

Hi Martin,

In fact, I already get this warning when building current 0.20.12
(meta-openembedded:master). But it is OK, I will post a rev. soon.

2016-02-01 16:07 GMT+01:00 Martin Jansa <martin.jansa@gmail.com>:

> On Fri, Jan 22, 2016 at 03:51:11PM +0100, Manuel Bachmann wrote:
> > From: Manuel Bachmann <mbc@iot.bzh>
> >
> > Update to latest version (required for latest Rygel).
>
> Causes new QA warning:
> gupnp-0.20.14: /usr/bin/gupnp-binding-tool_gupnp-dev contained in
> package gupnp-dev requires /usr/bin/python, but no providers found in
> its RDEPENDS [file-rdeps]
>
> >
> > Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
> > ---
> >  meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.12.bb |    8
> --------
> >  meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.14.bb |    8
> ++++++++
> >  2 files changed, 8 insertions(+), 8 deletions(-)
> >  delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/
> gupnp_0.20.12.bb
> >  create mode 100644 meta-multimedia/recipes-connectivity/gupnp/
> gupnp_0.20.14.bb
> >
> > diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.12.bb
> b/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.12.bb
> > deleted file mode 100644
> > index c8c6164..0000000
> > --- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.12.bb
> > +++ /dev/null
> > @@ -1,8 +0,0 @@
> > -require gupnp.inc
> > -
> > -SRC_URI = "${GNOME_MIRROR}/${BPN}/0.20/${BPN}-${PV}.tar.xz"
> > -SRC_URI[md5sum] = "c01aa6d3a78792b3a24591f036dd91f4"
> > -SRC_URI[sha256sum] =
> "205d47b950a1b7190df1115f454cb38a44d71aacfec75d4287299e400e139b69"
> > -
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7
> \
> > -
> file://libgupnp/gupnp.h;beginline=1;endline=20;md5=d78a69d9b6e63ee2dc72e7b674d97520"
> > diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.14.bb
> b/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.14.bb
> > new file mode 100644
> > index 0000000..ed07175
> > --- /dev/null
> > +++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.14.bb
> > @@ -0,0 +1,8 @@
> > +require gupnp.inc
> > +
> > +SRC_URI = "${GNOME_MIRROR}/${BPN}/0.20/${BPN}-${PV}.tar.xz"
> > +SRC_URI[md5sum] = "63346ef90ac5cd925c3a941f51d8bca6"
> > +SRC_URI[sha256sum] =
> "77ffb940ba77c4a6426d09d41004c75d92652dcbde86c84ac1c847dbd9ad59bd"
> > +
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7
> \
> > +
> file://libgupnp/gupnp.h;beginline=1;endline=20;md5=d78a69d9b6e63ee2dc72e7b674d97520"
> > --
> > 1.7.10.4
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

