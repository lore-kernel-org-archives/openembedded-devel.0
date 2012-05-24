Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gizero@gmail.com>) id 1SXR8Q-0005Nd-H8
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 May 2012 08:02:54 +0200
Received: by qcso7 with SMTP id o7so5490793qcs.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 May 2012 22:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=olpqq0LD+P6SzzuTiEtbrpi4c4zil177INJa62xXf8w=;
	b=VakD06yWteMTff7P6wyQtWB7oIe2WzP1X0X9d5hg9f2qEGkcxQk5bQnmIpvAFk2VGk
	DoNr1R4ihQ2w7umuZWyzbE3Izs4/YNJbKAndFCLTwePXdpED9RKpSUGZPKUGOYyQpeMB
	2imJB3hwOSOirwtnwuL2SLI78fDjdGqqDhPEChqiKTco8SJ7ah0euKJxYeYTeWGi4eUk
	ABjDjty+TL47vulL97lCsqqYcbrv8uJ3vTvTITDSy96UeavPnRadV5c+lutfHCV12v4d
	bcoiFAMe2PUy4j3WjY7qmCO4friKCM6DH+tKK2t8U7uYNQ3dKY8p2zxgTc7SEfZF0yzr
	FncA==
MIME-Version: 1.0
Received: by 10.224.217.193 with SMTP id hn1mr9114596qab.68.1337838763306;
	Wed, 23 May 2012 22:52:43 -0700 (PDT)
Received: by 10.229.120.201 with HTTP; Wed, 23 May 2012 22:52:43 -0700 (PDT)
In-Reply-To: <1337108462-14996-1-git-send-email-gizero@gmail.com>
References: <1337108462-14996-1-git-send-email-gizero@gmail.com>
Date: Thu, 24 May 2012 07:52:43 +0200
Message-ID: <CAC+thW2CJEGYJxPK63F_w7u+iZE+yv0Gda_XYwc6iB4TAOsy9w@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v3] libmodbus: ported recipe from classic and updated
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
X-List-Received-Date: Thu, 24 May 2012 06:02:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, May 15, 2012 at 9:01 PM, Andrea Galbusera <gizero@gmail.com> wrote:
> =A0* based on recipe by Radoslav Kolev which was in classic
> =A0* updated to latest released version 3.0.2
>
> =A0v2:
> =A0* drop git version of recipe
> =A0* drop no longer used PRIORITY
>
> =A0v3:
> =A0* drop PR =3D "r0"
>
> Signed-off-by: Andrea Galbusera <gizero@gmail.com>
> ---
> =A0.../recipes-extended/libmodbus/libmodbus_3.0.2.bb =A0| =A0 16 ++++++++=
++++++++
> =A01 files changed, 16 insertions(+), 0 deletions(-)
> =A0create mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.=
bb
>
> diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb b/meta=
-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb
> new file mode 100644
> index 0000000..03b7fcc
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb
> @@ -0,0 +1,16 @@
> +SUMMARY =3D "A Modbus library"
> +DESCRIPTION =3D "libmodbus is a C library designed to provide a fast and=
 robust \
> +implementation of the Modbus protocol. It runs on Linux, Mac OS X, FreeB=
SD, \
> +QNX and Windows."
> +HOMEPAGE =3D "http://www.libmodbus.org/"
> +SECTION =3D "libs"
> +
> +LICENSE =3D "LGPLv2.1+"
> +LIC_FILES_CHKSUM =3D "file://COPYING.LESSER;md5=3D4fbd65380cdd2559510790=
08b364516c"
> +
> +SRC_URI =3D "http://github.com/downloads/stephane/libmodbus/libmodbus-${=
PV}.tar.gz"
> +
> +inherit autotools pkgconfig
> +
> +SRC_URI[md5sum] =3D "1aaacce9d9779d3a84f7d1a75774c943"
> +SRC_URI[sha256sum] =3D "927ec90e0e299a7d4ec7086b1e2590566bdfc3bbc22e1220=
4229361c029f2615"
> --
> 1.7.5.4
>

Does v3 of the patch look acceptable?


