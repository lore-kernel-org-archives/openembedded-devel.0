Return-Path: <cavallini.koan@gmail.com>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3353C76E70
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Nov 2015 15:24:09 +0000 (UTC)
Received: by lffz202 with SMTP id z202so63351842lff.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Nov 2015 07:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=OC3moaL8gSijA7PPGVVrlrwGVecjr1vjHNdX7mPzCCc=;
	b=1H7409dIhfb9XUZR+lfx0jHhOmiJWLhHTZIwZKm5A52aWG9pmVLl2sSEiyy2yPe8Fu
	GAO/ZU5+oJFXASGXeOq1nKSH1JSRUNAlqJp7I1h0RagcGNgowRPa98xPew0gIWu5IvmK
	vc8s3zfnmmTS3MIzovKxqBAKM5jm8maUibHdjpEuZcXzoudMA5NuZ4XqbYlfZUyxpTCs
	DzniY3VXWCMsotctwV3TfZTB5n4om2b/NF49ZCPESPTh+t+WPgGJqQBnXABvViP+eA1W
	DBzqMBm1fiSrGoRvuXdpEDqlmL/6c1mo9aO8lTysax9mlZckbpSJVSD05BFYMAGgkO5I
	mVcQ==
MIME-Version: 1.0
X-Received: by 10.25.89.210 with SMTP id n201mr6625969lfb.87.1446477848106;
	Mon, 02 Nov 2015 07:24:08 -0800 (PST)
Received: by 10.25.60.4 with HTTP; Mon, 2 Nov 2015 07:24:08 -0800 (PST)
In-Reply-To: <CAKpvFF2FXDnVtPvOcA59s-x=ux+97Xo+Mv_V5ZKdCRCJAu+tuQ@mail.gmail.com>
References: <CAKpvFF2FXDnVtPvOcA59s-x=ux+97Xo+Mv_V5ZKdCRCJAu+tuQ@mail.gmail.com>
Date: Mon, 2 Nov 2015 16:24:08 +0100
Message-ID: <CAFQ+DiiJi_1mYLmzqgmxA_WN4UhKFevLPybs7huXYYjKrZ0ftQ@mail.gmail.com>
From: Marco Cavallini <cavallini.koan@gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Mon, 02 Nov 2015 15:24:10 -0000
Content-Type: text/plain; charset=UTF-8

You are missing the gstreamer video sink.
The problem may be related to Gstreamer rather than Qt.
--
Marco Cavallini | KOAN sas | Bergamo - Italia
embedded and real-time software engineering
http://www.KoanSoftware.com

2015-11-02 15:39 GMT+01:00 Stefano Gurrieri <gurrieristefano@gmail.com>:
> Hi people,
>
> I've just compiled my Qt5.4.2 and installed them on my target.
> But when I try to run some apps demo as videowidget or player, I always see
> these messages:
>
>
> (videowidget:642): GStreamer-CRITICAL **: gst_object_ref_sink: assertion
> 'object != NULL' failed
> No m_videoSink available!
>
> (videowidget:642): GStreamer-CRITICAL **: gst_element_set_state: assertion
> 'GST_IS_ELEMENT (element)' failed
>
>
> I think the problem is "No m_videoSink available!". What miss in my linux
> system?
> In my file local.conf I add PACKAGECONFIG_append_pn-qtmultimedia = "
> gstreamer" to enable the option gstreamer 1.0
>
> Thanks a lot for the help!
> Stefano
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

