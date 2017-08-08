Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 0E0F571ABD
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 20:08:28 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1502222910; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=zvK7HsnXoPqy03MQeQnsuqbO6Cv1CD9SF5uV6bD5LOY=;
	b=wWkMDdzxjMO9UtTjwRmzUQEI9mSkMfjXlESHIyRFjLtojHCuF0Bik9u8mzpglnoyJn+EA3qm
	ZOCgKzK44Ti7YTwm26mccgfoD83r+jaHL2txi0PjdAQLm9eYhsS5y1xPG1mu4wWxKByDZyaq
	oKhF+qF85ChRUz3en8VBT1OSTK4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Cc: Content-Type;
	b=rKKBWPf8JYC+Yp3G+w3ZpeK80kgIZVJdnfuTQmSB3iFGGlDQKehNNV+9dTfB17o0FrMtTo
	EzHmLx3PZvQ+NpbMlo+30bvyOzVLxVXQBu7cMbePC/MGMt69MtChqTGgzkBEAHSQCCz/kYYp
	Ga/Nv5VwUgSPWPly9fAouMOOBcu/k=
Sender: derek@asterius.io
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mxa.mailgun.org with ESMTP id 598a1a3c.7fa670455070-smtp-out-n02;
	Tue, 08 Aug 2017 20:08:28 -0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id 76so9888570ith.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 13:08:28 -0700 (PDT)
X-Gm-Message-State: AIVw112mBK0SMAB1ye5/Wz+NLQs8G4IU5uMbTLbY0Mv9UChyO+TjF6cv
	Y6WV+eMbgwDIUDzXvLxrsLutyzTVPg==
X-Received: by 10.36.105.85 with SMTP id e82mr4849334itc.66.1502222907694;
	Tue, 08 Aug 2017 13:08:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.198.133 with HTTP; Tue, 8 Aug 2017 13:08:27 -0700 (PDT)
In-Reply-To: <CAMKF1spYSbHUEm43XPjDHmfryLz7Us8K9rR_jBgjtXSLR5rh-A@mail.gmail.com>
References: <1502212606-19666-1-git-send-email-derek@asterius.io>
	<CAMKF1spYSbHUEm43XPjDHmfryLz7Us8K9rR_jBgjtXSLR5rh-A@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Tue, 8 Aug 2017 16:08:27 -0400
X-Gmail-Original-Message-ID: <CADNbA1qpJhEc8uvgUC_pZc7gVeWu8WabTDDA3mNw=+iXVnwmAA@mail.gmail.com>
Message-ID: <CADNbA1qpJhEc8uvgUC_pZc7gVeWu8WabTDDA3mNw=+iXVnwmAA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-webserver][PATCH] nginx: update stable version to 1.12.1
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
X-List-Received-Date: Tue, 08 Aug 2017 20:08:30 -0000
Content-Type: text/plain; charset="UTF-8"

Good call.  I'll set my default similarity index to 20% instead of using
the built-in 50%.  Thanks.

On Tue, Aug 8, 2017 at 2:26 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Aug 8, 2017 at 10:16 AM, Derek Straka <derek@asterius.io> wrote:
> > Signed-off-by: Derek Straka <derek@asterius.io>
> > ---
> >  meta-webserver/recipes-httpd/nginx/nginx_1.12.0.bb | 6 ------
> >  meta-webserver/recipes-httpd/nginx/nginx_1.12.1.bb | 6 ++++++
> >  2 files changed, 6 insertions(+), 6 deletions(-)
> >  delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.12.0.bb
> >  create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.12.1.bb
> >
> > diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.12.0.bb
> b/meta-webserver/recipes-httpd/nginx/nginx_1.12.0.bb
> > deleted file mode 100644
> > index d3e15a8..0000000
> > --- a/meta-webserver/recipes-httpd/nginx/nginx_1.12.0.bb
> > +++ /dev/null
>
> you should configure git to detect copies a bit harder. Its easlier to
> review moves/renamed files then delete/add
>
> > @@ -1,6 +0,0 @@
> > -require nginx.inc
> > -
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=903753de5f86a1ee0341fd2f9491b2
> 82"
> > -
> > -SRC_URI[md5sum] = "995eb0a140455cf0cfc497e5bd7f94b3"
> > -SRC_URI[sha256sum] = "b4222e26fdb620a8d3c3a3a8b955e0
> 8b713672e1bc5198d1e4f462308a795b30"
> > diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.12.1.bb
> b/meta-webserver/recipes-httpd/nginx/nginx_1.12.1.bb
> > new file mode 100644
> > index 0000000..7f0e3ad
> > --- /dev/null
> > +++ b/meta-webserver/recipes-httpd/nginx/nginx_1.12.1.bb
> > @@ -0,0 +1,6 @@
> > +require nginx.inc
> > +
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=903753de5f86a1ee0341fd2f9491b2
> 82"
> > +
> > +SRC_URI[md5sum] = "a307e74aca95403e5ee00f153807ce58"
> > +SRC_URI[sha256sum] = "8793bf426485a30f91021b6b945a9f
> d8a84d87d17b566562c3797aba8fac76fb"
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

