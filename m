Received: from [216.148.227.152] (helo=rwcrmhc12.comcast.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <golly@stellarwerx.com>) id 1HoKNy-0003fD-H8
	for openembedded-devel@openembedded.org; Wed, 16 May 2007 16:21:52 +0200
Received: from gatekeeper.stellarwerx.com
	(c-68-57-212-205.hsd1.in.comcast.net[68.57.212.205])
	by comcast.net (rwcrmhc12) with ESMTP
	id <20070516142130m120088e2ie>; Wed, 16 May 2007 14:21:31 +0000
Received: by gatekeeper.stellarwerx.com (Postfix, from userid 500)
	id 513F81108; Wed, 16 May 2007 10:32:21 -0400 (EDT)
From: "Mark Gollahon" <golly@stellarwerx.com>
To: openembedded-devel@openembedded.org
X-Originating-IP: 66.162.54.82
X-Mailer: Usermin 1.270
Message-Id: <1179325940.4167@gatekeeper.stellarwerx.com>
Date: Wed, 16 May 2007 10:32:20 -0400 (EDT)
MIME-Version: 1.0
Subject: Re: RFC: machine customized ixp4xx NPE firmware
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
X-List-Received-Date: Wed, 16 May 2007 14:21:56 -0000
Content-Type: multipart/mixed; boundary="bound1179325940"

--bound1179325940
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

Richard Purdie wrote ..
> 
> A neat way to handle this might be to define:
> 
> IXPMACHINES = "nslu2|ixp4xx|whatever"
> 
> and then the ixp specific .bb's check IXPMACHINES rather than a specific
> list. The list would then be maintained in one place and is easily
> updated if anyone adds a new ixp like machine.
> 
> I've not looked at the specifics, its just a random idea I had...
> 
> Cheers,
> 
> Richard

I want to second this approach as I tried awhile back to build OE for an IXP4XX-based machine that came into my possession and, during that time, ended up patching several IXP-specific .bb's to add my new machine.  My work would have been much easier had IXPMACHINES existed.

(NOTE: I did get it almost completely working, the only problem ended up being the networking ports didn't work, which, for a firewall machine, meant the device was useless.  There is an IC175 switch chip sitting between the IXP's two network ports and the physical ports and I couldn't figure out how to hack the IXP net driver to get the IC175 to pass eth frames.)

Regards,
-Mark Gollahon

--bound1179325940--
