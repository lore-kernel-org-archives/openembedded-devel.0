Return-Path: <sujith.h@gmail.com>
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6D80F713BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Sep 2014 10:48:32 +0000 (UTC)
Received: by mail-qa0-f54.google.com with SMTP id x12so7665474qac.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Sep 2014 03:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=Tg8RdHmFZQM1XzqkyFs2qbktfH4GPDlJdAzIO3eMQu4=;
	b=OCXduwHWDtoz40byiYSKyOWqC/Jhv2DHQU11+2Zyt3HaJ6N7jOWdd8z+1m3YzRaMFJ
	cVbKcdBvbh1Wdd5x5JowDUZCsMtaSC5epHLQ8XR5eXNjaiVp51mKSmzeJahyRsKyJ4+c
	3AKvAhs7MKKIRXsPOuVcmzpsMDQ9CB7/NL2IaJ7m/JQluxhdY1lzMn6vA8wzdOOrcUkM
	gNLT89zUoSVkbnbIUbJ+aHY8Qp5hrZAGSDmquDj3N2hodTnSIYHQOT5ERM2v9uUD+csh
	0NjpmG4p/Yk4i6/4ezLS1kKK4vvdMFwLqaGVhDyVGAmsxLFlvyOFNhqS19hTyK6sAeX0
	vJtg==
X-Received: by 10.224.114.136 with SMTP id e8mr24905060qaq.67.1409741314028;
	Wed, 03 Sep 2014 03:48:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.148 with HTTP; Wed, 3 Sep 2014 03:48:13 -0700 (PDT)
From: sujith h <sujith.h@gmail.com>
Date: Wed, 3 Sep 2014 16:18:13 +0530
Message-ID: <CADyYWLk5auD9_xirCJ2KCJyc5W1kXf9J0J7hWsP9vm68H06rsw@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt5] Issue with QML running on qemuarm
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
X-List-Received-Date: Wed, 03 Sep 2014 10:48:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

When I tried to build core-image-sato with meta-qt5 with machine as
qemuarm, I am noticing that qml examples are not running. The error I am
getting is as shown below:

root@qemuarm:/usr/share/qt5/examples# ./quick/animation/animation
libEGL warning: DRI2: failed to authenticate
Qt Warning: Could not find a location of the system's Compose files.
Consider setting the QTCOMPOSE environment variable.
Qt Warning: Could not find a location of the system's Compose files.
Consider setting the QTCOMPOSE environment variable.
Unable to find an X11 visual which matches EGL config 77
Could not initialize OpenGL
Aborted
root@qemuarm:/usr/share/qt5/examples#

At the same time when I use machine qemuppc or qemux86_64, I am able to run
the qml examples properly. Any clue what could be the reason for the
failure in qemuarm?

Thanks,
Sujith H

--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info

