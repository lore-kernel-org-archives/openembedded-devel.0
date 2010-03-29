Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Nw9AP-0000up-MB
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Mar 2010 09:13:46 +0200
Received: from tamarin.localnet (123-192-181-204.dynamic.kbronet.com.tw
	[123.192.181.204])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 7038A1B10C79
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Mar 2010 07:14:39 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Mar 2010 09:10:17 +0200
User-Agent: KMail/1.13.1 (Linux/2.6.33-rc8; KDE/4.4.1; i686; ; )
References: <loom.20100329T073757-156@post.gmane.org>
In-Reply-To: <loom.20100329T073757-156@post.gmane.org>
MIME-Version: 1.0
Message-Id: <201003290910.17851.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Problem building Angstrom (quilt-native_0.46.bb' failed)
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
X-List-Received-Date: Mon, 29 Mar 2010 07:13:46 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 29 March 2010 07:43:48 Danail wrote:
.
> 
> | ./.lineno: fork: Cannot allocate memory
> | FATAL: oe_runconf failed
> 
> NOTE: Task failed: /home/pc/stuff/build/tmp/work/x86_64-linux/
> quilt-native-0.46-r2/temp/log.do_configure.1750

> Any ideas what is the problem?

Hi,

this is a kind of issue you can only resolve yourself as it heavily depends on 
your environment. In general I have two remarks:

When a tool points you to a log file (as in above temp/log.do_configure) you 
should attempt to make sense out of it, or at least attach it when sending an 
email.

The other one is, we are all humans and we do love social interaction to 
various degrees. When you say you spend two weeks figuring that out, it would 
be very nice if you could explain what you have tried so far, how it failed 
instead of simply relying on others. :)


And here is my speculation:
	1.) You really don't have enough ram to allocate more than one process
	2.) Your home partition is mounted no exec or such.


