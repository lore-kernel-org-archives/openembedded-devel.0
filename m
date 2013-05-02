Received: from mail-vc0-f180.google.com ([209.85.220.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UXv5v-0001IK-9S
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 May 2013 17:06:52 +0200
Received: by mail-vc0-f180.google.com with SMTP id hv10so536905vcb.25
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 May 2013 07:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=PsMlO2ADZj2YX/e6WGkypzov9/vWc1bVJ/wwOIv610Q=;
	b=iWUOhbVgPRcEsOSQGzz5ce6STG9h4nIby9ZrP0q2a16LHy1v1SEpzV5sjRTO/C8FLB
	xNaAUCWuz5BOzf3m1bLHaCN615ud9E0ZghVTi1nfO+7yrPXSmxhj4MwlUz1/C1uGrGvD
	Im5anFEo/XANmhjV3C7ghwbJ5vRx4uGEjU/FwmR6Z1qipDU8ZjMfGamLKAmwO5xf9mVx
	sPc0WTHR6xDYX9GIemnbg6u0DN1R5sMhCyDnHE4j5nt9O3bMtF/LG4XDT5lTkYfxTek7
	xnw09jSZeD0Fb1E01oDZRySnZ+1H3I2PnK8shM5II4byWO1uR+oTz4iTltAZa6RmcaM5
	Vjmw==
MIME-Version: 1.0
X-Received: by 10.52.88.2 with SMTP id bc2mr1967770vdb.27.1367506137421; Thu,
	02 May 2013 07:48:57 -0700 (PDT)
Received: by 10.52.139.33 with HTTP; Thu, 2 May 2013 07:48:57 -0700 (PDT)
In-Reply-To: <CALbNGRSZ-H-+0yZuf4uvYbLEqXdUzTuMLXMhc63BtrZPieYyLA@mail.gmail.com>
References: <1367087640-4264-1-git-send-email-schnitzeltony@googlemail.com>
	<1367087640-4264-2-git-send-email-schnitzeltony@googlemail.com>
	<20130427193111.GF3199@jama>
	<CALbNGRSZ-H-+0yZuf4uvYbLEqXdUzTuMLXMhc63BtrZPieYyLA@mail.gmail.com>
Date: Thu, 2 May 2013 16:48:57 +0200
Message-ID: <CALbNGRQ63OrcZY9i-qvc0ERzGTsnTMiY101dAgr7keNBVDrpWQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-gnome/meta-xfce 1/4] gdm: fix postinst-code to unbreak first boot issues
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 May 2013 15:06:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 29, 2013 at 9:33 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Sat, Apr 27, 2013 at 9:31 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>> On Sat, Apr 27, 2013 at 08:33:57PM +0200, Andreas M=C3=BCller wrote:
>>> Exiting postinst code leaves systemd.bbclass offline postinst code unex=
ecuted,
>>> causes postinst not to finish at first boot (gdm.service is not aliased=
 to
>>> display-manager.service -> started much too early) and is not neccesary=
:
>>> language preparation can be done offline.
Just learned that the chown code does not belong to do_install. Shall
I send a V2 or a follow up?

Andreas


