Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SZkxN-0006ii-D3
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 May 2012 17:37:05 +0200
Received: by yhjj56 with SMTP id j56so3480691yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2012 08:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=ShkYxSkuwKH++JqqB6iKqXU2/Zhp3JuCjVzoVy85EL4=;
	b=LGk+agjKGWA0FjmlaErkAiaFNWqsInVM1spd69t3W6fbXjKmOdsGm3VNbo006VPmTJ
	J1BYoGlVeriRUuf/0o491DZqO1B/QDG6xy7RFZxQEnC9W5oO43tufDclyknFrS0qjjxP
	ljw2sxXJz21K/f72yZ/lmEcyglGA295Ms22jC9QKYfA+cbKUqXqS+P+gYitEelTGYPbC
	n8quizhx+q8Ix6574KQcFlPoqVoI+JEwFJFi8XEKicmyS0bngvrNuYMpwN0wFJF4LAK7
	RDhOzTDc0FcNGzPgmuexbsrjdUC3EYa0S7PAvEHLJgpYtKWt2hH45oUs7O82GrDw3qNU
	PVng==
MIME-Version: 1.0
Received: by 10.50.203.98 with SMTP id kp2mr11120319igc.42.1338391606147; Wed,
	30 May 2012 08:26:46 -0700 (PDT)
Received: by 10.64.18.10 with HTTP; Wed, 30 May 2012 08:26:46 -0700 (PDT)
In-Reply-To: <20120530152220.GQ3138@jama.jama.net>
References: <cover.1338386047.git.Martin.Jansa@gmail.com>
	<2484826dbf17baf50370f5484aa22f43200992dd.1338386047.git.Martin.Jansa@gmail.com>
	<CALbNGRTHSa+An9tURPWUQRgzZL8dMWN2s1uYJ+WyH41W=y-98Q@mail.gmail.com>
	<20120530152220.GQ3138@jama.jama.net>
Date: Wed, 30 May 2012 17:26:46 +0200
Message-ID: <CALbNGRS2vZ5_57H+u8O=jWkXUy1UD__-aB6KwDTgY-gyXCen4A@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-efl][PATCH 2/3] systemd.bbclass: fix postinst/rdepends generation for recipes with SYSTEMD_SERVICE (without _PN suffix)
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
X-List-Received-Date: Wed, 30 May 2012 15:37:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, May 30, 2012 at 5:22 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Wed, May 30, 2012 at 05:14:58PM +0200, Andreas M=FCller wrote:
>> On Wed, May 30, 2012 at 4:21 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> > ---
>> > =A0meta-oe/classes/systemd.bbclass | =A0 =A03 ++-
>> > =A01 files changed, 2 insertions(+), 1 deletions(-)
>> >
>> > diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd=
.bbclass
>> > index db35717..e895021 100644
>> > --- a/meta-oe/classes/systemd.bbclass
>> > +++ b/meta-oe/classes/systemd.bbclass
>> > @@ -201,7 +201,8 @@ python populate_packages_prepend () {
>> > =A0 =A0 =A0 =A0# run all modifications once when creating package
>> > =A0 =A0 =A0 =A0if os.path.exists('${D}'):
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for pkg_systemd in d.getVar('SYSTEMD_PA=
CKAGES', 1).split():
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if d.getVar('SYSTEMD_SER=
VICE' + "_" + pkg_systemd, 1) and d.getVar('SYSTEMD_SERVICE' + "_" + pkg_sy=
stemd, 1).strip():
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 systemd_services =3D d.g=
etVar('SYSTEMD_SERVICE' + "_" + pkg_systemd, 1) or d.getVar('SYSTEMD_SERVIC=
E', 1)
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if systemd_services and =
systemd_services.strip():
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0systemd=
_generate_package_scripts(pkg_systemd)
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0systemd=
_add_rdepends(pkg_systemd)
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0systemd_check_services()
>> > --
>> > 1.7.8.6
>> >
>> Two questions:
>>
>> 1. Did you see [1]?
>
> no, did you forgot to attach it? :)
>
>> 2. What is that strip for?
>
> In one .bbappend I had something like
>
> SERVICES =3D "foo"
> SERVICES_bar =3D ""
> SYSTEMD_SERVICE +=3D "${SERVICES}"
>
> And space was ending in SYSTEMD_SERVICE causing this to be executed
> without any real service in it (and failing).
>
> I can fix it by using _append but this .strip() looked like better
> solution for other who don't notice extra whitespace.
>
> Cheers,
>
> --
> Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
Yes :)
http://patches.openembedded.org/patch/28841/


