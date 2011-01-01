Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PYvw4-00063e-AP
	for openembedded-devel@lists.openembedded.org;
	Sat, 01 Jan 2011 08:31:32 +0100
Received: by gxk20 with SMTP id 20so5388050gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Dec 2010 23:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=MpFBz3G2Wiu0qnRSzxU+vdGfh0SE+nHv+V8qIwsQHAc=;
	b=t7SVzCTrGLR/j2UO4wZSJhKMwxWCAvdGiHXKqm6/8GcBVYAqGktrpY6tfWF9sp4dbK
	K95XcA67E+7RcyzeOevMdxhwkkIRSg/bMCsDr1MK0SJRSytaLO31Vbf6WfWQYXJzRuIK
	mRWZHCQO+CzPR+xy9qMO2grBoFxlhixbybp2U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=k201HbIyMfuucJluZFc2ExAX+tKWwTUg0J08wRQqpr86e6afS3Yp+ALboozotW6lUj
	jduPw5HbN6OzSF4yjwhIZDXawClx47w0YcWr5Q1EWeMIhD4z5XupbtyeP5hHhAn71UaV
	FTuwUaW6uej1bpj7cygml7VDenfPXy5dZLchs=
Received: by 10.90.10.31 with SMTP id 31mr9682587agj.85.1293867069689; Fri, 31
	Dec 2010 23:31:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Fri, 31 Dec 2010 23:30:49 -0800 (PST)
In-Reply-To: <1293835744-10837-3-git-send-email-eric@eukrea.com>
References: <1293835744-10837-1-git-send-email-eric@eukrea.com>
	<1293835744-10837-2-git-send-email-eric@eukrea.com>
	<1293835744-10837-3-git-send-email-eric@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 31 Dec 2010 23:30:49 -0800
Message-ID: <AANLkTi=tLW+-zGxuFyATQwCwLF4Dx=KOWErTZS6cnPnV@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 3/3] busybox-static: add 1.18.1
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
X-List-Received-Date: Sat, 01 Jan 2011 07:31:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 31, 2010 at 2:49 PM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0recipes/busybox/busybox-static_1.18.1.bb | =C2=A0 10 ++++++++++
> =C2=A01 files changed, 10 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes/busybox/busybox-static_1.18.1.bb
>
> diff --git a/recipes/busybox/busybox-static_1.18.1.bb b/recipes/busybox/b=
usybox-static_1.18.1.bb
> new file mode 100644
> index 0000000..58aca93
> --- /dev/null
> +++ b/recipes/busybox/busybox-static_1.18.1.bb
> @@ -0,0 +1,10 @@
> +require busybox_${PV}.bb
> +
> +FILESPATHPKG =3D. "busybox-${PV}:"
> +S =3D "${WORKDIR}/busybox-${PV}"
> +
> +do_configure_append() {
> + =C2=A0 =C2=A0 =C2=A0 sed -i -e '/CONFIG_STATIC/d' .config
> + =C2=A0 =C2=A0 =C2=A0 echo "CONFIG_STATIC=3Dy" >>.config
> +}
> +
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


