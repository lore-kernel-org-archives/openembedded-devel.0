Received: from [209.242.20.70] (helo=green.dls.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1H3FAc-0007kn-FT
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Jan 2007 18:17:26 +0100
Received: from twilight (gw.mwester.net [209.242.5.110])
	by green.dls.net (Postfix) with ESMTP id 7E3954125F8
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Jan 2007 11:16:03 -0600 (CST)
Message-ID: <0b4101c731b6$3d339cb0$6e01a8c0@twilight>
From: "Mike \(mwester\)" <mwester@dls.net>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 6 Jan 2007 11:15:18 -0600
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2800.1807
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2800.1896
Subject: Re: [oe-commits] org.oe.dev madwifi-ng: add slugos support and bump to latest snapshot
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
X-List-Received-Date: Sat, 06 Jan 2007 17:17:26 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

> mwester commit schreef:
> > madwifi-ng: add slugos support and bump to latest snapshot
>
[snip]
>
> Ehm, shouldn't those be machine specific? what happens if  I build slugos
for powerpc?
>
> regards,
>
> Koen

Er, actually it's worse than that.  You can also ask what happens if you
build slugos with gcc 3.x?  Or if you simply change the floating point
options when building slugos?

The problem is that the correct fix to apply depends on the machine,
toolchain, and the fp options -- and just to spice it up even more, the
state of the files being patched in ".../hal/public" seem to be somewhat in
flux; so those patches will have to change in order to even sucessfully
apply to each successive snapshot (hopefully that will stabilize at some
point, though).

If someone has a good way to encapsulate such a specific patchset based on
the parameters above, that would be ideal.  I opted for the less-elegant
approach -- the argument being that, at this point, in time, "slugos"
implicity defines the machine (ARM Xscale), the toolchain versions (gcc
4.x), and the floating point options (soft float, FPA).

(Frankly, the root of this problem is the pre-compiled proprietary HAL stuff
for the atheros chipset; the right solution is to get rid of that
proprietary stuff as soon as somebody reverse-engineers it, an effort I
understand is underway.  Or, for those with money to burn, replace the
atheros NIC that came in the device with something more open.)

Mike (mwester)




