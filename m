Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1IUM0i-0002HP-Ue
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Sep 2007 14:35:32 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 2976A28C013; Sun,  9 Sep 2007 14:29:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_NJABL_DUL,RCVD_IN_PBL,RCVD_IN_SORBS_DUL,
	REPTO_OVERQUOTE_THEBAT autolearn=no version=3.1.7-deb
Received: from PROMETHEUS (e180171236.adsl.alicedsl.de [85.180.171.236])
	by srv043.dedi23.de (Postfix) with ESMTP id 26CBD28C012
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Sep 2007 14:29:05 +0200 (CEST)
Date: Sun, 9 Sep 2007 14:32:37 +0200
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.3) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <65784821.20070909143237@vanille-media.de>
To: Detlef Vollmann <openembedded-devel@lists.openembedded.org>
In-Reply-To: <46E3E02B.22CEE170@vollmann.ch>
References: <46E3264C.39BD31A5@vollmann.ch>
	<74d0deb30709090150g161e6059q99f23e2ce1336e1c@mail.gmail.com>
	<46E3E02B.22CEE170@vollmann.ch>
MIME-Version: 1.0
Subject: Conditional Expressions in Python
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
X-List-Received-Date: Sun, 09 Sep 2007 12:35:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Guys,

I vote for rewriting our conditional expressions hack in .bb files:

DEPENDS = "${@['virtual/${TARGET_PREFIX}gcc-initial','virtual/${TARGET_PREFIX}gcc']['nptl' in '${GLIBC_ADDONS}']}"

Since Python 2.5, this can be written as:

DEPENDS = "${@'virtual/${TARGET_PREFIX}gcc' if 'nptl' in '${GLIBC_ADDONS}' else 'virtual/${TARGET_PREFIX}gcc-initial'}

which parses faster and is much more clear and concise. IIRC the
resulting bytecode is also faster since there is no need to construct,
access, and destroy temporary lists.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



