Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4785B6F6C2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Mar 2014 00:24:20 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id hr14so1477507wib.15
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Mar 2014 17:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=DQCUtXZLWwH1D9IxzIsDSD/DNYCh4ZVXEwVHME/uf6Y=;
	b=br7LsaF3goTts4Q4s1iZclunN/a+DeseUwSTkpyupXpldi4XB9LbSGVUkkGwpAyNf8
	lKjO0BsIcYag+V+xbXsCb51ywhjr+h9Blp8gXV7oLsf0Iik566xazT2Zse8rH/zL0R94
	VR9cD1pLCJ3Wv//lb+v5D5LS8N6dnGKd5iGbII8Xh+Xxx/kPWcM6LtvwF9w2k++o7E6L
	eXxnMZlLBsJqAIy+PgW/Ld2k9rEhruqXHq8g05noMcRrzhulMoE4ZbAK8vbmyqZ1NKvX
	fLdKYO/+VrhtVBg2eRBdbdemy6j/Lyb5pzRGszoNCabfPh4Um3OkIPMl4b9FFKvqPRK9
	2yRA==
MIME-Version: 1.0
X-Received: by 10.194.63.103 with SMTP id f7mr3521111wjs.38.1395015860736;
	Sun, 16 Mar 2014 17:24:20 -0700 (PDT)
Received: by 10.194.59.228 with HTTP; Sun, 16 Mar 2014 17:24:20 -0700 (PDT)
In-Reply-To: <20140317000217.GD3725@jama>
References: <1395010139-15359-1-git-send-email-stephen.arnold42@gmail.com>
	<20140317000217.GD3725@jama>
Date: Sun, 16 Mar 2014 17:24:20 -0700
Message-ID: <CAOLEWZVyVyLOt9H6U0ZXEyUidpAYcL6m=O2omDnXreCuhQjBMw@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-multimedia][PATCH] updated mpd to current upstream stable
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
X-List-Received-Date: Mon, 17 Mar 2014 00:24:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

Not sure I understand; there should be only a new 0.18.8 recipe file in the
commit.  I have an updated one with a more standard message body,
signed-off-by, etc.  I'll resend a v2 in a minute, so please be specific if
something looks funky.  Thanks, Steve


On Sun, Mar 16, 2014 at 5:02 PM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Sun, Mar 16, 2014 at 03:48:58PM -0700, stephen.arnold42 wrote:
> > ---
> >  .../recipes-multimedia/musicpd/mpd_0.18.8.bb       | 59
> ++++++++++++++++++++++
>
> Can you please remove 0.18.4 in the same commit and resend with -M?
>
> Thanks
>
> >  1 file changed, 59 insertions(+)
> >  create mode 100644 meta-multimedia/recipes-multimedia/musicpd/
> mpd_0.18.8.bb
> >
> > diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.8.bbb/meta-multimedia/recipes-multimedia/musicpd/
> mpd_0.18.8.bb
> > new file mode 100644
> > index 0000000..b6882af
> > --- /dev/null
> > +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.8.bb
> > @@ -0,0 +1,59 @@
> > +SUMMARY = "Music Player Daemon"
> > +LICENSE = "GPLv2"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> > +HOMEPAGE ="http://www.musicpd.org"
> > +
> > +DEPENDS = "alsa-lib libsamplerate0 libsndfile1 libvorbis libogg faad2
> ffmpeg curl sqlite bzip2 pulseaudio"
> > +
> > +SRC_URI = " \
> > +    http://www.musicpd.org/download/${PN}/stable/${P}.tar.xz \
> > +    file://mpd.conf.in \
> > +"
> > +
> > +SRC_URI[md5sum] = "7bbe1caf5abe404dc985ca4f44984b1f"
> > +SRC_URI[sha256sum] =
> "5366378e548fb77996cc33b0e15165ddd84f1e496bdd04616bd593aecdc26450"
> > +
> > +inherit autotools useradd systemd
> > +
> > +EXTRA_OECONF = "enable_bzip2=yes"
> > +EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd',
> '--with-systemdsystemunitdir=${systemd_unitdir}/system/',
> '--without-systemdsystemunitdir', d)}"
> > +
> > +PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
> > +PACKAGECONFIG[id3tag] = "--enable-id3,--disable-id3,libid3tag"
> > +PACKAGECONFIG[lame] =
> "--enable-lame-encoder,--disable-lame-encoder,lame"
> > +
> > +do_install_append() {
> > +    install -d ${D}/${localstatedir}/lib/mpd/music
> > +    chmod 775 ${D}/${localstatedir}/lib/mpd/music
> > +    install -d ${D}/${localstatedir}/lib/mpd/playlists
> > +    chown -R mpd ${D}/${localstatedir}/lib/mpd
> > +    chown mpd:mpd ${D}/${localstatedir}/lib/mpd/music
> > +
> > +    install -d ${D}/${sysconfdir}
> > +    install -m 644 ${WORKDIR}/mpd.conf.in ${D}/${sysconfdir}/mpd.conf
> > +    sed -i \
> > +        -e 's|%music_directory%|${localstatedir}/lib/mpd/music|' \
> > +        -e 's|%playlist_directory%|${localstatedir}/lib/mpd/playlists|'
> \
> > +        -e 's|%db_file%|${localstatedir}/lib/mpd/mpd.db|' \
> > +        -e 's|%log_file%|${localstatedir}/log/mpd.log|' \
> > +        -e 's|%state_file%|${localstatedir}/lib/mpd/state|' \
> > +        ${D}/${sysconfdir}/mpd.conf
> > +
> > +    if [ -e ${D}/${systemd_unitdir}/system/mpd.service ] ; then
> > +        sed -i \
> > +            's|^ExecStart=.*|ExecStart=${bindir}/mpd --no-daemon|' \
> > +            ${D}/${systemd_unitdir}/system/mpd.service
> > +    fi
> > +}
> > +
> > +RPROVIDES_${PN} += "${PN}-systemd"
> > +RREPLACES_${PN} += "${PN}-systemd"
> > +RCONFLICTS_${PN} += "${PN}-systemd"
> > +SYSTEMD_SERVICE_${PN} = "mpd.service"
> > +
> > +USERADD_PACKAGES = "${PN}"
> > +USERADD_PARAM_${PN} = " \
> > +    --system --no-create-home \
> > +    --home ${localstatedir}/lib/mpd \
> > +    --groups audio \
> > +    --user-group mpd"
> > --
> > 1.8.5.3
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

