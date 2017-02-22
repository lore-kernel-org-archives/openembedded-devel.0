Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 95C24605BA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 20:55:10 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id b80so7526642lfe.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 12:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SeKjRMGGVQmcDyZIAODTbc3L1ty4OcW7ccveCYCYr/o=;
	b=PeQfg9rxKYZyn/z6VmW/h74dfU5IV0j5VHA9CycO1x/2YM4fkrqQE2iJx5TNw9BDYp
	L1mksL0cKXg3LuErviRjuXWPlfwIb6vnPXRcb8EFLy7LibriEPd+ZLNd/t6LagR4e16N
	yOfrIlyx7MXiJU4kxOxt4IAfWKzOS090iaKtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SeKjRMGGVQmcDyZIAODTbc3L1ty4OcW7ccveCYCYr/o=;
	b=oUgr0zDOi3eRXlgKOuqlMAj+BCPgaLqckHSwCA8+Jo0N404RZOcaf+J1f82jPs1H54
	EzKVdkHlvC3iiPEQHJfYr6T7ml2X6ewXXPvvwoJ7MEv7Xrcy3UgpbtagWe5EMUrVfW+a
	1BXhfuLOjbNhCyTYlXNywtw+PEmgapcvaE2dNhwDU8Vq5Kw5UTx49gLv8HLRF08Os9JM
	PDAjcReOWIgwuglPCaFXvd3EIeV5wSWMyRdDqI+qdzt5JCgbMHlOXbIKncBuKNmKVq47
	J8pYCJ9PYXKCjUxD6ZbsxnSuPOUnDZztXiKu0d1hqXEj77Nx5bijp+bwzX+6iLOolerG
	8iUg==
X-Gm-Message-State: AMke39lu5oqqh7HkLzXNwDzjbX+GYaVMShAkywLVd9XuAw9jDDhsDa2qlHtUCF1QnmNl0g0PvTcRE/cbHg05DAAv
X-Received: by 10.46.92.201 with SMTP id q192mr4561553ljb.78.1487796910950;
	Wed, 22 Feb 2017 12:55:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.156.10 with HTTP; Wed, 22 Feb 2017 12:55:10 -0800 (PST)
Received: by 10.25.156.10 with HTTP; Wed, 22 Feb 2017 12:55:10 -0800 (PST)
In-Reply-To: <20170222204736.GG3283@jama>
References: <1487785536-13777-1-git-send-email-derek@asterius.io>
	<20170222204736.GG3283@jama>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Wed, 22 Feb 2017 12:55:10 -0800
Message-ID: <CADfgfobBp60s+GjqS3zRrO-z4HUhe8zFi51GPzceDFAKQVGf=Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "Lamego, Jose A" <jose.a.lamego@intel.com>,
	openembedded-devel@lists.openembedded.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Patchwork not picking changes from the ML Was: [meta-python][PATCH] python-paho-mqtt: update to version 1.2
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
X-List-Received-Date: Wed, 22 Feb 2017 20:55:11 -0000
Content-Type: text/plain; charset=UTF-8

I've seen several issues with hooks. I was working on them yesterday and
will continue today.

These are currently managed by hand but we are moving them into
configuration management which should help keep them working consistently.

On Feb 22, 2017 12:47 PM, "Martin Jansa" <martin.jansa@gmail.com> wrote:

> On Wed, Feb 22, 2017 at 12:45:36PM -0500, Derek Straka wrote:
> > Signed-off-by: Derek Straka <derek@asterius.io>
>
> It's not your fault Derek, but most of the patches from today and based
> on the pings from today also some earlier patches didn't make it into
> patchwork. This one is the only exception.
>
> Michael, Jose: are you aware of some issues with patchwork? Could it be
> caused by the default Reply-to change from yesterday (or day before
> during OEDAM)?
>
> I know only about issues processing merged changes:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10967
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10759
>
> And also UI issue in patchwork that paging doesn't work, e.g.:
> https://patchwork.openembedded.org/bundle/jama/
> master-next/?submitter=&state=&q=&archive=both
> shows that there are 5 pages of changes (which should be in most cases
> marked as accepted by the hook above), but clicking on 2nd page produces
> link which drops the query parameters:
> https://patchwork.openembedded.org/bundle/jama/master-next/?page=2
> so it says "No patches to display"
>
> Regards,
>
> > ---
> >  .../python/{python-paho-mqtt_1.1.bb => python-paho-mqtt_1.2.bb}
>  | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta-python/recipes-devtools/python/{python-paho-mqtt_1.1.bb =>
> python-paho-mqtt_1.2.bb} (68%)
> >
> > diff --git a/meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb
> b/meta-python/recipes-devtools/python/python-paho-mqtt_1.2.bb
> > similarity index 68%
> > rename from meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb
> > rename to meta-python/recipes-devtools/python/python-paho-mqtt_1.2.bb
> > index b8f5f3f..c8acfc5 100644
> > --- a/meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb
> > +++ b/meta-python/recipes-devtools/python/python-paho-mqtt_1.2.bb
> > @@ -11,5 +11,5 @@ RDEPENDS_${PN} = "\
> >                 python-threading \
> >  "
> >
> > -SRC_URI[md5sum] = "a6407b74eb5e5411e157be1de5c11366"
> > -SRC_URI[sha256sum] = "0f7a629efe6e3a2c61b59d3550aa9f
> 2c4529b5689a65fde45e6f1ac36b9a261e"
> > +SRC_URI[md5sum] = "241150b3fcb920ddca4d33181f3238b1"
> > +SRC_URI[sha256sum] = "9100a6aa706ab699d414ec02705a21
> eb66f436184691d0bf1f2a85a6213c6c1f"
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
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

