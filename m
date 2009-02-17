Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LZP46-0004Xt-9K
	for openembedded-devel@openembedded.org; Tue, 17 Feb 2009 13:28:42 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LZP2A-0001B0-TG
	for openembedded-devel@openembedded.org; Tue, 17 Feb 2009 12:26:42 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 17 Feb 2009 12:26:42 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 17 Feb 2009 12:26:42 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 17 Feb 2009 13:26:34 +0100
Message-ID: <gneadq$s6g$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090209 Shredder/3.0b2pre
Sender: news <news@ger.gmane.org>
Subject: [RFC] removing DISTRO_* vars from task-boot
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
X-List-Received-Date: Tue, 17 Feb 2009 12:28:43 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Lately I have been wondering how to change the /dev manager on a per 
image base, since I want udev for most images and busybox-mdev for 
special-purpose stuff. The catch is that I want to keep using task-boot 
for both.

Currently we have:

DISTRO_DEV_MANAGER ?= "${@base_contains("MACHINE_FEATURES", "kernel26", 
  "udev","",d)} "
DISTRO_INIT_MANAGER ?= "sysvinit sysvinit-pidof"
DISTRO_INITSCRIPTS ?= "initscripts"
DISTRO_LOGIN_MANAGER ?= "tinylogin"

in task-boot.bb

There are various ways we could attack this:

1) The image.bbclass way:

   Put the following in image.bbclass:

   IMAGE_DEV_MANAGER ?= "${@base_contains("MACHINE_FEATURES", 
"kernel26",  "udev","",d)} "
   IMAGE_INIT_MANAGER ?= "sysvinit sysvinit-pidof"
   IMAGE_INITSCRIPTS ?= "initscripts"
   IMAGE_LOGIN_MANAGER ?= "tinylogin"

   Pros:
   * Takes immediate effect
   * Can have distro defaults, overridable per image

   Cons:
   * marks them as 'user installed'
   * you can't 'debootstrap' from tasks anymore, you need to encode 
knowledge about the above vars into the debootstrap script

2) Make task-boot nostamp

   Pros:
   * takes effect on image build time
   * Can have distro defaults, overridable per image

   Cons:
   * QA hell, there's no way to tell what's inside task-boot_1.0-r87.ipk 
from the outside

3) Have task-boot.bb create task-boot-mdev and task-boot-udev

   Pros:
   * clean
   * solves my immediate need

   Cons:
   * doesn't scale for other vars

4) Move the vars to RRECOMMENDS and filter them out with BAD_RECOMMENDATIONS

   Pros:
   * takes effect on image time
   * performs as expected

   Cons:
   * image build succeeds when no /dev manager is present

What are your opinions on all this?

regards,

Koen




