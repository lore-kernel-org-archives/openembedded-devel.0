Return-Path: <guzaszymon@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id E20D87316B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2016 06:00:24 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id g141so1020937wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Sep 2016 23:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=vPIuQqnDNHosc4GztFvKwOBC+IguJha2713jp9QKQHQ=;
	b=J6XmrG0MsGTuUOovjiGRm6nJIfuyCoQl/YfKReo17EeZlZ33UNgiOBoa61RR7i8+T0
	Gi9rSR/isFxA0rJz5TK+ShLoSJIBaSeNDbsJ5t+9Px2fi25XSemZxgq0TdIyd8gnrfWH
	cB7CgdbeRS1MV00jTVD/X6Jw3zQZVORHhxWJtNdiSvP+bJ9NzyibVowtdgp1ElaGrnEn
	+ApOc93EO95Z/Lmb5KiyXL3RLyXWyxxecla6Tt+YSfIZvV1r4KwVopwLVUwSPhQuxCNW
	eHJnEtPevM4bimRY3udlVDeXYw4w1etfYyy/AJLHzL4+KbxQ/qAM/NIMq2Hlvx9RoiHY
	HhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=vPIuQqnDNHosc4GztFvKwOBC+IguJha2713jp9QKQHQ=;
	b=SLW1vzctnrIN4H6rdiEY4MAERtaFoWHCaMI3QQjhImszAKGTsCtc1NRJ8z1SLYlirY
	Ck2qRj3TMIHoeA+OEMEhQwnqp8UxqPg1StqSHkKAdfA4bRBTLUczvlbYPI6LwpXLthLg
	vuz/9xH76LXgUbQTO2cgIGNlgmwTvk8ncthktiu6VesFMsozrCInmhENaes8a9vJQ2Hw
	H6bgFiLK5V42Ecn2AuBP9S5llwLFZbe7oq5GUJ3CkXCwLVPyANZZqlM8mpykErQqsdyU
	jg8/DPx0xorBf2G5pIM67P4qNzsRxOxXC+jPsj/mT+bQ5yenVRBVBSPxGvyPGZy7jsrw
	hfQw==
X-Gm-Message-State: AE9vXwMarczLo9jrIX/DbEynd/BcTjJmLPUPGVovR3EbbqUzuA9EPRHTpDYiit8AoVq8m/AsFa3WutftYICwBA==
X-Received: by 10.194.173.102 with SMTP id bj6mr7666974wjc.22.1473660024340;
	Sun, 11 Sep 2016 23:00:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.15.2 with HTTP; Sun, 11 Sep 2016 23:00:23 -0700 (PDT)
In-Reply-To: <6dde3cd8-e6c9-7883-54a7-3603d57eb6dc@balister.org>
References: <CAO=ipHJL-FjdSgDE7pCaxUTjh-DcaMthn0y-X=PxqpJRiG+rvw@mail.gmail.com>
	<6dde3cd8-e6c9-7883-54a7-3603d57eb6dc@balister.org>
From: Szymon Guza <guzaszymon@gmail.com>
Date: Mon, 12 Sep 2016 08:00:23 +0200
Message-ID: <CAO=ipHLWUxu0FZeXizxawURPjZPCn1=0shH2g=L-+AfC=s4u6w@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [yocto] problem with openCV
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
X-List-Received-Date: Mon, 12 Sep 2016 06:00:25 -0000
Content-Type: text/plain; charset=UTF-8

Do you have any tips for me? Where should I search those patches? Or where
I can find recipes for more recent version? Or Can you tell me if there is
1.0 version for openCV available for Yocto?

2016-09-11 22:20 GMT+02:00 Philip Balister <philip@balister.org>:

> On 09/11/2016 02:10 PM, Szymon Guza wrote:
> > Hello,
> >
> > I want to create my own yocto disto image based on core-image-weston with
> > C/C++ compliers and openCV. But when I'm trying to bitbake openCV error
> > appears:
> >
> > | -- Configuring incomplete, errors occurred!
> > | See also "/home/admin/Zynq/poky/build/tmp/work/i586-poky-linux/
> > opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/CMakeFiles/CMakeOutput.log".
> > | See also "/home/admin/Zynq/poky/build/tmp/work/i586-poky-linux/
> > opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/CMakeFiles/CMakeError.log".
> > | WARNING: exit code 1 from a shell command.
> > | ERROR: Function failed: do_configure (log file is located at
> > /home/admin/Zynq/poky/build/tmp/work/i586-poky-linux/
> opencv/3.1+gitAUTOINC+
> > 92387b1ef8-r0/temp/log.do_configure.7661)
> > ERROR: Task 278 (/home/admin/Zynq/poky/meta-
> openembedded/meta-oe/recipes-
> > support/opencv/opencv_3.1.bb, do_configure) failed with exit code '1'
> >
> > It is connected with this:
> >
> > This recipe is *blacklisted* by the meta-oe
> > <https://layers.openembedded.org/layerindex/branch/master/layer/meta-oe/
> >
> > layer. The reason provided is:
> >
> > BROKEN: fails to build with gcc-6
>
> This is telling you you need to update the recipe by finding or writing
> patches so the opencv builds with gcc6. Try looking for a more recent
> version of opencv and/or patches to address the compile problems.
>
> Philip
>
> Philip
>
> >
> > ??
> > Am I right or openCV is now unavailable? Or Am i doing something wrong?
> > I am looking forward to hearing from you.
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

