Received: from [66.111.4.29] (helo=out5.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1HW6ho-0002f6-5P
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Mar 2007 10:07:00 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id 270D620D64A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Mar 2007 04:07:00 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute2.internal (MEProxy); Tue, 27 Mar 2007 04:07:00 -0400
X-Sasl-enc: RjudNB+pEarlb7wateW+qWvFCdDuVAp9B+9pLQpRnpIH 1174982819
Received: from [127.0.0.1] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTP id 8A53E1A09C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Mar 2007 04:06:59 -0400 (EDT)
Message-ID: <4608D065.3060205@whitby.id.au>
Date: Tue, 27 Mar 2007 17:35:57 +0930
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.10 (Windows/20070221)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.94.0.0
Subject: Alternatives handling for cpio (cpio vs busybox)
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
X-List-Received-Date: Tue, 27 Mar 2007 08:07:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I have a need for the *real* cpio to override the busybox cpio.  This is
normal practice in OE, and well understood.

The problem, however, is that busybox puts cpio in /bin, whereas the
cpio package puts cpio in /usr/bin.  This makes it hard for
update-alternatives to work.

I propose to change the cpio package such that it installs cpio in /bin
instead of /usr/bin, and then uses update-alternatives to select it
ahead of busybox.

Any objections?

-- Rod


