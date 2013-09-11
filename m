Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3509E60F18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2013 11:32:43 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id kp13so9061893pab.21
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2013 04:32:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=XlZq4vXPnCD/ZsN3lEIRYoXevTeHiUoeq+JgdTV/8SI=;
	b=gP+fg1gXnHIk9QaJwFf9xWIyWxmSZxcPwOvV2bZ0U954piiYXEkcx5FJH++Tvh4hMr
	p9J8StJ4X4cJhTKsnffKrq3mmJEzQbjbg5rNX6HesCVjP7OWvlfKJGEZNJUyNc0dMA+c
	v2fkPUH2T8Ngnow+dGrWdbVLliQ4yX7f82YvFA15KCKwx+LS69T0vazze3KL5wL7jOnL
	7RORbOhUKImm4ptToB4UjRhYVMP/8NK0ZRCDVYAmaB7ut7+DeZOFGGc6sU87/4DRgnSa
	+97s9pMxYfx0NoyqZrrvGtYMNqjWnBqHHBhG4EKxhWdzuVHnvDwFZZOEcgmxx82dYONz
	9AeQ==
X-Gm-Message-State: ALoCoQkuIXGLqtVHVC9KZ80NjNbrlmLcLjvoWrhqKWViZ/kvHdMt0tHfo/EhJQX0ZsiAofwbVEYR
MIME-Version: 1.0
X-Received: by 10.66.118.204 with SMTP id ko12mr2399825pab.184.1378899164979; 
	Wed, 11 Sep 2013 04:32:44 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.234 with HTTP; Wed, 11 Sep 2013 04:32:44 -0700 (PDT)
In-Reply-To: <CA+AhUGxYgv3yhGxHHJ+tb7xzLL7OkXn6RLnz1duZrdTKV1rO1Q@mail.gmail.com>
References: <1378898387-7629-1-git-send-email-erik.boto@pelagicore.com>
	<CAOMwXhONd6pVJ4=Nut+xF5cyBVcF9-LGfd0OzQ8NL2oJQbMsRQ@mail.gmail.com>
	<CA+AhUGxYgv3yhGxHHJ+tb7xzLL7OkXn6RLnz1duZrdTKV1rO1Q@mail.gmail.com>
Date: Wed, 11 Sep 2013 12:32:44 +0100
X-Google-Sender-Auth: -EHQbIwVzGvyvHjR052laCio1uo
Message-ID: <CAOMwXhNy0S7C9opkFFQOjjUo8a+vY6=mhO9N67wDz8ZYb83tDg@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5][PATCH] Added module qtquickcontrols
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Sep 2013 11:32:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Very nice, thanks.


On Wed, Sep 11, 2013 at 12:27 PM, Erik Bot=F6 <erik.boto@pelagicore.com>wro=
te:

> Yes, I have a project that uses "QtQuick.Layouts 1.0" and
> "QtQuick.Controls 1.0". I haven't done extensive testing, but after
> adding this module the GUI starts and seems to be working as intended.
>
> Cheers,
> Erik
>
> On Wed, Sep 11, 2013 at 1:22 PM, Laszlo Papp <lpapp@kde.org> wrote:
> > Were you able to run an example after adding this?
> >
> >
> > On Wed, Sep 11, 2013 at 12:19 PM, Erik Bot=F6 <erik.boto@pelagicore.com
> >wrote:
> >
> >> Signed-off-by: Erik Bot=F6 <erik.boto@pelagicore.com>
> >> ---
> >>  recipes-qt/qt5/qtquickcontrols.inc      | 3 +++
> >>  recipes-qt/qt5/qtquickcontrols_5.1.0.bb | 5 +++++
> >>  2 files changed, 8 insertions(+)
> >>  create mode 100644 recipes-qt/qt5/qtquickcontrols.inc
> >>  create mode 100644 recipes-qt/qt5/qtquickcontrols_5.1.0.bb
> >>
> >> diff --git a/recipes-qt/qt5/qtquickcontrols.inc
> >> b/recipes-qt/qt5/qtquickcontrols.inc
> >> new file mode 100644
> >> index 0000000..63e884e
> >> --- /dev/null
> >> +++ b/recipes-qt/qt5/qtquickcontrols.inc
> >> @@ -0,0 +1,3 @@
> >> +require qt5.inc
> >> +
> >> +DEPENDS +=3D "qtdeclarative"
> >> diff --git a/recipes-qt/qt5/qtquickcontrols_5.1.0.bb b/recipes-qt/qt5/
> >> qtquickcontrols_5.1.0.bb
> >> new file mode 100644
> >> index 0000000..fc880d7
> >> --- /dev/null
> >> +++ b/recipes-qt/qt5/qtquickcontrols_5.1.0.bb
> >> @@ -0,0 +1,5 @@
> >> +require qt5-${PV}.inc
> >> +require ${PN}.inc
> >> +
> >> +SRC_URI[md5sum] =3D "b3825124a173a36f63c2f8380dc61e81"
> >> +SRC_URI[sha256sum] =3D
> >> "88d39421d78464c3900c37616e8369fc8d998c1b0f611980e6e082f46569646b"
> >> --
> >> 1.8.1.2
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>
> --
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Erik Bot=F6
> Senior Software Engineer
> Pelagicore AB
> Ekelundsgatan 4, 6tr, SE-411 18 Gothenburg, Sweden
> Mobile: +46 (0)76 881 72 03
> E-Mail: erik.boto@pelagicore.com
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

