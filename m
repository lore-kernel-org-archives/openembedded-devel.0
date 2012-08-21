Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T3i1I-0005UH-UK
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Aug 2012 08:32:57 +0200
Received: by iaky10 with SMTP id y10so3342659iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2012 23:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=P8D2p+NAfe0aa4RWz/DUPlmAqmqQ3B+geFznmM44Rzk=;
	b=lIkvxmz9u2XOwnOT6IiTJOadaWS8gMmDjRWTlHE+zATgZXVjYSWN7VEHr2fh0GgZSX
	kOI0iSciCni8MlD2qpEoRYdiLRIKNaAGAwEMdS3IC4nXP8JQ/pLgQarrkj5Lh4QCdFTx
	TRuqWBHGvuVazsP0Ug+MByTW14Jghk+R+AVF9Uit199iJuB3pUjyzpHHE+ic/k7IaPFY
	S5wDGOuI11os9zHkADPev6+W4gwjq25MVGIh6sS68UcuQc92xN5fs362QF3TBDEY4023
	qcOcn7E7OOED68mkCphdOgy4eedzTX3JynXs905v+MxT0OGi5YV4xqpFkZiZlLVyL4KC
	9a/Q==
MIME-Version: 1.0
Received: by 10.50.154.132 with SMTP id vo4mr12426057igb.31.1345530052884;
	Mon, 20 Aug 2012 23:20:52 -0700 (PDT)
Received: by 10.64.18.13 with HTTP; Mon, 20 Aug 2012 23:20:52 -0700 (PDT)
In-Reply-To: <1345189700-26130-2-git-send-email-schnitzeltony@googlemail.com>
References: <1345189700-26130-1-git-send-email-schnitzeltony@googlemail.com>
	<1345189700-26130-2-git-send-email-schnitzeltony@googlemail.com>
Date: Tue, 21 Aug 2012 08:20:52 +0200
Message-ID: <CALbNGRR9hF-2W2e2+xcfo7X5iDpFPa0nTcVL=sT_XL00-TBGJw@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-systemd,V3] wpa-supplicant: add systemd support
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
X-List-Received-Date: Tue, 21 Aug 2012 06:32:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 17, 2012 at 9:48 AM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> * native systemd support came in with v1.0 [1]
> * needs [2] to work properly
> * mends my wlan under control of networkmanager
>
> [1] http://hostap.epitest.fi/gitweb/gitweb.cgi?p=3Dhostap-1.git;a=3Dblob_=
plain;f=3Dwpa_supplicant/ChangeLog
> [2] http://patches.openembedded.org/patch/34335/
>
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
> v1->v2: chenge recipe's location
> v2->v3: add SYSTEMD_AUTO_ENABLE =3D "disable"
>  .../wpa-supplicant/wpa-supplicant_1.0.bbappend     |    3 ---
>  .../wpa-supplicant/wpa-supplicant_1.0.bbappend     |   15 ++++++++++++++=
+
>  2 files changed, 15 insertions(+), 3 deletions(-)
>  delete mode 100644 meta-oe/recipes-connectivity/wpa-supplicant/wpa-suppl=
icant_1.0.bbappend
>  create mode 100644 meta-systemd/oe-core/recipes-connectivity/wpa-supplic=
ant/wpa-supplicant_1.0.bbappend
>
> diff --git a/meta-oe/recipes-connectivity/wpa-supplicant/wpa-supplicant_1=
.0.bbappend b/meta-oe/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.=
0.bbappend
> deleted file mode 100644
> index 54da0ff..0000000
> --- a/meta-oe/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbap=
pend
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> -
> -PRINC =3D "1"
> diff --git a/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa=
-supplicant_1.0.bbappend b/meta-systemd/oe-core/recipes-connectivity/wpa-su=
pplicant/wpa-supplicant_1.0.bbappend
> new file mode 100644
> index 0000000..a4dceb4
> --- /dev/null
> +++ b/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-suppli=
cant_1.0.bbappend
> @@ -0,0 +1,15 @@
> +PRINC =3D "2"
> +
> +inherit systemd
> +
> +SYSTEMD_PACKAGES =3D "${PN}-systemd"
> +SYSTEMD_SERVICE =3D "wpa_supplicant.service"
> +SYSTEMD_AUTO_ENABLE =3D "disable"
> +
> +do_install_append () {
> +    install -d ${D}${systemd_unitdir}/system
> +    install -m 644 ${S}/systemd/*.service ${D}${systemd_unitdir}/system
> +}
> +
> +# systemd.bbclass does not catch all multiple-instance-service-files
> +FILES_${PN}-systemd +=3D "${systemd_unitdir}/system/"
> --
> 1.7.4.4
>
A bit inpatient but: ping


