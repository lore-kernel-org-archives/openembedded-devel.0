Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1ROtok-0004xb-Hd
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Nov 2011 17:19:02 +0100
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1ROtig-0006Ay-Rs>; Fri, 11 Nov 2011 17:12:46 +0100
Received: from hydra.imp.fu-berlin.de ([160.45.117.149]
	helo=mail.imp.fu-berlin.de) by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1ROtig-0006lU-Pn>; Fri, 11 Nov 2011 17:12:46 +0100
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by mail.imp.fu-berlin.de with esmtps (Exim 4.72) id 1ROtiR-0002Yh-HU
	(envelope-from <heinold@mi.fu-berlin.de>)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Nov 2011 17:12:43 +0100
Received: from heinold by internal andorra.imp.fu-berlin.de with local (Exim
	4.72) id 1ROtiM-0000UE-Dk
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Nov 2011 17:12:26 +0100
Date: Fri, 11 Nov 2011 17:12:26 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111111161226.GA31507@mi.fu-berlin.de>
References: <CAFZPMobAtbxhHfAae1eY6ykB=z=uU36SCn5zsxcWbJMAmrTxVg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFZPMobAtbxhHfAae1eY6ykB=z=uU36SCn5zsxcWbJMAmrTxVg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Remote-IP: 160.45.42.84
X-Spam_Score: -4.1
X-exim-Spam_Score_Int: -40
X-exim-Spam_Bar: ----
X-Spam_Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -1.2 RP_MATCHES_RCVD Envelope sender domain matches handover relay
	domain * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Originating-IP: 160.45.117.149
Subject: Re: trying to compile recent gpsd (one with scons) with OE
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
X-List-Received-Date: Fri, 11 Nov 2011 16:19:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 11, 2011 at 04:14:04PM +0300, Sergey Lapin wrote:
> -L/home/build1/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/sysroots/crux/usr/lib
> -lm -mthumb-interwork -mno-thumb
> --sysroot=/home/build1/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/sysroots/crux
> -o driver_garmin.os -c -O2 -pipe -g -feliminate-unused-debug-types -O2
> -fPIC -I/usr/include/libusb-1.0 driver_garmin.c
           ^^^^^^^^^^^^^^^^^
Host includes used, wonder why gcc do not choke anymore.

> | driver_garmin.c:95:20: fatal error: libusb.h: No such file or directory
> | compilation terminated.
> | scons: *** [driver_garmin.os] Error 1
> | scons: building terminated because of errors.
> | + oefatal 'scons build execution failed.'
> | /home/build1/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/gpsd-git-r18.8/temp/run.do_compile.20570:
> line 104: oefatal: command not found
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
looks like scons class needs to changed, but do not know at the moment how it could be done
or what replaces the oe(msg) commands.

Bye Henning


