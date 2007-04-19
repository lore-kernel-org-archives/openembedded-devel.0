Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mickey@vanille-media.de>) id 1HeWCI-0007nj-Ia
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Apr 2007 14:57:14 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id D370828C012; Thu, 19 Apr 2007 14:49:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=RCVD_IN_NJABL_DUL, RCVD_IN_PBL,
	RCVD_IN_SORBS_DUL,UPPERCASE_25_50 autolearn=no version=3.1.7-deb
Received: from PROMETHEUS (e180154148.adsl.alicedsl.de [85.180.154.148])
	by srv043.dedi23.de (Postfix) with ESMTP id 67E9428C011
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2007 14:49:31 +0200 (CEST)
Date: Thu, 19 Apr 2007 14:57:13 +0200
From: "Dr. Michael 'Mickey' Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.98.4) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <157361400.20070419145713@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1HeU56-0006o4-VP@linuxtogo.org>
References: <E1HeU56-0006o4-VP@linuxtogo.org>
MIME-Version: 1.0
Subject: Re: [oe-commits] org.oe.dev mtx-3a.conf, nylon-image-base.bb: removed remaints from old OE code (PACKAGE_INSTALL instead of IPKG_INSTALL)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Apr 2007 12:57:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

MartinDietze commit wrote:
> mtx-3a.conf, nylon-image-base.bb: removed remaints from old OE code
> (PACKAGE_INSTALL instead of IPKG_INSTALL)

>  TARGET_ARCH = "arm"
> -IPKG_ARCHS = "all arm ${MACHINE}"
> +#PACKAGE_ARCHS = "all arm ${MACHINE}"

Why is that commented?

> -inherit image_ipk
> -inherit nylon_image
> -LICENSE = MIT
> +inherit image
> +inherit nylon-image
> +LICENSE = "MIT"

Are you sure about that? image_ipk looks about right for me.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



