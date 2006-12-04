Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mickey@vanille-media.de>) id 1GrDpv-00050y-J5
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Dec 2006 14:26:23 +0100
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 12F4D28C022; Mon,  4 Dec 2006 14:22:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.1.7 (2006-10-05) on srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=RCVD_IN_NJABL_DUL,
	RCVD_IN_SORBS_DUL autolearn=no version=3.1.7
Received: from PROMETHEUS (e180133007.adsl.alicedsl.de [85.180.133.7])
	by srv043.dedi23.de (Postfix) with ESMTP id 43C2428C021
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Dec 2006 14:22:54 +0100 (CET)
Date: Mon, 4 Dec 2006 14:25:34 +0100
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.85.03) UNREG / CD5BF9353B3B7091
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <299907395.20061204142534@vanille-media.de>
To: Nicolas FR <openembedded-devel@lists.openembedded.org>
In-Reply-To: <b9481e140612030440q4cd679e2l9c5ae7b3f2e7f423@mail.gmail.com>
References: <b9481e140612030440q4cd679e2l9c5ae7b3f2e7f423@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: libqte-sharprom in OE (attn Mickey)
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
X-List-Received-Date: Mon, 04 Dec 2006 13:26:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Nicolas FR wrote:
> I came accross an old post of yours on OESF:
[...]
> As I am fighting with some qte apps compiling for sharprom under OE
> (in fact they compile but then on the Zaurus complains about missing
> exports), I wanted to know what you meant in the last sentence "add
> two or three dedicated packages, i.e. qte-sharprom and
> libqpe-sharprom". Did you mean copy the libs from the Zaurus and put
> it in the OE tree?

Something like that -- see how we are doing it with the sharprom
binary-only camera drivers. Basically you need to upload the libraries
and include files to some site and make a .bb file download them and
copy them into staging.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



