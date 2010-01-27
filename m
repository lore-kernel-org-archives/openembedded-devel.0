Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Na3qi-0002lS-7H
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jan 2010 10:06:11 +0100
Received: by fxm4 with SMTP id 4so5603935fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2010 01:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=EAk1/OR2MXuxk6+sDg0hogObhZ+RIrt2qX7EYuTmd2M=;
	b=A4CJUi5vctrbd/uZYsWQ2KxBv6BMSSItesma8Q0kBKeDeSFuFfvy6JIo/fAKujZ6CV
	5MdEBOY1by1x4vlIHpCqs3V7SWxb5r4ykhjEc6ILH1hNhbu3NHiDk+oo+RlcraFYaZ6Y
	RxNmnbfZmSieaA43YiBYtYxJJ7Ew3hEuagPrs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=Stwtf5frQqJAjSY/CsHydeSCH/GDD3pfTmc9DGgb4k5i0I9bMrboQOehvcr+ztEEoN
	018LCZN3R+9Mi1zVIX1WmncfRCbUZBs4nFZb+s5r7DnDNtFTJ7q2fiTk2zvu8dNoT+Et
	ts9Z0DawghhTRzT5PCHuRjUz7fHtOhO7pVGSA=
MIME-Version: 1.0
Received: by 10.223.73.82 with SMTP id p18mr5938935faj.34.1264583019225; Wed, 
	27 Jan 2010 01:03:39 -0800 (PST)
In-Reply-To: <E1NZW8K-0006jm-0Z@melo.openembedded.org>
References: <E1NZW8K-0006jm-0Z@melo.openembedded.org>
Date: Wed, 27 Jan 2010 10:03:39 +0100
Message-ID: <141020e31001270103l4e84271ao184bdea0b19f7a01@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] Graeme Gregory : glib-2.0_2.22.4.bb : add new version totally clean recipe
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
X-List-Received-Date: Wed, 27 Jan 2010 09:06:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 25, 2010 at 10:06 PM, git version control
<git@git.openembedded.org> wrote:
> Commit: 267bedfed32b4488a66f7d6af88665e06261082c
> URL: =A0 =A0http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcomm=
it;h=3D267bedfed32b4488a66f7d6af88665e06261082c
>
> glib-2.0_2.22.4.bb : add new version totally clean recipe
>
> The glib-2.0 recipe seemed to have gained a lot of un-needed extras and
> was also out of date for BBCLASSEXTEND and staging. So this is a minimali=
sed
> new version.

Hi,

yesterday I did rebuild from scratch and noticed that
obexpush-1.0.0-r6 is failing with this version.

It's because it's looking for glibconfig.h only in
staging/armv4t-oe-linux-gnueabi/usr/include/glib-2.0 and this file is
with this version available only in
staging/armv4t-oe-linux-gnueabi/usr/lib/glib-2.0/include

with 2.22.4
bitbake@jama ~/tmpdir-dev-shr/staging/armv4t-oe-linux-gnueabi/usr/include/g=
lib-2.0
$ diff . ../../lib/glib-2.0/include/
Only in .: gio
Only in .: glib
Only in ../../lib/glib-2.0/include/: glibconfig.h
Only in .: glib.h
Only in .: glib-object.h
Only in .: gmodule.h
Only in .: gobject

with 2.22.1
bitbake@jama ~/tmpdir-dev/staging/armv5te-angstrom-linux-gnueabi/usr/includ=
e/glib-2.0
$ diff -rq . ../../lib/glib-2.0/include/
Only in .: gio
Only in .: glib
Only in .: glib.h
Only in .: glib-object.h
Only in .: gmodule.h
Only in .: gobject


Just to make sure where it should be fixed..
Adding -I in obexpush recipe is easy enough as GLIBINC is exported
from recipe and glib-config is not used.
export GLIBINC =3D "-I${STAGING_INCDIR}/glib-2.0
-I${STAGING_LIBDIR}/glib-2.0/include"

but maybe glibconfig.h will be needed in other recipes too.

Regards,


