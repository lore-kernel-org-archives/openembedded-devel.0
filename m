Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id DA85860065
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jul 2014 11:51:55 +0000 (UTC)
Received: from [99.240.204.5] (port=53692 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1X5vqO-0002kq-4J for openembedded-devel@lists.openembedded.org;
	Sat, 12 Jul 2014 07:51:56 -0400
Date: Sat, 12 Jul 2014 07:51:53 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1407120746570.23730@localhost>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: scripts/runqemu-internal adds "-no-reboot" QEMU options redundantly
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 12 Jul 2014 11:51:56 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  more obsessive pedantry, but when i do "runqemu qemuarm" (or other
arches), i notice that the eventual lengthy "qemu-system-arm" command
run has the option "-no-reboot" in it twice. that's because, in
scripts/runqemu-internal, numerous individual architectures add that
option to the variable QEMUOPTIONS while, at the bottom of that
script, one reads:

echo "Running $QEMU..."
# -no-reboot is a mandatory option - see bug #100
if [ "$FSTYPE" = "vmdk" ]; then
    echo $QEMUBIN $VM $QEMUOPTIONS $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT
    ... snip ...

wherein everyone ends up including that option a second time.

  doesn't hurt, of course, but it makes reading that script more
confusing than it has to be.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

