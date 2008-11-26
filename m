Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1L5Nj5-0007OW-9C
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Nov 2008 17:58:55 +0100
Received: from andromeda.vanille.de (e180179043.adsl.alicedsl.de
	[85.180.179.43])
	by drlauer-research.com (Postfix) with ESMTP id 417735843D6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Nov 2008 18:12:19 +0100 (CET)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Nov 2008 17:55:52 +0100
User-Agent: KMail/1.9.10
References: <ggjnpc$qhg$1@ger.gmane.org>
In-Reply-To: <ggjnpc$qhg$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200811261755.53197.mickey@vanille-media.de>
Subject: Re: preferred-provider at the image level a.k.a why is all this fso stuff in my non-fso image
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
X-List-Received-Date: Wed, 26 Nov 2008 16:58:55 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Sounds good overall, however there is still the problem with things like e.g. 
gpsd. If you remove fso-gpsd's RPROVIDES=gspd, then anything that rdepends on 
gpsd will bring us gpsd back into the [fso-]image, hence we have a conflict 
again.

-- 
:M:


