Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1QjT1M-0005fH-Vz
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jul 2011 11:24:50 +0200
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1QjSiC-0001Ws-Aa>; Wed, 20 Jul 2011 11:05:00 +0200
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1QjSiC-0002YM-8L>; Wed, 20 Jul 2011 11:05:00 +0200
Received: from heinold by internal andorra.imp.fu-berlin.de with local (Exim
	4.72) id 1QjSiC-0001Gf-5l
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2011 11:05:00 +0200
Date: Wed, 20 Jul 2011 11:05:00 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110720090459.GA3173@mi.fu-berlin.de>
References: <ED3E0BCACD909541BA94A34C4A164D4C06CA55@post.tritech.se>
	<ED3E0BCACD909541BA94A34C4A164D4C06CA7F@post.tritech.se>
	<09D9BE2AC4AA764DABAA8C91E48D819E0157569991@DEMCHP99E35MSX.ww902.siemens.net>
MIME-Version: 1.0
In-Reply-To: <09D9BE2AC4AA764DABAA8C91E48D819E0157569991@DEMCHP99E35MSX.ww902.siemens.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Subject: Re: Added header file to linux kernel - how to export
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
X-List-Received-Date: Wed, 20 Jul 2011 09:24:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 19, 2011 at 08:14:14PM +0200, Aeschbacher, Fabrice wrote:
> Hi,
> 
> Your could put something like this:
> 
> do_stage_append() {
> 	cp ${S}/my_ioctl.h ${STAGING_KERNEL_DIR}/include/linux
> }
> 
> in your recipes/linux<xxx>.bb
> 
> With kind regards,
>    Fabrice

Hi,

do_stage shouldn't be used anymore. Do it via do_install method.


Bye Henning


