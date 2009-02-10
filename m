Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <k.kooi@student.utwente.nl>) id 1LX1O3-0007uQ-Ft
	for openembedded-devel@openembedded.org; Tue, 10 Feb 2009 23:47:27 +0100
Received: from [172.20.1.5] (vpn006015.vpn.utwente.nl [130.89.6.15])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	n1AMh9NG031140 for <openembedded-devel@openembedded.org>;
	Tue, 10 Feb 2009 23:43:09 +0100
Message-Id: <03499B67-9FFC-43D7-91C4-A92ECDB55370@student.utwente.nl>
From: Koen Kooi <k.kooi@student.utwente.nl>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
In-Reply-To: <20090210204817.GH11815@smtp.west.cox.net>
Mime-Version: 1.0 (Apple Message framework v930.3)
Date: Tue, 10 Feb 2009 23:43:07 +0100
References: <20090210204817.GH11815@smtp.west.cox.net>
X-Pgp-Agent: GPGMail d55 (v55, Leopard)
X-Mailer: Apple Mail (2.930.3)
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [RFC] Add ubi volume image support, fix ubifs
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
X-List-Received-Date: Tue, 10 Feb 2009 22:47:27 -0000
X-Groupsio-MsgNum: 7590
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=pgp-sha1; boundary="Apple-Mail-1-448033282"
Content-Transfer-Encoding: 7bit

--Apple-Mail-1-448033282
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit


Op 10 feb 2009, om 21:48 heeft Tom Rini het volgende geschreven:

> Hey all.  I'd like to commit the following patch.

Looks ok, one minor featurerequest:


> +IMAGE_CMD_ubi = "echo \[ubifs\] > ubinize.cfg ; echo mode=ubi >>  
> ubinize.cfg ; echo image=${DEPLOY_DIR_IMAGE}/$ 
> {IMAGE_NAME}.rootfs.ubifs >> ubinize.cfg ; echo vol_id=0 >>  
> ubinize.cfg ; echo vol_type=dynamic >> ubinize.cfg ; echo  
> vol_name=rootfs >> ubinize.cfg ; echo vol_flags=autoresize >>  
> ubinize.cfg;mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/$ 
> {IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS} && ubinize -o $ 
> {DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${UBINIZE_ARGS}  
> ubinize.cfg"

echo vol_name=${MACHINE}-rootfs would be nice :)

regards,

Koen

--Apple-Mail-1-448033282
content-type: application/pgp-signature; x-mac-type=70674453;
	name=PGP.sig
content-description: Dit deel van het bericht is digitaal ondertekend
content-disposition: inline; filename=PGP.sig
content-transfer-encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFJkgL9MkyGM64RGpERAqrcAKCxHudgLpBZLhIbtLbcrsFIhHHcXgCfSL+c
HadGz5et6Q4+C6ISnIcjw/w=
=D/2w
-----END PGP SIGNATURE-----

--Apple-Mail-1-448033282--
