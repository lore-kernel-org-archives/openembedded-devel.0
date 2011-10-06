Received: from [178.16.156.2] (helo=office.altell.ru)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <khimov@altell.ru>) id 1RBj7h-0001GW-Jc
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Oct 2011 10:16:09 +0200
Received: from sencha.localnet (unknown [192.168.0.147])
	by mail.altell.local (Postfix) with ESMTPS id E308E53F9
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Oct 2011 12:04:23 +0400 (MSD)
From: Roman Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Thu, 6 Oct 2011 12:04:23 +0400
User-Agent: KMail/1.13.6 (Linux/2.6.37.6-0.7-desktop; KDE/4.6.0; x86_64; ; )
References: <1317871145-10848-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1317871145-10848-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Message-Id: <201110061204.23576.khimov@altell.ru>
X-Altell-MailScanner-ID: E308E53F9.B8B50
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-Spam-Status: No
Subject: Re: [meta-oe][PATCH] openssl: Fix build with gold linker
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
X-List-Received-Date: Thu, 06 Oct 2011 08:16:09 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

> There was a missing version script for one of
> the apps that was being flagged by gold. So we
> add appropriate openssl.ld for engines/ccgost
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Fixes real problem, same as
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=631503

Acked-by: Roman Khimov <khimov@altell.ru>


