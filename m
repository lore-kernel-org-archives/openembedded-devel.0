Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1I7tTt-0000xv-2I
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jul 2007 15:40:51 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 7446628C013; Mon,  9 Jul 2007 15:34:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.2 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_NJABL_DUL,RCVD_IN_PBL,REPTO_OVERQUOTE_THEBAT autolearn=no 
	version=3.1.7-deb
Received: from PROMETHEUS (e180163073.adsl.alicedsl.de [85.180.163.73])
	by srv043.dedi23.de (Postfix) with ESMTP id 9C7F828C012
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2007 15:33:59 +0200 (CEST)
Date: Mon, 9 Jul 2007 15:35:13 +0200
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.3) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1005211919.20070709153513@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20070709131744.GC2336@p3n3tr4t0r.internal>
References: <513012886.20070708041151@gmail.com> <f6q30v$s2$1@sea.gmane.org>
	<128309124.20070709154303@gmail.com>
	<20070709131744.GC2336@p3n3tr4t0r.internal>
MIME-Version: 1.0
Subject: Re: [RFC] Adding screen dimensions to machine configs
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
X-List-Received-Date: Mon, 09 Jul 2007 13:40:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Graeme Gregory wrote:
> On Mon, Jul 09, 2007 at 03:43:03PM +0300, Paul Sokolovsky wrote:
>>   As was pointed out, interpretation of those vars should depend on
>> presence of "screen" in machine features. And yes, then we need to set
>> their bitbake.conf default to 0, so only screen'ed machines specify
>> them.
>> 
>>   Also a note of exact semantics of those vars - they provide *some
>> default* screen resolution and orientation. Actually not some, but the
>> most appropriate after-install default. So, in particular,
>> notebook-style keyboarded devices would have:
>> 
>> MACHINE_DISPLAY_WIDTH_PIXELS=640
>> MACHINE_DISPLAY_HEIGHT_PIXELS=480
>> 
>> A device with vertical PDA layout would have
>> 
>> MACHINE_DISPLAY_WIDTH_PIXELS=480
>> MACHINE_DISPLAY_HEIGHT_PIXELS=640
>> 
> The problem with this interpretation is that although spitz boots and looks
> like it is 640x480 it is in fact 480x640 with rotation. So it may just
> be a mistake in your example that spitz happens to show up. Or it may be
> something that has not been considered.

I agree with Paul's "they provide *some default* screen resolution and
orientation.". Almost all our screen devices can be rotated on-the-fly
anyway. The MACHINE_DISPLAY_ namespace is mainly UI frameworks and
applications, as much as native framebuffer rotations and stuff are
important to know, they're less relevant here.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



