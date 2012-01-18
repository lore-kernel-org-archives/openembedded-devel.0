Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1Rnand-0005UU-2k
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jan 2012 20:03:57 +0100
Received: by qcsp14 with SMTP id p14so2731737qcs.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jan 2012 10:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=hyGGxlSnborSe9EIIqZODVekrIYQBno5Isqd7rWDb6c=;
	b=tYcj8KnOkNquQF2LZbNHERjF73FbXW1fO1Nw+3OvnNhCuftYe4qtMNtdXBvfI5bUeY
	KcVY472Os0DifaAhD7msT7cCdcbvO8vuOtfD51hDddV57M+ABlINEkNgA77rTtB19vWa
	GVjZEW2tj4zc/qaJYPWUjJa/6hVOevpCdU1iw=
MIME-Version: 1.0
Received: by 10.229.76.91 with SMTP id b27mr9383726qck.124.1326912978051; Wed,
	18 Jan 2012 10:56:18 -0800 (PST)
Received: by 10.229.98.149 with HTTP; Wed, 18 Jan 2012 10:56:17 -0800 (PST)
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C402355CD@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C402355CD@post.tritech.se>
Date: Wed, 18 Jan 2012 11:56:17 -0700
Message-ID: <CA+M6bX=4QiWzDSe3Vka79cVzk+4_g2+3ZosJyTd1mPvfrUDn9Q@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance] Packaged staging -- dependency problem
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
X-List-Received-Date: Wed, 18 Jan 2012 19:03:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 18, 2012 at 8:51 AM, Mats K=E4rrman <Mats.Karrman@tritech.se> w=
rote:
> Well, now at least it pulls packages from the mirror instead of building =
them but there is a but.
>
> When building glib-2.0, do_configure uses autotools and the configure scr=
ipt of glib-2.0 wants to use sed from sysroots. sed-native exists in the mi=
rror but has not been installed in sysroots. I am uncertain where the depen=
dency on sed (or sed-native?) is missing/should be added. In the glib recip=
e or for autotools class? (this time i looked in master but found no releva=
nt patches.)
>
> Any advice?

I think you're going to find that without a lot of additional work,
packaged-staging isn't going to be helpful beyond you and your
machine.  A lot of the lessons learned in making packaged-staging work
better are found in sstate-cache in oe-core.  The easiest fix here is
to add ASSUME_PROVIDED +=3D "sed-native" to your local.conf / similar so
that sed-native isn't built and your host one is used.

--=20
Tom


