Received: from [66.216.121.161] (helo=smtp161.sat.emailsrvr.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jpl@xiphos.ca>) id 1LAWrP-0006Yk-QZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Dec 2008 22:44:48 +0100
Received: from relay6.relay.sat.mlsrvr.com (localhost [127.0.0.1])
	by relay6.relay.sat.mlsrvr.com (SMTP Server) with ESMTP id C14521B4D15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Dec 2008 16:40:43 -0500 (EST)
Received: by relay6.relay.sat.mlsrvr.com (Authenticated sender:
	jpl-AT-xiphos.com) with ESMTPSA id 8CD681B4D3A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Dec 2008 16:40:43 -0500 (EST)
From: Joshua Lamorie <jpl@xiphos.ca>
To: openembedded-devel@lists.openembedded.org
Organization: Xiphos Technologies Inc.
Date: Wed, 10 Dec 2008 16:40:43 -0500
Message-Id: <1228945243.8200.16.camel@getafix>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.3 (2.12.3-5.fc8) 
Subject: Building minimal-image with kernel24
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
X-List-Received-Date: Wed, 10 Dec 2008 21:44:48 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Gidday there,

I'm trying to move my development system from buildroot to
openembedded.  

My embedded platform is based on a Virtex-II Pro/Virtex-4 PPC405 and for
various reasons is stuck in linux 2.4.  I've used the xilinx-ml430
machine as an example, and the minimal distro and modified
PREFERRED_PROVIDER_virtual/kernel to refer to a .bb file that I've made
for my 2.4 kernel.

However, when I go to bitbake minimal-image, it keeps trying to build
kernel 2.6.

Are there examples of machines/distros that use 2.4?  How can I tell
where the currently building package was commanded from?  I've tried to
add more debugging, but is there a log somewhere which is insanely
verbose?

Is there a way to build a simple image without the kernel?

Part of the output when I run 'bitbake -v minimal-image' is the
following.

NOTE: checking PREFERRED_PROVIDER_virtual/kernel
NOTE: checking PREFERRED_PROVIDER_linux-rt-2.6.24
NOTE: checking PREFERRED_PROVIDER_linux-rt-2.6.24-r6
NOTE: multiple providers are available for runtime kernel-image (linux,
gumstix-kernel, linux-rt);
NOTE: consider defining a PREFERRED_PROVIDER entry to match runtime
kernel-image

What does this mean define a PREFERRED_PROVIDER entry to match 'runtime
kernel-image'?  What is the 'runtime kernel-image'?

When I run this interactively, (with build minimal-image) and I ask to
display some variables, I get the following:

BB>> getvar PREFERRED_PROVIDER_virtual/kernel
linux-q5-2.4.32.2

That is the kernel that I want.

So, why does it do so much checking?  Where can I see some debug output that says, here
are all the packages I'm going to build?

Thanks in advance for your assistance.

Joshua

p.s. Where is it possible to contribute to the OE manual?

-- 
Xiphos Technologies Inc.
T: 514.847.9474 x 227
F: 514.847.9474

________________________________________________________________________
The information transmitted is intended only for the person or entity to
which it is addressed and may contain confidential and/or privileged
material. If you have received this in error, please contact the sender
and delete this communication and any copy immediately. Thank you.



