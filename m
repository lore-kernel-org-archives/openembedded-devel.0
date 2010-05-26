Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OHBSm-0004SS-US
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 09:55:41 +0200
Received: by gwb15 with SMTP id 15so1825663gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 May 2010 00:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=rSUR3wOP9IhIT/c5cZ4DbbYmyOjPe/fRUaAoyS8IVdA=;
	b=EUklHJK/AGXl7uCFZ+LCDwjiaDtgMn6bKiSNv5xn7PngmDP5F8rgjdgmhpt0Mx9YSK
	3h0TguvLnsvJCX4uah4BqN8ccb6b7w+7n+LkRCbLalk1pZUgDAAzj7QSqyz2zwbuq/yP
	EX3B9ceu0tnzqI57DkQAp9eF6Xcm+ukvOCqh4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=uIJh2A0VZFew824O2KDesn6lKT9o7U9cQxxS8mhN1FvJVVajP4pwjcbVwVri9lrC4a
	Vg2RU+5nFhrBf/uKJ8E2GQ+M2aOYhG7GL/uM3VQIpjjR9TYHvx9u+xLwPz9j1eqvyDaK
	vt93LpsGM0GnBt7Vin8kBKeHF0ZB9N6YWU0n0=
MIME-Version: 1.0
Received: by 10.91.100.18 with SMTP id c18mr4026151agm.151.1274860290621; Wed, 
	26 May 2010 00:51:30 -0700 (PDT)
Received: by 10.90.71.4 with HTTP; Wed, 26 May 2010 00:51:30 -0700 (PDT)
In-Reply-To: <1274859584-8442-1-git-send-email-raj.khem@gmail.com>
References: <1274859584-8442-1-git-send-email-raj.khem@gmail.com>
Date: Wed, 26 May 2010 09:51:30 +0200
Message-ID: <AANLkTikJgMLy1es5sHK8p07GTrKoe9ZYNJ9wiAQjmJVZ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] sanity.bbclass: Barf if TMPDIR has trailing forward slash
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
X-List-Received-Date: Wed, 26 May 2010 07:55:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/5/26 Khem Raj <raj.khem@gmail.com>:
> * Unknowingly many developers run into this issue and
> =A0painful part it that the problems start happening almost
> =A0when build it complete and the errors are unrelated to cause
> =A0see http://www.mail-archive.com/angstrom-distro-devel@linuxtogo.org/ms=
g02922.html
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0classes/sanity.bbclass | =A0 11 +++++++++--
> =A01 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/classes/sanity.bbclass b/classes/sanity.bbclass
> index dfb3010..88672ba 100644
> --- a/classes/sanity.bbclass
> +++ b/classes/sanity.bbclass
> @@ -112,11 +112,18 @@ def check_sanity(e):
> =A0 =A0 =A0 =A0oes_bb_conf =3D data.getVar( 'OES_BITBAKE_CONF', e.data, T=
rue )
> =A0 =A0 =A0 =A0if not oes_bb_conf:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0messages =3D messages + 'You do not includ=
e OpenEmbeddeds version of conf/bitbake.conf. This means your environment i=
s misconfigured, in particular check BBPATH.\n'
> -
> =A0 =A0 =A0 =A0#
> - =A0 =A0 =A0 # Check that TMPDIR hasn't changed location since the last =
time we were run
> + =A0 =A0 =A0 # get TMPDIR and use it in following two checks
> =A0 =A0 =A0 =A0#
> =A0 =A0 =A0 =A0tmpdir =3D data.getVar('TMPDIR', e.data, True)
> + =A0 =A0 =A0 #
> + =A0 =A0 =A0 # check if tmpdir has traling '/'
> + =A0 =A0 =A0 #
> + =A0 =A0 =A0 if tmpdir[-1] =3D=3D "/":
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 messages =3D messages + "Your TMPDIR has tr=
ailing '/' (forward slash), this can cause autotools lamangler fail regexp =
matches when munging .la files. Please remove it.\n\t"
> + =A0 =A0 =A0 #
> + =A0 =A0 =A0 # Check that TMPDIR hasn't changed location since the last =
time we were run
> + =A0 =A0 =A0 #
> =A0 =A0 =A0 =A0checkfile =3D os.path.join(tmpdir, "saved_tmpdir")
> =A0 =A0 =A0 =A0if os.path.exists(checkfile):
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0f =3D file(checkfile, "r")
> --
> 1.7.0.4
>

Tested. works great for me so:
Acked-By: fransmeulenbroeks@gmail.com


