Received: from mail-gx0-f179.google.com ([209.85.161.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PVE9u-0001BE-Ks
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 03:10:30 +0100
Received: by gxk21 with SMTP id 21so2774831gxk.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 18:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=61qGdnB3wbOn61NNWeriX+AadGygckyuIU6fFXcMBYA=;
	b=NhHTCQIFyHMEkICo9skGwkJ737zBYFAYrhLxO2q8JxTWRVZ/hJP7juDnSpOA5xBwOv
	rMazjCgevaP84q8MO86MK+zDvSP4176hxhOUzJjeYfibtcIkSR+WlCfcObQQZSMOwTQF
	rMEBbtpQWMlBMXEdFfAQqY2NF1BrPEhAs+k2g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=XIv0Yc4cE3TS8IKdE9POFg0DPObzEOUaGs0jq4RYqoNUxnamj+0LjgEuEw0kkUjLn6
	wdOiak4HP5oVUUHClg0uqAc70TGXjKrdasLXyywfi66X3Pl0ShgjF+TIPqpLJK2VZM+1
	0wiIWQoz8UbhoudJ7roRtun/6eNgoSoJ4DOJ4=
Received: by 10.90.10.31 with SMTP id 31mr7897682agj.85.1292983822090; Tue, 21
	Dec 2010 18:10:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Tue, 21 Dec 2010 18:10:01 -0800 (PST)
In-Reply-To: <1292969027-18762-1-git-send-email-eric@eukrea.com>
References: <20101221150222.GB4665@gmail.com>
	<1292969027-18762-1-git-send-email-eric@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Dec 2010 18:10:01 -0800
Message-ID: <AANLkTimMbqWP4JwW6FaDT+_C-uaWZVsVNRjmcUM2F4g_@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] asterisk: move non working recipes to nonworking directory
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
X-List-Received-Date: Wed, 22 Dec 2010 02:10:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 21, 2010 at 2:03 PM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0recipes/asterisk/asterisk-1.2.24/asterisk.patch =C2=A0 =C2=A0| =C2=
=A0221 --------------------
> =C2=A0.../asterisk/asterisk-1.2.24/enable-speex.patch =C2=A0 =C2=A0| =C2=
=A0 21 --
> =C2=A0.../asterisk-1.2.24/uclibc-compat-getloadavg.patch | =C2=A0 13 --
> =C2=A0recipes/asterisk/asterisk-1.2.24/uclibc-dns.patch =C2=A0| =C2=A0 18=
 --
> =C2=A0recipes/asterisk/asterisk-1.2.28/asterisk.patch =C2=A0 =C2=A0| =C2=
=A0221 --------------------
> =C2=A0.../asterisk/asterisk-1.2.28/enable-speex.patch =C2=A0 =C2=A0| =C2=
=A0 21 --
> =C2=A0.../asterisk-1.2.28/uclibc-compat-getloadavg.patch | =C2=A0 13 --
> =C2=A0recipes/asterisk/asterisk-1.2.28/uclibc-dns.patch =C2=A0| =C2=A0 18=
 --
> =C2=A0recipes/asterisk/asterisk-1.4.17/Makefile.patch =C2=A0 =C2=A0| =C2=
=A0 20 --
> =C2=A0recipes/asterisk/asterisk-1.4.17/init =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 77 -------
> =C2=A0recipes/asterisk/asterisk-1.4.17/logrotate =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 12 -
> =C2=A0recipes/asterisk/asterisk-1.4.17/sounds.xml.patch =C2=A0| =C2=A0 18=
 --
> =C2=A0recipes/asterisk/asterisk-1.4.17/volatiles =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A07 -
> =C2=A0recipes/asterisk/asterisk-1.4.19.1/Makefile.patch =C2=A0| =C2=A0 20=
 --
> =C2=A0recipes/asterisk/asterisk-1.4.19.1/init =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 77 -------
> =C2=A0recipes/asterisk/asterisk-1.4.19.1/logrotate =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 12 -
> =C2=A0.../asterisk/asterisk-1.4.19.1/sounds.xml.patch =C2=A0 =C2=A0| =C2=
=A0 18 --
> =C2=A0recipes/asterisk/asterisk-1.4.19.1/volatiles =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 =C2=A07 -
> =C2=A0.../asterisk/asterisk-1.6.0-beta8/Makefile.patch =C2=A0 | =C2=A0 20=
 --
> =C2=A0recipes/asterisk/asterisk-1.6.0-beta8/init =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 77 -------
> =C2=A0recipes/asterisk/asterisk-1.6.0-beta8/logrotate =C2=A0 =C2=A0| =C2=
=A0 12 -
> =C2=A0.../asterisk/asterisk-1.6.0-beta8/sounds.xml.patch | =C2=A0 18 --
> =C2=A0recipes/asterisk/asterisk-1.6.0-beta8/volatiles =C2=A0 =C2=A0| =C2=
=A0 =C2=A07 -
> =C2=A0recipes/asterisk/asterisk-addons_1.6.0-beta2.bb =C2=A0 =C2=A0| =C2=
=A0 66 ------
> =C2=A0recipes/asterisk/asterisk_1.2.24.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 52 -----
> =C2=A0recipes/asterisk/asterisk_1.2.28.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 46 ----
> =C2=A0recipes/asterisk/asterisk_1.4.17.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0174 ---------------
> =C2=A0recipes/asterisk/asterisk_1.4.19.1.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0173 ---------------
> =C2=A0recipes/asterisk/asterisk_1.6.0-beta8.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0185 ----------------
> =C2=A0.../asterisk/asterisk-1.2.24/asterisk.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0221 ++++++++++++++++++++
> =C2=A0.../asterisk/asterisk-1.2.24/enable-speex.patch =C2=A0 =C2=A0| =C2=
=A0 21 ++
> =C2=A0.../asterisk-1.2.24/uclibc-compat-getloadavg.patch | =C2=A0 13 ++
> =C2=A0.../asterisk/asterisk-1.2.24/uclibc-dns.patch =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 18 ++
> =C2=A0.../asterisk/asterisk-1.2.28/asterisk.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0221 ++++++++++++++++++++
> =C2=A0.../asterisk/asterisk-1.2.28/enable-speex.patch =C2=A0 =C2=A0| =C2=
=A0 21 ++
> =C2=A0.../asterisk-1.2.28/uclibc-compat-getloadavg.patch | =C2=A0 13 ++
> =C2=A0.../asterisk/asterisk-1.2.28/uclibc-dns.patch =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 18 ++
> =C2=A0.../asterisk/asterisk-1.4.17/Makefile.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 20 ++
> =C2=A0recipes/nonworking/asterisk/asterisk-1.4.17/init =C2=A0 | =C2=A0 77=
 +++++++
> =C2=A0.../nonworking/asterisk/asterisk-1.4.17/logrotate =C2=A0| =C2=A0 12=
 +
> =C2=A0.../asterisk/asterisk-1.4.17/sounds.xml.patch =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 18 ++
> =C2=A0.../nonworking/asterisk/asterisk-1.4.17/volatiles =C2=A0| =C2=A0 =
=C2=A07 +
> =C2=A0.../asterisk/asterisk-1.4.19.1/Makefile.patch =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 20 ++
> =C2=A0recipes/nonworking/asterisk/asterisk-1.4.19.1/init | =C2=A0 77 ++++=
+++
> =C2=A0.../asterisk/asterisk-1.4.19.1/logrotate =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 12 +
> =C2=A0.../asterisk/asterisk-1.4.19.1/sounds.xml.patch =C2=A0 =C2=A0| =C2=
=A0 18 ++
> =C2=A0.../asterisk/asterisk-1.4.19.1/volatiles =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A07 +
> =C2=A0.../asterisk/asterisk-1.6.0-beta8/Makefile.patch =C2=A0 | =C2=A0 20=
 ++
> =C2=A0.../nonworking/asterisk/asterisk-1.6.0-beta8/init =C2=A0| =C2=A0 77=
 +++++++
> =C2=A0.../asterisk/asterisk-1.6.0-beta8/logrotate =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 12 +
> =C2=A0.../asterisk/asterisk-1.6.0-beta8/sounds.xml.patch | =C2=A0 18 ++
> =C2=A0.../asterisk/asterisk-1.6.0-beta8/volatiles =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A07 +
> =C2=A0.../asterisk/asterisk-addons_1.6.0-beta2.bb =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 66 ++++++
> =C2=A0recipes/nonworking/asterisk/asterisk_1.2.24.bb =C2=A0 =C2=A0 | =C2=
=A0 52 +++++
> =C2=A0recipes/nonworking/asterisk/asterisk_1.2.28.bb =C2=A0 =C2=A0 | =C2=
=A0 46 ++++
> =C2=A0recipes/nonworking/asterisk/asterisk_1.4.17.bb =C2=A0 =C2=A0 | =C2=
=A0174 +++++++++++++++
> =C2=A0recipes/nonworking/asterisk/asterisk_1.4.19.1.bb =C2=A0 | =C2=A0173=
 +++++++++++++++
> =C2=A0.../nonworking/asterisk/asterisk_1.6.0-beta8.bb =C2=A0 =C2=A0| =C2=
=A0185 ++++++++++++++++
> =C2=A058 files changed, 1644 insertions(+), 1644 deletions(-)
> =C2=A0delete mode 100644 recipes/asterisk/asterisk-1.2.24/asterisk.patch
> =C2=A0delete mode 100644 recipes/asterisk/asterisk-1.2.24/enable-speex.pa=
tch
> =C2=A0delete mode 100644 recipes/asterisk/asterisk-1.2.24/uclibc-compat-g=
etloadavg.patch
> =C2=A0delete mode 100644 recipes/asterisk/asterisk-1.2.24/uclibc-dns.patc=
h
> =C2=A0delete mode 100644 recipes/asterisk/asterisk-1.2.28/asterisk.patch
> =C2=A0delete mode 100644 recipes/asterisk/asterisk-1.2.28/enable-speex.pa=
tch
> =C2=A0delete mode 100644 recipes/asterisk/asterisk-1.2.28/uclibc-compat-g=
etloadavg.patch
> =C2=A0delete mode 100644 recipes/asterisk/asterisk-1.2.28/uclibc-dns.patc=
h
> =C2=A0delete mode 100644 recipes/asterisk/asterisk-1.4.17/Makefile.patch
> =C2=A0delete mode 100644 recipes/asterisk/asterisk-1.4.17/init
> =C2=A0delete mode 100644 recipes/asterisk/asterisk-1.4.17/logrotate
> =C2=A0delete mode 100644 recipes/asterisk/asterisk-1.4.17/sounds.xml.patc=
h
> =C2=A0delete mode 100644 recipes/asterisk/asterisk-1.4.17/volatiles
> =C2=A0delete mode 100644 recipes/asterisk/asterisk-1.4.19.1/Makefile.patc=
h
> =C2=A0delete mode 100644 recipes/asterisk/asterisk-1.4.19.1/init
> =C2=A0delete mode 100644 recipes/asterisk/asterisk-1.4.19.1/logrotate
> =C2=A0delete mode 100644 recipes/asterisk/asterisk-1.4.19.1/sounds.xml.pa=
tch
> =C2=A0delete mode 100644 recipes/asterisk/asterisk-1.4.19.1/volatiles
> =C2=A0delete mode 100644 recipes/asterisk/asterisk-1.6.0-beta8/Makefile.p=
atch
> =C2=A0delete mode 100644 recipes/asterisk/asterisk-1.6.0-beta8/init
> =C2=A0delete mode 100644 recipes/asterisk/asterisk-1.6.0-beta8/logrotate
> =C2=A0delete mode 100644 recipes/asterisk/asterisk-1.6.0-beta8/sounds.xml=
.patch
> =C2=A0delete mode 100644 recipes/asterisk/asterisk-1.6.0-beta8/volatiles
> =C2=A0delete mode 100644 recipes/asterisk/asterisk-addons_1.6.0-beta2.bb
> =C2=A0delete mode 100644 recipes/asterisk/asterisk_1.2.24.bb
> =C2=A0delete mode 100644 recipes/asterisk/asterisk_1.2.28.bb
> =C2=A0delete mode 100644 recipes/asterisk/asterisk_1.4.17.bb
> =C2=A0delete mode 100644 recipes/asterisk/asterisk_1.4.19.1.bb
> =C2=A0delete mode 100644 recipes/asterisk/asterisk_1.6.0-beta8.bb
> =C2=A0create mode 100644 recipes/nonworking/asterisk/asterisk-1.2.24/aste=
risk.patch
> =C2=A0create mode 100644 recipes/nonworking/asterisk/asterisk-1.2.24/enab=
le-speex.patch
> =C2=A0create mode 100644 recipes/nonworking/asterisk/asterisk-1.2.24/ucli=
bc-compat-getloadavg.patch
> =C2=A0create mode 100644 recipes/nonworking/asterisk/asterisk-1.2.24/ucli=
bc-dns.patch
> =C2=A0create mode 100644 recipes/nonworking/asterisk/asterisk-1.2.28/aste=
risk.patch
> =C2=A0create mode 100644 recipes/nonworking/asterisk/asterisk-1.2.28/enab=
le-speex.patch
> =C2=A0create mode 100644 recipes/nonworking/asterisk/asterisk-1.2.28/ucli=
bc-compat-getloadavg.patch
> =C2=A0create mode 100644 recipes/nonworking/asterisk/asterisk-1.2.28/ucli=
bc-dns.patch
> =C2=A0create mode 100644 recipes/nonworking/asterisk/asterisk-1.4.17/Make=
file.patch
> =C2=A0create mode 100644 recipes/nonworking/asterisk/asterisk-1.4.17/init
> =C2=A0create mode 100644 recipes/nonworking/asterisk/asterisk-1.4.17/logr=
otate
> =C2=A0create mode 100644 recipes/nonworking/asterisk/asterisk-1.4.17/soun=
ds.xml.patch
> =C2=A0create mode 100644 recipes/nonworking/asterisk/asterisk-1.4.17/vola=
tiles
> =C2=A0create mode 100644 recipes/nonworking/asterisk/asterisk-1.4.19.1/Ma=
kefile.patch
> =C2=A0create mode 100644 recipes/nonworking/asterisk/asterisk-1.4.19.1/in=
it
> =C2=A0create mode 100644 recipes/nonworking/asterisk/asterisk-1.4.19.1/lo=
grotate
> =C2=A0create mode 100644 recipes/nonworking/asterisk/asterisk-1.4.19.1/so=
unds.xml.patch
> =C2=A0create mode 100644 recipes/nonworking/asterisk/asterisk-1.4.19.1/vo=
latiles
> =C2=A0create mode 100644 recipes/nonworking/asterisk/asterisk-1.6.0-beta8=
/Makefile.patch
> =C2=A0create mode 100644 recipes/nonworking/asterisk/asterisk-1.6.0-beta8=
/init
> =C2=A0create mode 100644 recipes/nonworking/asterisk/asterisk-1.6.0-beta8=
/logrotate
> =C2=A0create mode 100644 recipes/nonworking/asterisk/asterisk-1.6.0-beta8=
/sounds.xml.patch
> =C2=A0create mode 100644 recipes/nonworking/asterisk/asterisk-1.6.0-beta8=
/volatiles
> =C2=A0create mode 100644 recipes/nonworking/asterisk/asterisk-addons_1.6.=
0-beta2.bb
> =C2=A0create mode 100644 recipes/nonworking/asterisk/asterisk_1.2.24.bb
> =C2=A0create mode 100644 recipes/nonworking/asterisk/asterisk_1.2.28.bb
> =C2=A0create mode 100644 recipes/nonworking/asterisk/asterisk_1.4.17.bb
> =C2=A0create mode 100644 recipes/nonworking/asterisk/asterisk_1.4.19.1.bb
> =C2=A0create mode 100644 recipes/nonworking/asterisk/asterisk_1.6.0-beta8=
.bb
>


