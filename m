Received: from [64.233.182.189] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J2DDf-0003dM-PE
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Dec 2007 23:04:51 +0100
Received: by nf-out-0910.google.com with SMTP id h3so1249818nfh
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Dec 2007 14:00:36 -0800 (PST)
Received: by 10.86.84.5 with SMTP id h5mr7151648fgb.1197410436404;
	Tue, 11 Dec 2007 14:00:36 -0800 (PST)
Received: from ?192.168.61.156? ( [194.79.8.34])
	by mx.google.com with ESMTPS id y18sm7267772fkd.2007.12.11.14.00.35
	(version=SSLv3 cipher=OTHER); Tue, 11 Dec 2007 14:00:36 -0800 (PST)
Date: Wed, 12 Dec 2007 00:04:16 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <1617210780.20071212000416@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
Cc: angstrom-distro-devel@linuxtogo.org
Subject: [RFC] Using ${PR} instead of ${DATETIME} in deployed kernel image filename
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
X-List-Received-Date: Tue, 11 Dec 2007 22:04:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello openembedded-devel,

  I already mentioned this in
http://lists.linuxtogo.org/pipermail/openembedded-devel/2007-December/003695.html , here's specific RFC:
I'd like to propose using the following filename pattern for deployed
kernel images: "${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}", instead
of "${KERNEL_IMAGETYPE}-${PV}-${MACHINE}-${DATETIME}". This will
ensure that kernels built from the same recipe are named consistently,
and thus will allow users and developers track kernels easier. Also,
any change to build configuration should be accompanied by recipe PR
bump, so new kernel file will be produces.

  So:

1. Does anybody see something grossly wrong with this scheme?
2. Otherwise, I'm going to change this for linux-handhelds-2.6, and
would like to encourage maintainers of the other kernel recipes to do
the same.


-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com



