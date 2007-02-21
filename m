Received: from [66.249.92.171] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <hvontres@gmail.com>) id 1HJzXA-0004I3-Bu
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Feb 2007 23:02:07 +0100
Received: by ug-out-1314.google.com with SMTP id e2so1160231ugf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2007 14:01:51 -0800 (PST)
Received: by 10.78.97.7 with SMTP id u7mr1415176hub.1172095311388;
	Wed, 21 Feb 2007 14:01:51 -0800 (PST)
Received: by 10.78.20.19 with HTTP; Wed, 21 Feb 2007 14:01:51 -0800 (PST)
Message-ID: <a7f8874a0702211401m30e4c43agf9fe7c8910b3f192@mail.gmail.com>
Date: Wed, 21 Feb 2007 14:01:51 -0800
From: "Hans Henry von Tresckow" <hvontres@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <45DCA97A.8000701@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <45DCA97A.8000701@dominion.kabel.utwente.nl>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: RFC: stop mounting /dev/mtdblockX but mount mtdX (without /dev) instead
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Feb 2007 22:02:25 -0000
X-List-Received-Date: Wed, 21 Feb 2007 22:02:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

sounds OK to me. Will this improve performance as well?

On 2/21/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
>
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> Chris Ball from the OLPC project was kind (and patient) enough to explain
> the first item
> of http://www.linux-mtd.infradead.org/archive/tech/faq.html to me.
>
> It seems that most machines in OE with MTD have something like:
>
> /dev/mtdblock2  /               jffs2   defaults        1  1
> /dev/mtdblock3  /home           jffs2   defaults        1  1
>
> in their fstab, which apparently is wrong. The trick to understanding the
> FAQ entry is not
> to think in terms of actual devices and controllers, but in terms of
> fstab. So 'block
> devices' translate to the emulated block devices present as /dev/mtdblockX
> and 'mtd'
> refers to mtdX.
>
> The correct fstab should be:
>
> mtd2  /         jffs2   defaults        1  1
> mtd3  /home     jffs2   defaults        1  1
>
> I don't know which kernel version introduced it, but it seems to work on
> 2.6.16.
>
> What do you think?
>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFF3Kl6MkyGM64RGpERAhiaAKCdBvq8lwBfM2lzzt+vGS28KcY1VwCeNgvN
> Fyi+w99uUA+KF2bZOdDLBq0=
> =bELj
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

