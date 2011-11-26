Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RUCy7-0000KO-Kp for openembedded-devel@lists.openembedded.org;
	Sat, 26 Nov 2011 08:46:39 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RUCrl-0007JC-Ud for openembedded-devel@lists.openembedded.org;
	Sat, 26 Nov 2011 08:40:06 +0100
Received: from dynamicip-95-79-237-69.pppoe.nn.ertelecom.ru
	([dynamicip-95-79-237-69.pppoe.nn.ertelecom.ru])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Nov 2011 08:40:05 +0100
Received: from mordenhil by dynamicip-95-79-237-69.pppoe.nn.ertelecom.ru with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Nov 2011 08:40:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Evgeniy Markov <mordenhil@yandex.ru>
Date: Sat, 26 Nov 2011 07:38:12 +0000 (UTC)
Message-ID: <loom.20111126T081859-131@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 95.79.237.69 (Opera/9.80 (X11; Linux i686; U;
	en) Presto/2.10.229 Version/11.60)
Subject: Build xfce46-image crash
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
X-List-Received-Date: Sat, 26 Nov 2011 07:46:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello!

I have a problem with building 'xfce46-image'. Building crashes on stage 'do-
rootfs'. Log shows that this is due to an dependencies error for 'task-xfce46-
base' - this task can't satisfy the dependencies from 'hicolor-icon-theme'. 
Description of this dependence looks strange.
Here is a part of the log:

Collected errors:
 * satisfy_dependencies_for: Cannot satisfy the following dependencies for task-
xfce46-base:
 * 	hicolor-icon-themehicolor-icon-themehicolor-icon-themehicolor-icon-
themehicolor-icon-theme * 	hicolor-icon-themehicolor-icon-themehicolor-
icon-themehicolor-icon-themehicolor-icon-theme * 	hicolor-icon-
themehicolor-icon-themehicolor-icon-themehicolor-icon-themehicolor-icon-theme 
* 	hicolor-icon-themehicolor-icon-themehicolor-icon-themehicolor-icon-
themehicolor-icon-theme * 	hicolor-icon-themehicolor-icon-themehicolor-
icon-themehicolor-icon-themehicolor-icon-theme * 	hicolor-icon-
themehicolor-icon-themehicolor-icon-themehicolor-icon-themehicolor-icon-theme 
* 	hicolor-icon-themehicolor-icon-themehicolor-icon-themehicolor-icon-
themehicolor-icon-theme * 	hicolor-icon-themehicolor-icon-themehicolor-
icon-themehicolor-icon-themehicolor-icon-theme * 	hicolor-icon-
themehicolor-icon-themehicolor-icon-themehicolor-icon-themehicolor-icon-theme 
* 	hicolor-icon-themehicolor-icon-themehicolor-icon-themehicolor-icon-
themehicolor-icon-theme * 	hicolor-icon-themehicolor-icon-themehicolor-
icon-themehicolor-icon-themehicolor-icon-theme * 
 * opkg_install_cmd: Cannot install package task-xfce46-base.
 * opkg_install_cmd: Cannot install package qt4-tools-sdk.
 * resolve_conffiles: Existing conffile /home/evmarkov/angstrom-setup-scripts/
build/tmp-angstrom_2008_1/rootfs/my-xfce46-image/etc/device_table is different 
from the conffile in the new package. The new conffile will be placed at /home/
evmarkov/angstrom-setup-scripts/build/tmp-angstrom_2008_1/rootfs/my-xfce46-
image/etc/device_table-opkg.

I've seen reports of the same error, but there wasn't the solution.
I would be glad if someone could explain to me how can I fix this problem.

Regards,

Evgeniy



