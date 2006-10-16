Received: from [64.233.182.187] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1GZU3P-0004K0-H5
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Oct 2006 17:06:59 +0200
Received: by nf-out-0910.google.com with SMTP id l23so2511463nfc
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2006 08:00:13 -0700 (PDT)
Received: by 10.49.19.18 with SMTP id w18mr12329197nfi;
	Mon, 16 Oct 2006 08:00:11 -0700 (PDT)
Received: from CUBE ( [85.202.124.214])
	by mx.google.com with ESMTP id b1sm984285nfe.2006.10.16.08.00.04;
	Mon, 16 Oct 2006 08:00:06 -0700 (PDT)
Date: Mon, 16 Oct 2006 18:00:05 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1810005940.20061016180005@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: [RFC] Annotate machines with amount of RAM
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Oct 2006 15:07:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello openembedded-devel,

  Another small RFC from me. We already have ROOT_FLASH_SIZE variable
for machines, which specifies builtin flash size. Distros may use it to
decide what to put into rootfs, check its size, etc.

  I'd like to propose to add setting like RAM_SIZE which would list
available RAM. Generally, that would be in line with more comprehensive
declaritive machine descriptions we move towards with introduction of
MACHINE_FEATURES. Clever distro could use RAM_SIZE to select
alternative packages/settings. For example, if we ever come to
Firefox/Minimo being default browser for distros, RAM_SIZE="32"
machines may still prefer something smaller.


-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com



