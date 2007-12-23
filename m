Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rod@whitby.id.au>) id 1J6Xzt-0000pC-Lx
	for openembedded-devel@openembedded.org; Sun, 23 Dec 2007 22:04:33 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 92BF781F8C
	for <openembedded-devel@openembedded.org>;
	Sun, 23 Dec 2007 15:59:07 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Sun, 23 Dec 2007 15:59:07 -0500
X-Sasl-enc: TgMVXV1nLDPPis5OjAaXxPFmto+0z3IlLwMtvhJNBgAa 1198443547
Received: from [192.168.18.11] (CPE-121-209-21-249.sa.bigpond.net.au
	[121.209.21.249])
	by mail.messagingengine.com (Postfix) with ESMTP id D2BA4F7EE
	for <openembedded-devel@openembedded.org>;
	Sun, 23 Dec 2007 15:59:06 -0500 (EST)
Message-ID: <476ECBD0.8030907@whitby.id.au>
Date: Mon, 24 Dec 2007 07:27:52 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <E1J6Pwj-0006Mu-Pq@linuxtogo.org>
	<476E77E7.2080705@student.utwente.nl>
In-Reply-To: <476E77E7.2080705@student.utwente.nl>
X-Enigmail-Version: 0.95.5
Subject: Re: [oe-commits] org.oe.dev nas-server: New task, meta-package, and image for creating a network attached storage server.
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
X-List-Received-Date: Sun, 23 Dec 2007 21:04:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> rwhitby commit schreef:
>> nas-server: New task, meta-package, and image for creating a network attached storage server.
> 
>> +IMAGE_INSTALL = "task-boot task-base-apex \
>> +            ${DISTRO_SSH_DAEMON} \
>> +            ${DISTRO_PACKAGE_MANAGER} \
>> +            task-base-usbhost task-base-ext2 \
>> +            ${IMAGE_INSTALL_TASKS} \
> 
> This suffers from bug #3499 like base-image did before Marcin fixed it.
> Could you have a look at
> http://monotone.openembedded.org/revision/info/4a084d17d8150e500fccc6f78c116ab863359656
> and alter bas-server-image and your image templates accordingly?

Fixed.  Thanks for picking this up, Koen.  I had nas-server-image
sitting uncomitted locally since before I did base-image.

-- Rod


