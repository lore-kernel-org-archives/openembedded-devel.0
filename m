Received: from [67.121.157.153] (helo=integratus.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <andy@protium.com>) id 1J32Qb-00080q-Tq
	for Openembedded-devel@openembedded.org; Fri, 14 Dec 2007 05:45:38 +0100
Received: (qmail 12944 invoked from network); 14 Dec 2007 04:41:07 -0000
Received: from pool-71-116-93-90.snfcca.dsl-w.verizon.net (HELO
	?192.168.1.200?) (andy@71.116.93.90)
	by cuba.integratus.com with ESMTPA; 14 Dec 2007 04:41:07 -0000
Message-ID: <4762095D.4060505@protium.com>
Date: Thu, 13 Dec 2007 20:41:01 -0800
From: Andy Wilcox <andy@protium.com>
User-Agent: Thunderbird 2.0.0.6 (X11/20070728)
MIME-Version: 1.0
To: Openembedded-devel@lists.openembedded.org
Subject: RFC: Renaming uboot-utils
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Dec 2007 04:45:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Since uboot-utils builds a native binary (mkImage) it should really be 
called
uboot-utils-native.

My motivation is (a) I'd really like to build a few tools from uboot
which are cross-compiled (notably, fw-setenv/printenv, which allow R/W
access to the u-boot configuration space), and (b) it's the "right"
thing to do (-;

The following files would be updated:

./conf/distro/foonas.conf
./conf/distro/include/angstrom-2007-preferred-versions.inc
./packages/linux/em-x270_2.6.23.bb
./packages/linux/linux-bd-neon-2.6_2.6.22.bb
./packages/linux/linux-gumstix_2.6.15.bb
./packages/linux/linux-omap.inc
./packages/linux/linux-storcenter_2.6.12.6.bb
./packages/linux/linux-turbostation_2.6.20.2.bb
./packages/tasks/task-base.bb

Any objection or comment?

Thanks!
Andy



