Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rrz9l-0005qc-Lc
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jan 2012 22:52:57 +0100
Received: by lahc1 with SMTP id c1so2427843lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2012 13:45:04 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.112.83.197 as permitted sender)
	client-ip=10.112.83.197; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.112.83.197 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.112.83.197])
	by 10.112.83.197 with SMTP id s5mr6148054lby.9.1327959904635 (num_hops
	= 1); Mon, 30 Jan 2012 13:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=PeD4cA98DOOSTF9yPCmamcS6McTJSkcVY1RvN9wnKk0=;
	b=C6tForH4x1rxhyNm9AqR60sz1XuUqoJtOEX2GbmZWKxiUqhakkNsAR6vLSRgTOYsJE
	eSgSKZBoz6Szda6fI3v/R+0QSXDo2PT8D7L2Gx9GrVc/qN+q6jvqVSPJdtSRbpuuHvZF
	Eo5OBnwUiiEHFRSDMAKzJY/De2YtkbQg7Vvkg=
MIME-Version: 1.0
Received: by 10.112.83.197 with SMTP id s5mr5059142lby.9.1327959903865; Mon,
	30 Jan 2012 13:45:03 -0800 (PST)
Received: by 10.112.102.165 with HTTP; Mon, 30 Jan 2012 13:45:03 -0800 (PST)
In-Reply-To: <1327954536-29427-1-git-send-email-tworaz666@gmail.com>
References: <1327954536-29427-1-git-send-email-tworaz666@gmail.com>
Date: Mon, 30 Jan 2012 22:45:03 +0100
Message-ID: <CALbNGRRFydx6qqfMUCGrTzLsvAp5N+N8K4ox_fJMZUf6cRZtSg@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xfce][PATCH] Add recipe for xarchiver 0.5.2.
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
X-List-Received-Date: Mon, 30 Jan 2012 21:52:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2012 at 9:15 PM, Peter Tworek <tworaz666@gmail.com> wrote:
> Run tested on netbookpro.
>
> Signed-off-by: Peter Tworek <tworaz666@gmail.com>
> ---
> =A0.../recipes-apps/xarchiver/xarchiver_0.5.2.bb =A0 =A0 =A0| =A0 16 ++++=
++++++++++++
> =A01 files changed, 16 insertions(+), 0 deletions(-)
> =A0create mode 100644 meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
>
> diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb b/meta-x=
fce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
> new file mode 100644
> index 0000000..b2e5fb6
> --- /dev/null
> +++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION =3D "Lightweight desktop independent, GTK+ archive manager"
> +HOMEPAGE =3D "http://xarchiver.sourceforge.net"
> +SECTION =3D "x11"
> +PR =3D "r0"
> +
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> +
> +DEPENDS =3D "gtk+ glib-2.0 xfce4-dev-tools"
Do you need xfce4-dev-tools on the target or isn't
xfce4-dev-tools-native enough?

Andreas


