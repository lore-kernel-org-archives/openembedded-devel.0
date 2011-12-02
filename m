Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RWKLH-0008Si-ME
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Dec 2011 05:03:19 +0100
Received: by lagj5 with SMTP id j5so1070050lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Dec 2011 19:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=77Ftzq6Z2eCdmx+TxkOArGmcrrbYsUhTf8a2RSUqnkQ=;
	b=I9WaiN2eYR7nyAEdL41KVeTUi8nR3Kk2YwFvF89g/5Q3jkSLA217QHXYaqIhn1GoDy
	bcKh2GSuYsEkXakSMVKkCOMgmRLRviFLEw+dNVDf58L27CDtGNekVRQiZri2xQxvTMbJ
	NgpBPbmkg74RHeFRmIe+7u+MdX9ec38RmjE1E=
Received: by 10.152.144.73 with SMTP id sk9mr6522342lab.34.1322798197385; Thu,
	01 Dec 2011 19:56:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Thu, 1 Dec 2011 19:56:05 -0800 (PST)
In-Reply-To: <CAESPx36Joi7Hzo5KdvNcy6QZDJ+YGXimbjzbbctZogLU_jkRyw@mail.gmail.com>
References: <CAESPx36Joi7Hzo5KdvNcy6QZDJ+YGXimbjzbbctZogLU_jkRyw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Dec 2011 19:56:05 -0800
Message-ID: <CAMKF1srkBd=jusV1SBcHHwtvZkDJoL=h=Y_a8ERERabtFtTzMA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Help building console-image
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
X-List-Received-Date: Fri, 02 Dec 2011 04:03:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 1, 2011 at 6:35 PM, Chris Watkins <chris.watkins88@gmail.com> w=
rote:
> Hi,
>
> I've installed openembedded and managed to build 'task-base' for a mini24=
40
> board (Though I'm not sure exactly what this). Now I'm trying to build
> console-image to test on the device using the angstrom-2010.x distro but
> I'm getting error messages that I can't figure out how to get around. The
> full log file is here http://pastebin.com/raw.php?i=3DdtkErM5a , and
> the error below. I'd appreciate any suggestions on how to fix this or whe=
re
> to look for problems as I'm new to building embedded systems.
>
> Cheers,
>
> Chris
>
> Error messages:
>
> =C2=A0satisfy_dependencies_for: Cannot satisfy the following dependencies=
 for
> task-base:
>
> =C2=A0* =C2=A0 =C2=A0 =C2=A0base-passwd * =C2=A0 busybox * =C2=A0 =C2=A0 =
=C2=A0 modutils-initscripts * =C2=A0netbase * =C2=A0 =C2=A0 =C2=A0 opkg
> * =C2=A0 =C2=A0 =C2=A0 util-linux-ng-mount * =C2=A0 util-linux-ng-umount =
*
> =C2=A0 =C2=A0 =C2=A0 =C2=A0module-init-tools-depmod * =C2=A0 =C2=A0 =C2=
=A0dropbear * =C2=A0 =C2=A0 =C2=A0sysfsutils *
> =C2=A0 =C2=A0 =C2=A0 =C2=A0module-init-tools * =C2=A0 =C2=A0 alsa-utils-a=
lsactl * =C2=A0 =C2=A0alsa-utils-alsamixer *
> =C2=A0 =C2=A0 =C2=A0 =C2=A0usbutils * =C2=A0 =C2=A0 =C2=A0portmap * =C2=
=A0 =C2=A0 =C2=A0 ppp * =C2=A0 ppp *
> =C2=A0* opkg_install_cmd: Cannot install package task-base.
> =C2=A0* opkg_install_cmd: Cannot install package psplash-angstrom.
> =C2=A0* opkg_install_cmd: Cannot install package psplash-zap.
> =C2=A0* satisfy_dependencies_for: Cannot satisfy the following dependenci=
es
> for task-base-extended:
> =C2=A0* =C2=A0 =C2=A0 =C2=A0wireless-tools * =C2=A0 =C2=A0 =C2=A0 =C2=A0w=
pa-supplicant * =C2=A0 =C2=A0 =C2=A0 =C2=A0blueprobe * =C2=A0 =C2=A0 bluez4=
 *


Does it happen with all built fresh from scratch too ?


