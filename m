Return-Path: <gizero@gmail.com>
X-Greylist: delayed 432 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 08 May 2014 06:17:08 UTC
Received: from mail-vc0-f175.google.com (unknown [209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4AE53609A7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 May 2014 06:17:08 +0000 (UTC)
Received: by mail-vc0-f175.google.com with SMTP id lh4so2671818vcb.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 May 2014 23:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=12RL0GsKBq9AUuU1Ijz/jgzgetPbAPeng22xtgva9mc=;
	b=QsehLj41klcRluKkU2fohJNqFBaB3UR0T7B10rkJLwkA7b4pUiqT11TEMhRhF2lvgz
	nfGvcuawaXw3EuoH+ly2ssnv5N/sLS9nGgf1wBHXW19MxaAgtGrwnre+tSWwYGT3yI0H
	ZW4L4OLuJbbWtshFlqTwrodTzOy7wgG51JhVPn77FfXxr+EMpczDivMYwgBo3RZ662d0
	eF/3OGYNAiayWXUvMwAUDil2oawj9P/qKJj6e5U/7EpNMJPSLc01sRR2mlGaQ3gAVbur
	P6TbGwX8a8InDs2W6PNTmQUYdLwq7ih4TxAKXU+buSeUY9TUKI4tUl257rc87/JB9xIH
	l+PQ==
MIME-Version: 1.0
X-Received: by 10.58.107.65 with SMTP id ha1mr1536233veb.1.1399529396704; Wed,
	07 May 2014 23:09:56 -0700 (PDT)
Received: by 10.220.0.67 with HTTP; Wed, 7 May 2014 23:09:56 -0700 (PDT)
In-Reply-To: <9465494.5B6U7XsnM9@koontz>
References: <1399454777-2868-1-git-send-email-sgh@sgh.dk>
	<2543976.qS9USN9dCY@peggleto-mobl5.ger.corp.intel.com>
	<8485696.3mtcMOoHMt@peggleto-mobl5.ger.corp.intel.com>
	<9465494.5B6U7XsnM9@koontz>
Date: Thu, 8 May 2014 08:09:56 +0200
Message-ID: <CAC+thW2wBb0xDpUo2G=UcHpEQXbiW4Q-U_r9TzoHZLs3gEvF-g@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] ifplugd: Added ifplugd recipe.
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
X-List-Received-Date: Thu, 08 May 2014 06:17:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi S=C3=B8ren,

On Wed, May 7, 2014 at 1:16 PM, S=C3=B8ren Holm <sgh@sgh.dk> wrote:
> Thanks for the feedback Paul
>
> Are there a document stating the "best pratice" sequence of lines in reci=
pes?

I usually refer to Openembedded Styleguide at [1]. It also links to a
similar page on Yocto's site.

[1] http://www.openembedded.org/wiki/Styleguide

>
> that said I might have been grabing the recipe from OE-Classic. Before po=
sting
> this patch I tried to find the recipe on layers.openembedded.org without =
luck.
>
> But just skip the patch - connman is the way to go I guess.
>
>
> Onsdag den 7. maj 2014 11:43:40 skrev Paul Eggleton:
>> On Wednesday 07 May 2014 11:34:23 Paul Eggleton wrote:
>> > Hi S=C3=B8ren,
>> >
>> > So leaving aside that ifplugd is completely dead upstream, a few small
>> > pieces of feedback on the recipe:
>> >
>> > On Wednesday 07 May 2014 11:26:17 S=C3=B8ren Holm wrote:
>> > > Signed-off-by: S=C3=B8ren Holm <sgh@sgh.dk>
>> > > ---
>> > >
>> > >  .../ifplugd/files/ifplugd.conf                     | 42
>> > >
>> > > ++++++++++++++++++++++ .../recipes-connectivity/ifplugd/ifplugd_0.28=
.bb
>> > >
>> > > 23 ++++++++++++ 2 files changed, 65 insertions(+)
>> > >
>> > >  create mode 100644
>> > >
>> > > meta-networking/recipes-connectivity/ifplugd/files/ifplugd.conf crea=
te
>> > > mode
>> > > 100644 meta-networking/recipes-connectivity/ifplugd/ifplugd_0.28.bb
>> > >
>> > > diff --git
>> > > a/meta-networking/recipes-connectivity/ifplugd/files/ifplugd.conf
>> > > b/meta-networking/recipes-connectivity/ifplugd/files/ifplugd.conf ne=
w
>> > > file mode 100644
>> > > index 0000000..1e0f83a
>> > > --- /dev/null
>> > > +++ b/meta-networking/recipes-connectivity/ifplugd/files/ifplugd.con=
f
>> > > @@ -0,0 +1,42 @@
>> > > +# -*-sh-*-
>> > > +# $Id: ifplugd.conf 43 2003-09-13 11:25:11Z lennart $
>> > > +
>> > > +# This file is part of ifplugd.
>> > > +#
>> > > +# ifplugd is free software; you can redistribute it and/or modify i=
t
>> > > under
>> > > +# the terms of the GNU General Public License as published by the F=
ree
>> > > +# Software Foundation; either version 2 of the License, or (at your
>> > > +# option) any later version.
>> > > +#
>> > > +# ifplugd is distributed in the hope that it will be useful, but
>> > > WITHOUT
>> > > +# ANY WARRANTY; without even the implied warranty of MERCHANTABILIT=
Y or
>> > > +# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public Lice=
nse
>> > > +# for more details.
>> > > +#
>> > > +# You should have received a copy of the GNU General Public License
>> > > +# along with ifplugd; if not, write to the Free Software Foundation=
,
>> > > +# Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
>> > > +
>> > > +# ifplugd configuration file
>> > > +
>> > > +# Please note that this is a bourne shell fragment sourced by the
>> > > +# init script of ifplugd.
>> > > +
>> > > +# Specify the interfaces to control here, separated by spaces.
>> > > +# Ifplugd processes will be started for each of these interfaces wh=
en
>> > > +# the ifplugd init script is called with the "start" argument. You =
may
>> > > +# use the magic string "auto" to make the init script start or stop
>> > > +# ifplugd processes for ALL eth and wlan interfaces that are availa=
ble
>> > > +# according to /proc/net/dev. Note that the list of interfaces
>> > > +# appearing in /proc/net/dev may depend on which kernel modules you
>> > > +# have loaded.
>> > > +INTERFACES=3D"eth0"
>> > > +
>> > > +# Additional parameters for ifplugd.
>> > > +# (Run "ifplugd -h" for further information.)
>> > > +ARGS=3D"-fwI -u0 -d10"
>> > > +
>> > > +# Additional parameters for ifplugd for the specified interface.  N=
ote
>> > > +# that $ARGS is ignored, when a variable like this is set for an
>> > > +# interface
>> > > +#ARGS_wlan0=3D"-MwI -u5 -d5"
>> > > diff --git
>> > > a/meta-networking/recipes-connectivity/ifplugd/ifplugd_0.28.bb
>> > > b/meta-networking/recipes-connectivity/ifplugd/ifplugd_0.28.bb new f=
ile
>> > > mode 100644
>> > > index 0000000..340d5f4
>> > > --- /dev/null
>> > > +++ b/meta-networking/recipes-connectivity/ifplugd/ifplugd_0.28.bb
>> > > @@ -0,0 +1,23 @@
>> > > +DESCRIPTION =3D "Daemon for monitoring ethernet device link state"
>> >
>> > Please use SUMMARY instead of DESCRIPTION of a
>>
>> Sorry, that should have been "Please use SUMMARY instead of DESCRIPTION =
for
>> a short description like this".
>>
>> Cheers,
>> Paul
>
> --
> S=C3=B8ren Holm
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

