Received: from mail-gx0-f228.google.com ([209.85.217.228])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ryan@trolocsis.com>) id 1NzbZM-0006IH-L2
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Apr 2010 22:09:50 +0200
Received: by gxk28 with SMTP id 28so843468gxk.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Apr 2010 13:06:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.70.4 with HTTP; Wed, 7 Apr 2010 13:06:17 -0700 (PDT)
Date: Wed, 7 Apr 2010 15:06:17 -0500
Received: by 10.91.55.17 with SMTP id h17mr2887722agk.57.1270670777187; Wed, 
	07 Apr 2010 13:06:17 -0700 (PDT)
Message-ID: <p2y46a47f951004071306meb244b2ge55fbff26849ccf@mail.gmail.com>
From: Ryan Phillips <ryan@trolocsis.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.228
X-SA-Exim-Mail-From: ryan@trolocsis.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Problem with creating an SDK and host libraries
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
X-List-Received-Date: Wed, 07 Apr 2010 20:09:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

I'm creating a powerpc 405 based meta-toolchain-sdk and the resulting
opkg-cl for x86_64 is linking to OpenSSL within my
$BUILD/tmp/staging/x86_64-linux/usr/lib/lib{ssl,crypto}...

The resulting tar of the toolchain does not include openssl x86_64
binaries at all. Does anyone know why this happening and what a
solution might be?

The goal is to get a toolchain that is standalone or relies on the
host shared libraries. OpenMoko's pre-built toolchain seems to link
correctly, although somehow it isn't including SSL at all in opkg-cl.

Regards,
Ryan Phillips


