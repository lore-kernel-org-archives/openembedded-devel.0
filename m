Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 5536872FA8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Mar 2017 18:58:51 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1488394732; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=GJcKn0SX/gNkUE61QWFkF54uZ8O2o1VcwwP/lVNvUcE=;
	b=dB/7gxCsh40j0gbcA0AfcCUJGlLbO5QL/KaZBOfk0tOg+AITMk8TeUVkOpbUih3KOcMCweP6
	K1/zb+C5VnmQu3Ge2BUDrC2FHoWtB9kUoE9i8n/q15tmxFRDNnYv6VWYkfXLCcfDl1CXhl98
	QFvrSbSgJ24xciI8JX21W+uP7us=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Cc: Content-Type;
	b=agX7TnV1M7nawkYZXMCSfvLsdgL4WcJI6hDDsyHuwu/bwmpsU1upTRr/2eKwUmrsPA0jsz
	sAQHPuWdrRGETjWe1zGPVLGJ08J/mKX8Oc+YH4jaeC61/Yp75TSRWgkyo7mhKmtjxUEgav4m
	Oz0FE/WKYdm+Pqocu8jqy4n1dxXyM=
Sender: derek@asterius.io
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mxa.mailgun.org with ESMTP id 58b719eb.7f1804219470-smtp-out-n03;
	Wed, 01 Mar 2017 18:58:51 -0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id 68so8248805itg.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Mar 2017 10:58:51 -0800 (PST)
X-Gm-Message-State: AMke39klh6GuJ0tnkIhIbr99eXg760262A0iXYTpqBJexS1P8SrlutUzrMttVDbR2IqhICCFWP0r+PmGMlj0UQ==
X-Received: by 10.36.70.21 with SMTP id j21mr1282174itb.41.1488394730611; Wed,
	01 Mar 2017 10:58:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.17 with HTTP; Wed, 1 Mar 2017 10:58:50 -0800 (PST)
In-Reply-To: <20170301185614.GD3290@jama>
References: <1488317150-20810-1-git-send-email-derek@asterius.io>
	<20170301185614.GD3290@jama>
From: Derek Straka <derek@asterius.io>
Date: Wed, 1 Mar 2017 13:58:50 -0500
X-Gmail-Original-Message-ID: <CADNbA1pG37X6EFce0HunXuWfes9KNTVsdvEfDTHJF71v_oX9uA@mail.gmail.com>
Message-ID: <CADNbA1pG37X6EFce0HunXuWfes9KNTVsdvEfDTHJF71v_oX9uA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-ruby][PATCHv2] bundler: resolve build issues with RSS
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
X-List-Received-Date: Wed, 01 Mar 2017 18:58:52 -0000
Content-Type: text/plain; charset=UTF-8

I have no idea then because it builds on my jenkins instance with and
without gold.  Someone who uses ruby can look into a fix.  Thanks.

On Wed, Mar 1, 2017 at 1:56 PM, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Tue, Feb 28, 2017 at 04:25:50PM -0500, Derek Straka wrote:
> > Signed-off-by: Derek Straka <derek@asterius.io>
>
> Fails the same as v1:
> http://errors.yoctoproject.org/Errors/Details/134457/
>
> > ---
> >  meta-ruby/recipes-devtools/ruby/bundler_git.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-ruby/recipes-devtools/ruby/bundler_git.bb
> b/meta-ruby/recipes-devtools/ruby/bundler_git.bb
> > index f2d8f3c..8388cc3 100644
> > --- a/meta-ruby/recipes-devtools/ruby/bundler_git.bb
> > +++ b/meta-ruby/recipes-devtools/ruby/bundler_git.bb
> > @@ -26,8 +26,8 @@ SRC_URI = " \
> >
> >  inherit ruby
> >
> > +DEPENDS += "zlib"
> > +
> >  RDEPENDS_${PN} = "git"
> >
> >  BBCLASSEXTEND = "native"
> > -
> > -PNBLACKLIST[bundler] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130640/"
> > --
> > 2.7.4
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

