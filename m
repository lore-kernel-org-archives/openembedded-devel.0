Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1Ii6sF-0005hR-DX
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Oct 2007 13:15:39 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 1523E28C014; Wed, 17 Oct 2007 12:42:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=AWL,BAYES_00,RCVD_IN_PBL,
	RCVD_IN_SORBS_DUL,REPTO_OVERQUOTE_THEBAT autolearn=no 
	version=3.1.7-deb
Received: from PROMETHEUS (e180169241.adsl.alicedsl.de [85.180.169.241])
	by srv043.dedi23.de (Postfix) with ESMTP id 0C94328C012
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2007 12:42:35 +0200 (CEST)
Date: Wed, 17 Oct 2007 12:47:32 +0200
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.24) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1566637534.20071017124732@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4715D0B4.7010401@student.utwente.nl>
References: <200710151419.07302.openembedded@haerwu.biz>
	<1192464632.25543.58.camel@localhost.localdomain>
	<4713AD5F.3040807@student.utwente.nl>
	<1192478818.25543.108.camel@localhost.localdomain>
	<4715D0B4.7010401@student.utwente.nl>
MIME-Version: 1.0
Subject: Re: [RFC] Handling of virtual/* namespace in packages
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
X-List-Received-Date: Wed, 17 Oct 2007 11:15:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1

> Richard Purdie schreef:
>> On Mon, 2007-10-15 at 20:11 +0200, Koen Kooi wrote:
>>> Richard Purdie schreef:
>>>> So perhaps we should just standardise the existing xserver behaviour
>>>> into a dedicated namespace:
>>>>
>>>> DEPENDS = "virtual/xserver"
>>>> RDEPENDS_xyz = "${VIRTUAL-RUNTIME_xserver}"
>>>>
>>>> and the machine.conf in this case would say
>>>>
>>>> PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive"
>>>> VIRTUAL-RUNTIME_xserver = "xserver-kdrive-fbdev"
>>> We have the ${XSERVER} var for runtime selecting it:
>> 
>> Indeed. So what should we use for update-alternatives,
>> ${UPDATE-ALTERNATIVES} ? My point was that this is going to keep biting
>> us and a dedicated namespace might make sense?

> I'd say we copy the VIRTUAL-RUNTIME (note the OEDEM hyphen   ) from poky for kdrive and
> u-a. Any objections?

Go for it.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



