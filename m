Return-Path: <gizero@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id F109171ABC
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Sep 2017 06:03:51 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id j189so616869vka.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Aug 2017 23:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=h06n8k21kozkxMtWM1uFrwTnHkNu0IbsaMhCAsCzszc=;
	b=eYr3OiBA4nXsQuOgMY5ftOLlPn27enGwQ4pO9iLHwsODR4DrtoPn7jKpIjXDhMzy3V
	kvcajMeXgvF85l9jFq++K6fZtGaFF18WJeA5h0c+dupDD1ZQUhHN9+BMV3sO2R8KUy+/
	BGww8DBGX185TE8hLElSYzB65tiGLP88HXOxuuLGZHcm3vjn+89pOY5K+NCWQLQXh6T3
	76EqsXUljzoaOcII/UZW9COJvx1RFtpICpDLD7B/pTcJovcHfPtYjKTl5H7glrSDtu6H
	lWA7rIhhzJhunv01Ctt3WVJK1bTR3dLvl6JTS25bqp2qFdJg1CW/x1K8eKznGIa9Yz1M
	U4tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=h06n8k21kozkxMtWM1uFrwTnHkNu0IbsaMhCAsCzszc=;
	b=lLwmwvDRmuxoeUG4JxSQGDiH9jwcJ7Aw4YynlptGYByN3UbJ4k31VH5V01Dn89XxQ8
	JJAzWJOK32enuL0kBHAy0oHTlMdwNcP00wGKLUHhUSBfKoHp0pI9UZjaiYcdMI8KTK1h
	WnExr5pHoNzvAc/wBnCULxUIesYRDbBd+Ce+zF1l7rVgY+RurkGi30Y/2simIlbPWXWB
	L8hmdmP+CG1KacrYCp9HtqPbBMGCH2BXvW9789QqEPNPk7USFOKhWZJiH03HG3u73uC2
	XMnbaH/EHGQJrrKGfQOaYt5fY01uCDTwMQ9jyn39lZ3BTLNQlQPlyR1d3AX61Fqgt6xv
	pO2A==
X-Gm-Message-State: AHPjjUivpJmKevn8toGtNGCZPhRbAYEjfTpm/vEWfU13wBvMXxyC8RRV
	OFpuyiReZ4tPAqOukTYNrHwmeCyn6LHN
X-Google-Smtp-Source: ADKCNb5aIsMmrklfxRm/g7vCKx1mjn/YcYoySX49nEsUMSfUFI14Hc9VKRbWNqjzly9sjfLjjSiQ5IEFiJxGjjI8wmE=
X-Received: by 10.31.86.197 with SMTP id k188mr522553vkb.196.1504245832598;
	Thu, 31 Aug 2017 23:03:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.93.42 with HTTP; Thu, 31 Aug 2017 23:03:52 -0700 (PDT)
In-Reply-To: <C8465E87-50F5-4857-8835-3B8D7D25D6C8@linux.intel.com>
References: <cover.1504238509.git.paul.eggleton@linux.intel.com>
	<C8465E87-50F5-4857-8835-3B8D7D25D6C8@linux.intel.com>
From: Andrea Galbusera <gizero@gmail.com>
Date: Fri, 1 Sep 2017 08:03:52 +0200
Message-ID: <CAC+thW1YCXd-RGakNnfx-j8z3W0Cq9wwTORWNzv9bt=7VKSC2w@mail.gmail.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 0/2] Add a couple of MQTT support recipes
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
X-List-Received-Date: Fri, 01 Sep 2017 06:03:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 1, 2017 at 6:44 AM, Tim Orling <timothy.t.orling@linux.intel.com
> wrote:

>
> > On Aug 31, 2017, at 9:02 PM, Paul Eggleton <
> paul.eggleton@linux.intel.com> wrote:
> >
> > Add a couple of recipes from meta-intel-iot-middleware to support MQTT.
> > Since the meta-intel-iot-middleware layer isn't being actively maintained
> > and these aren't in any way Intel-specific I figured they ought to be
> > brought up-to-date and moved somewhere that people can more easily reuse
> > them.
> >
>
> Thank you for this. It has been a concern of mine and this is a welcome
> solution.


Good news for me also! FWIW months ago there used to be a more recent
version of meta-intel-iot-middleware hosted on github as part of Ostro.
Since this was confusing to me I asked [1] on the list to clarify
maintenance status and relationships between the two things, but only got a
reply [2] from a former maintainer of the repo on yoctoproject.org. Anyway
I agree that having MQTT recipes in meta-oe will help! Thanks Paul for
that!

[1]
https://lists.yoctoproject.org/pipermail/meta-intel/2016-December/004462.html
[2]
https://lists.yoctoproject.org/pipermail/meta-intel/2017-January/004488.html


> > FWIW, at least mosquitto is something I plan on using personally, and
> > I'm more than happy sign up to maintaining these in future.
> >
>
> I also plan on using mosquitto, so I am happy to help maintain as well.
>
> >
> > The following changes since commit e5681e1dca96d3f313b3b2b346789f
> 22483d7881:
> >
> >  layer.conf: remove FREESMARTPHONE_GIT variable (2017-08-31 14:22:12
> +0200)
> >
> > are available in the git repository at:
> >
> >  git://git.openembedded.org/meta-openembedded-contrib paule/mqtt-recipes
> >  http://cgit.openembedded.org/meta-openembedded-contrib/log/
> ?h=paule/mqtt-recipes
> >
> > Paul Eggleton (2):
> >  mosquitto: add from meta-intel-iot-middleware and update
> >  paho-mqtt-c: add recipe from meta-intel-iot-middleware and update
> >
> > .../mosquitto/files/build.patch                    | 94
> ++++++++++++++++++++++
> > .../mosquitto/files/mosquitto.init                 | 89
> ++++++++++++++++++++
> > .../mosquitto/files/mosquitto.service              | 15 ++++
> > .../mosquitto/mosquitto_1.4.14.bb                  | 80
> ++++++++++++++++++
> > .../paho-mqtt-c/files/makefile.patch               | 25 ++++++
> > .../paho-mqtt-c/paho-mqtt-c_1.2.0.bb               | 35 ++++++++
> > 6 files changed, 338 insertions(+)
> > create mode 100644 meta-oe/recipes-connectivity/
> mosquitto/files/build.patch
> > create mode 100644 meta-oe/recipes-connectivity/
> mosquitto/files/mosquitto.init
> > create mode 100644 meta-oe/recipes-connectivity/
> mosquitto/files/mosquitto.service
> > create mode 100644 meta-oe/recipes-connectivity/mosquitto/
> mosquitto_1.4.14.bb
> > create mode 100644 meta-oe/recipes-connectivity/
> paho-mqtt-c/files/makefile.patch
> > create mode 100644 meta-oe/recipes-connectivity/paho-mqtt-c/
> paho-mqtt-c_1.2.0.bb
> >
> > --
> > 2.9.5
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

