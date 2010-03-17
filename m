Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NrhQ7-0001Og-Qq
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Mar 2010 01:47:37 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NrhN9-0003SR-R8 from Tom_Rini@mentor.com ;
	Tue, 16 Mar 2010 17:44:31 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 16 Mar 2010 17:44:31 -0700
Received: from 172.30.80.63 ([172.30.80.63]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Wed, 17 Mar 2010 00:43:42 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	16 Mar 2010 17:43:41 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1268773130-4625-1-git-send-email-ulf.samuelsson@atmel.com>
References: <1268773130-4625-1-git-send-email-ulf.samuelsson@atmel.com>
Organization: Mentor Graphics Corporation
Date: Tue, 16 Mar 2010 17:43:41 -0700
Message-ID: <1268786621.20395.4.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 17 Mar 2010 00:44:31.0349 (UTC)
	FILETIME=[01A8C250:01CAC56B]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: Re: [PATCH 1/1] libstdc++.bb: copy libstdc++.so* to rootfs
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
X-List-Received-Date: Wed, 17 Mar 2010 00:47:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-03-16 at 21:58 +0100, Ulf Samuelsson wrote:
> libstdc++.so* is needed by some applications during build,
> including gnome-mplayer.
>=20
> This recipe copies the shared library from the crosscompiler
> directory, without having to install the complete compiler
> in the target system

Checking in a non-external-toolchain based build I have around, I see
staging/<target>/usr/lib/libstdc++.so / libstc++.so.6 which point at
libstdc++.so.6.0.10, which exists.  Can you explain how you're getting a
lack of libstdc++?  Thanks.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


