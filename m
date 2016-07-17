Return-Path: <sveinse@seldal.com>
X-Greylist: delayed 454 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 17 Jul 2016 12:33:27 UTC
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	by mail.openembedded.org (Postfix) with ESMTP id B126960589
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jul 2016 12:33:27 +0000 (UTC)
Received: from 156.92-221-160.customer.lyse.net ([92.221.160.156]:49320
	helo=[10.5.5.121]) by smtp.domeneshop.no with esmtpsa
	(TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128) (Exim 4.80)
	(envelope-from <sveinse@seldal.com>) id 1bOl8r-0003mx-3f
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jul 2016 14:25:53 +0200
To: openembedded-devel@lists.openembedded.org
From: Svein Seldal <sveinse@seldal.com>
Message-ID: <578B7950.2050800@seldal.com>
Date: Sun, 17 Jul 2016 14:25:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
Subject: Qt5 meta and HostBinaries path
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Jul 2016 12:33:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

I am porting a large Qt5 application to Yocto and are using the meta-qt5 
layer. I have discovered that the qmake conf file, qt.conf, sets most 
Host* fields to the absolute host/sysroot path as expected. However, 
HostBinaries is not; It is set to /usr/bin/qt5, which cause our Qt5 app 
to fail compiling.

My first reaction is that this is clearly a bug, but after sifting 
through the codebase and googling about it, I am not so sure. I see that 
oe adds a new ExternalHostBinaries setting, and that this contains what 
HostBinaries would.

Can someone please explain if this is intentional and why its done like 
this?


Best regards,
Svein Seldal

