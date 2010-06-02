Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OJtpK-0001x6-JS
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 21:42:11 +0200
Received: by iwn9 with SMTP id 9so1253030iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jun 2010 12:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=AP01rH4BbG5qipd2UDkIv82oN2aG1elpqwiffOD53OE=;
	b=HNDqXCzWJGlJrEriVgHH+yld2kW83rP4fOaOGy04pRrhGf3LclqCNppGazUtw9NZCd
	h5smwsndQrohcdSnweHWNjvFq7J9rSidyDHSMskLFE0MW7PBruZmayLp0qGE7zQa8i2Z
	26hdCTr36tCNoQ7ph13e/FrGWgHU/55cclihE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=tuqtt3GLa+kAAcoBMSzFXREILSN5Phq5+67Jx4bDieGuMPeRnDQKF1xreqqMzJVncz
	1dRDFqiMkqP5ZYClRe3bq4Hq8dmxN5ENx4PK6a5yPn7UCVbpPkdq2VS94RR7VkLFJbZ8
	LmZOJDinYpsPuqlDaSSGuDn6pyggQQmYd1EPI=
Received: by 10.231.148.145 with SMTP id p17mr10436634ibv.28.1275507476326; 
	Wed, 02 Jun 2010 12:37:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.10.202 with HTTP; Wed, 2 Jun 2010 12:37:35 -0700 (PDT)
In-Reply-To: <hu6a00$qd2$1@dough.gmane.org>
References: <hu6a00$qd2$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Jun 2010 12:37:35 -0700
Message-ID: <AANLkTinJBGqwz-QKJozTjnbMNH7W4Z85NP4mDizexXi2@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Please don't put image vars in machine.conf aka revert 39a7a0152d5d9a38ab202e11eb2eaab163dc35fa
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
X-List-Received-Date: Wed, 02 Jun 2010 19:42:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jun 2, 2010 at 12:04 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Khem,
>
> Could you please remove the ROOTFS_POSTPROCESS_COMMAND from
> conf/machine/include/qemu.inc? It make using the qemu machine for
> debugging useless, since all images I would pass it are using
> zap_root_password.

I thought qemu images would be more used for dev purposes and it would be handy
to have it enabled for qemu targets as whole. But yeah I see your
point. Will revert.

Thx
-Khem

> If you have a need for zap_root_password, please add some images to
> recipes/images/ that use it, but please, *PLEASE* keep image vars out of
> machine.confs.
>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMBqtAMkyGM64RGpERAkLEAJ4iUw9lPDsLw+M7Aon6eN+sb3hfhgCeKiXD
> 6xTULmnMcxllnBwLBuBA0ks=
> =yxcs
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


