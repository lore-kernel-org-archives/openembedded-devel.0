Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P0ck9-0008NM-R0
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Sep 2010 18:09:26 +0200
Received: by wwb18 with SMTP id 18so3816525wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Sep 2010 09:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=2YqBe6X6vSYfycStne8YQeyytt1ZLepHbEsj4xnVJig=;
	b=TkE/DaiGZFY7iWzcLedCeV88rU67vhYU8drJRut6qAbWBad/93thqc4nMy8AM1RGst
	G9vf7YcxSiGMhwb+flEHHg/MpYfFacEtZim40Uz7RzpTyUaCQhocCV9fD+PTM6Q52F2c
	AfuUQoxfbuXFE2ZYBEhnQQqXwqIfcmxwO/qi0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Om85bUZwz0isIwaAF+O67kSmI6XrHbSPVeC09wR8Zn0J52mVCSsDMvQkxx+2viEL5x
	GN5jlIdJcCvlMohMPYJNvU9glAkNevi7UbBIxsmjZTULNBs0xrlPwXD7TCzC1HdRSjV0
	dEbp/7+3hXYiU3HTXi71i8IS8U5UAPoJehcKk=
MIME-Version: 1.0
Received: by 10.227.155.82 with SMTP id r18mr165978wbw.70.1285690153599; Tue,
	28 Sep 2010 09:09:13 -0700 (PDT)
Received: by 10.227.144.69 with HTTP; Tue, 28 Sep 2010 09:09:13 -0700 (PDT)
In-Reply-To: <1285161497-13594-1-git-send-email-eric@eukrea.com>
References: <1285161497-13594-1-git-send-email-eric@eukrea.com>
Date: Tue, 28 Sep 2010 18:09:13 +0200
Message-ID: <AANLkTimojR-3LyNvVsYtt6njfbN3seEWMiziewW47GJR@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] classes/update-rc.d.bbclass: move update-rc after postinst
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
X-List-Received-Date: Tue, 28 Sep 2010 16:09:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 22, 2010 at 3:18 PM, Eric B=E9nard <eric@eukrea.com> wrote:
> without this, launching a daemon can fail if postinst is supposed, for
> example, to fix permissions of directories used by the daemon.
>
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>

FYI: this maybe somehow broke syslog-ng postinst:

Configuring syslog-ng.
update-rc.d: /etc/init.d/syslog exists during rc.d purge (continuing)
 Removing any system startup links for syslog ...
update-rc.d: /etc/init.d/syslog-ng exists during rc.d purge (use -f to forc=
e)

from syslog-ng package:
OE om-gta02@shr ~/test $ cat postinst
#!/bin/sh
        update-rc.d -f syslog remove
if test "x$D" !=3D "x"; then
        OPT=3D"-r $D"
else
        OPT=3D"-s"
fi
update-rc.d $OPT syslog-ng remove
OE om-gta02@shr ~/test $ cat prerm
#!/bin/sh
if test "x$D" =3D "x"; then
        if test "$1" =3D "upgrade" -o "$1" =3D "remove"; then
                /etc/init.d/syslog-ng stop
        fi
fi
OE om-gta02@shr ~/test $ cat postrm
update-rc.d syslog add 5
if test "x$D" !=3D "x"; then
        OPT=3D"-r $D"
else
        OPT=3D""
fi
if test "$1" =3D "remove" -o "$1" =3D "purge"; then
        if ! test -e "/etc/init.d/syslog-ng"; then
                update-rc.d $OPT syslog-ng remove
        fi
fi


