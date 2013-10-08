Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 285DD6CC85
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 18:13:23 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id gx14so7118871lab.23
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Oct 2013 11:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=myEFn2B3WPQ6eHtT7FOG85sZcvZU7fztgcZUyeChZRQ=;
	b=bLjZpWjUVNRKes7QSUlBk9Bny4cmHJAgjlYaK+lJ/JrOe2MnxF0J6DlUBk04vzQOwP
	VvGkW6MbJSxX5Jio+hKEG1LbWXyqUdApgY9dffCYk0WjuuKIaR/UOVWglXDqqPg9ZBT2
	h6DXo7D0IFkaTdSk/vCniHbBqhPSe4kZ31uhKFjofTTkuWF9Daljf5O3V9wY+08lrYbH
	shSfHLApwZhGpkbp0NWlVBNaDqEbggaB6yI1jSYisGa6qxYItSfZXkCkBEaL5RCrxRPn
	dxopfHZHdvTaNBvlXQf1nOJpxXhOHpcShwvMlMHsS/Nj1UbZTZF8Rew5sHRm+e+BBdhM
	dxqA==
MIME-Version: 1.0
X-Received: by 10.152.22.131 with SMTP id d3mr2373944laf.35.1381256004924;
	Tue, 08 Oct 2013 11:13:24 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Tue, 8 Oct 2013 11:13:24 -0700 (PDT)
In-Reply-To: <20131008171847.GB6619@deserted.net>
References: <1381239308-8682-1-git-send-email-joe@deserted.net>
	<52540AA5.8080808@windriver.com>
	<CAOMwXhNLQKhAJMvKT4TYJrKRf5npt7MWK1sMULNpgSsrYyJBEg@mail.gmail.com>
	<CAOMwXhOL7XopAd7dvJ-OLctZiy_uAXa0BA07OHR2573kkYD2sA@mail.gmail.com>
	<20131008171847.GB6619@deserted.net>
Date: Tue, 8 Oct 2013 14:13:24 -0400
Message-ID: <CADkTA4NdfwisTy09CJbaKUZizs2JxHfz0ENe=vN5YDfpRkZR5A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Cc: Laszlo Papp <lpapp@kde.org>
Subject: Re: [meta-networking][PATCH] openflow: import and tweak
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
X-List-Received-Date: Tue, 08 Oct 2013 18:13:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2013 at 1:18 PM, Joe MacDonald <joe@deserted.net> wrote:
> Hey Laszlo,
>
> [Re: [meta-networking][PATCH] openflow: import and tweak] On 13.10.08 (Tu=
e 15:31) Laszlo Papp wrote:
>
>> Just to give an example about one of those critical issues: the recipe f=
or 1.0
>> is even broken, as that should *not* use ./boot.sh.
>
> Okay.  It didn't cause obvious problems for me and it seemed to be
> working for the guys using meta-virtualization, but I'm completely
> willing to believe it's not the right thing to do here.  If you have an
> alternative suggestion or could help me understand the impact, please
> let me know.
>
>> On Tue, Oct 8, 2013 at 3:17 PM, Laszlo Papp <lpapp@kde.org> wrote:
>>
>>     In short: please do not get this in if I may ask.
>>
>>     The recipe from meta-virtual is flawed in my opinion and should be d=
ropped,
>>     and then rewritten,
>
> I recall you saying that, though I haven't encountered large problems
> with it yet.  I'd appreciate any guidance you have to offer, of course,
> including a full rewrite.
>
>>     especially since "Bruce" was so concerned about
>>     license, reference and copyrights stuff. I would not mix his code in=
to a
>>     new layer for those issues.
>
> I'm not terribly concerned about attribution and copyright since he
> seems to have agreed with my approach here.

Yep.

Also, since non of the code is mine, I was just looking for a paper
trail back to
the old recipe and contributor for folks that were updating layers and
can follow
the recipe movement.  I think my previous concerns were misunderstood.

So Joe's approach is fine, and I have no issues.

Full re-write, some combination .. they are all good. I'll just test meta-v=
irt
against it no matter what, and send patches if things break.

>
>>     By the way, I also mentioned that I would rewrite that. Is there any=
 reason
>>     why I did not get enough time for that contribution? I mean I have n=
ot even
>>     been contacted about my status. Why did you not try to avoid the
>>     cross-work?
>
> The last time this came around the thread was already pretty long before
> I even started with it and the last I'd seen suggested to me that you
> weren't interested in having this integrated anymore.  I still thought
> there was value in it, so I started from your base and tried to address
> the open issues from the thread.  Time-wise, a month has passed for
> something it sounded like would be done in a few days.  I took that at
> confirmation that you were no longer pursuing this.
>
> Absolutely no slight was intended.

'nor here with my Ack of Joe's work. I was just waiting in the background a=
s
well.

Cheers,

Bruce

>
> -J.
>
>>
>>
>>     On Tue, Oct 8, 2013 at 2:37 PM, Bruce Ashfield <
>>     bruce.ashfield@windriver.com> wrote:
>>
>>         On 13-10-08 09:35 AM, Joe MacDonald wrote:
>>
>>             Based on work by David Nystr=F6m (meta-virtualization) and L=
aszlo
>>             Papp
>>             (meta-oe).
>>
>>                 - Import OpenFlow 1.0 from meta-virtualization and provi=
de an
>>             updated
>>                   version of the recipe for the head of tree in the Open=
Flow
>>             git
>>                   repository.
>>
>>                 - Minor tweak in both recipes for do_install_append() sp=
acing.
>>
>>                 - Update 'libssl' PACKAGECONFIG flag in both to follow t=
he
>>             'openssl'
>>                   convention used elsewhere in meta-oe.
>>
>>                 - Create common include file for both versioned and git
>>             recipes.
>>
>>
>>         Awesome. I was just wondering about this a few days ago. I'll pu=
sh a
>>         removal of the meta-virt recipe, once this has merged to
>>         meta-networking.
>>
>>         Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>>
>>
>>
>>
>>             Signed-off-by: Joe MacDonald <joe@deserted.net>
>>             ---
>>               .../recipes-protocols/openflow/openflow.inc        |   35
>>             ++++++++++++++++++++
>>               .../recipes-protocols/openflow/openflow_1.0.bb     |    4 =
+++
>>               .../recipes-protocols/openflow/openflow_git.bb     |    4 =
+++
>>               3 files changed, 43 insertions(+)
>>               create mode 100644 meta-networking/recipes-protocols/openf=
low/
>>             openflow.inc
>>               create mode 100644 meta-networking/recipes-protocols/openf=
low/
>>             openflow_1.0.bb
>>               create mode 100644 meta-networking/recipes-protocols/openf=
low/
>>             openflow_git.bb
>>
>>             diff --git a/meta-networking/recipes-protocols/openflow/
>>             openflow.inc b/meta-networking/recipes-protocols/openflow/
>>             openflow.inc
>>             new file mode 100644
>>             index 0000000..43af54e
>>             --- /dev/null
>>             +++ b/meta-networking/recipes-protocols/openflow/openflow.in=
c
>>             @@ -0,0 +1,35 @@
>>             +SUMMARY =3D "OpenFlow communications protocol"
>>             +DESCRIPTION =3D "\
>>             +Open standard that enables researchers to run experimental
>>             protocols in \
>>             +contained networks.  OpenFlow is a communications interface
>>             between \
>>             +control and forwarding planes of a software-defined network=
ing
>>             architecture.\
>>             +"
>>             +HOMEPAGE =3D "http://www.openflow.org"
>>             +
>>             +SECTION =3D "networking"
>>             +LICENSE =3D "GPLv2"
>>             +
>>             +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D
>>             e870c934e2c3d6ccf085fd7cf0a1e2e2"
>>             +
>>             +SRC_URI =3D "git://gitosis.stanford.edu/openflow.git;protoc=
ol=3Dgit"
>>             +
>>             +DEPENDS =3D "virtual/libc"
>>             +
>>             +EXTRA_OECONF +=3D "KARCH=3D${TARGET_ARCH}"
>>             +
>>             +PACKAGECONFIG ??=3D "openssl"
>>             +PACKAGECONFIG[openssl] =3D "--enable-ssl,--disable-ssl, ope=
nssl,
>>             libssl"
>>             +
>>             +S =3D "${WORKDIR}/git"
>>             +
>>             +inherit autotools
>>             +
>>             +do_configure() {
>>             +    ./boot.sh
>>             +    oe_runconf
>>             +}
>>             +
>>             +do_install_append() {
>>             +    # Remove /var/run as it is created on startup
>>             +    rm -rf ${D}${localstatedir}/run
>>             +}
>>             diff --git a/meta-networking/recipes-protocols/openflow/
>>             openflow_1.0.bb b/meta-networking/recipes-protocols/openflow=
/
>>             openflow_1.0.bb
>>             new file mode 100644
>>             index 0000000..a7e254d
>>             --- /dev/null
>>             +++ b/meta-networking/recipes-protocols/openflow/openflow_1.=
0.bb
>>             @@ -0,0 +1,4 @@
>>             +include ${BPN}.inc
>>             +
>>             +SRCREV =3D "5ccca75a69f99791659bcfbcf35353ab1921320a"
>>             +PV =3D "1.0"
>>             diff --git a/meta-networking/recipes-protocols/openflow/
>>             openflow_git.bb b/meta-networking/recipes-protocols/openflow=
/
>>             openflow_git.bb
>>             new file mode 100644
>>             index 0000000..6403bfb
>>             --- /dev/null
>>             +++ b/meta-networking/recipes-protocols/openflow/openflow_gi=
t.bb
>>             @@ -0,0 +1,4 @@
>>             +include ${BPN}.inc
>>             +
>>             +SRCREV =3D "c84f33f09d5dbcfc9b489f64cb30475bf36f653a"
>>             +PV =3D "1.0+git${SRCPV}"
>>
>>
>>
>>
>>
>>
>>
>
> --
> -Joe MacDonald.
> :wq
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

