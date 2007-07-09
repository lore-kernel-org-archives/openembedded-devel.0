Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1I7zSL-0006Tu-Vc
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jul 2007 22:03:38 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id F34D828C013; Mon,  9 Jul 2007 21:56:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_NJABL_DUL,RCVD_IN_PBL,REPTO_OVERQUOTE_THEBAT autolearn=no 
	version=3.1.7-deb
Received: from PROMETHEUS (e180163073.adsl.alicedsl.de [85.180.163.73])
	by srv043.dedi23.de (Postfix) with ESMTP id 5163128C012
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2007 21:56:42 +0200 (CEST)
Date: Mon, 9 Jul 2007 21:57:55 +0200
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.3) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <126613333.20070709215755@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1I7yE2-0000V0-1x@linuxtogo.org>
References: <E1I7yE2-0000V0-1x@linuxtogo.org>
MIME-Version: 1.0
Subject: dbg packages (was: org.oe.dev wireshark: fix -dbg)
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
X-List-Received-Date: Mon, 09 Jul 2007 20:03:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

koen commit wrote:
> wireshark: fix -dbg
[...]
> +
> +FILES_${PN}-dbg += "${libdir}/wireshark/plugins/${PV}/.debug"
> +
> +

We keep adding this stuff more and more -- since more and more
packages go from a monolithic state to an extensible -- and
I don't like having to specify this all over. Can't we get the dbg
package to pick up all .debug directories automatically?

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



