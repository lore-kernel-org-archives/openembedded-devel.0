Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PW9IU-0001kP-Cy
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Dec 2010 16:11:10 +0100
Received: by ywi6 with SMTP id 6so3212716ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Dec 2010 07:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=VffQr69iOE/Ct2tf7E6y5OMQr/itIcwKQ6eUx70h+i0=;
	b=O7dWQQv/RN1E+AHa/Cuv+tRBQlrWLc8VTDx85QRB+EoBMubsUDVTIY5s2oLLfku4eG
	yupK31+Nev0wfNI3y6hLcx6slyAumXcF05P2rHQHKcaawb1vC2k7L+9HjqPt1BeRcSfs
	K6NFGPfuAFCU4uVgk8eNOoFDwJHrc9spJa1/4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=YKsB9qb0uoXEzpfwAOuDIX6EMpwD8sOe1c9hk6v9ADBBRarAz/Xwo2yizgJFB9ccvU
	Rk6yrwCyKzX/SeQMR3M4eTbVjeI3+A4i/EhsqUFj1mF3CFYB4YQAKilWY5B6J/Zqj/r4
	jMao8CMPUbG7Ci5A32pTLfN77cTFrFDhek/8U=
Received: by 10.90.120.17 with SMTP id s17mr891782agc.193.1293203458415; Fri,
	24 Dec 2010 07:10:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Fri, 24 Dec 2010 07:10:38 -0800 (PST)
In-Reply-To: <1293139278-18438-1-git-send-email-eric@eukrea.com>
References: <1293139278-18438-1-git-send-email-eric@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Dec 2010 07:10:38 -0800
Message-ID: <AANLkTik9Yo0v-YAg8ccvs+OGz1-XqOH06UXKZpp-DRVJ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] busybox: update 1.18.0 to 1.18.1
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
X-List-Received-Date: Fri, 24 Dec 2010 15:11:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 23, 2010 at 1:21 PM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> 1.18.1 is considered as the latest stable version
>
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0recipes/busybox/busybox-1.18.0/B921600.patch =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 13 -
> =C2=A0.../busybox-1.18.0/busybox-1.18.0-buildsys.patch =C2=A0 | =C2=A0 21=
 -
> =C2=A0.../busybox-1.18.0/busybox-1.18.0-runsvdir.patch =C2=A0 | =C2=A0 17=
 -
> =C2=A0.../busybox-1.18.0/busybox-1.18.0-sha.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0118 ---
> =C2=A0recipes/busybox/busybox-1.18.0/defconfig =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0873 --------------------
> =C2=A0recipes/busybox/busybox-1.18.0/fdisk_nios2.patch =C2=A0 | =C2=A0 13=
 -
> =C2=A0.../busybox/busybox-1.18.0/get_header_tar.patch =C2=A0 =C2=A0| =C2=
=A0 13 -
> =C2=A0.../busybox-1.18.0/udhcpc-fix-nfsroot.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 47 --
> =C2=A0recipes/busybox/busybox-1.18.0/udhcpscript.patch =C2=A0 | =C2=A0 13=
 -
> =C2=A0recipes/busybox/busybox-1.18.1/B921600.patch =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 13 +
> =C2=A0.../busybox-1.18.1/busybox-1.18.1-hush.patch =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0241 ++++++
> =C2=A0recipes/busybox/busybox-1.18.1/defconfig =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0873 ++++++++++++++++++++
> =C2=A0recipes/busybox/busybox-1.18.1/fdisk_nios2.patch =C2=A0 | =C2=A0 13=
 +
> =C2=A0.../busybox/busybox-1.18.1/get_header_tar.patch =C2=A0 =C2=A0| =C2=
=A0 13 +
> =C2=A0.../busybox-1.18.1/udhcpc-fix-nfsroot.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 47 ++
> =C2=A0recipes/busybox/busybox-1.18.1/udhcpscript.patch =C2=A0 | =C2=A0 13=
 +
> =C2=A0recipes/busybox/busybox_1.18.0.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 14 -
> =C2=A0recipes/busybox/busybox_1.18.1.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 12 +
> =C2=A018 files changed, 1225 insertions(+), 1142 deletions(-)
> =C2=A0delete mode 100644 recipes/busybox/busybox-1.18.0/B921600.patch
> =C2=A0delete mode 100644 recipes/busybox/busybox-1.18.0/busybox-1.18.0-bu=
ildsys.patch
> =C2=A0delete mode 100644 recipes/busybox/busybox-1.18.0/busybox-1.18.0-ru=
nsvdir.patch
> =C2=A0delete mode 100644 recipes/busybox/busybox-1.18.0/busybox-1.18.0-sh=
a.patch
> =C2=A0delete mode 100644 recipes/busybox/busybox-1.18.0/defconfig
> =C2=A0delete mode 100644 recipes/busybox/busybox-1.18.0/fdisk_nios2.patch
> =C2=A0delete mode 100644 recipes/busybox/busybox-1.18.0/get_header_tar.pa=
tch
> =C2=A0delete mode 100644 recipes/busybox/busybox-1.18.0/udhcpc-fix-nfsroo=
t.patch
> =C2=A0delete mode 100644 recipes/busybox/busybox-1.18.0/udhcpscript.patch
> =C2=A0create mode 100644 recipes/busybox/busybox-1.18.1/B921600.patch
> =C2=A0create mode 100644 recipes/busybox/busybox-1.18.1/busybox-1.18.1-hu=
sh.patch
> =C2=A0create mode 100644 recipes/busybox/busybox-1.18.1/defconfig
> =C2=A0create mode 100644 recipes/busybox/busybox-1.18.1/fdisk_nios2.patch
> =C2=A0create mode 100644 recipes/busybox/busybox-1.18.1/get_header_tar.pa=
tch
> =C2=A0create mode 100644 recipes/busybox/busybox-1.18.1/udhcpc-fix-nfsroo=
t.patch
> =C2=A0create mode 100644 recipes/busybox/busybox-1.18.1/udhcpscript.patch
> =C2=A0delete mode 100644 recipes/busybox/busybox_1.18.0.bb
> =C2=A0create mode 100644 recipes/busybox/busybox_1.18.1.bb


