Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <k.kooi@student.utwente.nl>) id 1Jcdic-0004KT-W6
	for openembedded-devel@openembedded.org; Fri, 21 Mar 2008 10:39:57 +0100
Received: from [172.20.1.5] (vpn006010.vpn.utwente.nl [130.89.6.10])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	m2L9cneE032164 for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2008 10:38:51 +0100
Message-Id: <F4CE5C74-22A4-4616-BE98-DD104EF609AC@student.utwente.nl>
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@openembedded.org
Mime-Version: 1.0 (Apple Message framework v919.2)
Date: Fri, 21 Mar 2008 10:38:45 +0100
X-Pgp-Agent: GPGMail d51 (Leopard)
X-Mailer: Apple Mail (2.919.2)
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-SA-Exim-Connect-IP: 130.89.2.8
X-SA-Exim-Mail-From: k.kooi@student.utwente.nl
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,BAYES_50,RDNS_NONE
	autolearn=no version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Kernel developers strike again - aka "why wpa is broken" aka "why I have 2 kernels installed"
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
X-List-Received-Date: Fri, 21 Mar 2008 09:40:27 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

In their supreme genius the kernel people have renamed the aes crypto  
module in 2.6.24, which leads to a lot of problems for people using  
feeds. The old modules doesn't get replaced by the new one (different  
name), so task-base will pull in the old aes-module and hence the old  
kernel. It doesn't pull in the new aes module, so your crypto is broken.

A good solution would be for task-base to check the kernel version and  
adjust RRECOMMENDS accordingly.

regards,

KOen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH44IoMkyGM64RGpERArl5AKCi2WRksiNUxt/0OKH160jYUBN+/QCglS+i
e3kERYhrZVPAvM1JDAr/kKw=
=5Vi7
-----END PGP SIGNATURE-----


