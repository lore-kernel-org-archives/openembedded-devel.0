Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OlyO3-0002Eh-Rf
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 08:14:06 +0200
Received: by iwn38 with SMTP id 38so1458584iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Aug 2010 23:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ewd6776LrM+kLDvH3Met/cbmu61oQ3qAWZTjeJkwKBg=;
	b=sk0tWsc4jV94qINSz6PepMEPk25Ew4ut1KlyZOhwR3Hk4xWFiIBu6aVZHg4suc+eqL
	xc33dLuK4qwENDqSejVoBUPe3fJC7qJaKLuEWNKlb9wafjS/U+qWrK/IkqIMA9x4Bl+/
	zqNuxurDo6FE1dBOiPZAn6bKjAWu/V5dCrYwY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=aUHHUhIlACggBH6OwFGqC61AEO374Dw/D1fJk04uMuOB0TUvv4c6DLO1wbHvcw7hP9
	gar3f51vipJ4sqdANKaq+naLQFx1ie6O+ZG/tPhn4K/vT15YTJZ4so3hMcalg5mzfZ77
	CZ7OEY9jq3du+ipmCzjZz2sz55PVpPSVIgenk=
MIME-Version: 1.0
Received: by 10.231.146.129 with SMTP id h1mr10444451ibv.181.1282198412566;
	Wed, 18 Aug 2010 23:13:32 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Wed, 18 Aug 2010 23:13:32 -0700 (PDT)
In-Reply-To: <1281633623-10945-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1281633623-10945-1-git-send-email-fransmeulenbroeks@gmail.com>
Date: Thu, 19 Aug 2010 08:13:32 +0200
Message-ID: <AANLkTinQQa_DqQpZwNE_4yXyvwE1Q006qEvP0J1oYbUn@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] src_distribute_local.bbclass: add an error message and exit if a file is not found
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
X-List-Received-Date: Thu, 19 Aug 2010 06:14:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/12 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> When a file was not found do_distribute_local would still continue.
> This patch adds an error message and terminates do_distribute_local
>
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
> =A0classes/src_distribute_local.bbclass | =A0 28 +++++++++++++++++++++++-=
----
> =A01 files changed, 23 insertions(+), 5 deletions(-)
>
> diff --git a/classes/src_distribute_local.bbclass b/classes/src_distribut=
e_local.bbclass
> index 7b1e7d7..bdf03e9 100644
> --- a/classes/src_distribute_local.bbclass
> +++ b/classes/src_distribute_local.bbclass
> @@ -7,21 +7,39 @@ SRC_DISTRIBUTECOMMAND[dirs] =3D "${SRC_DISTRIBUTEDIR}/$=
{LIC}/${PN}"
> =A0# symlinks the files to the SRC_DISTRIBUTEDIR
> =A0SRC_DISTRIBUTECOMMAND-symlink () {
> =A0 =A0 test -e "${SRC}.md5" && ln -sf "${SRC}.md5" .
> - =A0 =A0ln -sf "${SRC}" .
> + =A0 =A0if test -e {SRC}
> + =A0 =A0then
> + =A0 =A0 =A0 =A0ln -sf "${SRC}" .
> + =A0 =A0else
> + =A0 =A0 =A0 echo "File does not exist:" ${SRC}
> + =A0 =A0 =A0 exit 1
> + =A0 =A0fi
> =A0}
>
> =A0# copies the files to the SRC_DISTRIBUTEDIR
> =A0SRC_DISTRIBUTECOMMAND-copy () {
> =A0 =A0 test -e "${SRC}.md5" && cp -f "${SRC}.md5" .
> - =A0 =A0cp -fr "${SRC}" .
> + =A0 =A0if test -e {SRC}
> + =A0 =A0then
> + =A0 =A0 =A0 =A0cp -fr "${SRC}" .
> + =A0 =A0else
> + =A0 =A0 =A0 echo "File does not exist:" ${SRC}
> + =A0 =A0 =A0 exit 1
> + =A0 =A0fi
> =A0}
>
> =A0# moves the files to the SRC_DISTRIBUTEDIR and symlinks them back
> =A0SRC_DISTRIBUTECOMMAND-move+symlink () {
> =A0 =A0 if ! [ -L ${SRC} ]; then
> - =A0 =A0 =A0 =A0src=3D`basename "${SRC}"`
> - =A0 =A0 =A0 =A0mv ${SRC} .
> - =A0 =A0 =A0 =A0ln -sf $src "${SRC}"
> + =A0 =A0 =A0 =A0if test -e {SRC}
> + =A0 =A0 =A0 =A0then
> + =A0 =A0 =A0 =A0 =A0 =A0src=3D`basename "${SRC}"`
> + =A0 =A0 =A0 =A0 =A0 =A0mv ${SRC} .
> + =A0 =A0 =A0 =A0 =A0 =A0ln -sf $src "${SRC}"
> + =A0 =A0 =A0 =A0else
> + =A0 =A0 =A0 =A0 =A0 echo "File does not exist:" ${SRC}
> + =A0 =A0 =A0 =A0 =A0 exit 1
> + =A0 =A0 =A0 =A0fi
> =A0 =A0 =A0 =A0 if [ -e ${SRC}.md5 ]; then
> =A0 =A0 =A0 =A0 =A0 =A0 mv ${SRC}.md5 .
> =A0 =A0 =A0 =A0 =A0 =A0 ln -sf $src "${SRC}.md5"
> --

This has been in review for a week & no comments.
Unless someone reacts soon, I'm going to push this.

Frans.


