Received: from fg-out-1718.google.com ([72.14.220.155])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@dominion.thruhere.net>) id 1NkYnM-0002Q2-3A
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Feb 2010 09:10:05 +0100
Received: by fg-out-1718.google.com with SMTP id l26so60028fgb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2010 00:07:20 -0800 (PST)
Received: by 10.87.63.3 with SMTP id q3mr1586382fgk.53.1267085240088;
	Thu, 25 Feb 2010 00:07:20 -0800 (PST)
Received: from ?172.20.0.255? (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 16sm4083508fxm.15.2010.02.25.00.07.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 25 Feb 2010 00:07:19 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1077)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1267039367-8677-1-git-send-email-Martin.Jansa@gmail.com>
Date: Thu, 25 Feb 2010 09:07:16 +0100
Message-Id: <7502B74B-0D2B-4460-9564-56C58E8A8909@dominion.thruhere.net>
References: <1267039367-8677-1-git-send-email-Martin.Jansa@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1077)
X-SA-Exim-Connect-IP: 72.14.220.155
X-SA-Exim-Mail-From: koen@dominion.thruhere.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] testlab.bbclass: use opkg.conf from staging, always specify tmp_dir in opkg-cl call with -t parameter
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
X-List-Received-Date: Thu, 25 Feb 2010 08:10:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Acked--by: Koen Kooi <koen@openembedded.org>


Op 24 feb 2010, om 20:22 heeft Martin Jansa het volgende geschreven:

> * Use opkg.conf from staging in the same way as do_rootfs does
> * When option tmp_dir is used in opkg.conf installed on rootfs then =
it's
>  used also in do_rootfs call and points to probably non-existent =
directory
>  on buildhost like /var/lib/opkg/tmp.
> * The value of tmp_dir from rootfs is used even with another config =
file
>  specified with -c parameter
> * Before this, it was using default value (/tmp) on buildhost, now it =
will use
>  own "${IMAGE_ROOTFS}-tmp" and remove it after do_rootfs finish
>  (usually already empty inside, cleaned by opkg itself)
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> classes/testlab.bbclass |   13 +++++++++----
> 1 files changed, 9 insertions(+), 4 deletions(-)
>=20
> diff --git a/classes/testlab.bbclass b/classes/testlab.bbclass
> index fc923c5..e6c9c8e 100644
> --- a/classes/testlab.bbclass
> +++ b/classes/testlab.bbclass
> @@ -24,26 +24,31 @@
> do_testlab() {
> if [ -e  ${IMAGE_ROOTFS}/etc/opkg ] && [ =
"${ONLINE_PACKAGE_MANAGEMENT}" =3D "full" ] ; then
>=20
> +	IPKG_TMP_DIR=3D"${IMAGE_ROOTFS}-tmp"
> +	IPKG_ARGS=3D"-f ${STAGING_ETCDIR_NATIVE}/opkg.conf -o =
${IMAGE_ROOTFS} -t ${IPKG_TMP_DIR}"
> +
> 	TESTLAB_DIR=3D"${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-testlab"
>         mkdir -p ${TESTLAB_DIR}/
> +        mkdir -p ${IPKG_TMP_DIR}/
> 	ls -laR ${IMAGE_ROOTFS} > ${TESTLAB_DIR}/files-in-image.txt =09
>=20
> 	echo > ${TESTLAB_DIR}/installed-packages.txt
> 	echo -e "digraph depends {\n    node [shape=3Dplaintext]" > =
${TESTLAB_DIR}/depends.dot
>=20
> -	for pkg in $(opkg-cl -f ${IMAGE_ROOTFS}/etc/opkg -o =
${IMAGE_ROOTFS} list_installed | awk '{print $1}') ; do=20
> -		opkg-cl -f ${IMAGE_ROOTFS}/etc/opkg -o ${IMAGE_ROOTFS} =
info $pkg | awk '/Package/ {printf $2"_"} /Version/ {printf $2"_"} =
/Archi/ {print $2".ipk"}'  >> ${TESTLAB_DIR}/installed-packages.txt
> +	for pkg in $(opkg-cl ${IPKG_ARGS} list_installed | awk '{print =
$1}') ; do=20
> +		opkg-cl ${IPKG_ARGS} info $pkg | awk '/Package/ {printf =
$2"_"} /Version/ {printf $2"_"} /Archi/ {print $2".ipk"}'  >> =
${TESTLAB_DIR}/installed-packages.txt
>=20
> -    		for depends in $(opkg-cl -f ${IMAGE_ROOTFS}/etc/opkg -o  =
${IMAGE_ROOTFS} info $pkg | grep Depends) ; do=20
> +    		for depends in $(opkg-cl ${IPKG_ARGS} info $pkg | grep =
Depends) ; do=20
>         		echo "$pkg OPP $depends;" | grep -v "(" | grep =
-v ")" | grep -v Depends | sed -e 's:,::g' -e 's:-:_:g' -e 's:\.:_:g' -e =
's:+::g' |sed 's:OPP:->:g' >> ${TESTLAB_DIR}/depends.dot
>     		done
>     	=09
> -		for recommends in $(opkg-cl -f ${IMAGE_ROOTFS}/etc/opkg =
-o ${IMAGE_ROOTFS} info $pkg | grep Recom) ; do
> +		for recommends in $(opkg-cl ${IPKG_ARGS} info $pkg | =
grep Recom) ; do
>         		echo "$pkg OPP $recommends [style=3Ddotted];" | =
grep -v "(" | grep -v ")" | grep -v Recom | sed -e 's:,::g' -e 's:-:_:g' =
-e 's:\.:_:g' -e 's:+::g' |sed 's:OPP:->:g' >> =
${TESTLAB_DIR}/depends.dot
>     		done
> 	done
>=20
> 	echo "}" >>  ${TESTLAB_DIR}/depends.dot
> +	rm -rf ${IPKG_TMP_DIR}
> =09
> 	grep -v kernel_2 ${TESTLAB_DIR}/depends.dot | grep -v =
kernel_image > ${TESTLAB_DIR}/depends-nokernel.dot
> 	grep -v libc6 ${TESTLAB_DIR}/depends-nokernel.dot | grep -v =
libgcc > ${TESTLAB_DIR}/depends-nokernel-nolibc.dot
> --=20
> 1.7.0
>=20
>=20



