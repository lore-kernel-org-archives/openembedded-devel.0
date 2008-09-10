Received: from [216.145.245.198] (helo=mx02.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1KdESj-0006SE-Q8
	for openembedded-devel@openembedded.org; Wed, 10 Sep 2008 03:25:42 +0200
Received: from [209.242.7.188] (helo=[192.168.231.111])
	by mx02.dls.net with esmtpa (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1KdEQC-0000xm-4K
	for openembedded-devel@openembedded.org; Tue, 09 Sep 2008 20:23:05 -0500
Message-ID: <48C72166.7030000@dls.net>
Date: Tue, 09 Sep 2008 20:22:46 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.16) Gecko/20080708 Thunderbird/2.0.0.16 Mnenhy/0.7.5.666
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
Subject: libusb and libusb-compat: conflict
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
X-List-Received-Date: Wed, 10 Sep 2008 01:25:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

There appears to be a conflict between libusb and libusb-compat -- both
stage usr/lib/libusb.a.

Many packages in OE use libusb-compat; some others use libusb.  I can't
say why this conflict hasn't come up before -- perhaps its a build order
thing that has just popped up on my system -- but attempting to link
openocd or dfu-util (which DEPEND on libusb) against the libusb.a in
staging will fail, if it was libusb-compat that was staged overtop of
libusb.

I think step one would be to put a "CONFLICTS" line in each of libusb
and libusb-compat's bb files -- but I suspect that will break a lot of
builds.  So I'll send an email out for comments and suggestions on how
to handle this little problem.

It would be good if people can check their tmpdirs to see if both libusb
and libusb-compat are being built (libusb1 is fine - not the similarity
in name).  How big a problem is this?

Regards,
Mike (mwester)


