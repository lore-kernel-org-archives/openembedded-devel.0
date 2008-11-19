Received: from [212.204.227.171] (helo=mail.3v8.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sander@3v8.net>) id 1L2pWb-000248-Di
	for openembedded-devel@openembedded.org; Wed, 19 Nov 2008 17:03:29 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.3v8.net (Postfix) with ESMTP id 8F170BFE72
	for <openembedded-devel@openembedded.org>;
	Wed, 19 Nov 2008 17:00:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at 3v8.net
Received: from mail.3v8.net ([127.0.0.1])
	by localhost (pillbox.3v8.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vykAQ0GwPFSo for <openembedded-devel@openembedded.org>;
	Wed, 19 Nov 2008 17:00:32 +0100 (CET)
Received: from skunk.localnet (195-240-237-161.ip.telfort.nl [195.240.237.161])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.3v8.net (Postfix) with ESMTP id 6B632BE763
	for <openembedded-devel@openembedded.org>;
	Wed, 19 Nov 2008 17:00:32 +0100 (CET)
From: Sander van Grieken <sander@3v8.net>
To: openembedded-devel@openembedded.org
Date: Wed, 19 Nov 2008 17:00:56 +0100
User-Agent: KMail/1.10.3 (Linux/2.6.27-7-generic; KDE/4.1.3; i686; ; )
MIME-Version: 1.0
Message-Id: <200811191700.57645.sander@3v8.net>
Subject: [FSO] illume fails to start
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
X-List-Received-Date: Wed, 19 Nov 2008 16:03:29 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

Yesterday, after building the latest org.openembedded.dev and upgrading my 
GTA02, illume/e does not start anymore.

I get this: 

ESTART: 0.93536 [0.61815] - test file format support
<<<< Enlightenment Error >>>>
Enlightenment found Evas can't load PNG files. Check Evas has PNG
loader support.

stracing releaved that it is looking for test.png (and jpg, and eet) in 
/usr/share/enlightenment/data/images, but these files do not exist.

The relevant loader plugins are installed.

Also, the upgrade complained about same-file conflicts between illume and e-
wm. The problem above manifests regardless of a -force-overwrite upgrade.

grtz,
Sander



