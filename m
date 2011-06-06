Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefflance01@gmail.com>) id 1QTcG9-0002sc-G7
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Jun 2011 18:02:33 +0200
Received: by iwn10 with SMTP id 10so3622216iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jun 2011 08:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=07BBiaox5Y7A75ClTP5Eqb3DRCyU2b2O8IsjhV+Jvdk=;
	b=xhQvBOOe+w/me0EpEJ6gyNHVvFUJAdwV7OgzdmQOkuspWAqqRJmzB9bIHv9SeEw0ZY
	mwHZMIkpMTbL8rGtJl3ZU7f5O0aFERwWCx6H9lGyWOqtMRTLMA5yTWSm5yC+7rVUQckt
	zl/o35FI++zys1KdPeASrBipw4ZrV1knBhDco=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=m9a9wV8/0EJbvp1LZEbKQWpDO6joKdQp0QK9DSuXdHVcX8end/RWapUQZ8upim9r2h
	YcYxec4R8Mdi92CRM8Uc8lj9uZVZ4E5Yoa7gbsSMsbJyAhjW8iEagX5CVkK5vcDMuemt
	QNxRrcLAJUSalax3X8coRCdePdIM7yTUymcNs=
MIME-Version: 1.0
Received: by 10.231.142.17 with SMTP id o17mr8229890ibu.49.1307375937414; Mon,
	06 Jun 2011 08:58:57 -0700 (PDT)
Received: by 10.231.31.68 with HTTP; Mon, 6 Jun 2011 08:58:57 -0700 (PDT)
In-Reply-To: <1307370959.4011.17.camel@mattotaupa>
References: <1307369743-14738-1-git-send-email-j-lance1@ti.com>
	<1307370959.4011.17.camel@mattotaupa>
Date: Mon, 6 Jun 2011 10:58:57 -0500
Message-ID: <BANLkTikbajbPaptoGjE=bwZrCsE+KyyTHw@mail.gmail.com>
From: Jeff Lance <jefflance01@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 1/1] matrix_gui: Update SRCREV
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
X-List-Received-Date: Mon, 06 Jun 2011 16:02:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Paul,

Thanks for the help. I will use -s now. Previously I was hand typing in the
commit message.
I will resubmit a corrected version of this patch.

Jeff Lance

On Mon, Jun 6, 2011 at 9:35 AM, Paul Menzel <
paulepanter@users.sourceforge.net> wrote:

> Dear Jeff,
>
> Am Montag, den 06.06.2011, 09:15 -0500 schrieb Jeff Lance:
>
> you can make the commit subject more informational by writing the
> following.
>
>        matrix_gui: Update SRCREV to revision 257
>
> >       * Adding arm only multimedia apps to am37x
> >       * Wifi updates to am37x, am180x
> >       * Adding to am180x, am37x, am35x, beagle:
> >               * Oprofile example
>
> do you copy those lines from `git log`? `git log` adds indentation in
> front of the commit message. Please use `git format-patch`.
>
> > Signed-off-by  Jeff Lance   <j-lance1@ti.com>
>
> A colon =BB:=AB is missing and it is formatting strangely. Please use the
> option `-s`.
>
> As I wrote often enough please make sure the From and Signed-off-by
> field match.
>
> > ---
> >  recipes/ti/matrix-gui-common_1.4.bb |    4 ++--
> >  recipes/ti/matrix-gui-e_1.3.bb      |    4 ++--
> >  recipes/ti/matrix-gui_1.3.bb        |    4 ++--
> >  3 files changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/recipes/ti/matrix-gui-common_1.4.bb b/recipes/ti/
> matrix-gui-common_1.4.bb
> > index 6f7376d..0b4b25b 100644
> > --- a/recipes/ti/matrix-gui-common_1.4.bb
> > +++ b/recipes/ti/matrix-gui-common_1.4.bb
> > @@ -4,5 +4,5 @@ require matrix-gui-common.inc
> >  # prebuilt version in the repository.
> >  RRECOMMENDS_${PN} =3D "am-sysinfo"
> >
> > -SRCREV =3D "249"
> > -PR =3D "${INC_PR}.10"
> > +SRCREV =3D "257"
>
> Would it be beneficial to add `SRCREV` to `matrix-gui.inc` and require
> that everywhere?
>
> > +PR =3D "${INC_PR}.11"
> > diff --git a/recipes/ti/matrix-gui-e_1.3.bb b/recipes/ti/
> matrix-gui-e_1.3.bb
> > index 8f2df1c..a6eb17f 100644
> > --- a/recipes/ti/matrix-gui-e_1.3.bb
> > +++ b/recipes/ti/matrix-gui-e_1.3.bb
> > @@ -1,5 +1,5 @@
> >  require matrix-gui-e.inc
> >
> > -SRCREV =3D "249"
> > -PR =3D "${INC_PR}.9"
> > +SRCREV =3D "257"
> > +PR =3D "${INC_PR}.10"
> >
> > diff --git a/recipes/ti/matrix-gui_1.3.bb b/recipes/ti/matrix-gui_1.3.b=
b
> > index f7e56a3..51678df 100644
> > --- a/recipes/ti/matrix-gui_1.3.bb
> > +++ b/recipes/ti/matrix-gui_1.3.bb
> > @@ -1,4 +1,4 @@
> >  require matrix-gui.inc
> >
> > -SRCREV =3D "249"
> > -PR =3D "${INC_PR}.5"
> > +SRCREV =3D "257"
> > +PR =3D "${INC_PR}.6"
>
> Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>
>
> I did not build or runtest though.
>
>
> Thanks,
>
> Paul
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>

