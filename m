Received: from mail-vc0-f178.google.com ([209.85.220.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Tq2T4-00021L-Rp
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jan 2013 15:05:23 +0100
Received: by mail-vc0-f178.google.com with SMTP id x16so13437414vcq.23
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Jan 2013 05:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=R0lV6LoyEniHafPuTOGDT4rf4tSOh/laXztrUSCIgoA=;
	b=IXIT/uPfjNryIwKPqsUAT8g2mprO8NMstQ7sWFiA/kUFCUna+F6NgCFvfvtEJtHYj+
	hsn7RG5XT7RjMq3bN090E0NWeIBD5rbjZePvRiGpFiZxxC9k3E3L8QxYQBnQ/WN4DYgr
	VxHlsBNK4oXpbDJZmHSf1kAL4JBKBeHY045oiE3SndeRmHBI2J+6ctYv1PjG852slhRK
	gS7qkgQBE5UVdSjVqGxgc1QjlTpzkWcI9MPQbcNQDYAYyiXNB5DrNa8t+wngPdkMdenE
	UzN1Z78PC/T1LqwsvknpGkFLnVxs5/Q+Yz9hV9ErnIZFame6NDBBYAKM1Z5Fh/w7J+T8
	hQ8Q==
MIME-Version: 1.0
Received: by 10.52.70.205 with SMTP id o13mr59492835vdu.75.1357048221415; Tue,
	01 Jan 2013 05:50:21 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Tue, 1 Jan 2013 05:50:21 -0800 (PST)
In-Reply-To: <1356974245-3497-7-git-send-email-schnitzeltony@googlemail.com>
References: <1356974245-3497-1-git-send-email-schnitzeltony@googlemail.com>
	<1356974245-3497-7-git-send-email-schnitzeltony@googlemail.com>
Date: Tue, 1 Jan 2013 14:50:21 +0100
Message-ID: <CALbNGRSAtQT3_OBy8Yv9Mx+dbgOgy=O4ceHmRz7qhK+Nn0ZKiw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xfce/meta-gnome 06/10] mousepad: initial add 0.3.0
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
X-List-Received-Date: Tue, 01 Jan 2013 14:05:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 31, 2012 at 6:17 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb |   10 ++++++++++
>  1 files changed, 10 insertions(+), 0 deletions(-)
>  create mode 100644 meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb
>
> diff --git a/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb b/meta-xfc=
e/recipes-apps/mousepad/mousepad_0.3.0.bb
> new file mode 100644
> index 0000000..9028ec2
> --- /dev/null
> +++ b/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb
> @@ -0,0 +1,10 @@
> +DESCRIPTION =3D "A simple text editor for Xfce"
> +SECTION =3D "x11/application"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> +DEPENDS =3D "gtk+ dbus-glib"
> +
> +inherit xfce-app
> +
> +SRC_URI[md5sum] =3D "dcfcdfaa8a19c89f35d5f6f64753e6e1"
> +SRC_URI[sha256sum] =3D "10f27506994d0d0b8f9e02555404a144babedab97517abe3=
b6be8b2d21ff046d"
> --
> 1.7.4.4
>
This one fails at configure for build from scratch - will send V2 soon

Andreas


