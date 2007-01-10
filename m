Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1H4n8W-0007BB-Sl
	for openembedded-devel@openembedded.org; Thu, 11 Jan 2007 00:45:40 +0100
Received: from lieve.dominion.void (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l0ANhdox001041 for <openembedded-devel@openembedded.org>;
	Thu, 11 Jan 2007 00:43:39 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
To: openembedded-devel@openembedded.org
In-Reply-To: <E1H4mEX-0005Jg-Pk@linuxtogo.org>
References: <E1H4mEX-0005Jg-Pk@linuxtogo.org>
Date: Thu, 11 Jan 2007 00:43:07 +0100
Message-Id: <1168472587.5483.2.camel@lieve>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev packages/parted/parted_1.8.0.bb:	Addition of mem allocation patch
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
X-List-Received-Date: Wed, 10 Jan 2007 23:45:41 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Could you also add the actual patch?

Op wo, 10-01-2007 te 23:47 +0100, schreef kristoffer commit:
> packages/parted/parted_1.8.0.bb: Addition of mem allocation patch
> * Currently parted 1.8.0 doesnt work on ARM devices
>   when using glibc 2.5. This patch although it didnt solve the
>   issue is an update from their maintainer.
> 
> Author: kristoffer@openembedded.org
> Branch: org.openembedded.dev
> Revision: ab8f78229862d338d098dfcf3f16220f581fc88d
> ViewMTN: http://monotone.openembedded.org/revision.psp?id=ab8f78229862d338d098dfcf3f16220f581fc88d
> Files:
> 1
> packages/parted/parted_1.8.0.bb
> Diffs:
> 
> #
> # mt diff -rece70fc7a4ae5629717d10fd851fa3b219086494 -rab8f78229862d338d098dfcf3f16220f581fc88d
> #
> # 
> # 
> # patch "packages/parted/parted_1.8.0.bb"
> #  from [896f73b9e4a2aaef2af4e2ce3de9ada7960e4e2c]
> #    to [02861e9f7b662a601a0e16446d7e975a28746824]
> # 
> ============================================================
> --- packages/parted/parted_1.8.0.bb	896f73b9e4a2aaef2af4e2ce3de9ada7960e4e2c
> +++ packages/parted/parted_1.8.0.bb	02861e9f7b662a601a0e16446d7e975a28746824
> @@ -5,7 +5,8 @@ PR = "r0"
>  DEPENDS = "readline e2fsprogs-libs"
>  PR = "r0"
>  
> -SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.gz"
> +SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.gz \
> +           file://memory_allocation.patch;patch=0"
>  
>  EXTRA_OECONF = "--disable-Werror"
>  #export CFLAGS = "-mstructure-size-boundary=8"
> 
> 
> 
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
> 



