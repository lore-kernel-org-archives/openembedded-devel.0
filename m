Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickeyl@linuxtogo.org>) id 1Ii9TY-0003Sj-C3
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Oct 2007 16:02:22 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id D80BA28C015; Wed, 17 Oct 2007 15:20:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=AWL,BAYES_00,RCVD_IN_PBL,
	RCVD_IN_SORBS_DUL autolearn=no version=3.1.7-deb
Received: from PROMETHEUS (e180150150.adsl.alicedsl.de [85.180.150.150])
	by srv043.dedi23.de (Postfix) with ESMTP id D4D2E28C014
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2007 15:20:26 +0200 (CEST)
Date: Wed, 17 Oct 2007 15:25:24 +0200
From: Michael 'Mickey' Lauer <mickeyl@linuxtogo.org>
X-Mailer: The Bat! (v3.99.24) Professional
Organization: LinuxToGo
X-Priority: 3 (Normal)
Message-ID: <4510693243.20071017152524@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Cleaning up SDK/Toolchain
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
X-List-Received-Date: Wed, 17 Oct 2007 14:02:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On OEDEM we talked about SDK and Toolchain issues. Richard Purdie
recently merged Poky's meta-toolchain package plus the infrastructure
that enables OE building external toolchains for usage with or without
OpenEmbedded.

In order to make this a bit more clean, we'd like to remove some of
the older meta-sdk packages, if no one objects. If you are still using
the meta-sdk packages, could you merge them towards using
meta-toolchain?

Adding custom packages to the meta-toolchain should just be a matter
of overriding TOOLCHAIN_TARGET_TASK now.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



