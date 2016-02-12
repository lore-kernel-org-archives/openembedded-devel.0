Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 854A57317F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Feb 2016 16:23:37 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id g62so3570101wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Feb 2016 08:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=wmXVN2h7+hCpfUKtp3KJHlRRmSolIbRgjRH0JNZ4440=;
	b=vOUASFidiqFJkDXzRmfUkwhWd0r7OmiHQofT3L87UGbTs3VeQILwwVrlOAbihWXBl2
	IRDTrz8p01hHn12EH01KII7aNcENkOnMqQ5lXfstU3no8zrYhp2nkrwuS/3BlgyHvAxH
	bc5D5asTjdbw5Qg2JR2LooJcQD0ZpMFGg6HNe9A4V5f97ScyrSH7tW1BrdbO7qsESv6a
	KoMnOnjUYUdd1FIODZNRCnJlsZh5sfvc5Gt8kjBvTtlDMEUUSFHqvNvkU8AD99Xr0q8x
	nOuuWnK+Dp/dvnnegKeWaPC8NgARPXGqh/tPzy0IZ5x9jvGESKaf+C9e1UL2CqBssokG
	Hk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:content-type:content-transfer-encoding
	:subject:message-id:date:to:mime-version;
	bh=wmXVN2h7+hCpfUKtp3KJHlRRmSolIbRgjRH0JNZ4440=;
	b=dB9nxqNYXDdFXDo03oKhddEPf2XBnuHx5ZdMTM7zWrrVXB1DC2AZNKHJbT/UyYz3Qb
	EM2I7z1nx9GkGfHUFggQvvnLojr2OZioYnONS14XRBBk/B167SvFUVhYP/3yNr2F3giv
	UX9VI42cPTsKnXNtR/o+AWvkSPeq0lmElYSBHMxMBqdDOfM7mqb2paEpglbfE1+VYwPo
	CCmd7Id+wz8s9PzBfW+3E2EpUdJ2P1E7+TcvCvfz9kVL1wDQ0FXV0MB3mxZh1ArNcivZ
	fd6QBZU1hfAEoYGsI95srzyODcEi6RVJa0C2jrFnzgi/aFEm4O7uKHt8r7kphU0Q3F1m
	QeBQ==
X-Gm-Message-State: AG10YOTYMB1EQlB+RKED2a4ZSargWi2WqSU8uf9R00MJVAmnzLhoja1B2xlFeyGsD/Hl8w==
X-Received: by 10.28.145.7 with SMTP id t7mr5450574wmd.98.1455294218296;
	Fri, 12 Feb 2016 08:23:38 -0800 (PST)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by smtp.gmail.com with ESMTPSA id k4sm3046834wmc.12.2016.02.12.08.23.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 12 Feb 2016 08:23:37 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Message-Id: <45119797-AAEF-4ED3-A274-A23D25F85FD3@dominion.thruhere.net>
Date: Fri, 12 Feb 2016 17:23:36 +0100
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3120\))
X-Mailer: Apple Mail (2.3120)
Subject: Kodi 16rc recipes available
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
X-List-Received-Date: Fri, 12 Feb 2016 16:23:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

I=E2=80=99ve managed to get kodi 16rc3 to build (and work!) on armv7a =
and x86-64. The recipes can be found here: =
https://github.com/koenkooi/meta-dominion/tree/master/recipes-multimedia

It needs work before I can submit it properly to meta-multimedia. The =
problems I=E2=80=99ve spotted so far:

1) No libva in oe-core, it should move from meta-intel to oe-core. =
libva-intel-driver is fine where it is.
2) No vdpau in oe-core, it should move from meta-dominion to oe-core
3) It runs java in do_configure. Since meta-java only works one day per =
year we=E2=80=99ll just have to install it on the host.
4) OpenGLES is broken in kodi, a fork has fixes.
5) Wayland is broken in kodi, a fork has fixes.
6) No PACKAGECONFIGs yet for weird media accelerations like openmax, =
imx6, etc.

and the big one for me:

7) no hts add-ons available. pvr.hts needs ${S} from kodi, but uses =
cmake instead of autotools. I might just partially copy/paste =
cmake*bbclass into kodi_git.bb to make this work. Needs more thought and =
less cmake.

So if you have an x86-64 box with intel graphics, great, everything =
works as expected. On ARM you need working openGL, so that limits you to =
snapdragon/freedreno. That works[1], but no accelerated decode.
If you have non-intel graphics in x86, have a look at what meta-dominion =
and meta-amd (thanks Kergoth!) do, I have it working on ATI and Nvidia =
cards locally.

Anyway, if people want to help out with getting the recipes upstreamed =
into the right layers: awesome. The biggest hurdle named ffmpeg was =
removed (well, added into OE, but you get what I mean) 16 days ago, so =
it should be relatively plain sailing :)

regards,

Koen

[1] https://www.youtube.com/watch?v=3DZJcfcKmIgSM=

