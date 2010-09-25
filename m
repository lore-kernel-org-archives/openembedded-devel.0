Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1OzbP5-0001Nd-Pe
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Sep 2010 22:31:28 +0200
Received: from [192.168.0.101] (91-64-127-39-dynip.superkabel.de
	[91.64.127.39])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 70D401B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Sep 2010 20:34:16 +0000 (UTC)
Message-ID: <4C9E5C16.60705@freyther.de>
Date: Sun, 26 Sep 2010 04:31:18 +0800
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.9) Gecko/20100908 Fedora/3.1.3-1.fc14 Lightning/1.0b2
	Thunderbird/3.1.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTikDibG-qAf2b9U_OuOLbVXNP8QWouTEN7z_v25_@mail.gmail.com>	<20100921152505.GB3403@jama>	<AANLkTikTrRMX-5UAso2BgJ8-XqhwtXTnS_vT2Yt4FNnc@mail.gmail.com>	<20100921154038.GC3403@jama>	<AANLkTim9cs7=eKAV1T2ZWTd1HgAaXrxDUdcLUT8RahUF@mail.gmail.com>	<20100921203711.GF3403@jama>
	<AANLkTin-D__XnhkP3ZDjtW0K5hN0QyY0Zkd6sXd-XGsd@mail.gmail.com>
In-Reply-To: <AANLkTin-D__XnhkP3ZDjtW0K5hN0QyY0Zkd6sXd-XGsd@mail.gmail.com>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: anyone working on recipes for qt 4.7.0 released?
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
X-List-Received-Date: Sat, 25 Sep 2010 20:31:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 09/23/2010 05:02 AM, Cliff Brake wrote:

> /scratch/pp/du-sw-web-builder/oe4/build/angstrom-2008.1/tmp/sysroots/x86_64-linux/usr/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/bin/ld:
> warning: libphonon.so.4, needed by

Hi,
just to explain the root cause. The QMAKE_RPATH variable got renamed to
QMAKE_LFLAGS_RPATH and our g++.conf didn't catch up (i have some commits
pending that I will push tomorrow if things compiled).

I have updated the g++.conf/linux.conf and will remove the patches that
covered up this issue.

z.


