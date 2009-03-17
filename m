Received: from [130.149.7.33] (helo=mail.tu-berlin.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <torsten.sadowski@tu-berlin.de>) id 1LjZ6i-0005td-1m
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Mar 2009 14:13:27 +0100
X-tubIT-Incoming-IP: 130.149.75.153
Received: from kapitaen.kup.tu-berlin.de ([130.149.75.153]
	helo=kapitaen.localnet)
	by mail.tu-berlin.de (exim-4.69/mailfrontend-a) with esmtpa 
	for <openembedded-devel@lists.openembedded.org>
	id 1LjZ5x-00050s-Sx; Tue, 17 Mar 2009 14:12:38 +0100
From: Torsten Sadowski <torsten.sadowski@tu-berlin.de>
Organization: TU Berlin
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Mar 2009 14:12:20 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.27-11-generic; KDE/4.2.0; i686; ; )
MIME-Version: 1.0
Message-Id: <200903171412.20971.torsten.sadowski@tu-berlin.de>
X-tubIT-Score: 0.0 ()
X-SA-Exim-Connect-IP: 130.149.7.33
X-SA-Exim-Mail-From: torsten.sadowski@tu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_50,RCVD_IN_DNSWL_LOW,
	RDNS_NONE autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Naming of different recipes for the same package
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
X-List-Received-Date: Tue, 17 Mar 2009 13:13:27 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

I want to turn my Simpad into a satnav. So I did define a custom image 
including navit. Unluckily, the image is too large. The reason is that speech-
dispatcher uses espeak AND flite with flite being a fat 7MB package. 

I tried to make my own speech-dispatcher package but how can I name it to 
coexist with the default? "speech-dispatcher-noflite_0.6.6.bb" breaks the 
normal ${PN}-${PV} convention and fails during patching:

No file to patch.  Skipping patch.
1 out of 1 hunk ignored
can't find file to patch at input line 52
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|diff -aurp speech-dispatcher-0.6.5/src.old/tests/Makefile.am speech-
dispatcher-0.6.5/src/tests/Makefile.am
|--- speech-dispatcher-0.6.5/src.old/tests/Makefile.am	2008-01-02 
17:06:47.000000000 -0600
|+++ speech-dispatcher-0.6.5/src/tests/Makefile.am	2008-01-02 
17:13:55.000000000 -0600
--------------------------

Any hints?

Cheers, Torsten


