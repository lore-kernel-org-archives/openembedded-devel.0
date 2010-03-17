Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NrhIL-0001Eu-Sn
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Mar 2010 01:39:38 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NrhFL-0002at-V1 from Tom_Rini@mentor.com ;
	Tue, 16 Mar 2010 17:36:27 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 16 Mar 2010 17:36:27 -0700
Received: from 172.30.80.63 ([172.30.80.63]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Wed, 17 Mar 2010 00:36:26 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	16 Mar 2010 17:36:25 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1268775178-16062-1-git-send-email-ulf.samuelsson@atmel.com>
References: <1268775178-16062-1-git-send-email-ulf.samuelsson@atmel.com>
Organization: Mentor Graphics Corporation
Date: Tue, 16 Mar 2010 17:36:25 -0700
Message-ID: <1268786185.20395.2.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 17 Mar 2010 00:36:27.0487 (UTC)
	FILETIME=[E14146F0:01CAC569]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: Re: [PATCH v4 1/1] u-boot-2009.11: Add recipe
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
X-List-Received-Date: Wed, 17 Mar 2010 00:39:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-03-16 at 22:32 +0100, Ulf Samuelsson wrote:
[snip]
> diff --git a/recipes/u-boot/u-boot_2009.11.bb b/recipes/u-boot/u-boot_200=
9.11.bb
[snip]
> +PR =3D "r1"

r0 to start with.

> +require u-boot.inc

And doesn't that give us...

> +TARGET_LDFLAGS =3D ""
> +
> +inherit base
> +
> +do_compile () {
> +       oe_runmake ${UBOOT_MACHINE}
> +       oe_runmake all
> +}

Also, missing checksums.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


