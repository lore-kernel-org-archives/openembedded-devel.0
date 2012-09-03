Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T8Qf0-00005v-RB
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Sep 2012 09:01:27 +0200
Received: by iaky10 with SMTP id y10so7801417iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Sep 2012 23:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=LKbCaR8KdagQm3TpILQcuAqZ/gA7xTW0mUzvwEgdJJU=;
	b=UbSs4qbyqNZu5cUJCjLvDrFWrXLiqF1driD2Gr+kgd9Eji3g/tB7zif25A675pxtka
	P6Ps/jmf/52EXRJ8q5kQF5/izxeZeA4eeSbQWCFtvNMOJgrl4bAiUsU5PAkpUZVP8Vzs
	yACC3PyzkdKmv9UYGpKf7CECYHLyRQ9dmq3ALy2hh0phvzqIB0944qX9islFpIwj0+1x
	eEdLbXWG8Fo+hUhF0QTkErP+voVWszoPyoDYYL6QcES+ES2uzdG8fgGBwlMwyadxfl1Y
	8CZX1uHQa3GXb8vqpdLly5/JTJvh/UahuCpKgHm/nk/sUYDN4+SP81zNPInASN8WccOs
	0avg==
MIME-Version: 1.0
Received: by 10.50.191.165 with SMTP id gz5mr9808532igc.50.1346654946144; Sun,
	02 Sep 2012 23:49:06 -0700 (PDT)
Received: by 10.64.18.13 with HTTP; Sun, 2 Sep 2012 23:49:06 -0700 (PDT)
In-Reply-To: <1345793018-4843-1-git-send-email-schnitzeltony@googlemail.com>
References: <1345793018-4843-1-git-send-email-schnitzeltony@googlemail.com>
Date: Mon, 3 Sep 2012 08:49:06 +0200
Message-ID: <CALbNGRRvrfJ0NCdxGcT0NrvJwB3aUynLvV0TnLf9L42LHNMY4w@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/3] gnome.bbclass: remove to use oe-core's version
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
X-List-Received-Date: Mon, 03 Sep 2012 07:01:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 24, 2012 at 9:23 AM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> * suggested in [1]
> * build tested from scratch with my working image [2]
>
> [1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-August/0=
41157.html
> [2] http://gitorious.org/schnitzeltony-oe-meta/meta-misc/blobs/master/rec=
ipes-image/xfce-full-image.bb
>
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  meta-oe/classes/gnome.bbclass |    4 ----
>  1 files changed, 0 insertions(+), 4 deletions(-)
>  delete mode 100644 meta-oe/classes/gnome.bbclass
>
> diff --git a/meta-oe/classes/gnome.bbclass b/meta-oe/classes/gnome.bbclas=
s
> deleted file mode 100644
> index 0a32a77..0000000
> --- a/meta-oe/classes/gnome.bbclass
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -inherit gnomebase gtk-icon-cache gconf mime
> -
> -EXTRA_OECONF +=3D "--enable-introspection=3Dno"
> -BBCLASSEXTEND +=3D "native"
> --
> 1.7.6.5
>
Some final ACK/NAK on this?

Andreas


