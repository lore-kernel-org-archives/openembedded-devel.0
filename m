Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 951687198A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 19:05:39 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id l1so7093405wrc.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 12:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=whHO0+EPXIDoSz0E5r3x3OwB8u/WbulE+Lhj4wZAHJs=;
	b=rHX4+SzqoreCOpyenHReRsYtrXzB9RDJi9yPmyxqVg7JmFAT//GwFk34E8Eqy+ZTN1
	/a32tar7A2a43m+u/M4W1XZeWkcLooTXav0nl7apZz8TC0W3VEAQE9dFNwjL0IqaFBce
	aMOOvrPaHBLl/eJ6WktGabAVfbwPL0Uqxfc/UKw4Ccxp+2p7KvxolheWn1/PF6bVhF2d
	ksL7ze8XfAyjabEc0NVGot7of5NdhWBC01UMF+Jm3yL3jr4ukQSYQFPupPTeSJY/ToXB
	TpUhDTv1vyhDm+1a3i1H7zq0O637h6+30YJdjp58OSP5cajhB7ghXzoLkdKhtFttj4tj
	rWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=whHO0+EPXIDoSz0E5r3x3OwB8u/WbulE+Lhj4wZAHJs=;
	b=jR9wyObjP9VYQiEbsOU/hdnH4DQliLEREONvGQtXb1dVi1qYL7XWDJJQKpSiV5MAOU
	FGvAW+v4w73a0ZaDpJIYqJxaLtcOz14FHL8pDz3GhwnIVc1x10rd92wMuwDm6xUSH0tJ
	0s4Fx7qgoU06tPHC/eX9Km2uW8aNpKj2YIRbJy0n6ewBlgv8oXUPaNeUhLjIIkNlEu9A
	8CELXR5R5oiKoC8q/95BCmlx3AjWCn5TgNs/mIWMjvmxRBfqugK8fA17Q+9vbCBJCmVm
	YkXuUojwiDe3zAAOzHk9tBSnHZj1I0QMO87hdjXf7VgoP9U39sz+GY1UFLEeIHLAaFld
	o0Gw==
X-Gm-Message-State: AMCzsaVo6CyTQN8zVBZ+TcthTXR66ittCTAA3n8fe7m1swGKXTsNtFmx
	vahThiXfHg6ogkG0VgvI7e5D+KCP0WxTS6LLjkA=
X-Google-Smtp-Source: ABhQp+Rf+Y/5DYek3xU9e7nKyy3eadrilCgAd1XRtxej/+n9DArf/rYXpJGLq1NHnB7q5gGCwKe4mDyki2zYgUp1yYM=
X-Received: by 10.223.196.156 with SMTP id m28mr1348241wrf.67.1509131140324;
	Fri, 27 Oct 2017 12:05:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Fri, 27 Oct 2017 12:05:39 -0700 (PDT)
In-Reply-To: <50f1d37c-2b92-e26b-2403-57c438b43381@zonque.org>
References: <20171017195649.8657-1-s.sonski@gmail.com>
	<20171017195649.8657-2-s.sonski@gmail.com>
	<CA+chaQcK6+mS9SgBTaNdzgLdDS=nhoHNj1crFtPeirxnK1m87Q@mail.gmail.com>
	<8cfe1d21-f003-031b-ae42-024f3be91910@zonque.org>
	<20171026125505.GW9221@denix.org>
	<689fd8ec-97bf-2451-0c7a-1bc4606458e5@zonque.org>
	<20171026133646.GX9221@denix.org>
	<50f1d37c-2b92-e26b-2403-57c438b43381@zonque.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 27 Oct 2017 21:05:39 +0200
Message-ID: <CA+chaQcd+9G5=BTnQTzrGVwj3AKz2tGB3zPc19ze0bkTtSq3JQ@mail.gmail.com>
To: Daniel Mack <daniel@zonque.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "Chris E. Rallis" <Chris.Rallis@ravenind.net>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 2/2] qmake5_base: add OE_QMAKE_OBJCOPY from OBJCOPY
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
X-List-Received-Date: Fri, 27 Oct 2017 19:05:40 -0000
Content-Type: text/plain; charset="UTF-8"

I've dropped the "qmake5_base: add OE_QMAKE_OBJCOPY from OBJCOPY"
change, so now I have only following 3 included:


== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
2c3ef00 qt5: add missing commercial license
not included in master yet:
bbb3044 meta-qt5: Update to 5.9.2 release
8fd20e8 nativesdk-qtbase Enable objcopy for qmake
60329bc qt5-ptest.inc: fix qtxmlpatterns:do_install_ptest out-of-order call


and it still fails the same as shown in:

http://errors.yoctoproject.org/Errors/Build/47776/

I'm going to drop the 2nd objcopy change and retrigger the builds.

On Fri, Oct 27, 2017 at 7:53 AM, Daniel Mack <daniel@zonque.org> wrote:

> On Thursday, October 26, 2017 03:36 PM, Denys Dmytriyenko wrote:
> > On Thu, Oct 26, 2017 at 03:07:36PM +0200, Daniel Mack wrote:
> >> On Thursday, October 26, 2017 02:55 PM, Denys Dmytriyenko wrote:
> >>> On Tue, Oct 24, 2017 at 03:33:10PM +0200, Daniel Mack wrote:
> >>>> Hi,
> >>>>
> >>>> On Saturday, October 21, 2017 12:54 AM, Martin Jansa wrote:
> >>>>> Either this or the ptest change seems to cause:
> >>>>> http://errors.yoctoproject.org/Errors/Details/157417/
> >>>>
> >>>> FTR, I see the same error locally. Reverting both 8fd20e8b1
> >>>> ("nativesdk-qtbase Enable objcopy for qmake") and 5ec6b97a8
> >>>> ("qmake5_base: add OE_QMAKE_OBJCOPY from OBJCOPY") in the master-next
> >>>> branch of meta-qt5 fixes things for me.
> >>>
> >>> Have you tried bisecting by any chance?
> >>
> >> bisect what exactly? If I take your patch out of my stack, qtbase
> >> builds. If I don't it doesn't. Can I provide more information somehow?
> >
> > That's not what you said above - we are trying to figure out which of
> the 2
> > (*two*) patches causes the breakage, hence the question about
> bisecting...
>
> Ah, sorry, my bad.
>
> Only reverting "qmake5_base: add OE_QMAKE_OBJCOPY from OBJCOPY" fixes a
> build that does not have a native sdk target. I assume the 2nd patch
> would break a native sdk, but I can't tell.
>
> I can provide full build logs if you want.
>
>
> Thanks,
> Daniel
>

