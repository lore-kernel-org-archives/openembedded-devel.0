Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T1ygF-00048j-MG
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Aug 2012 13:56:03 +0200
Received: by ghbz2 with SMTP id z2so3030225ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2012 04:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=wLbG3EdbMEZoDJl/ppRBfZjnOKYDcOuwOyJMYVbiCcs=;
	b=FKiHATzvN2aaCMjla834BsRtV2OezYV3cAbx3KViqr0f+y66q2q6+9YZOpSpPexSlu
	S/ENPwwrCdov2dk0RdXmEBmFsKdgSCq4Ou1/Dqpd5nMb031lRwWR4iFB383FQjjMnIYx
	60kjNT8EOBbddhcBfYcKFVcOJW34rJNcomuc3JGrR/jozyd+/kfYe9tSP0OEniEd4xcx
	92XZ5YOrMlR/rJYfWomjHzCb6AC91/ip3ryj8vVxxLRnibuASQjYoGvA6/5TpBeySJaX
	UFj+4IU9vqJ1++W6zSfERLxTGojXfjJGA6FSjhye/fo4wfmeVqUSyMPbGKR6bBJnZBuZ
	8qHg==
MIME-Version: 1.0
Received: by 10.50.191.165 with SMTP id gz5mr974248igc.50.1345117445853; Thu,
	16 Aug 2012 04:44:05 -0700 (PDT)
Received: by 10.64.18.13 with HTTP; Thu, 16 Aug 2012 04:44:05 -0700 (PDT)
In-Reply-To: <1344903048-2800-1-git-send-email-schnitzeltony@googlemail.com>
References: <1344903048-2800-1-git-send-email-schnitzeltony@googlemail.com>
Date: Thu, 16 Aug 2012 13:44:05 +0200
Message-ID: <CALbNGRQJHwSY5CC+c0na_nWH2mck0TjcKP87k4q=aMQKmRdvgQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-systemd,v2] wpa-supplicant: add systemd support
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
X-List-Received-Date: Thu, 16 Aug 2012 11:56:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 14, 2012 at 2:10 AM, Andreas M=FCller
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
>  .../wpa-supplicant/wpa-supplicant_1.0.bbappend     |    3 ---
>  .../wpa-supplicant/wpa-supplicant_1.0.bbappend     |   14 ++++++++++++++
>  2 files changed, 14 insertions(+), 3 deletions(-)
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
> index 0000000..6f62cd8
> --- /dev/null
> +++ b/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-suppli=
cant_1.0.bbappend
> @@ -0,0 +1,14 @@
> +PRINC =3D "2"
> +
> +inherit systemd
> +
> +SYSTEMD_PACKAGES =3D "${PN}-systemd"
> +SYSTEMD_SERVICE =3D "wpa_supplicant.service"
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
I am testing

SYSTEMD_AUTO_ENABLE =3D "disable"

to avoid starting at every boot. First results look good and I think a
V3 will follow.

Andreas


