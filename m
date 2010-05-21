Received: from mail-yw0-f188.google.com ([209.85.211.188])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OFPO4-0007KF-Hq
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 May 2010 12:23:29 +0200
Received: by ywh26 with SMTP id 26so413019ywh.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 May 2010 03:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=bxPHQX4Nw3ygFzgJY7owRji3lxHvIK3Jc9JEJeLqF3A=;
	b=iBMD+9083Yoa5YGGQhmv8V0wHX8rIalRQPkLQu7eol1IAydpracmqUhgfVrE2Fhhdl
	OVYvsbMvxO3qnr1x0c6D9e81WAu55gnvKvE/CDZ7qw09MQisArLs64QUclcr9vdC0lTn
	Hy3spub8jlf2LUYr1FSPZ4C79l6O6EH5X6Bc0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=f6ZviV1oIIBmlNo7IUm5z8QSQF6s1yEJQObWisBhFN/dDgiPG7p/vX0Nvddz5Dmkkb
	yf8QFrYuVxfKvf9Q/ZlSNpJfxMOS3AZNTfPcTWXa6ZXqk6ZNSx0HwFv7kO16UdrXwA+Z
	W80nBirrUKhwgfzASvsSggKMoSNH2xuETnbBg=
MIME-Version: 1.0
Received: by 10.100.246.26 with SMTP id t26mr1907570anh.112.1274437164895; 
	Fri, 21 May 2010 03:19:24 -0700 (PDT)
Received: by 10.100.132.11 with HTTP; Fri, 21 May 2010 03:19:24 -0700 (PDT)
Date: Fri, 21 May 2010 12:19:24 +0200
Message-ID: <AANLkTilSGknB7dURJ4q_WCu1dVwP88KtkQ-lORJNPNua@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.188
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] linux-kexecboot: remove unused versions asap
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
X-List-Received-Date: Fri, 21 May 2010 10:23:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I'd like to merge the linux-kexecboot recipes in /linux soon.
Kernel 2.6.34 has been released, so before I propose to add this last
one and remove older unused versions.

For Zaurus unfortunately we'll have to keep around 2.6.24 and 2.6.26
for a while.
I ignore the status for omap and linux-hh machines: do these work with
2.6.34? Can we remove older kernels?
About qemu in COMPATIBLE_MACHINE: does qemu survive to kexec?

Please help cleaning COMPATIBLE_MACHINE and DEFAULT_PREFERENCE for your machine.

Thanks

Andrea


