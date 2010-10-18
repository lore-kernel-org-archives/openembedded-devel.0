Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1P7sZg-0008Ie-O4
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 18:28:37 +0200
Received: from [192.168.0.101] (91-64-127-39-dynip.superkabel.de
	[91.64.127.39])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 082541B10C0C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 16:29:02 +0000 (UTC)
Message-ID: <4CBC7592.80807@freyther.de>
Date: Mon, 18 Oct 2010 18:28:02 +0200
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.9) Gecko/20100921 Fedora/3.1.4-1.fc14 Lightning/1.0b2
	Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1286889913-20008-1-git-send-email-Chase.Maupin@ti.com>	<4CBC5C00.2070200@freyther.de>	<131E5DFBE7373E4C8D813795A6AA7F080310FFAE94@dlee06.ent.ti.com>	<4CBC73DF.6080302@freyther.de>
	<131E5DFBE7373E4C8D813795A6AA7F080310FFAF0B@dlee06.ent.ti.com>
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F080310FFAF0B@dlee06.ent.ti.com>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] qt4: replace underscore with dash in library name
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
X-List-Received-Date: Mon, 18 Oct 2010 16:28:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/18/2010 06:24 PM, Maupin, Chase wrote:

>> Why do you need to patch Qt? :)
> 
> This library allows Qt to use the NEON processor on our Cortex-A8 for bitblit operations.  Currently this recipe is being carried in our overlay but will be moved to the OE mainline once we have all the licensing worked out.


Interesting, I worked on the raster engine in the 4.7 release cycle, did some
neon code as well. Samuel has done his version from scratch and integrated it.

Is that handwritten neon code or using gcc mnemonics? How does it compare to
what is in 4.7? Qt 4.7 can use ARM NEON even for string compares and other
parts of libQtCore.


PS: Do you need someone to integrate your patch?


