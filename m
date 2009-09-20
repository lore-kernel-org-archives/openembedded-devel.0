Received: from [209.85.221.175] (helo=mail-qy0-f175.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MpNxl-0006rx-TH
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Sep 2009 17:04:33 +0200
Received: by qyk5 with SMTP id 5so205028qyk.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Sep 2009 08:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=KDAFXINgc0s2jIIdm5e/1VC8CzLnlyAN51NaFaMQdLc=;
	b=MPI3dDJ+m48v7c4Bd9MfO2xoH/8DtNcWXY+dtupJ7WENOVYjuiRNtFpyetmaBezzHf
	vyVKzbj1X7YC8GBvvL13I5uH1+dhmB2jzEM/WDdeKNxIdO08MXUxgfcMPTlfsOEU0pQa
	aFKNnKzpTyPyG/CCom1CsnunQ7qN3hhigNRuw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=uySRPluHGCmBN9KipbK0PmTYHot3ScDUHLRh+2QKN6I9/z1pzQ8rMVte4F+LcbBw91
	Pd8KJRltm5OdWSMPucB92ZNRdF1u70/PimQ4Jd/oJTP8stEJRxfNHqkw8VDjr7JIHhlR
	Xx3F6hJvDrHd13kniW8IQPYfwunWJeNTdrDY0=
MIME-Version: 1.0
Received: by 10.229.47.3 with SMTP id l3mr884326qcf.25.1253459031769; Sun, 20 
	Sep 2009 08:03:51 -0700 (PDT)
In-Reply-To: <1253432757-27944-1-git-send-email-denis@denix.org>
References: <1253432757-27944-1-git-send-email-denis@denix.org>
Date: Sun, 20 Sep 2009 08:03:51 -0700
Message-ID: <19c1b8a90909200803s62acf1a2l34e662ab121fd2e1@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] kernel.bbclass: fix ownership inside the modules tarball
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
X-List-Received-Date: Sun, 20 Sep 2009 15:04:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2009 at 12:45 AM, Denys Dmytriyenko <denis@denix.org> wrote=
:
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0classes/kernel.bbclass | =C2=A0 =C2=A03 ++-
> =C2=A01 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> index c5192d5..9c1f637 100644
> --- a/classes/kernel.bbclass
> +++ b/classes/kernel.bbclass
> @@ -530,7 +530,7 @@ do_deploy() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0package_stagefile_shell ${DEPLOY_DIR_IMAGE}/${=
KERNEL_IMAGE_BASE_NAME}.bin
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -d "${D}/lib" ]; then
> - =C2=A0 =C2=A0 =C2=A0 tar -cvzf ${DEPLOY_DIR_IMAGE}/${MODULES_IMAGE_BASE=
_NAME}.tgz -C ${D} lib
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fakeroot tar -cvzf ${D=
EPLOY_DIR_IMAGE}/${MODULES_IMAGE_BASE_NAME}.tgz -C ${D} lib
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${DEPLOY_DIR_IMAGE}
> @@ -540,5 +540,6 @@ do_deploy() {
> =C2=A0}
>
> =C2=A0do_deploy[dirs] =3D "${S}"
> +do_deploy[depends] +=3D "fakeroot-native:do_populate_staging"
>
> =C2=A0addtask deploy before do_package after do_install
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


