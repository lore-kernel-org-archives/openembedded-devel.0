Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rod@whitby.id.au>) id 1IwyRF-0007Jm-QA
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2007 12:17:13 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id F2B8857B0F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2007 06:14:23 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Tue, 27 Nov 2007 06:14:23 -0500
X-Sasl-enc: oo+HVRgRZRa2pzq/Bo34njhs76lLfXUrtLw6LLoSzn6h 1196162063
Received: from [192.168.18.13] (CPE-121-209-18-182.sa.bigpond.net.au
	[121.209.18.182])
	by mail.messagingengine.com (Postfix) with ESMTP id 195C8310
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2007 06:14:22 -0500 (EST)
Message-ID: <474BFBF6.2000602@whitby.id.au>
Date: Tue, 27 Nov 2007 21:43:58 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: Openembedded Developers <openembedded-devel@lists.openembedded.org>
Subject: RFC: Adding endian support to linux.inc
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
X-List-Received-Date: Tue, 27 Nov 2007 11:17:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I wish to propose the following patch to linux.inc to enable automatic
support for setting the endian configuration value for those CPUs that
can run in both big and little endian modes.

This is the first step in rationalisation of ixp4xx-kernel.inc to more
closely match the other kernel recipes in OE.

Note that SITEINFO_ENDIANESS is set automatically by siteinfo.class for
all OE MACHINE settings, not just when MACHINE is ixp4xx.

Also note that there is no '=' sign near the end of the line added to
the call to sed.  This is intentional, to remove both commented and
uncommented settings of CPU_BIG_ENDIAN in the original defconfig.

--- packages/linux/linux.inc    14e3b9590c6a3ef9334959ab19c1b24b1954b55b
+++ packages/linux/linux.inc    12ee7627f507a1eb127802f7268674f901a357fc
@@ -41,11 +41,19 @@ do_configure_prepend() {
                 echo "# CONFIG_OABI_COMPAT is not set"  >> ${S}/.config
         fi

+       #
+       # endian support
+       #
+        if [ "${SITEINFO_ENDIANESS}" = "be" ]; then
+                echo "CONFIG_CPU_BIG_ENDIAN=y"          >> ${S}/.config
+        fi
+
         echo "CONFIG_CMDLINE=\"${CMDLINE}\"" >> ${S}/.config

         sed -e '/CONFIG_AEABI/d' \
             -e '/CONFIG_OABI_COMPAT=/d' \
             -e '/CONFIG_CMDLINE=/d' \
+            -e '/CONFIG_CPU_BIG_ENDIAN/d' \
             -e '/CONFIG_LOGO=/d' \
             -e '/CONFIG_LOGO_LINUX_CLUT224=/d' \
             < '${WORKDIR}/defconfig' >>'${S}/.config'

Silence will be taken as acceptance, and if there are no objections this
change will be committed sometime this coming weekend.

-- Rod


