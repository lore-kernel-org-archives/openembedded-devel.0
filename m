Received: from [66.111.4.29] (helo=out5.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1HLGBZ-0006Ik-SY
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Feb 2007 11:01:30 +0100
Received: from out1.internal (unknown [10.202.2.149])
	by out1.messagingengine.com (Postfix) with ESMTP id 2D4201D04C0;
	Sun, 25 Feb 2007 05:00:53 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by out1.internal (MEProxy); Sun, 25 Feb 2007 05:00:53 -0500
X-Sasl-enc: SX5VsynFgkqNLv2JHxS9tYezxKitVy3r9dWwgMKEQAuQ 1172397652
Received: from [127.0.0.1] (CPE-58-160-130-105.sa.bigpond.net.au
	[58.160.130.105])
	by mail.messagingengine.com (Postfix) with ESMTP id E70B213EDF;
	Sun, 25 Feb 2007 05:00:51 -0500 (EST)
Message-ID: <45E15E45.5060800@whitby.id.au>
Date: Sun, 25 Feb 2007 20:30:37 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.9 (Windows/20061207)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Cc: "openmoko-devel@lists.openmoko.org" <openmoko-devel@lists.openmoko.org>
Subject: Should rm_work be moved after do_deploy, or is ${WORKDIR} not available in do_deploy?
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
X-List-Received-Date: Sun, 25 Feb 2007 10:02:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

[Follow-ups to openembedded-devel@lists.openembedded.org only, please.]

A question for the OE core team representatives on the list:  Is
do_deploy prohibited from being able to get at things in ${WORKDIR}, or
should rm_work happen after do_deploy?

Details follow:

There is this neat rm_work.bbclass in OpenEmbedded which removes each
individual build/tmp/work/... directory as each package is successfully
built (this saves a *lot* of space, especially with the openmoko svnnow
paradigm which will quickly fill your disk with multiple build copies of
openmoko packages).

Unfortunately (at least with bitbake 1.6 head), rm_work is called before
do_deploy, so the do_deploy() function in OpenMoko's
sjf2410-linux-native.bb fails:

do_deploy() {
        install -d ${DEPLOY_DIR_IMAGE}
        install -m 0755 sjf2410 ${DEPLOY_DIR_IMAGE}/sjf2410
}

The sjf2410 executable no longer exists at that point, cause rm_work has
deleted it.

Should rm_work be moved to after do_deploy, or should
sjf2410-linux-native.bb (and all other packages that assume that the
contents of ${WORKDIR} are still available in do_deploy) be fixed?

(For example, the same problem occurs in ixp4xx-kernel ...)

-- Rod


