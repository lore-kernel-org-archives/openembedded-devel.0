Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6165D73A1E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 13:50:31 +0000 (UTC)
Received: by wiwl15 with SMTP id l15so28737659wiw.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 06:50:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=yCi60xBwd1zeoarVK49Ovh8wG0rD4fNclShEt6H8oYk=;
	b=JYPtcCCSbgcCspQ4r/t9ycmGlkrXlOo1l8HCdv4XOfCL2D0HAi9zC60IqNHhVZyiCk
	qcy9pTEYNey7jTNTcPSk0D8a+BkdweAkY+QEy+DY61BssF06nHIRCZIfcatgPZZdGWtA
	fGlumlTzDDUYAYCGf6lw9m/ZgglQQFnfL8NAUEfrPU1MbuXkGhPA93b+qRr4K91amJeG
	E1EvUuQngyWn891Ci09QWarod6XYurI0eYl0Qy7wd++WUCRVhTtNdZzvCtcf/Qz0KT48
	cehRG8yHXHmQK9nmbfRwXML7V+2eOF1Qhbey5V5kO2bo8LkN4jvjKqxvP8ggOvQVdsVp
	S4Zg==
X-Gm-Message-State: ALoCoQlHzcsbwsazlLWer2Nj4xRXcRBHuQ+HOAHPv4IAs6nQ4Ph//PiuZIXAvPY1zymgm0UI2Bp7
X-Received: by 10.194.192.167 with SMTP id hh7mr68820065wjc.151.1425995432022; 
	Tue, 10 Mar 2015 06:50:32 -0700 (PDT)
Received: from ?IPv6:2001:610:612::5ded:8042:1da1:b2fd?
	([2001:610:612:0:5ded:8042:1da1:b2fd])
	by mx.google.com with ESMTPSA id gt4sm1666698wib.21.2015.03.10.06.50.30
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 10 Mar 2015 06:50:30 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <54FD8999.4030303@dresearch-fe.de>
Date: Tue, 10 Mar 2015 14:50:28 +0100
Message-Id: <FAE79245-0EDA-4219-86E5-A3950BDA7682@dominion.thruhere.net>
References: <54FD8999.4030303@dresearch-fe.de>
To: Steffen Sledz <sledz@dresearch-fe.de>
X-Mailer: Apple Mail (2.2070.6)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	angstrom-distro-devel <angstrom-distro-devel@linuxtogo.org>
Subject: Re: meta-angstrom commit 75f0f25e breaks build of opencv from meta-openembedded
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
X-List-Received-Date: Tue, 10 Mar 2015 13:50:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 9 mrt. 2015, om 12:52 heeft Steffen Sledz <sledz@dresearch-fe.de> =
het volgende geschreven:
>=20
> Commit 75f0f25e55f0745a011640b5c81d88be99366f45 in =
meta-angstrom/recipes-tweaks (branch angstrom-v2014.12-yocto1.7) =
introduces version 10.5 of libav.
>=20
> This version does no longer provide defines like CODEC_ID_H264 which =
are needed for opencv 2.4.9 from =
meta-openembedded/meta-oe/recipes-support (branch dizzy).
>=20
> ---------------------> snip <----------------------
> =
.../tmp-glibc/work/armv5te-angstrom-linux-gnueabi/opencv/2.4.9+gitAUTOINC+=
df8e28283f-r0/git/modules/highgui/src/ffmpeg_codecs.hpp:104:7: error: =
'CODEC_ID_H264' was not declared in this scope
>     { CODEC_ID_H264, MKTAG('H', '2', '6', '4') },
>       ^
> =
.../tmp-glibc/work/armv5te-angstrom-linux-gnueabi/opencv/2.4.9+gitAUTOINC+=
df8e28283f-r0/git/modules/highgui/src/ffmpeg_codecs.hpp:105:7: error: =
'CODEC_ID_H264' was not declared in this scope
>     { CODEC_ID_H264, MKTAG('h', '2', '6', '4') },
>       ^
> =
.../tmp-glibc/work/armv5te-angstrom-linux-gnueabi/opencv/2.4.9+gitAUTOINC+=
df8e28283f-r0/git/modules/highgui/src/ffmpeg_codecs.hpp:106:7: error: =
'CODEC_ID_H264' was not declared in this scope
>     { CODEC_ID_H264, MKTAG('X', '2', '6', '4') },
>       ^
> =
.../tmp-glibc/work/armv5te-angstrom-linux-gnueabi/opencv/2.4.9+gitAUTOINC+=
df8e28283f-r0/git/modules/highgui/src/ffmpeg_codecs.hpp:107:7: error: =
'CODEC_ID_H264' was not declared in this scope
>     { CODEC_ID_H264, MKTAG('x', '2', '6', '4') },
> ...
> ---------------------> snip <----------------------
>=20
> I'm not sure if this problem occurs in the master branches too, but =
the dizzy/angstrom-v2014.12-yocto1.7 branches are unusable for some of =
our applications beacause of this problem at the moment. :(

Sorry about that, I looked at that this weekend, but forgot to push the =
patches to meta-angstrom. 744d6439175058909002d1e22439e93945d53e22 =
should fix the issues you are seeing.

regards,

Koen=

