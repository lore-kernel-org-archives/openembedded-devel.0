Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SHVco-0001I6-UU
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Apr 2012 09:36:27 +0200
Received: by iaag37 with SMTP id g37so7063231iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2012 00:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=JOZ6u156+NHHqXK/BekS7qIvfVszEVD+0wjEE15Mq3c=;
	b=PBGr0gvutULzXN+8HCzhGrF+REmwKO0mR6cSPlV0NmYgnMxpPq7nmBs49Ak7OuiHMn
	6vUylED3pSrfV9z+H99IrwJYf23sA5vktLisxxwFet0ycIoTMSBZ5+58sflPEtaR49ve
	it+UTk/UuRXGHIXfVKHnS0KFgBEtlknM4U/IIJ7TDg22XfIYEBzhrn0Db09+6YB7P1cd
	9e9Q99H3aYNPthQdy1xlYiXAei5FXZu1PR7Zp0Zp6YjtOzJoqJftpSn59ebdOyQIQYY/
	6eN4WsokJGxZJohVMMne3JfIG+UUudm+BsDt6fj9RL/ZUus93aAuZk/BSJ74SDjuc5Bj
	ZheA==
MIME-Version: 1.0
Received: by 10.50.192.228 with SMTP id hj4mr1233121igc.65.1334042829117; Tue,
	10 Apr 2012 00:27:09 -0700 (PDT)
Received: by 10.42.165.137 with HTTP; Tue, 10 Apr 2012 00:27:09 -0700 (PDT)
In-Reply-To: <1332488120-28631-1-git-send-email-schnitzeltony@googlemail.com>
References: <1332488120-28631-1-git-send-email-schnitzeltony@googlemail.com>
Date: Tue, 10 Apr 2012 09:27:09 +0200
Message-ID: <CALbNGRSxbZf3-9VoZU6S5V3WoUDA+80kdS-z3tuZ-aF94DXv4Q@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xfce] thunar-volman: add eject to RDEPENDS
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
X-List-Received-Date: Tue, 10 Apr 2012 07:36:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2012 at 8:35 AM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> Ejecting USB-memory stick caused:
> Error starting job: Failed to execute child process "eject" (No such file=
 or directory)
>
> run-tested with angstrom/meta-oe environment on overo
>
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
> =A0.../thunar-volman/thunar-volman_0.6.0.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
3 +++
> =A01 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb =
b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb
> index c581d78..c7cc0ed 100644
> --- a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb
> +++ b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb
> @@ -3,8 +3,11 @@ SECTION =3D "x11"
> =A0LICENSE =3D "GPLv2"
> =A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079b=
ae19f"
> =A0DEPENDS =3D "exo gtk+ libxfce4ui libxfce4util xfconf libnotify udev"
> +PR =3D "r1"
>
> =A0inherit xfce
>
> =A0SRC_URI[md5sum] =3D "2f166662dd100d5195da238af417f305"
> =A0SRC_URI[sha256sum] =3D "b1afd2b3b285cfcf07c11caa3d37fa5ff1fc06f7dc68fc=
ca07f9a0d70daa694f"
> +
> +RDEPENDS_${PN} =3D "eject"
> --
> 1.7.6.5
>
ping?


