Return-Path: <gurrieristefano@gmail.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6C8B776FED
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Nov 2015 15:30:57 +0000 (UTC)
Received: by iodd200 with SMTP id d200so146912586iod.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Nov 2015 07:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=031rPH8Zwaz1CtVXIamrc+TH4+8BEjbJttcez4Lezz8=;
	b=QhzxfhY+CLrofMtfVSa5TSVErW61AO03fCb6eyZ5ycJ85cLpxYWUg/KhmZSSdOrswe
	3pmRip7p9mfzRaMkwFs0Z08ZMF3OgprWLm7Kr5kySdefdnQWjWRZhcx6fgsBGMiVvxXn
	N/VAJ9uByTWEPiuHf/WLIn281kJRoh7HfCRicnUr9+y/UIjl/OBvBx6tAq6Vd5ACOMQb
	MrhjSjbSEVtLkcBT6E3MSewPB2tz4wY2Flb8SjaYmbG5v+Fin/g+rMlAhz5bvS5NM8w2
	hYJPXO1f4qex0AubqmYFf7U92dIJ/ZytinOp0lBD2ZI+vaVG2SvRYTraB+rS09GqaYVM
	vjCg==
MIME-Version: 1.0
X-Received: by 10.107.150.12 with SMTP id y12mr26880110iod.52.1446478257847;
	Mon, 02 Nov 2015 07:30:57 -0800 (PST)
Received: by 10.107.192.5 with HTTP; Mon, 2 Nov 2015 07:30:57 -0800 (PST)
In-Reply-To: <CAFQ+DiiJi_1mYLmzqgmxA_WN4UhKFevLPybs7huXYYjKrZ0ftQ@mail.gmail.com>
References: <CAKpvFF2FXDnVtPvOcA59s-x=ux+97Xo+Mv_V5ZKdCRCJAu+tuQ@mail.gmail.com>
	<CAFQ+DiiJi_1mYLmzqgmxA_WN4UhKFevLPybs7huXYYjKrZ0ftQ@mail.gmail.com>
Date: Mon, 2 Nov 2015 16:30:57 +0100
Message-ID: <CAKpvFF3m5kekh0afgNRteOhXrSoZ5SeNgDrv_H1=RMx4=K3Hxw@mail.gmail.com>
From: Stefano Gurrieri <gurrieristefano@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: media player videowidget Qt5.4.2
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
X-List-Received-Date: Mon, 02 Nov 2015 15:30:58 -0000
Content-Type: text/plain; charset=UTF-8

Do you know the package name to append at my IMAGE_INSTALL ?

Thanks a lot Marco.

2015-11-02 16:24 GMT+01:00 Marco Cavallini <cavallini.koan@gmail.com>:

> You are missing the gstreamer video sink.
> The problem may be related to Gstreamer rather than Qt.
> --
> Marco Cavallini | KOAN sas | Bergamo - Italia
> embedded and real-time software engineering
> http://www.KoanSoftware.com
>
> 2015-11-02 15:39 GMT+01:00 Stefano Gurrieri <gurrieristefano@gmail.com>:
> > Hi people,
> >
> > I've just compiled my Qt5.4.2 and installed them on my target.
> > But when I try to run some apps demo as videowidget or player, I always
> see
> > these messages:
> >
> >
> > (videowidget:642): GStreamer-CRITICAL **: gst_object_ref_sink: assertion
> > 'object != NULL' failed
> > No m_videoSink available!
> >
> > (videowidget:642): GStreamer-CRITICAL **: gst_element_set_state:
> assertion
> > 'GST_IS_ELEMENT (element)' failed
> >
> >
> > I think the problem is "No m_videoSink available!". What miss in my linux
> > system?
> > In my file local.conf I add PACKAGECONFIG_append_pn-qtmultimedia = "
> > gstreamer" to enable the option gstreamer 1.0
> >
> > Thanks a lot for the help!
> > Stefano
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

