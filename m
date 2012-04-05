Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.darander@gmail.com>) id 1SFfkw-00083O-EI
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Apr 2012 08:01:15 +0200
Received: by wibhj13 with SMTP id hj13so850951wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Apr 2012 22:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=NMOnqELQQaaHgvxX5EHDPqJ69cQ2Ep5lk4/UOa6nlf4=;
	b=lXAyO6pSqEGv7bcqmZl2gEqCq/+7Z4vEqN+1KXcIdIgKPdNXg8WIe073gUmKqj2Sj1
	XRVLhWUXB8RKjZyAdDy5nIRdDsAvZ1S+aBHUPEru6ygEkFAgOfNmfVP+c57aboRvn8Ow
	At1lVgBvjBp3b8Z8mfOGXhbP6E3rexIeIhZnVx6v9UzYsGd/eZaMfIWoNcKwNHOKTXme
	yjiymQhJKCixyOFgP3vjwsFlcafYrH6DoD4orIGAVzp78acXlsXzoZy3LT527IrdNgo+
	33v6eDb0Qrcm81atVVOozFIsuLG/xhCgWl6rTYccUYdg5nNV8JilA1gCAZMV/S9qhFce
	IYUg==
MIME-Version: 1.0
Received: by 10.180.76.240 with SMTP id n16mr1558550wiw.10.1333605123191; Wed,
	04 Apr 2012 22:52:03 -0700 (PDT)
Received: by 10.223.62.6 with HTTP; Wed, 4 Apr 2012 22:52:03 -0700 (PDT)
In-Reply-To: <cover.1333604512.git.anders@chargestorm.se>
References: <cover.1333604512.git.anders@chargestorm.se>
Date: Thu, 5 Apr 2012 07:52:03 +0200
Message-ID: <CAE4k23-qowUjTmTpxQPEabN4VXER0a3RcCFLYfCsSkANx0QOVw@mail.gmail.com>
From: Anders Darander <anders.darander@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe] Re: [PATCH 0/1] Fix issue re-running sqlite configure step
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
X-List-Received-Date: Thu, 05 Apr 2012 06:01:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Subject: [oe] [PATCH 0/1] Fix issue re-running sqlite configure step

should obviously have been
[meta-oe] [PATCH 0/1] Fix issue re-running sqlite configure step

On Thu, Apr 5, 2012 at 07:42, Anders Darander <anders@chargestorm.se> wrote=
:
>
> A recent update of meta-oe and oe-core force a rebuild of e.g. sqlite in
> my tree. This made sqlite error out in the configure step, as it couldn't
> find sqlite.pc, which had already been moved in a prior run of do_configu=
re.
>
>
> The following changes since commit a6790d602eb91069b1f618697e66a38619bcd6=
90:
>
> =A0v4l-utils: correct license delimiter (2012-04-04 20:36:48 +0200)
>
> are available in the git repository at:
> =A0git://github.com/darander/meta-oe sqlite-configure
> =A0https://github.com/darander/meta-oe/tree/sqlite-configure
>
> Anders Darander (1):
> =A0sqlite: cp instead of mv in do_configure
>
> =A0meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> --
> 1.7.5.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



--=20
Anders Darander
EPO guidelines 1978: "If the contribution to the known art resides
solely in a computer program then the subject matter is not
patentable in whatever manner it may be presented in the claims."


