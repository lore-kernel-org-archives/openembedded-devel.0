Received: from [66.111.4.29] (helo=out5.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1HLGVz-00087y-B7
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Feb 2007 11:21:59 +0100
Received: from out1.internal (unknown [10.202.2.149])
	by out1.messagingengine.com (Postfix) with ESMTP id B3C1A1CF96D;
	Sun, 25 Feb 2007 05:21:58 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by out1.internal (MEProxy); Sun, 25 Feb 2007 05:21:58 -0500
X-Sasl-enc: vSRu4hGE6M1YVsj82EpsX7gZFys7AWUbG9ZVjL2ucuzw 1172398918
Received: from [127.0.0.1] (CPE-58-160-130-105.sa.bigpond.net.au
	[58.160.130.105])
	by mail.messagingengine.com (Postfix) with ESMTP id 5EDCE15CA0;
	Sun, 25 Feb 2007 05:21:57 -0500 (EST)
Message-ID: <45E16336.8060205@whitby.id.au>
Date: Sun, 25 Feb 2007 20:51:42 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.9 (Windows/20061207)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <45E15E45.5060800@whitby.id.au>
In-Reply-To: <45E15E45.5060800@whitby.id.au>
Cc: "openmoko-devel@lists.openmoko.org" <openmoko-devel@lists.openmoko.org>
Subject: Re: Should rm_work be moved after do_deploy, or is ${WORKDIR} not available in do_deploy?
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
X-List-Received-Date: Sun, 25 Feb 2007 10:22:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Rod Whitby wrote:
> A question for the OE core team representatives on the list:  Is
> do_deploy prohibited from being able to get at things in ${WORKDIR}, or
> should rm_work happen after do_deploy?

Never mind - it was simply the fact that do_deploy is badly placed in
sjf2410-linux-native.bb, nothing to do with base OE or bitbake
functionality.

Reported as
http://bugzilla.openmoko.org/cgi-bin/bugzilla/show_bug.cgi?id=211
and work-around added to MokoMakefile.

Sorry for the noise.

-- Rod


