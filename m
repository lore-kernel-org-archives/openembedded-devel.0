Received: from [64.233.184.224] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <pmiscml@gmail.com>) id 1GTJJw-00034S-L6
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Sep 2006 16:26:32 +0200
Received: by wr-out-0506.google.com with SMTP id i11so264502wra
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Sep 2006 07:21:26 -0700 (PDT)
Received: by 10.90.118.10 with SMTP id q10mr1501364agc;
	Fri, 29 Sep 2006 07:21:25 -0700 (PDT)
Received: from CUBE ( [82.193.96.236])
	by mx.gmail.com with ESMTP id 22sm2419544nzn.2006.09.29.07.21.24;
	Fri, 29 Sep 2006 07:21:25 -0700 (PDT)
Date: Fri, 29 Sep 2006 17:21:27 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1627999063.20060929172127@gmail.com>
To: "Axel.Lin" <Axel.Lin@mitac-mtc.com.tw>
In-Reply-To: <451B8A47.6030405@mitac-mtc.com.tw>
References: <451B8A47.6030405@mitac-mtc.com.tw>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: package xserver-xorg-X11R7.1-1.1.0-r0: task do_configure: failed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Sep 2006 14:26:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Axel.Lin,

Thursday, September 28, 2006, 11:39:35 AM, you wrote:

> hi list,
> I'm using mainstone/generic config.
> When I try to build gpe-image, I got failed message as below.
> xaw7 package is missing.
> How to fix this issue?


> | checking for XDMCP... yes
> | checking for XdmcpWrap in -lXdmcp... no
> | checking for XSERVERCFLAGS... yes
> | checking for XSERVERLIBS... yes
> | checking if SVR4 needs to be defined... no
> | checking whether to build Xdmx DDX... checking for DMXMODULES... yes
> | yes
> | checking linux/input.h usability... yes
> | checking linux/input.h presence... yes
> | checking for linux/input.h... yes
> | checking linux/keyboard.h usability... yes
> | checking linux/keyboard.h presence... yes
> | checking for linux/keyboard.h... yes
> | checking for XDMXCONFIG_DEP... Package xaw7 was not found in the
> pkg-config search path.
> | Perhaps you should add the directory containing `xaw7.pc'
> | to the PKG_CONFIG_PATH environment variable
> | No package 'xaw7' found
> | configure: error: Package requirements (xaw7 xmu xt xpm x11) were not met:

  So, somehow listed above X11 packages were not build yet (or staged
properly). It's strange, because .bb file lists them as dependences.
Anyway, quick fix would be to try to build them manually (note you'll
need to use OE package names, not shortings in error above).

  Another suggestion if you don't feel like digging what can be wrong
there, is to try some named distro instead of "generic" one, e.g.,
"angstrom-2007.1". Note that it comes with xserver-kdrive, not
full-fledged X.org. Just yesterday I fixed similar error building it
in the described configuration - it was due to "xcalibrateext" being
renamed to "xcalibrateproto". I wonder, if the issue you report is
something similar. Eother way, gpe-image for angstrom-2007.1 was just
rebuilt successfully.

> Thanks for your help.

> Axel




-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



