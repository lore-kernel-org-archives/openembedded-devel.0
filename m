Received: from mail-ey0-f178.google.com ([209.85.215.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1Qiwwo-00013Z-Fq
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jul 2011 01:09:59 +0200
Received: by eye4 with SMTP id 4so2086409eye.37
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2011 16:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=U5NeOW4MNDH+JdnELxUt78DcwEUZ2Zi1dOPBXzcNcGc=;
	b=RaWUKPt8PYZZShv4aLBXM/Uyvb6r5ZQB3z4qm9HtOtPccz2BESdglJJAKjs2LTNpbN
	3oNOXl8WyG7umMrSXpJXtzxglXiT5U26CVl//ZRofT3dHCPDOPg+DQi/HA6czWwLtj6s
	cCm3fl2juoaaoSAr8V9NppQWMevnjcHnBsspQ=
MIME-Version: 1.0
Received: by 10.213.13.220 with SMTP id d28mr40164eba.60.1311030353736; Mon,
	18 Jul 2011 16:05:53 -0700 (PDT)
Received: by 10.213.105.210 with HTTP; Mon, 18 Jul 2011 16:05:53 -0700 (PDT)
In-Reply-To: <1310779198-20764-1-git-send-email-agnel.joel@gmail.com>
References: <1310779198-20764-1-git-send-email-agnel.joel@gmail.com>
Date: Mon, 18 Jul 2011 18:05:53 -0500
Message-ID: <CAD=GYpapFmSWcUV6wXQsAYBL6Hbo+VU17kMpMJHY_W43aXxXiA@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: joelagnel@ti.com, beagleboard@googlegroups.com, k-kooi@ti.com, jdk@ti.com
Subject: Re: [PATCH] beagleboard-test-scripts: BeagleBoard userbutton detection for flashing
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
X-List-Received-Date: Mon, 18 Jul 2011 23:09:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 15, 2011 at 8:19 PM, Joel A Fernandes <agnel.joel@gmail.com> wr=
ote:
> * Build and install a userbutton tool to detect state of the user button =
on a BeagleBoard from /dev/input/event0
> * Install a user.txt and uEnv.txt to /boot, Narcissus will copy from here=
 to the FAT partition of an SD Card
>
> Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
> ---
> This is an effort to be able to build an SD Card image for the BeagleBoar=
d that can be used optionally for flashing
> an image to NAND if the user button is pressed. This patch makes sure tha=
t the root filesystem is ready with the scripts
> and programs required for Narcissus to build such an image.
>
> This patch can be safely merged in even if the Narcissus hasn't yet been =
(as it was just submitted)
>
> The related Narcissus patch is here:
> http://groups.google.com/group/beagleboard/browse_thread/thread/c0dd79f8e=
5fb26ae
>
> =A0.../beagleboard/beagleboard-test-scripts_git.bb =A0 =A0| =A0 12 ++++++=
++++--
> =A01 files changed, 10 insertions(+), 2 deletions(-)
>

Would it be possible for amyone to pull this patch into the OE
maintenance/dev trees?

Thanks,

Regards,
Joel


