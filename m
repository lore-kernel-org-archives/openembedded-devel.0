Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1OUQZs-00081e-Rr
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 22:41:45 +0200
Received: by gwj18 with SMTP id 18so1441115gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jul 2010 13:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer;
	bh=LFePGlyhDvsVpIz5fRfpdsEZKlU5uVRFzk8QqPfHLQU=;
	b=bi3tnI1IyL507HhncbuiHSMo/5sAkEg+yQqTy44dgk3d0hNtSFDj/3H2la3RimS3hQ
	8L01XNHim999w0esz0w2wPQaEZJtnxCzrZv+8NeYvMzjVvykHL6eaQvJIdxmBhUTtdAQ
	Ed36RjRupNAKYaH+xuUAwk70vTkTnjNxtR3Ks=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=Bd0uA2pP+WbIol1rCJC8B7g4Ew9EdYoWjVuNVVL+vHd/L1mweKTDW2c/YT+xQCt2Ac
	kzn4MEkvEnQtxoU9t8ptYuBwZ5jg5thtTt3z6R4FFAKGBiLWNr1D/INszIR0PK77PHKK
	Ftih0bT3qXehAqug5+BchzlU4M3lmsO8oPGo8=
Received: by 10.90.70.11 with SMTP id s11mr38678aga.182.1278016618797;
	Thu, 01 Jul 2010 13:36:58 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id v7sm135299ybe.6.2010.07.01.13.36.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 01 Jul 2010 13:36:58 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Jul 2010 15:30:24 -0500
Message-Id: <1278016225-11067-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.6.0.4
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: sourceipk.bbclass patch submission
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
X-List-Received-Date: Thu, 01 Jul 2010 20:41:45 -0000


All,

This e-mail is to describe the purpose of the patch that will
follow which adds a sourceipk.bbclass file to the classes
directory.  The purpose of the sourceipk class is to allow
recipe authors and openembedded users to create a simple
ipk package that contains the patched sources and recipe
used to create the binary ipks.  This source ipk does NOT
build the binary ipks itself, that is still done using
bitbake and openembedded.

The purpose is to allow the sources to be placed in a
feed along with the binaries and installed on either the
target system for native building or the host system for
reference on manual cross compilation if desired.

This can also be used by installers that will install/create
custom images and their corresponding sources based on user
selection.

Please consider the patch that follows for inclusion.  I would
also like to take this time to thank Koen and Denys for their
input and feedback on this code.

Sincerely,
Chase Maupin


