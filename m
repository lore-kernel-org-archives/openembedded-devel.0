Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
X-Greylist: delayed 303 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 23 Dec 2016 14:21:22 UTC
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id E527A77218
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Dec 2016 14:21:22 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1482502883; h=Content-Type: To: Subject: Message-ID: Date:
	From: References: In-Reply-To: MIME-Version: Sender;
	bh=LD7ahtXLgD6FJmQiJQX0v3Ino3+TLSniEE5w6W32AXw=;
	b=J2/xGCU2C2RKYjGWRimkUvbY6nwrhz7v5GT54zPr3Xo0d2758QxHLNqDiBM2SKmaxRMxkcPC
	qw5RWVHlj43giTgQ16ZB8w75xG/Sa6q5hX8K3dQK5nzj4k3eNtxgaRiidR8DBjZnAbYnf9WP
	zb7XABZC1mV+GjdeAdwZlu0AwzQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Content-Type;
	b=dO8/zPzkqgo60Y1w6YcGnebzyn964oMPl1p1m3ro3wxMQMpDD4YflYIR7FM4p/3vTCSG7h
	JnL7JE7hsOG8F92xKlVvxOJmwQ+GaDcJiEIycArJAAogwFAgdg+QRfmjLDBcHz6rKPDs2O97
	9EQ+U4MHBDksUxzVkB6A6dya68hOk=
Sender: derek@asterius.io
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mxa.mailgun.org with ESMTP id 585d31b3.7fee08ca8d70-smtp-out-n01;
	Fri, 23 Dec 2016 14:16:19 -0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id h133so18075753ioe.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Dec 2016 06:16:19 -0800 (PST)
X-Gm-Message-State: AIkVDXKyGusb1XFibiah8n8YwreX3dOugqv+b+yNVVQ6OoaJtJ74yV5NYZOouaD8iPpebgf3cmJGCHGK7wC+BQ==
X-Received: by 10.107.137.233 with SMTP id t102mr9020397ioi.233.1482502578618; 
	Fri, 23 Dec 2016 06:16:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.191.2 with HTTP; Fri, 23 Dec 2016 06:16:18 -0800 (PST)
In-Reply-To: <20161223060645.zxhknpoqi7bkfo43@ad.chargestorm.se>
References: <1482421531-29836-1-git-send-email-derek@asterius.io>
	<20161223060645.zxhknpoqi7bkfo43@ad.chargestorm.se>
From: Derek Straka <derek@asterius.io>
Date: Fri, 23 Dec 2016 09:16:18 -0500
X-Gmail-Original-Message-ID: <CADNbA1rGRKuck_s=uvsntmWTiErEOTEzQc_SebnjVu-ZBevKdQ@mail.gmail.com>
Message-ID: <CADNbA1rGRKuck_s=uvsntmWTiErEOTEzQc_SebnjVu-ZBevKdQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH] python3-wekzeug: update RDEPENDS to pull in http module
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
X-List-Received-Date: Fri, 23 Dec 2016 14:21:33 -0000
Content-Type: text/plain; charset=UTF-8

Agreed.  It is self-contained.  It looks like it just fell through into
misc. I can submit a patch tomorrow to oe-core to create a new package.
Until that gets accepted, depending on misc will be a necessary evil to use
the full functionality.

-Derek

On Fri, Dec 23, 2016 at 1:06 AM, Anders Darander <anders@chargestorm.se>
wrote:

> * Derek Straka <derek@asterius.io> [161222 16:46]:
>
> > Signed-off-by: Derek Straka <derek@asterius.io>
> > ---
> >  meta-python/recipes-devtools/python/python3-werkzeug_0.11.11.bb | 2 ++
> >  1 file changed, 2 insertions(+)
>
> > diff --git a/meta-python/recipes-devtools/python/python3-
> werkzeug_0.11.11.bb b/meta-python/recipes-devtools/python/python3-
> werkzeug_0.11.11.bb
> > index af2d86a..145a1de 100644
> > --- a/meta-python/recipes-devtools/python/python3-werkzeug_0.11.11.bb
> > +++ b/meta-python/recipes-devtools/python/python3-werkzeug_0.11.11.bb
> > @@ -1,2 +1,4 @@
> >  inherit pypi setuptools3
> >  require python-werkzeug.inc
> > +
> > +RDEPENDS_${PN} += "${PYTHON_PN}-misc"
>
> How much of python3-misc is actually needed? Just running du -sh gave
> me:
> 4.2M tmp/work/armv5e-oe-linux-gnueabi/python3/3.5.1-r1.0/
> packages-split/python3-misc/usr/lib/python3.5/
>
> If `http` doesn't require much of the other stuf in python3-misc, could
> you split out python3-http?
>
> Not that I'm using python3-werkzeug, but I've been contemplating it...
>
> Cheers,
> Anders
>
> --
> Anders Darander, Senior System Architect
> ChargeStorm AB / eStorm AB
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

