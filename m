Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1I7DHG-0001bd-GM
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Jul 2007 18:36:58 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 60FE728C013; Sat,  7 Jul 2007 18:30:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ****
X-Spam-Status: No, score=4.4 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_NJABL_DUL,RCVD_IN_PBL,RCVD_IN_SORBS_DUL,
	REPTO_OVERQUOTE_THEBAT autolearn=no version=3.1.7-deb
Received: from PROMETHEUS (e180157254.adsl.alicedsl.de [85.180.157.254])
	by srv043.dedi23.de (Postfix) with ESMTP id ABF7328C012
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Jul 2007 18:30:24 +0200 (CEST)
Date: Sat, 7 Jul 2007 18:31:33 +0200
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.3) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1687020492.20070707183133@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <468FA89D.8060701@dominion.kabel.utwente.nl>
References: <E1I75mQ-0005Wr-Px@linuxtogo.org>
	<142948947.20070707122533@vanille-media.de>
	<468FA89D.8060701@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Subject: Re: [oe-commits] org.oe.dev disapproval of revision '66573a06c1ee62e38d70a6c82f8d99a41243cd5c'
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
X-List-Received-Date: Sat, 07 Jul 2007 16:36:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1

> Dr. Michael Lauer schreef:
>> koen commit wrote:
>>> disapproval of revision '66573a06c1ee62e38d70a6c82f8d99a41243cd5c'
>> 
>> May I request that from now on _every_ disapproval goes hand in hand with a
>> lengthy explanation on oe-devel?

> Yes, sorry about that, I wanted to act quickly before people with glibc builds get the
> change, build libiconv and require a build from scratch.

> The bottom line:

> *NEVER* DEPEND on libiconv directly, but on virtual/libiconv, otherwise you break all
> glibc based builds out there

> The situation is tricky since uclibc (and maybe newlib) need libiconv, but our glibc build
> can use the internal iconv from libc6.so. That's why we have virtual/libiconv which does
> the right thing automagically.

Excellent. Thanks for the explanation.

Cheers,

:M:




