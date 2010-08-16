Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Ol804-0005sZ-Bp
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 00:17:53 +0200
Received: by wwb34 with SMTP id 34so5873335wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 15:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=RRQSusyN+c00/AjJXypEbReJpW9/Z/TqyWsVVn0Co6w=;
	b=odxO/OBPEXmJyORe0ZnBrJNckitRMvzvMwZyBVEtSOXl8x2Nsco4pmoE84HuHDPi4z
	BaWsk1ZXoKp0+10poA/dgKdu7k5AkocffnAcXJHDUesNwoFjU5BLxN2yZC7DNp0e0ftI
	oNZIIFZ/tjihYGpxYImQiM0m4j5lCkAw5xra4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=K8A3JDbyxk6ngD1HrOh2/4KQLMI7D3DCsWO9mVYcRhbeGSElpn0iBkPgT4OryZkaKR
	Ahsz6Vz45qkYMWjQAl5BzAGEvzeiiVn9gPUu1YOGjDyChkUP0eChxlEg40xx/00twpBV
	Dp8L1nlsW6COFXxak2n1BeKhDgdUsG0iVNc8M=
MIME-Version: 1.0
Received: by 10.227.145.14 with SMTP id b14mr5251503wbv.24.1281997050770; Mon,
	16 Aug 2010 15:17:30 -0700 (PDT)
Received: by 10.227.69.82 with HTTP; Mon, 16 Aug 2010 15:17:30 -0700 (PDT)
In-Reply-To: <4C609035.7080500@gmail.com>
References: <E1OhMNp-0001vS-Ot@melo.openembedded.org>
	<AANLkTimcUgoNO73WXbn2R1O-pgXT-4raSGjtsHa8SvOC@mail.gmail.com>
	<4C609035.7080500@gmail.com>
Date: Tue, 17 Aug 2010 00:17:30 +0200
Message-ID: <AANLkTinwNNmb-b2dDWycBeKmPWK4JP0sjYAYYZhmKwau@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Graham Gower : package_ipk.bbclass: add lists_dir to sysroots' /etc/opkg. conf
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
X-List-Received-Date: Mon, 16 Aug 2010 22:17:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 10, 2010 at 1:33 AM, Graham Gower <graham.gower@gmail.com> wrot=
e:
> On 08/10/2010 07:24 AM, Andrea Adami wrote:
>> It seems this doesn't respect ${ONLINE_PACKAGE_MANAGEMENT}" =3D=3D "none=
"
>>
>> I see a spurious /var/lib/opkg in the cpio of initramfs-kexecboot-image.
>>
>> oe =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=94=82 =C2=A0 =C2=
=A0 =C2=A00=E2=94=82Aug =C2=A09 23:32=E2=94=82
>> oe-all =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=94=82 =C2=A064030=E2=94=82A=
ug =C2=A09 23:32
>> oe-armv5te =C2=A0 =C2=A0 =C2=A0=E2=94=823637007=E2=94=82Aug =C2=A09 23:3=
2
>> oe-tosa =C2=A0 =C2=A0 =C2=A0 =C2=A0 =E2=94=82 463708=E2=94=82Aug =C2=A09=
 23:3
>>
>>
>> We don't need any extra cruft there ;)
>>
>> Regards
>>
>> Andrea
>>
>
> /var/lib/opkg shouldn't be populated regardless of the value of ONLINE_PA=
CKAGE_MANAGEMENT.
>
> Signed-off-by: Graham Gower <graham.gower@gmail.com>
> ---
> diff --git a/classes/rootfs_ipk.bbclass b/classes/rootfs_ipk.bbclass
> index db04fb6..b0baab0 100644
> --- a/classes/rootfs_ipk.bbclass
> +++ b/classes/rootfs_ipk.bbclass
> @@ -98,15 +98,18 @@ fakeroot rootfs_ipk_do_rootfs () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0rm -f ${IMAGE_ROOTFS}${libdir}/opkg/lists/*
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> -
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${IMAGE_ROOTFS}=
/var/lib/opkg/*
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Keep these lines=
 until package manager selection is implemented
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s opkg ${IMAGE=
_ROOTFS}${sysconfdir}/ipkg
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s opkg ${IMAGE=
_ROOTFS}${libdir}/ipkg
> =C2=A0 =C2=A0 =C2=A0 =C2=A0else
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${IMAGE_ROO=
TFS}${libdir}/opkg
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${IMAGE_ROO=
TFS}/usr/lib/opkg
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${IMAGE_ROOTFS}=
/var/lib/opkg
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> -
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0log_check rootfs
> =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${IPKG_TMP_DIR}
> =C2=A0}

We (SHR) are using tmp_dir pointing to /var/lib/opkg/tmp (because /tmp
is size-limited tmpfs)

in opkg-collateral.bb:
do_install_append_shr () {
        install -d ${D}/var/lib/opkg/tmp
}

This change removes /var/lib/opkg/tmp from prepared image (and opkg
calls then fail on target).

Do you propose different tmp dir or can you update the logic somehow?

Thanks,
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


