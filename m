Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NemBz-0004RI-P5
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 10:15:38 +0100
Received: from [85.210.8.8] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1Nem9W-0006nb-OP
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 09:13:02 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1265676216-9722-3-git-send-email-ynezz@true.cz>
References: <1265676216-9722-1-git-send-email-ynezz@true.cz>
	<1265676216-9722-2-git-send-email-ynezz@true.cz>
	<1265676216-9722-3-git-send-email-ynezz@true.cz>
Date: Tue, 09 Feb 2010 09:13:01 +0000
Message-ID: <1265706781.6761.19.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.8.8
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] linux 2.6.24: moving ts72xx to 2.6.27 as default kernel so change DEFAULT_PREFERENCE
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
X-List-Received-Date: Tue, 09 Feb 2010 09:15:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-02-09 at 01:43 +0100, Petr =C5=A0tetiar wrote:
> -DEFAULT_PREFERENCE_ts72xx =3D "1"
> +DEFAULT_PREFERENCE_ts72xx =3D "-1"
>  DEFAULT_PREFERENCE_hipox =3D "1"
>  DEFAULT_PREFERENCE_cs-e9302 =3D "1"
>  DEFAULT_PREFERENCE_smartq5 =3D "1"
> =20
> -PR =3D "r34"
> +PR =3D "r35"

There's no need to increment PR if the only thing you are changing is
DEFAULT_PREFERENCE.  In general, you need to increment PR if (and only
if) your change would cause the output from the recipe to be different
from what it was before.  Changes that just affect whether or not the
recipe is built at all, and don't have any impact on the result of the
build, do not require a new PR.

Not that bumping PR unnecessarily is all that big a deal, of course, but
it does cause a certain amount of avoidable churn and annoyance for
other users of the recipe.  It is best not to do it when you don't have
to.

p.




