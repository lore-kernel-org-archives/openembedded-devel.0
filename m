Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id CBCED72F70
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 15:56:12 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1488297374; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=48cWtJqmYe2kDG68HolFr6/HbJVZr1wRYQ1z4LR/fjA=;
	b=Ab/4VqHo/kvsn+inymHl4VzYmbtHYWvye5IxbAMHXlZU5SARVomF9I+KB93zd7jox9SnPuAn
	+LXWTWuJi40P45ZeEQJhu+brWIi8igaBec3iEnm/Mk2Kt3XWftNY4UwrWKnKBcpqN6m4vGZt
	J460p+Miu1qin8wroORF/GswwjM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Cc: Content-Type;
	b=VTrj2yN1EsYlz0XsIaEbaKhvtCqLduPtku5CxA7r6ALhpHe+wmuWyO8nSZqX6XSvhxbhet
	u2khGBNkp+i12f6Sx/dNEQcPjlD0UB2SDPSEgnHYQkSC6IB/Dt0w0NDXgk44sqJkUDS9S5Bu
	5JzD6WzhY5gOnhnAYmSo8Nn6GLXFU=
Sender: derek@asterius.io
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mxa.mailgun.org with ESMTP id 58b59d9d.7f8ed05b2af0-smtp-out-n03;
	Tue, 28 Feb 2017 15:56:13 -0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id y135so1859325itc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 07:56:13 -0800 (PST)
X-Gm-Message-State: AMke39nsNGVGzOZnC+wRFPCQ3qEIncq3IHBUz8iPRTlSmj+OJ8GHw2IdDbeZDRpXa+BuG0TJS5t0ndsOOYwc0w==
X-Received: by 10.36.82.22 with SMTP id d22mr3691665itb.0.1488297372697; Tue,
	28 Feb 2017 07:56:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.156.85 with HTTP; Tue, 28 Feb 2017 07:56:12 -0800 (PST)
In-Reply-To: <741960ebbae947bd8fa4297e4f60cd88@XBOX02.axis.com>
References: <1487973264-29272-1-git-send-email-derek@asterius.io>
	<CA+chaQdjpaUPga2h0rN8BFdjsubgrc8M+LxQhJ0K0cQ6FXJaog@mail.gmail.com>
	<741960ebbae947bd8fa4297e4f60cd88@XBOX02.axis.com>
From: Derek Straka <derek@asterius.io>
Date: Tue, 28 Feb 2017 10:56:12 -0500
X-Gmail-Original-Message-ID: <CADNbA1rWZhyFBGEQaeAJo19CFLkZ51KZ8ESourT+yM7H06vdZQ@mail.gmail.com>
Message-ID: <CADNbA1rWZhyFBGEQaeAJo19CFLkZ51KZ8ESourT+yM7H06vdZQ@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] syslog-ng: update inherit to work correctly with RSS
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
X-List-Received-Date: Tue, 28 Feb 2017 15:56:13 -0000
Content-Type: text/plain; charset=UTF-8

This patch can been dropped and we can use Peter's update instead.

On Tue, Feb 28, 2017 at 10:33 AM, Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> > Martin Jansa
> > Sent: den 28 februari 2017 10:24
> > To: Derek Straka
> > Cc: openembedded-devel
> > Subject: Re: [oe] [meta-oe][PATCH] syslog-ng: update inherit to work
> > correctly with RSS
> >
> > Now it complains about libtool version :/
> >
> > http://errors.yoctoproject.org/Errors/Details/134288/
>
> I have a solution for this where it executes autoreconf twice
> to make it work. I do not really know why that is necessary, or
> why it changed with RSS, but at least it seems to work. syslog-ng
> has sub-projects with their own autotools files, and that has
> probably got something to do with it...
>
> I will also include an update to version 3.8.1 that I have been
> meaning to provide for a while now.
>
> > On Fri, Feb 24, 2017 at 10:54 PM, Derek Straka <derek@asterius.io>
> > wrote:
> >
> > > Resolves build issue exposed by RSS
> > > http://errors.yoctoproject.org/Errors/Details/130631/
> > >
> > > Signed-off-by: Derek Straka <derek@asterius.io>
> > > ---
> > >  meta-oe/recipes-support/syslog-ng/syslog-ng.inc      | 2 +-
> > >  meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb | 2 --
> > >  2 files changed, 1 insertion(+), 3 deletions(-)
> > >
> > > diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> > > index 21d1748..0dbcc6e 100644
> > > --- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> > > +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> > > @@ -22,7 +22,7 @@ SRC_URI = "http://www.balabit.com/
> downloads/files/syslog-ng/sources/${PV}/source
> > >             file://configure.ac-add-option-enable-thread-tls-to-manage-.patch
> \
> > >  "
> > >
> > > -inherit autotools systemd pkgconfig update-rc.d
> > > +inherit autotools gettext systemd pkgconfig update-rc.d
> > >
> > >  EXTRA_OECONF = " \
> > >      --enable-dynamic-linking \
> > > diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb
> b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb
> > > index bee1e19..73609af 100644
> > > --- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb
> > > +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb
> > > @@ -13,5 +13,3 @@ SRC_URI += " \
> > >
> > >  SRC_URI[md5sum] = "e9f401615e92e5eb27396c995c1446ba"
> > >  SRC_URI[sha256sum] = "7be11df31ac7d716f1f952e22b5ae8
> e2049edd633a41b223776a853d9106f4e7"
> > > -
> > > -PNBLACKLIST[syslog-ng] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130631/"
> > > --
> > > 2.7.4
>
> //Peter
>

