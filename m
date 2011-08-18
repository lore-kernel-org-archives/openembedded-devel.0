Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1QuASI-0008MQ-Rm
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2011 23:48:51 +0200
Received: by vxj14 with SMTP id 14so2287963vxj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2011 14:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=s7aImx2Ta3tlP3PztSfMqWqDGll/+cX5orX7TU7AIK8=;
	b=iwMcJaKCXxpHG16+Z3lmEG8lNaMHd325BmuEaSn8Bvdl4uHlWK2rDJ0LHWjukJrTzm
	/6Uq6zH2FkX55rjgCkr95SpW7sT5xRXhIVIbYK4ShGiAClbDBh6hyt+tvFAqYZg2TBeS
	2V4fH1cVT8lZGGjzuRAEW5VbZ9Q65FMm69CnY=
MIME-Version: 1.0
Received: by 10.52.70.14 with SMTP id i14mr1345950vdu.420.1313703850460; Thu,
	18 Aug 2011 14:44:10 -0700 (PDT)
Received: by 10.52.112.161 with HTTP; Thu, 18 Aug 2011 14:44:10 -0700 (PDT)
In-Reply-To: <4E439289.3050005@dresearch-fe.de>
References: <4E3A3C4B.8040208@dresearch-fe.de>
	<4E3B9812.9010002@dresearch-fe.de>
	<4E3ECD6E.7000201@dresearch-fe.de>
	<CA+M6bXkrQyqiSFFxsyZv4mRPUmk82EbdUzSygrBaoyp5zeQ9zA@mail.gmail.com>
	<4E40FCA9.7060204@dresearch-fe.de>
	<4E439289.3050005@dresearch-fe.de>
Date: Thu, 18 Aug 2011 14:44:10 -0700
Message-ID: <CAGDS+n=3CWBVVD2R5uxAz1vOSfuz1GVUEY0Ky5h=1KSsDCrXjw@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Philip Balister <philip@opensdr.com>
Subject: Re: [2011.03-maintenance] unsatisfied dependencies to libgcc
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
X-List-Received-Date: Thu, 18 Aug 2011 21:48:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2011 at 1:27 AM, Steffen Sledz <sledz@dresearch-fe.de> wrot=
e:

> After some bb recipe updates there is a new error of this type.
>
> | =A0* check_data_file_clashes: Package libgcc-s-dev wants to install fil=
e /CACHE/hudson/jobs/HydraIP_Linux_release_image/workspace/OE/tmp.6/rootfs/=
hydraip-hipox-devimage/usr/lib/libgcc_s.so
> | =A0 =A0 =A0 But that file is already provided by package =A0* libgcc-de=
v
> | =A0* opkg_install_cmd: Cannot install package libsqlite3-dev.

Others are also running into this issue!  I've seen messages from
Philip Balister regarding this same problem with his Ettus images:

http://comments.gmane.org/gmane.comp.hardware.usrp.e100/1245

I see it with the GNOME images I build:

|  * check_data_file_clashes: Package libgcc-dev wants to install file
/media/data/gnome-r13-tmp/rootfs/sakoman-gnome-image/usr/lib/libgcc_s.so
| 	But that file is already provided by package  * libgcc-s-dev

In looking through the packages in my deploy directory I see a split
between packages that depend on libgcc-dev and libgcc-s-dev.

Any ideas on how to fix this issue?

Steve


