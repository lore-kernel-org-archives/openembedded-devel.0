Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JZAuE-0002WX-Fe
	for openembedded-devel@openembedded.org; Tue, 11 Mar 2008 21:17:57 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1JZAsI-0003q3-9r
	for openembedded-devel@openembedded.org; Tue, 11 Mar 2008 20:15:02 +0000
Received: from adsl-69-209-48-145.dsl.chcgil.sbcglobal.net ([69.209.48.145])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 11 Mar 2008 20:15:02 +0000
Received: from kbloom by adsl-69-209-48-145.dsl.chcgil.sbcglobal.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 11 Mar 2008 20:15:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Ken Bloom <kbloom@gmail.com>
Date: Tue, 11 Mar 2008 14:54:14 -0500
Message-ID: <pan.2008.03.11.19.54.14@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: adsl-69-209-48-145.dsl.chcgil.sbcglobal.net
User-Agent: Pan/0.132 (Waxed in Black)
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Cellwriter
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
X-List-Received-Date: Tue, 11 Mar 2008 20:18:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I'm very surprised that CellWriter isn't in OpenEmbedded yet. This is a 
GPL handwriting recognition system that can be used on keyboardless 
systems, for example the Nokia 770, for input. Please add this if you 
can, and encourage distributions for keyboardless devices (e.g. Poky 
Linux, and Mamona) to include it in their images.

$ cat org.openembedded.dev/packages/cellwriter/cellwriter_1.3.3.bb
DESCRIPTION = "A grid-entry natural handwriting input panel. As you write 
characters into the cells, your writing is instantly recognized at the 
character level. When you press Enter on the panel, the input you entered 
is sent to the currently focused application as if typed on the keyboard."
SECTION = "x11/input"
AUTHOR = "Michael Levin"
LICENSE = "GNU General Public License"
DEPENDS = "gtk+"

SRC_URI = "http://pub.risujin.org/cellwriter/cellwriter-1.3.3.tar.gz"
EXTRA_OECONF = "--without-gnome"

inherit autotools





-- 
Ken (Chanoch) Bloom. PhD candidate. Linguistic Cognition Laboratory.
Department of Computer Science. Illinois Institute of Technology.
http://www.iit.edu/~kbloom1/



