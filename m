Received: from [72.14.220.157] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <serra82@gmail.com>) id 1N0Ao3-0007bI-Hx
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Oct 2009 11:15:06 +0200
Received: by fg-out-1718.google.com with SMTP id d23so2331839fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Oct 2009 02:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=dRbMNikworreQ/W7eeQFZPy2uK5GOPdk2uLRFiBsUec=;
	b=BsuibKY89oSeFMkrLWYeFbDGb0ozenLLD0ysoXlAYt7WD/qZyNIAzZ8kAmX3FlYMWQ
	aPguIYAVUkXeJaphIzA8EUjEyiL/blB5tZhmNSSGOY/sXkBDadG4Ed9pi8NjbfjUbNiw
	Rw/mztU0k0EydN/KdsvRZFHF1ftuEhwdnzcKY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=PIu2IP78gwlQMk6wVWOn55LHnsk8SuenSq8yZIJOsZn8+5E9YgXpJQZ0uJXIPU+2lS
	kr+brDpbkwH/B+WzGKirQGo7ZC3Efhv9UUxiVcugmCZtOCnOVqfh8mH7TZwX9giPkAa9
	NrtsLcl4MZZkucCLSIxsEyHDx4COdHHpk2CcE=
MIME-Version: 1.0
Received: by 10.103.127.28 with SMTP id e28mr2634699mun.120.1256030044768; 
	Tue, 20 Oct 2009 02:14:04 -0700 (PDT)
Date: Tue, 20 Oct 2009 11:14:04 +0200
Message-ID: <afb7987a0910200214v11b56177w400fac16a87a09f7@mail.gmail.com>
From: Andrea <serra82@gmail.com>
To: enric.balletbo@telefonica.net
X-SA-Exim-Connect-IP: 72.14.220.157
X-SA-Exim-Mail-From: serra82@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: beagleboard@googlegroups.com, openembedded-devel@lists.openembedded.org
Subject: IGEPv2 with TI DSP codecs and GStreamer
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
X-List-Received-Date: Tue, 20 Oct 2009 09:15:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Enric,
I'm working on two IGEPv2 boards we bought through the university of
Urbino (italy). We were able to run the DSP TI codecs on a BeagleBoard
sample with the 2.6.29 kernel from openembedded. But we still have
some problems with the IGEP boards.

2009/9/15 Enric Balletb=F2 i Serra <enric.balletbo@telefonica.net>:
> =A0 =A0For now, our more stable version of linux is a 2.6.28.10 based ker=
nel
> with several backports from recent releases (like smsc driver, libertas, =
DSS
> ...). That does not seem to linux-omap recipe present in OE.

What are the differences between your patched kernel and the one
mentioned above (recipes/linux/linux-omap_2.6.29.bb)?
Which DSS patches have been applied?
Should gstreamer and the DSP TI codecs work as far as you know? Is
there some guide to make it all work or are you still working on it?

The boot parameters we're using are as following:
bootargs-base=3Dconsole=3DttyS2,115200n8 console=3Dtty0
omapfb.mode=3Ddvi:dvi:800x600MR-24@60 mem=3D99M omapfb.vram=3D0:3M,1:3M,2:3=
M
omapfb.debug=3Dy

We have patched the ti-dmai to support the IGEP board and we are
currently using a gstreamer pipe like this:
gst-launch filesrc location=3D/home/root/bak/video/luce.flv !
ffdemux_flv name=3Dd d.video_00 ! TIViddec2 ! TIDmaiVideoSink
It works, but the video playback is very chunky and instable.


