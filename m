Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gizero@gmail.com>) id 1SUBXB-00036c-A3
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2012 08:47:01 +0200
Received: by qcso7 with SMTP id o7so4004114qcs.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 23:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=n8TA8h/CVr4ZPBsfCaw0gA4ul8z4tAXXz1DjWPlS1jg=;
	b=AC8jzBNya8o0KXXgggtzB4pLUjKhLODupxUqsBF33AD6iHEuSb+ZEFwWLJ0ZrhyhsP
	zPTWoc15DZdHSHIspaayL2GYJx63UvBxY5UnTohdsVhIDXtW1QJurlaTP3aMw3JTzhYG
	LovRBC/PZ+51aBqWCSyZSD2nUMCc1/4lJymJ62KXyF66zIOXAmErK94WlQMANTI8RtaB
	AgrANIfc96k+S63x/Ju7MCUP2J0ciReE+RGBhtz24U8LgmN7pSj8TuzqCUVFCWlWndzl
	DZiSVarBu+R+R9mq3QqhGsLoXZ39uxrDHuZsO4q6f+oxTykNXu85TLH9Nx/MWYe4xiMA
	Kp3w==
MIME-Version: 1.0
Received: by 10.224.180.212 with SMTP id bv20mr1221432qab.4.1337063820933;
	Mon, 14 May 2012 23:37:00 -0700 (PDT)
Received: by 10.229.217.200 with HTTP; Mon, 14 May 2012 23:37:00 -0700 (PDT)
In-Reply-To: <1336233109-26164-1-git-send-email-gizero@gmail.com>
References: <1336166708-14019-1-git-send-email-gizero@gmail.com>
	<1336233109-26164-1-git-send-email-gizero@gmail.com>
Date: Tue, 15 May 2012 08:37:00 +0200
Message-ID: <CAC+thW3n9UgBA_Ki3BzTr5UG6d5vzqtCniF6JvqQYi+k=dvYqA@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] libmodbus: ported recipe from classic and updated
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
X-List-Received-Date: Tue, 15 May 2012 06:47:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, May 5, 2012 at 5:51 PM, Andrea Galbusera <gizero@gmail.com> wrote:
> * based on recipe by Radoslav Kolev which was in classic
> * updated to latest released version 3.0.2
> * v2 drops git version of recipe
> * v2 drops no longer used PRIORITY
>
> Signed-off-by: Andrea Galbusera <gizero@gmail.com>
> ---
> =A0.../recipes-extended/libmodbus/libmodbus_3.0.2.bb =A0| =A0 18 ++++++++=
++++++++++
> =A01 files changed, 18 insertions(+), 0 deletions(-)
> =A0create mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.=
bb
>
> diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb b/meta=
-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb
> new file mode 100644
> index 0000000..5926bc4
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb
> @@ -0,0 +1,18 @@
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
> +PR =3D "r0"
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

Any comment on this patch respin?
Regards


