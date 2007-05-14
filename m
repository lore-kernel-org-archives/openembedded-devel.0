Received: from [69.72.139.204] (helo=zeus.rm-fr.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <skyhusker@rm-fr.net>) id 1HnatO-0002LM-Be
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2007 15:47:14 +0200
Received: from raichu.casa (cm-83-97-128-47.telecable.es [83.97.128.47])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by zeus.rm-fr.net (Postfix) with ESMTP id 682875C937
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2007 14:47:08 +0100 (BST)
From: Alberto =?iso-8859-1?q?Garc=EDa_Hierro?= <skyhusker@rm-fr.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 May 2007 15:46:02 +0200
User-Agent: KMail/1.9.6
References: <07a101c7962b$e0db5860$0200a8c0@atmel.com>
In-Reply-To: <07a101c7962b$e0db5860$0200a8c0@atmel.com>
MIME-Version: 1.0
Message-Id: <200705141546.02470.skyhusker@rm-fr.net>
Subject: Re: qemu-native failure on Angstrom
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 May 2007 13:47:14 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

El Monday 14 May 2007 15:14:03 Ulf Samuelsson escribi=F3:
> Tried building OpenEmbedded for the first time, DISTRO=3D=C5ngstr=F6m,
> with an at91sam9263 target (made my own file) but it seems that
> qemu.native is not compilable on my OpenSuSE 10.1 system using gcc-4.1.2.
> The error message says that qemu has only been tested on gcc-4.x.x for arm
> and that other architectures need gcc-3.x
>
> Tried to update the bb files to allow gcc-4.1.2 but that resulted in
> qemu-arm not beeing built, causing the build to terminate later.
>
> Is there any way to have open embedded build a gcc-3.4.4 cross compiler
> as part of the normal build.

	Check the patch at http://bugs.openembedded.org/show_bug.cgi?id=3D1144. It=
's=20
for amd64, but with little editing you can adapt it to your system.

Regards,
	Alberto


=2D-=20
Alberto Garc=EDa Hierro
http://zeus.rm-fr.net/~skyhusker/


