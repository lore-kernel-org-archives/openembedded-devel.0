Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PIj9y-0000sV-AP
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 15:38:55 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 6A21C314ACBD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 15:37:50 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Vk7JdjynwqHk
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 15:37:44 +0100 (CET)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 7BBFD3147E43
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 15:37:44 +0100 (CET)
Message-ID: <4CE3E8B8.3060505@opendreambox.org>
Date: Wed, 17 Nov 2010 15:37:44 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.12) Gecko/20101027 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: versions in RDEPENDS etc.
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
X-List-Received-Date: Wed, 17 Nov 2010 14:38:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi all,

looking for examples in Git, I found the following entries using
"(<$version)":

> $ git grep -E '^(RDEPENDS|RPROVIDES|RRECOMMENDS|RSUGGESTS|RREPLACES|RCONFLICTS)'  | grep '<'
> recipes/networkmanager/netm-cli_0.2.bb:RDEPENDS_${PN} = "python-dbus python-pygobject python-textutils networkmanager (>=0.6) networkmanager (<0.7)"
> recipes/wireshark/wireshark_1.2.6.bb:RCONFLICTS_${PN}-tshark = "tshark wireshark (<1.0.5)"
> recipes/wireshark/wireshark_1.2.6.bb:RREPLACES_${PN}-tshark = "tshark wireshark (<1.0.5)"
> recipes/wireshark/wireshark_1.2.6.bb:RCONFLICTS_${PN}-wireshark = "tshark wireshark (<1.0.5)"
> recipes/wireshark/wireshark_1.2.6.bb:RREPLACES_${PN}-wireshark = "tshark wireshark (<1.0.5)"
> recipes/wireshark/wireshark_1.2.6.bb:RCONFLICTS_${PN} = "tshark wireshark (<1.0.5)"
> recipes/wireshark/wireshark_1.2.6.bb:RREPLACES_${PN} = "tshark wireshark (<1.0.5)"

From what I've read, the control file format of opkg should match the
control file format of debian packages. Also, it looks like the
variables grepped for above are written unmodifed to control files.

The Debian Policy Manual [1] states: "The relations allowed are <<, <=,
=, >= and >> for strictly earlier, earlier or equal, exactly equal,
later or equal and strictly later, respectively. The deprecated forms <
and > were used to mean earlier/later or equal, rather than strictly
earlier/later, so they should not appear in new packages (though dpkg
still supports them)."

Also: "For consistency and in case of future changes to dpkg it is
recommended that a single space be used after a version relationship and
before a version number;"

Should the recipes be updated accordingly? Would such changes require PR
bumps?

Regards,
Andreas

[1] http://www.debian.org/doc/debian-policy/ch-relationships.html


