Received: from [82.195.155.133] (helo=mail.techworks.ie)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cgagneraud@techworks.ie>) id 1Mfxcm-0000Lm-KZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Aug 2009 17:07:55 +0200
Received: from archeopterix.techworks.local (unknown [86.43.120.173])
	by mail.techworks.ie (Postfix) with ESMTP id A9C053AB65
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2009 15:50:01 +0100 (IST)
Message-ID: <4A93FA79.80706@techworks.ie>
Date: Tue, 25 Aug 2009 15:51:37 +0100
From: Christian Gagneraud <cgagneraud@techworks.ie>
User-Agent: Thunderbird 2.0.0.21 (X11/20090320)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A8E3AA6.10609@dresearch.de>	<200908211344.53306.holger+oe@freyther.de>	<4A92AB1F.3060404@dresearch.de>	<200908250403.12093.holger+oe@freyther.de>
	<4A93C0BB.50206@dresearch.de>
In-Reply-To: <4A93C0BB.50206@dresearch.de>
Subject: Re: Variable reference (was: Documentation update about	machine conf files)
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
X-List-Received-Date: Tue, 25 Aug 2009 15:08:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Steffen Sledz wrote:
> Holger Hans Peter Freyther wrote:
>>> It's a good starting point. But it has one drawback: It allows a short one
>>> liner docu only. Often it would be great to have some more info, e.g. a
>>> list of supported image file system types for IMAGE_FSTYPES.
>> Why do you think so?
> 
> When i had a look into conf/documentation.conf it occurred to me
> that the documentation field may only be a simple string. It seems not
> to be possible to use e.g. tables or lists there. Sorry, if i'm wrong
> here.

Hi,

Actually i was thinking as well to have a document presented as a 
matrix that will show quickly when and where this variables are 
intended to be used or not, ie:

For each variable, there could be a:
- one line documentation
- default value
- Used by (see below)
- Used in (see below)

For "Used by" and "Used in", it could be nice to specify yes, no or 
maybe (with default to no) for the following:
   - bitbake itself
   - <file>.bbclass
   - <package>.bb
   - <meta>.bb
   - <image>.bb
   - bitbake.conf
   - <distro>.conf
   - <machine>.conf
   - local.conf
   - any other interesting things...

For the difference between used by and used in, here is an example:
CMDLINE is used in <machine>.conf or local.conf, and is used by linux.inc

I'm not (yet) familiar with bitbake and bbclass, but I guess that it 
is possible to extract all these information and generate say an xml 
file that can be in turn transformed into anything people like.


By greping/seding into all the bb, bbclass, inc and conf file, one (I) 
can set-up a list of all variable currently in use in OE, post it here 
on oedev mailing list and then people can help to sort out which ones 
are worth documenting.

Currently greping is the way I am doing to learn OE (as well as 
reading documentation and ML archive of course! ;)), but I found it a 
bit painful...

Here is an example of what i did recently to find out what variables 
was used in the various machine config file and who was using them:
$ sed -ne 's,^[[:blank:]]*\([[:alnum:]_/]\+[[:blank:]]\)=.*$,\1,gp' 
conf/machine/*.conf |sort|uniq > var-used-in-machine
$ cat var-used-in-machine
BASE_PACKAGE_ARCH
BOOTSTRAP_EXTRA_RDEPENDS
ERASEBLOCK_SIZE
EXTRA_IMAGECMD
EXTRA_IMAGECMD_h1910_jffs2
EXTRA_IMAGECMD_jffs2
[...]
module_autoload_pxa27x_udc
module_conf_acx
module_conf_g_ether
udevdir
$ for v in $(cat var-used-in-machine); do echo " * $v:"; grep -l $v 
classes/* recipes/*/*; done > var-used-in-machine-are-used-by
$ cat var-used-in-machine-are-used-by
[...]
  * PCMCIA_MANAGER:
packages/tasks/task-base.bb
[...]
  * TARGET_PREFIX:
classes/base.bbclass
classes/icecc.bbclass
classes/kernel.bbclass
classes/module-base.bbclass
classes/native.bbclass
classes/srec.bbclass
[...]

This is far from perfect and can be improved. It doesn't take into 
account overrides and virtual for example, as well in that case I made 
the assumption that the vars are used in <machine>.conf and are used 
by recipes/* which is not really true... Anyway this gave me a first 
hint at where to look at.

Regards,
Chris

> 
> Steffen
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



