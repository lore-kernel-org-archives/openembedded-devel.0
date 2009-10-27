Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N2n4r-0003rX-Vj for openembedded-devel@lists.openembedded.org;
	Tue, 27 Oct 2009 15:31:17 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N2n3k-0001IP-5J
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Oct 2009 15:30:04 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2009 15:30:04 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2009 15:30:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 27 Oct 2009 15:24:51 +0100
Message-ID: <hc6vrj$k2o$2@ger.gmane.org>
References: <4AE6F615.4080204@SSpaeth.de> <hc6tgk$bvp$1@ger.gmane.org>
	<4AE6FCC8.8090704@SSpaeth.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <4AE6FCC8.8090704@SSpaeth.de>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: gst-plugins-base -> gnome-vfs question
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
X-List-Received-Date: Tue, 27 Oct 2009 14:31:17 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27-10-09 14:59, Sebastian Spaeth wrote:
> Koen Kooi wrote:
>> On 27-10-09 14:31, Sebastian Spaeth wrote:
>>> Current "gst-plugins-base" in org.oe.dev unconditionally depends on
>>> "gnome-vfs" which in turn pulls in stuff like "avahi".
>
>> It's already optional, don't install gst-plugin-gnomevfs
> Thanks for the quick reply.
> I was referring to the fact that the "gst-plugins-base" package directly
> depends on gnome-vfs.
>
> eg.
> http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/gstreamer/gst-plugins-base_0.10.22.bb
> contains:
> DEPENDS += "libtheora alsa-lib libsm virtual/libx11 freetype gnome-vfs
> libxv"
>
> This does not look very optional to me. I keep thinking that there must
> be something very obvious that I have missed.

Yes, something along the lines of "build time dependency != runtime 
depency" or in OE speak "DEPENDS != RDEPENDS".

Glibc has qemu in DEPENDS, does that show up on your freerunner?



