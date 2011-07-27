Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Qm6nT-00054i-7n
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jul 2011 18:17:23 +0200
Received: by vxh2 with SMTP id 2so1389648vxh.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2011 09:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=G9sC89tbRQ6YYXNFUiW7YpVABYmGdh1PDNPg9sBGq8E=;
	b=EKqkYC6zTAECJ5jqY0zohc8g/8eI9206srW4AaTiWHS5dDImNkyLOZT4d3ui+v0xbh
	VtnjzbEXJjNn0cWPHVp1RLcYqhnI/DUrViU22syvrUXdbdaVT+YXSEimxGLSNlqh4pt+
	lexrCpK9kZlNy5qia5lC3SIK4bFCKWzTpsMAs=
Received: by 10.52.75.234 with SMTP id f10mr253955vdw.241.1311783188080; Wed,
	27 Jul 2011 09:13:08 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.181.104 with HTTP; Wed, 27 Jul 2011 09:12:48 -0700 (PDT)
In-Reply-To: <4E301F87.8040609@dresearch-fe.de>
References: <4E301F87.8040609@dresearch-fe.de>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 27 Jul 2011 09:12:48 -0700
X-Google-Sender-Auth: zF_lVdHeMP3uLfypgTsRVe8-ZHg
Message-ID: <CABcZANnYw1Njsi=8BUr0=Mf-O78VEXF9XJQy5-Oqm66+=A7nQQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: understanding overlays
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
X-List-Received-Date: Wed, 27 Jul 2011 16:17:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 27, 2011 at 7:24 AM, Steffen Sledz <sledz@dresearch-fe.de> wrot=
e:
> I'm not really familiar with the oe/bitbake overlay details. So please fo=
rgive me if this is a faq. ;-)
>
> Is the overlay package or file based?
>
> Or in other words is the following scenario possible?
>
> base layer:
>
> =C2=A0recipes/
> =C2=A0 =C2=A0foo/
> =C2=A0 =C2=A0 =C2=A0foo.inc
> =C2=A0 =C2=A0 =C2=A0foo_x.y.z.bb
>
> overlay:
>
> =C2=A0recipes/
> =C2=A0 =C2=A0foo/
> =C2=A0 =C2=A0 =C2=A0foo.inc
>
> And than build foo-x.y.z with the foo.inc from the overlay.

That depends. If the .bb does 'require foo.inc', then no, it will use
the local one. If it does 'require recipes/foo/foo.inc', then yes, it
will use the overlay one, assuming the overlay is before the main
layer in your BBLAYERS.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


