Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PDL7A-00033p-CQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 18:57:45 +0100
Received: by gwaa11 with SMTP id a11so4447991gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Nov 2010 10:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=YHP7Mngflu23i0gvV6aqduwiJoksJNLr3t5K0eG8OOU=;
	b=Jw6ttX7Y633ANxuQliOPCTr6LPKDMvGibAYSVAh7jpCQvlLsuvfSIxo34avSbkICkE
	fx8tiydc15thUZrFVDxS3odUrE5lBSWWrF4Rrt/xZxvWRfzW6hirBGb2DoKlKN2kcRTb
	8lmD1ZjoDCnjw/QWOYPbOJYl0lk/o3kjx00qI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=XJXbdbM8Kqaxq2PZbnpEcEqnN40QEJ9z4kaeMXnU0F4GIYHBduEpDqfpJlwIShXQ8t
	YraOEt4iQ7XwpyXxbvdhhj0PdES+diCdjC9RHFeSeeZNCfr0/JPi1+hLYrZLa68isRse
	8vBgxw1ctIEwbTyhNuhpEVe4c2nRnxik8W2Q4=
Received: by 10.91.153.10 with SMTP id f10mr1751067ago.172.1288720613574; Tue,
	02 Nov 2010 10:56:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.135.18 with HTTP; Tue, 2 Nov 2010 10:56:33 -0700 (PDT)
In-Reply-To: <1288709799-9891-1-git-send-email-eric@eukrea.com>
References: <4CD02461.3020106@eukrea.com>
	<1288709799-9891-1-git-send-email-eric@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Nov 2010 10:56:33 -0700
Message-ID: <AANLkTim8oPBrRRMFVBknR+c3+gxMgSZAJkB84qa_ByYO@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gdb-cross-sdk: reconfigure before running oe_runmake configure-host
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
X-List-Received-Date: Tue, 02 Nov 2010 17:57:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 2, 2010 at 7:56 AM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> so we have : configure then make configure-host which generates the
> Makefile that we modify using sed to statically link the libs
>
> Without this patch, we don't statically link libncurses, libtinfo
> and libz which leads to :
> /usr/local/angstrom/arm/bin/arm-angstrom-linux-gnueabi-gdb:
> error while loading shared libraries: libtinfo.so.5:
> cannot open shared object file: No such file or directory
>
> when trying to use the toolchain.
>
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0recipes/gdb/gdb-cross-sdk.inc | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/gdb/gdb-cross-sdk.inc b/recipes/gdb/gdb-cross-sdk.in=
c
> index 6a708ca..e1d4895 100644
> --- a/recipes/gdb/gdb-cross-sdk.inc
> +++ b/recipes/gdb/gdb-cross-sdk.inc
> @@ -8,6 +8,7 @@ EXTRA_OEMAKE =3D "'SUBDIRS=3Dintl mmalloc libiberty opcod=
es bfd sim gdb etc utils' L
> =C2=A0# add a depenency on the -sdk versions of them.
> =C2=A0do_configure_append () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${B}
> + =C2=A0 =C2=A0 =C2=A0 oe_runconf
> =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake configure-host
> =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -e 's,-lncurses,${STAGING_LIBDIR_NATIVE}/l=
ibncurses.a ${STAGING_LIBDIR_NATIVE}/libtinfo.a ,g' -i ${B}/gdb/Makefile
> =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -e 's,-lz, ${STAGING_LIBDIR_NATIVE}/libz.a=
 ,g' -i ${B}/gdb/Makefile
> @@ -16,5 +17,4 @@ do_configure_append () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0for SIM in ${B}/sim/*/Makefile; do
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ -f $SIM ] && sed=
 -e 's,-lz, ${STAGING_LIBDIR_NATIVE}/libz.a ,g' -i $SIM
> =C2=A0 =C2=A0 =C2=A0 =C2=A0done
> - =C2=A0 =C2=A0 =C2=A0 oe_runconf
> =C2=A0}
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


