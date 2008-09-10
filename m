Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KdLOx-00021s-Bz
	for openembedded-devel@openembedded.org; Wed, 10 Sep 2008 10:50:15 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KdLMO-0008Mb-KY
	for openembedded-devel@openembedded.org; Wed, 10 Sep 2008 08:47:37 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 10 Sep 2008 08:47:36 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 10 Sep 2008 08:47:36 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 10 Sep 2008 10:47:25 +0200
Message-ID: <ga81it$e8i$1@ger.gmane.org>
References: <48C72166.7030000@dls.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080901030016 Shredder/3.0b1pre
In-Reply-To: <48C72166.7030000@dls.net>
Sender: news <news@ger.gmane.org>
Subject: Re: libusb and libusb-compat: conflict
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
X-List-Received-Date: Wed, 10 Sep 2008 08:50:15 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Mike (mwester) wrote:
> There appears to be a conflict between libusb and libusb-compat -- both
> stage usr/lib/libusb.a.
>
> Many packages in OE use libusb-compat; some others use libusb.  I can't
> say why this conflict hasn't come up before -- perhaps its a build order
> thing that has just popped up on my system -- but attempting to link
> openocd or dfu-util (which DEPEND on libusb) against the libusb.a in
> staging will fail, if it was libusb-compat that was staged overtop of
> libusb.
>
> I think step one would be to put a "CONFLICTS" line in each of libusb
> and libusb-compat's bb files -- but I suspect that will break a lot of
> builds.  So I'll send an email out for comments and suggestions on how
> to handle this little problem.
>
> It would be good if people can check their tmpdirs to see if both libusb
> and libusb-compat are being built (libusb1 is fine - not the similarity
> in name).  How big a problem is this?

Some background: libusb1 is the rewrite of libusb which brings up 
goodness as better performance and more powersaving, but its ABI is 
incompatible with libusb. That is why the libusb people create 
libusb-compat, it's a drop-in replacement for libusb.

When I added it to OE I made sure the runtime situation worked and 
changed all packages to libusb-compat. It seems I missed a few.

It should be safe to change everything over to libusb-compat, unless 
your favourite apps abuses private libusb API (as gnuradio does).

And there's no such thing as CONFLICTS in OE, only RCONFLICTS.

regards,

Koen



