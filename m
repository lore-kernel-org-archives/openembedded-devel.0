Received: from [216.68.135.106] (helo=silverton.cliftonlabs.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <blaine@cliftonlabs.com>) id 1KHJ0J-0002nb-Nf
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jul 2008 15:49:43 +0200
Received: from 107.135.68.216.ded-dsl.fuse.net ([216.68.135.107]
	helo=arcadia.cliftonlabs.lan)
	by silverton.cliftonlabs.com with esmtps
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <blaine@cliftonlabs.com>) id 1KHIzz-0005jx-4Y
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jul 2008 09:49:25 -0400
From: Blaine Booher <blaine@cliftonlabs.com>
Organization: Clifton Labs
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Jul 2008 09:49:07 -0400
User-Agent: KMail/1.9.5
References: <48761569.4080304@gmx.net> <1215703284.32070.6.camel@isis>
	<4876A7DD.8090608@palm.com>
In-Reply-To: <4876A7DD.8090608@palm.com>
MIME-Version: 1.0
Message-Id: <200807110949.07500.blaine@cliftonlabs.com>
X-SA-Exim-Connect-IP: 216.68.135.107
X-SA-Exim-Mail-From: blaine@cliftonlabs.com
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	silverton.cliftonlabs.com
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=ALL_TRUSTED,BAYES_00 
	autolearn=ham version=3.1.7-deb
X-SA-Exim-Version: 4.2.1 (built Tue, 09 Jan 2007 17:23:22 +0000)
X-SA-Exim-Scanned: Yes (on silverton.cliftonlabs.com)
Subject: Compiling a custom kernel module
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Fri, 11 Jul 2008 13:49:44 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hey guys,
  I am very new to Open Embedded so please bare with me if I make it too 
obvious :).  We are using a gumstix embedded system with open embedded (and 
the angstrom release that gumstix provides).  We would like to use the kernel 
module cp2101 with a usb device.  The default cp2101 module won't work, since 
we have to edit the USB Device ID in the source code.  I'm having a hard time 
figuring out:
1.  How do I 'enable' the cp2101 module in the kernel?
2.  How do I rebuild the kernel, once the source code is edited?
3.  How to I ensure that the module is part of the final build, so that I can 
do a 'modprove cp2101' on the gumstix and have it load successfully?

I have found a few references, including emails on this email list, but 
nothing that explains it in a clear and concise manner (yet, at least).

Thank you in advance,
Blaine


