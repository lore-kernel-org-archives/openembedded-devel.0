Received: from [216.239.58.189] (helo=gv-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1N7tYN-0003cr-SF
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 17:26:50 +0100
Received: by gv-out-0910.google.com with SMTP id e6so23194gvc.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2009 08:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=sST98bBv0LMPTai7bA2j59VetRLa4GjEMwx0hO6ZcCw=;
	b=Rd+7tauRCPYA+mfqBpEWng/ao0ufGmbf0lJBn/8cLh9a50asx2JuOisnguZKoV7wcg
	eTbap1Io8bWHE8bJZM3meusY6pqZhojvXZvSmzykoPOQSY+d7PSfPC0Z4Rm2paDyjnlK
	xuVVTZWqFtYuEkOE2w1PEP3g0/rMEWIMtmBpA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Uw+t1OMVSZ4rgj3FTjCoRee3V0oR79kml5+yn1dBOLFFP7yzJctGOAQEgq2W8u8lBT
	jA0OqfMq4tlI/vnHFEC75YhEMblc6sCY3jl84opTXehLa8EwMwrEY024ZNjJC6l7Nz6O
	s9MWlB8T6qtW/3jAv8SXJ549mTstz2qLh4Nbs=
MIME-Version: 1.0
Received: by 10.239.160.84 with SMTP id b20mr25341hbd.124.1257870331891; Tue, 
	10 Nov 2009 08:25:31 -0800 (PST)
Date: Tue, 10 Nov 2009 17:25:31 +0100
Message-ID: <c384c5ea0911100825s66f64234s8d1c27b66221faca@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 216.239.58.189
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: addtask menuconfig after do_configure (instead of do_patch)?
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
X-List-Received-Date: Tue, 10 Nov 2009 16:26:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

as seen in another thread I think this change is desired to improve
towards expected behaviour:

classes/kernel.bbclass:

-addtask menuconfig after do_patch
+addtask menuconfig after do_configure

This will make sure the OE default configuration is used as the
default config before going into the menu.

Downside is that menuconfig will probably not work for new kernel
recipes without defconfig.

Regards.
-- 
Leon


