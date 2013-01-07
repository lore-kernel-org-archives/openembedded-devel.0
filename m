Received: from mail-ia0-f173.google.com ([209.85.210.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TsFN6-0005il-ON
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jan 2013 17:16:22 +0100
Received: by mail-ia0-f173.google.com with SMTP id w21so16569486iac.18
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jan 2013 08:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=dE7EIwGRw8ZvytNRB7VJssIEFk1p+kh+LjXNWgXJbz4=;
	b=OTwKgbTe5AYp6nzgRAU7R43XfuiZwcbzkeLzIwUPP9k9VnW45tr1+Ny2pBbNjP6z4l
	KZxl2o8VKjXTk34wVxEjj0ouiWkgaENIPS1hCzN6SzlQtF8+0b8soA4Me1vVkn1oQPXR
	n/6PWt6iX8+/NsS3jYXx3+I+wVg/9tRU8f4JZZD1jT3KJJuUfEdTU7e22qh00Gj8Gg5g
	cCf7KG9sSjRhTZEiT8r2VHv8SdLAPL+zsDE2mliDFnRfCSveUGjvYqF19ngIGB2Br1b1
	P/twsYjKS2aXBSZpdCpxhOg63b/BR/nyOwVtcmNpYk1a6wGoaWCNGx+XDlXNUNERrqyU
	qJwQ==
MIME-Version: 1.0
Received: by 10.43.92.72 with SMTP id bp8mr46204732icc.49.1357574470474; Mon,
	07 Jan 2013 08:01:10 -0800 (PST)
Received: by 10.64.19.8 with HTTP; Mon, 7 Jan 2013 08:01:10 -0800 (PST)
In-Reply-To: <20130107153602.GD6154@windriver.com>
References: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
	<1357463568-26241-9-git-send-email-raj.khem@gmail.com>
	<20130106093635.GB3272@jama>
	<CAMKF1sqXMaKrkpicDJLgZuWBzwTo3gyw_N3emL858GZfSZnwHw@mail.gmail.com>
	<20130107153602.GD6154@windriver.com>
Date: Mon, 7 Jan 2013 08:01:10 -0800
Message-ID: <CAMKF1srqeYHXwFz+e8C8+RTQMX63Fbgck2DnjYia8XLzTqSN4Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH V2 09/25] atftp: Upgrade to latest from git
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
X-List-Received-Date: Mon, 07 Jan 2013 16:16:33 -0000
Content-Type: text/plain; charset=UTF-8

On Monday, January 7, 2013, Joe MacDonald wrote:

> Hi Khem,
>
> [Re: [oe] [meta-oe][PATCH V2 09/25] atftp: Upgrade to latest from git] On
> 13.01.06 (Sun 17:23) Khem Raj wrote:
>
> > On Sun, Jan 6, 2013 at 1:36 AM, Martin Jansa <martin.jansa@gmail.com<javascript:;>>
> wrote:
> > > On Sun, Jan 06, 2013 at 01:12:32AM -0800, Khem Raj wrote:
> > >> Add patches to let atftp serve huge ramdisks >500M in size
> > >
> > > I don't see this patch
> > > http://patchwork.openembedded.org/patch/41955/
> > > in V2, can you update status on patchwork to indicate which patches are
> > > superseeded by V2 and which are still valid?
> > >
> >
> > I would suggest to actually drop all V1 patches since I have
> > reshuffled them quite a bit and take all V2 fresh
> > I have also pushed this latest series into contrib repo
> >
> >
> http://git.openembedded.org/meta-openembedded-contrib/log/?h=kraj/updates
>
> I'm looking at that now.  The only comment / request I have right now is
> about atftp.  It was on my list of stuff to update and move into
> meta-networking.  If there's no objection it that, would you mind moving
> it there at the same time?  I'd been planning to have it in
> meta-networking/recipes-daemons.


Yes that's ok but I trout of doing the move as a separate step which does
not have other changes
For ease of surfing the history in future. It's not only atftpd but there
are move recipes that need to
Move into this layer


>
> Thanks,
> -J.
>
> >
> >
> > > Thanks
> > >
> > >>
> > >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >> ---
> > >>  .../atftp/{atftp_0.7.bb => atftp_git.bb}           |   18 +--
> > >>  ...tpd-0.7_circumvent_tftp_size_restrictions.patch |  158
> ++++++++++++++++++++
> > >>  .../atftpd-0.7_unprotected_assignments_crash.patch |  145
> ++++++++++++++++++
> > >>  3 files changed, 311 insertions(+), 10 deletions(-)
> > >>  rename meta-oe/recipes-extended/atftp/{atftp_0.7.bb => atftp_git.bb}
> (59%)
> > >>  create mode 100644
> meta-oe/recipes-extended/atftp/files/atftpd-0.7_circumvent_tftp_size_restrictions.patch
> > >>  create mode 100644
> meta-oe/recipes-extended/atftp/files/atftpd-0.7_unprotected_assignments_crash.patch
> > >>
> > >> diff --git a/meta-oe/recipes-extended/atftp/atftp_0.7.bbb/meta-oe/recipes-extended/atftp/
> atftp_git.bb
> > >> similarity index 59%
> > >> rename from meta-oe/recipes-extended/atftp/atftp_0.7.bb
> > >> rename to meta-oe/recipes-extended/atftp/atftp_git.bb
> > >> index ff1e11d..774dd68 100644
> > >> --- a/meta-oe/recipes-extended/atftp/atftp_0.7.bb
> > >> +++ b/meta-oe/recipes-extended/atftp/atftp_git.bb
> > >> @@ -3,13 +3,16 @@ SECTION = "network"
> > >>  HOMEPAGE = "http://packages.debian.org/atftp"
> > >>  LICENSE = "GPLv2"
> > >>  LIC_FILES_CHKSUM =
> "file://LICENSE;md5=94d55d512a9ba36caa9b7df079bae19f"
> > >> -PR = "r4"
> > >> +PV = "0.7.1+git${SRCPV}"
> > >>
> > >> -SRC_URI =
> "${DEBIAN_MIRROR}/main/a/atftp/atftp_${PV}.dfsg.orig.tar.gz;name=archive \
> > >> -
> ${DEBIAN_MIRROR}/main/a/atftp/atftp_${PV}.dfsg-11.diff.gz;name=patch \
> > >> -           file://atftpd.init"
> > >> +SRCREV = "be3291a18c069ae23a124ffdc56d64a5ff0bbec7"
> > >>
> > >> -S = "${WORKDIR}/atftp-${PV}.dfsg"
> > >> +SRC_URI = "git://
> atftp.git.sourceforge.net/gitroot/atftp/atftp;protocol=git \
> > >> +           file://atftpd-0.7_circumvent_tftp_size_restrictions.patch
> \
> > >> +           file://atftpd-0.7_unprotected_assignments_crash.patch \
> > >> +           file://atftpd.init \
> > >> +          "
> > >> +S = "${WORKDIR}/git"
> > >>
> > >>  inherit autotools update-rc.d useradd
> > >>
> > >> @@ -35,8 +38,3 @@ PACKAGES =+ "atftpd"
> > >>  FILES_${PN} = "${bindir}/*"
> > >>
> > >>  FILES_${PN}d = "${sbindir}/* ${sysconfdir}/init.d/* /srv/tftp"
> > >> -
> > >> -SRC_URI[archive.md5sum] = "aa269044a6f992eca78fee2f6119643c"
> > >> -SRC_URI[archive.sha256sum] =
> "18815f5b67290fac087c6b9da28dfa5e0feb722096f5c5de52e59b46026da559"
> > >> -SRC_URI[patch.md5sum] = "1636f199bf32c754a7bf34a5c647d138"
> > >> -SRC_URI[patch.sha256sum] =
> "0df33f6c09c2b2de58a84d7bb757844fc9538cd4d6c8d9c463da5270ebc2e41d"
> > >> diff --git
> a/meta-oe/recipes-extended/atftp/files/atftpd-0.7_circumvent_tftp_size_restrictions.patch
> b/meta-oe/recipes-extended/atftp/files/atftpd-0.7_circumvent_tftp_size_restrictions.patch
> > >> new file mode 100644
> > >> index 0000000..9aeb351
> > >> --- /dev/null
> -Joe MacDonald.
> :wq
>

