Return-Path: <stephan.binner@basyskom.com>
Received: from mx1.basyskom.com (groupware.basyskom.com [144.76.148.65])
	by mail.openembedded.org (Postfix) with ESMTP id 762B973770
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 07:59:38 +0000 (UTC)
X-Footer: YmFzeXNrb20uY29t
Received: from fridolin.localnet ([193.158.222.114])
	(authenticated user sbin@basyskom.com)
	by mx1.basyskom.com (Kerio Connect 8.4.0)
	(using TLSv1.1 with cipher DHE-RSA-AES256-SHA (256 bits))
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Feb 2015 08:59:37 +0100
From: Stephan Binner <stephan.binner@basyskom.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Feb 2015 08:59:37 +0100
Message-ID: <3759374.HWPbCCYMfQ@fridolin>
Organization: basysKom GmbH
User-Agent: KMail/4.8.5 (Linux/3.2.0-76-generic; KDE/4.8.5; x86_64; ; )
In-Reply-To: <CALbNGRSm7NPJoQYMx=d_6uXJCVMXZqbDSm3wks2WeA+7BENc9A@mail.gmail.com>
References: <2271195.WOsUHlN0Xa@fridolin>
	<CALbNGRSm7NPJoQYMx=d_6uXJCVMXZqbDSm3wks2WeA+7BENc9A@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-qt5][PATCH] fix build of qtbase with "gles2" package config
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
X-List-Received-Date: Fri, 27 Feb 2015 07:59:40 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Thursday 26 February 2015 21:25:52 Andreas M=FCller wrote:

> Have gles2 in my packageconfig without problems.=20

I encountered this when building for "beaglebone" / with meta-ti, with =
other=20
targets/machines and X files it may be actually fine. :-)

> What error is fixed?

#error qtextstream.h must be included before any header file that defin=
es Status

and other compilation breakage caused by X defines (None, Status, ...).=


> Upstream-Status?

As commented/obvious from the patch my patch was merged upstream

 > +    Change-Id: Iaf95ae2488df3d3301436262ed79f7091b4be0a9
 > +    Reviewed-by: Laszlo Agocs <laszlo.agocs@theqtcompany.com>

 > # This patch is in 5.4 branch but didn't make it into 5.4.1 release

with https://codereview.qt-project.org/#/c/105116/
=20
Regards,
Stephan


