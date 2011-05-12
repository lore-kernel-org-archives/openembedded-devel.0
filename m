Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <needemesleepe@gmail.com>) id 1QKdt1-0006N9-OY
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 23:57:36 +0200
Received: by pzk36 with SMTP id 36so946367pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 May 2011 14:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=NQzotFnGrnkvc9+y6WtyrXgxXQ+WvRaVQUIx0ruWOyk=;
	b=e3x/qvLScOSNLn6YT/+mP4A4CNj2Jd0SXFnKgQOyq1hByJ3FQ+/EJYzvzdhvu46vim
	1W7xaIowPKePP5VZsthSPsJqgVRyNixoyfhRKlYZQb7UctppWGeeyjNnG8AAQ+nYn5/b
	806ZffMbV+2eguEOdn22ZlI1zv20Gr0FUhiwk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Mi2nEjsdyGiIsBTtKEIAWGapJPEHWJLdza5paMMCD5GUPJEkmbCvyvDoS9uvWRdwxh
	UIfyYy6TGaZPXdrkJg8P3W8ISXjo7xAq7FD0WtX/JlrjtGBi/JGFURGueiY/BXN25qFL
	EHzf1Xf0Eim46sAsAO6SjpUpiLfJw9Rxgcuko=
MIME-Version: 1.0
Received: by 10.68.49.73 with SMTP id s9mr991452pbn.117.1305237286852; Thu, 12
	May 2011 14:54:46 -0700 (PDT)
Received: by 10.68.41.97 with HTTP; Thu, 12 May 2011 14:54:46 -0700 (PDT)
In-Reply-To: <1305236006.13652.41.camel@mattotaupa>
References: <BANLkTimHpb2Jyf=QYk_p0VL95jdNQJGCog@mail.gmail.com>
	<1305236006.13652.41.camel@mattotaupa>
Date: Thu, 12 May 2011 17:54:46 -0400
Message-ID: <BANLkTimdLk4S_0zjM8NTwXSxrTU_epdC+Q@mail.gmail.com>
From: Martin Bures <needemesleepe@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: wpa-supplicant-0.7.inc patch
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
X-List-Received-Date: Thu, 12 May 2011 21:57:36 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi, Paul -

I will take a look at the policy and try to update the patch tomorrow.

As for your questions/comments about .config.  That was how the recipe was
when I found it - I was just trying to make minimal modifications from what
was there to get it working.  I agree that it could be changed to use
defconfig.  As with the patch submission guidelines, I will take a look and
see if this change as-suggested works correctly tomorrow and modify and
resubmit the patch accordingly.

best regards,
martin.

On Thu, May 12, 2011 at 5:33 PM, Paul Menzel <
paulepanter@users.sourceforge.net> wrote:

> Dear Martin,
>
>
> Am Donnerstag, den 12.05.2011, 16:53 -0400 schrieb Martin Bures:
> > The wpa-supplicant recipe does not place dbus configuration files even
> > though dbus is enabled in the .config.
>
> you can add this to the commit message too.
>
> > The following patch fixes this for me.
>
> Thank you very much for the patch. Unfortunately we cannot commit this
> yet, since at least your Signed-off-by line is missing. Please take a
> look at the commit policy [1].
>
> > From b8d6a52070f678371aef194fc0df37c6911e1952 Mon Sep 17 00:00:00 2001
> > From: Martin Bures <mbures@zoll.com>
>
> You should decide what address to use and also take that for the
> Signed-off-by line.
>
> > Date: Thu, 12 May 2011 16:35:29 -0400
> > Subject: [PATCH] Fixed issue where dbus configuration is not detected.
>  This prevented
> >  wpa-supplicant dbus support from being included.
>
> Please use a short commit summary and an elaborate commit message
> (body).
>
> wpa-supplicant-0.7.inc: use `.config` in the source directory `${S}`
>
> Using the `.config` in the working directory `${WORKDIR}` =85
>
> > ---
> >  recipes/wpa-supplicant/wpa-supplicant-0.7.inc |    6 +++---
> >  1 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
> b/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
> > index 722f5fa..6e2f754 100644
> > --- a/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
> > +++ b/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
> > @@ -50,15 +50,15 @@ do_install () {
> >         install -m 600 ${WORKDIR}/defaults-sane
> ${D}${sysconfdir}/default/wpa
> >         install -m 600 ${WORKDIR}/wpa_supplicant.conf-sane
> ${D}${sysconfdir}/wpa_supplicant.conf
> >
> > -       if grep -q ^CONFIG_CTRL_IFACE_DBUS=3Dy .config || grep -q
> ^CONFIG_CTRL_IFACE_DBUS_NEW=3Dy .config; then
> > +       if grep -q ^CONFIG_CTRL_IFACE_DBUS=3Dy ${S}/.config || grep -q
> ^CONFIG_CTRL_IFACE_DBUS_NEW=3Dy ${S}/.config; then
>
> I still do not quite understand the change. Looking at
>
>        do_configure () {
>                install -m 0755 ${WORKDIR}/defconfig .config
>                if [ "${@base_contains('COMBINED_FEATURES', 'madwifi', 1, =
0,
> d)}" =3D "1" ]; then
>                        echo "CONFIG_DRIVER_MADWIFI=3Dy" >> .config
>                        echo "CFLAGS +=3D -I${STAGING_INCDIR}/madwifi-ng" =
>>
> .config
>                fi
>        }
>
> `.config` should be created in `${WORKDIR}` as a copy of `defconfig`.
> Why do you now consider `.config` in the source directory? Maybe you
> should adapt the `defconfig` shipped by OpenEmbedded?
>
> >                 install -d ${D}/${sysconfdir}/dbus-1/system.d
> >                 install -m 644 ${S}/dbus/dbus-wpa_supplicant.conf
> ${D}/${sysconfdir}/dbus-1/system.d
> >                 install -d ${D}/${datadir}/dbus-1/system-services
> > -               if grep -q ^CONFIG_CTRL_IFACE_DBUS=3Dy .config; then
> > +               if grep -q ^CONFIG_CTRL_IFACE_DBUS=3Dy ${S}/.config; th=
en
> >                         sed -i -e s:/sbin:${sbindir}:g
> ${S}/dbus/fi.epitest.hostap.WPASupplicant.service
> >                         install -m 644
> ${S}/dbus/fi.epitest.hostap.WPASupplicant.service
> ${D}/${datadir}/dbus-1/system-services
> >                 fi
> > -               if grep -q ^CONFIG_CTRL_IFACE_DBUS_NEW=3Dy .config; the=
n
> > +               if grep -q ^CONFIG_CTRL_IFACE_DBUS_NEW=3Dy ${S}/.config=
;
> then
> >                         sed -i -e s:/sbin:${sbindir}:g
> ${S}/dbus/fi.w1.wpa_supplicant1.service
> >                         install -m 644
> ${S}/dbus/fi.w1.wpa_supplicant1.service
> ${D}/${datadir}/dbus-1/system-services
> >                 fi
>
> I do not know the recipe, so please excuse my questions.
>
>
> Thanks,
>
> Paul
>
>
> [1] http://openembedded.org/index.php/Commit_Policy
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>

