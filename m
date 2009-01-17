Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LO46b-0000vA-N5
	for openembedded-devel@openembedded.org; Sat, 17 Jan 2009 06:52:25 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LO400-0000GD-1z
	for openembedded-devel@openembedded.org; Sat, 17 Jan 2009 05:45:36 +0000
Received: from 203.117.215.163 ([203.117.215.163])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 17 Jan 2009 05:45:36 +0000
Received: from robk by 203.117.215.163 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 17 Jan 2009 05:45:36 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rob Kramer <robk@starhub.net.sg>
Date: Sat, 17 Jan 2009 13:45:08 +0800
Message-ID: <gkrr9l$nfh$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: 203.117.215.163
User-Agent: KNode/0.10.9
Sender: news <news@ger.gmane.org>
Subject: Trouble creating virtual library provider package..
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
X-List-Received-Date: Sat, 17 Jan 2009 05:52:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit

Hi all,

How would I go about if I'd like to have two packages that provide the same
thing? For example, I have package freetype, and freetype-led (which has a
device-specific hack). Or ffmpeg and ffmpeg-minimal (which builds the
smallest possible libavcodec/format). The right package is selected by the
image recipe, via a task. 

Is the normal way to do this to make a virtual/freetype and
PREFERRED_PROVIDER? I tried to do this, but still have trouble with double
providers etc. It gets tricky if package-name munging is involved, where
the final package is called libfreetype6_2.3.7-r4_i586.ipk, and not
freetype_2.3.7-r4_i586.ipk (and freetype-led_2.3.7-r4_i586.ipk).

If this is the right way, can someone point to a good (simple) example of a
virtual library provider?

Cheers!

    Rob



