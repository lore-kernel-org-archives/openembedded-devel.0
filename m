Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id C6E826011C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 02:29:33 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id s15so16743841qtk.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jun 2019 19:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kyMyWY5prNEG+cfflHnaCdfs1F8dXm+aARb+rVNOHhs=;
	b=T3YEMOBiSGypdXOOa3NhJdXwXm4CMMD9b3WEEJao6h5WkmrXqbYfGUXAiKRqu8JAvc
	c9ZXQ7vNKTDf3SMPrCUfRGLOAkDKfVa7mwb4c8ADTdsvNUNNqqIz+3nycyaZs30uU+uN
	ngAF7245P38cM2OC1f8599Wfb2cXySJUea3H1D9eEsxu8i/z5fsnbV5ICo1qYhpuQT9y
	y7+Ye8A31Q0YI7+bJkX494IDQ+1bZdcFcQWIADM/kv4B6RSu4VyjCVyR4wol+lKzFqGC
	ohZYh5RGkUuSmnBGKQlcjyEryYaGxBhI4JJe8SaTcNKBcp8SwAhx83eGoihtMhOoo1KC
	2h0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kyMyWY5prNEG+cfflHnaCdfs1F8dXm+aARb+rVNOHhs=;
	b=svf8PvCyd44pQmsLwPIX8bTquuiDmvapGG9CMWam0WUH7t50n0dSYhlupkayLh+6F9
	KEmgnEd14dUQGbx076H1peo15Ju9xSoOfD/ch+tnupr9Us1pnteaLoB5cfdNKH6k3CGF
	0lYb5VAi0SXIcyP1W5V/YWWA59GM3nJV37pJ5OjXWaqN22preGCTXBK0FAHrWaQZmqL/
	nhCkbU2SHfcX891NxWwTK2ZRafrFAnnq1+S/7ypfu4iUabNmlYBYZdJyoWctQcrNemf/
	ePuVMHin43tTH3PfrwwARK7+079KGudxEWWyKqJt1WyC84eza+0FxIEHlG3fSsnErwrc
	8k+A==
X-Gm-Message-State: APjAAAUduU0fCqYtxIl+sxwXp6DwUKqreS21kTcmQbxOzR2zuzu7bqG3
	EV1di57/5buDw2lzV90zNVeTcHF+kFdGCumvqQ+GktOQ
X-Google-Smtp-Source: APXvYqzmH9RVj9eBOTgpzR8OgawyQmR94IXsid7K7VtXN6HFmDbzVKmNT9e13X3G1Pu7pq/lLFE3wpveXccPBEiItXU=
X-Received: by 2002:a0c:bd1d:: with SMTP id m29mr61093221qvg.181.1561429774201;
	Mon, 24 Jun 2019 19:29:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190623223554.13989-1-open.source@oleksandr-kravchuk.com>
	<CAMKF1soezey1nig9E+7ZGt_Lq=tycPfL0-OXMvdFaeRomai3+w@mail.gmail.com>
	<3e80014a-a5fa-ebf2-4617-29fd4dd67456@oleksandr-kravchuk.com>
In-Reply-To: <3e80014a-a5fa-ebf2-4617-29fd4dd67456@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Jun 2019 19:29:08 -0700
Message-ID: <CAMKF1sph9teMfc6Yc+-zV0tHDC=9X6e44Uf05PLjHv3nekMBOQ@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-networking] nuttcp: add systemd unit file
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Jun 2019 02:29:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 24, 2019 at 11:03 AM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> I thought the same. I am not sure how this is supposed to work, but when
> I add `inherit systemd`, unit files do not end up in the package.
>

you still need to install them in right location but this class will
then do the right post install steps etc.

> On 24/06/2019 02:54, Khem Raj wrote:
> > On Sun, Jun 23, 2019 at 3:36 PM Oleksandr Kravchuk
> > <open.source@oleksandr-kravchuk.com> wrote:
> >> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> >> ---
> >>  .../recipes-support/nuttcp/nuttcp/nuttcp.socket      |  9 +++++++++
> >>  .../recipes-support/nuttcp/nuttcp/nuttcp@.service    |  8 ++++++++
> >>  .../recipes-support/nuttcp/nuttcp_8.2.2.bb           | 12 +++++++++++-
> >>  3 files changed, 28 insertions(+), 1 deletion(-)
> >>  create mode 100644 meta-networking/recipes-support/nuttcp/nuttcp/nuttcp.socket
> >>  create mode 100644 meta-networking/recipes-support/nuttcp/nuttcp/nuttcp@.service
> >>
> >> diff --git a/meta-networking/recipes-support/nuttcp/nuttcp/nuttcp.socket b/meta-networking/recipes-support/nuttcp/nuttcp/nuttcp.socket
> >> new file mode 100644
> >> index 000000000..a8ae74fb8
> >> --- /dev/null
> >> +++ b/meta-networking/recipes-support/nuttcp/nuttcp/nuttcp.socket
> >> @@ -0,0 +1,9 @@
> >> +[Unit]
> >> +Description=Network Performance Testing Server Activation Socket
> >> +
> >> +[Socket]
> >> +ListenStream=5000
> >> +Accept=true
> >> +
> >> +[Install]
> >> +WantedBy=sockets.target
> >> diff --git a/meta-networking/recipes-support/nuttcp/nuttcp/nuttcp@.service b/meta-networking/recipes-support/nuttcp/nuttcp/nuttcp@.service
> >> new file mode 100644
> >> index 000000000..b778e8552
> >> --- /dev/null
> >> +++ b/meta-networking/recipes-support/nuttcp/nuttcp/nuttcp@.service
> >> @@ -0,0 +1,8 @@
> >> +[Unit]
> >> +Description=Network Performance Testing Server
> >> +After=local-fs.target
> >> +
> >> +[Service]
> >> +User=nobody
> >> +ExecStart=/usr/bin/nuttcp -S
> >> +StandardInput=socket
> >> diff --git a/meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb b/meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb
> >> index 2fd563123..193caf3cf 100644
> >> --- a/meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb
> >> +++ b/meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb
> >> @@ -12,7 +12,9 @@ LIC_FILES_CHKSUM = "file://${BP}.c;beginline=4;endline=30;md5=496a7c0bb83c07ff52
> >>
> >>  UPSTREAM_CHECK_URI = "https://www.nuttcp.net/nuttcp/beta/"
> >>
> >> -SRC_URI = "http://nuttcp.net/${BPN}/beta/${BP}.c"
> >> +SRC_URI = "http://nuttcp.net/${BPN}/beta/${BP}.c \
> >> +           file://nuttcp@.service \
> >> +           file://nuttcp.socket"
> >>  SRC_URI[md5sum] = "d3c92c4d2f261221193c3726c1b9a42f"
> >>  SRC_URI[sha256sum] = "8c5595bcd27c2fd66831be74c390df078cfb1870aa427f2511ac2586d236c8a1"
> >>
> > I think we also need to inherit systemd bbclass,
> >
> >> @@ -24,5 +26,13 @@ do_compile () {
> >>
> >>  do_install () {
> >>      install -d ${D}${bindir}
> >> +    install -d ${D}${systemd_system_unitdir}
> >>      install -m 0755 nuttcp ${D}${bindir}
> >> +    install -m 0644 ${WORKDIR}/nuttcp@.service ${D}${systemd_system_unitdir}
> >> +    install -m 0644 ${WORKDIR}/nuttcp.socket ${D}${systemd_system_unitdir}
> >>  }
> >> +
> >> +FILES_${PN} += " \
> >> +    ${bindir} \
> >> +    ${systemd_system_unitdir} \
> >> +"
> >> --
> >> 2.17.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

