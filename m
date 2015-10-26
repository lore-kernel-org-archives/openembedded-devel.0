Return-Path: <stephanoc@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 5028F73695
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2015 16:32:11 +0000 (UTC)
Received: by pacfa8 with SMTP id fa8so13821109pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2015 09:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=FWnsDgL75qjIM8ppK8IJuHqJ/mnQAbhWJEJ+0uSL8y4=;
	b=wi9F2+1vAynpSwYD4DqKfoxdXliJF87fAZvh5HEBquImcfo5+sdXEBo87Of72K/q8J
	uo9DO/Ed0ErANjW1fn9oPbQFzW4ve2HWNMhzE5+Le8nTwEufkV5R02qqs+BYJ/46/N+h
	E2yVlH8EfUS0PzPzgHcjDe8g/yqP13hhRzQ4j7akeJ0aTTyE/sWNl/3rk8zE4E3XSTQv
	pwAtHcRd9pZLembHzDtjLn+LMWhBASw+bJQ/ki6j9JsZ6xrGyqLxB+HeYRyjcyJYJjUB
	gJPDY9X9aTSO+e7h2wxtnq+DrAPQmjXlbTsK59XusVdW8e43adylXWn5RPzFMZ86d3FY
	ackw==
X-Received: by 10.66.155.5 with SMTP id vs5mr22716100pab.108.1445877131960;
	Mon, 26 Oct 2015 09:32:11 -0700 (PDT)
Received: from mail.spox.systems
	(ec2-52-11-37-43.us-west-2.compute.amazonaws.com. [52.11.37.43])
	by smtp.gmail.com with ESMTPSA id
	ub4sm19245318pac.29.2015.10.26.09.32.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 26 Oct 2015 09:32:11 -0700 (PDT)
Date: Mon, 26 Oct 2015 16:32:02 +0000
From: Stephano Cetola <stephanoc@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151026163201.GA20355@mail.spox.systems>
References: <CAKpvFF1Us5xk3EFTUE1oo5xF14CNZOkJmHN5_uR9o8_CRxSmVQ@mail.gmail.com>
	<CAB25Ju4q9v8_WPXbmpj_dAy7oasaiyRM2fhN5Gyrr7ZexgSmxQ@mail.gmail.com>
	<CAKpvFF32BXGy2_qr=xRpxc4tf4EHN2pWS2X7dWWJ4+ebhSGDxQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKpvFF32BXGy2_qr=xRpxc4tf4EHN2pWS2X7dWWJ4+ebhSGDxQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: qtmultimedia + qt5.3.2 + yocto dizzy
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
X-List-Received-Date: Mon, 26 Oct 2015 16:32:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 10/23, Stefano Gurrieri wrote:
> Hi Stephano,
> thanks for your fast reply.
> 
> I tried to follow this link, but without success.
> Specifically, I tried to add:
> 
> PACKAGECONFIG_append_pn-qtmultimedia= " gstreamer010" in my local.conf
> 
> and I've added this part of code in qtmultimedia.inc recipe:
> 
> do_configure_prepend() { # disable openal test if it isn't enabled by
> PACKAGECONFIG sed -i 's/^qtCompileTest(openal)/OE_OPENAL_ENABLED:
> qtCompileTest(openal)/g' ${S}/qtmultimedia.pro # disable gstreamer-0.10
> test if it isn't enabled by PACKAGECONFIG sed -i 's/^\( *\)qtCompileTest(
> gstreamer)/\1OE_GSTREAMER010_ENABLED:qtCompileTest(gstreamer) {/g' ${S}
> /qtmultimedia.pro}
> and removed patches:
> 
> SRC_URI += "\
>     file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
>     file://0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch \
> "
> 
> present in my original qtmultimedia.inc file.
> 
> Then I bake my qt5-custom-image successfully. Now, on my target, in
> /usr/lib/qt5/plugins/mediaservice, I see:
> libgstaudiodecoder.so  libgstcamerabin.so  libgstmediacapture.so
> libgstmediaplayer.so
> 
> but when I try to run (for example) videowidget application or player
> application, I see these error:
> 
> GStreamer-CRITICAL **: gst_object_ref_sink: assertion 'G_IS_OBJECT
> (object)' failed

Hmmm, I have never seen this error. Sounds like some Gstreamer plugins
may be missing.

Have a look at this custom image:

http://wiki.wandboard.org/index.php/Building_Qt5_using_yocto_on_Wandboard

I have used that in the past to successfully test video. Perhaps there
are some packages in that image that you are missing. Hope this helps.


> 
> 
> Could you help me?
> Thanks a lot.
> Stefano
> 
> 2015-10-22 22:47 GMT+02:00 Stephano Cetola <stephanoc@gmail.com>:
> 
> > Ciao Stefano,
> >
> > Take a look at this thread:
> >
> > https://community.freescale.com/message/391750#391750
> >
> > You are missing libgstmediaplayer.so. That link should help get you
> > the right packages installed.
> >
> >
> >
> > On Thu, Oct 22, 2015 at 7:23 AM, Stefano Gurrieri
> > <gurrieristefano@gmail.com> wrote:
> > > Goodmorning,
> > > I tried to compile Qt5.3.2 in my Yocto dizzy successfully etc…
> > > … but when I try to run (on my target based on iMX6) a videowidget
> > > application or player application… I always have the same error:
> > > defaultServiceProvider::requestService(): no service found for -
> > > "org.qt-project.qt.mediaplayer"
> > > and I can’t to see a video. In /usr/lib/qt5/plugins/mediaservice I’ve
> > only
> > > libqtmedia_audioengine.so library. Missing gstreamer multimedia service
> > > plugins?
> > >
> > > Could you please help me?
> > >
> > > Thanks a lot.
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

