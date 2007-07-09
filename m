Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1I7tkr-0001R9-4F
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jul 2007 15:58:21 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id AA15E28C013; Mon,  9 Jul 2007 15:51:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.2 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_NJABL_DUL,RCVD_IN_PBL,REPTO_OVERQUOTE_THEBAT autolearn=no 
	version=3.1.7-deb
Received: from PROMETHEUS (e180163073.adsl.alicedsl.de [85.180.163.73])
	by srv043.dedi23.de (Postfix) with ESMTP id D18FC28C012;
	Mon,  9 Jul 2007 15:51:31 +0200 (CEST)
Date: Mon, 9 Jul 2007 15:52:45 +0200
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.3) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <13810026301.20070709155245@vanille-media.de>
To: Graeme Gregory <dp@xora.org.uk>
In-Reply-To: <20070709134256.GD2336@p3n3tr4t0r.internal>
References: <513012886.20070708041151@gmail.com> <f6q30v$s2$1@sea.gmane.org>
	<128309124.20070709154303@gmail.com>
	<20070709131744.GC2336@p3n3tr4t0r.internal>
	<1005211919.20070709153513@vanille-media.de>
	<20070709134256.GD2336@p3n3tr4t0r.internal>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Mon, 09 Jul 2007 13:58:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Graeme Gregory wrote:
> On Mon, Jul 09, 2007 at 03:35:13PM +0200, Dr. Michael Lauer wrote:
>> I agree with Paul's "they provide *some default* screen resolution and
>> orientation.". Almost all our screen devices can be rotated on-the-fly
>> anyway. The MACHINE_DISPLAY_ namespace is mainly UI frameworks and
>> applications, as much as native framebuffer rotations and stuff are
>> important to know, they're less relevant here.
>> 
> But this argument makes the variables useless as if you support on the fly
> rotate then the UI framework must support dynamic resize.

> So are we adding these global variables solely in order to tell opie what
> size backgrounds to ship?

Heh, it's not just Opie. Eventually we may want to ship prerendered png's for
UI elements. We better know about the size and dpi of the displays to
get sane defaults. There's a whole lot of packages which could use the
MACHINE namespace to improve targetting the platforms specifics at
build time.

What makes you worry so much about adding more (imho necessary)
information to the MACHINE_ capability namespace?

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



