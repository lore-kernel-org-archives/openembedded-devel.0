Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Ntf3V-0000hl-OY
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 11:40:22 +0100
Received: from tamarin.localnet (123-192-181-204.dynamic.kbronet.com.tw
	[123.192.181.204])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 3BB2A1B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Mar 2010 10:40:50 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Mar 2010 11:37:08 +0100
User-Agent: KMail/1.13.1 (Linux/2.6.33-rc8; KDE/4.4.1; i686; ; )
References: <000001cac9a8$63534250$29f9c6f0$@in>
In-Reply-To: <000001cac9a8$63534250$29f9c6f0$@in>
MIME-Version: 1.0
Message-Id: <201003221137.08426.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Want to Re build after modifying any files
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
X-List-Received-Date: Mon, 22 Mar 2010 10:40:22 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 22 March 2010 11:13:59 Tejas wrote:
> Hello All,
> 
>                I have removed INHERIT += " rm_work "  option from my
> local.conf file. So I can avail source code.
> 
> 
> 
>                The problem which I am facing is, I have built gst-omapfb
> from openembedded by giving bitbake gst-omapfb. It is built successfully.
> Now I am changing code and trying to rebuild it by giving bitbake
> gst-omapfb. But it is not rebuilding.
>

You can use:
	bitbake -ccompile -f gst-omapfb

This will force compilation (running of make) inside the existing 
tmp/work/*/gst-omap*... source directory..

Alternatively you can do:

	bitbake -cdevshell gst-omapfb (on angstrom)

this will open a gnome-terminal and you can type make inside the build 
directory..


Alternatively you can:
	Change to tmp/work/*/gst-omap
	and run the temp/run.do_* scripts to redo a task..




