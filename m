Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <itodroid@gmail.com>) id 1RgeSo-0003cY-8f
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Dec 2011 16:33:46 +0100
Received: by obcwn6 with SMTP id wn6so10846270obc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2011 07:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding:x-mailer:thread-index:content-language;
	bh=2fGTKN4WhuAl8Lz3SZPCsGQ821U+AfC6V0Pz7qRIEMs=;
	b=nG4k5JBdJ23xKfpASb6tyDTjI3lBW/IPgfwXAGNdj0JszliiVqrivtGlxgrAWMz2tH
	G+0X3Fxa0/zBGNutltiMjJ0Gy6WbqcN34HPJHnr2gKSGF/Y5iEiY6ZuW0MBAp5ChaqoV
	OTx2QFvZ1BTh49+nGtLXdhin7vsZVdiRWm1zQ=
Received: by 10.50.40.129 with SMTP id x1mr55106524igk.4.1325258789798;
	Fri, 30 Dec 2011 07:26:29 -0800 (PST)
Received: from AZPCMATTWALTER (wsip-174-78-94-230.ph.ph.cox.net.
	[174.78.94.230])
	by mx.google.com with ESMTPS id cv10sm81392328igc.0.2011.12.30.07.26.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Dec 2011 07:26:29 -0800 (PST)
From: "itodroid" <itodroid@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 30 Dec 2011 08:26:25 -0700
Message-ID: <012301ccc707$664a36e0$32dea4a0$@gmail.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AczHBkKy73rRFxXcRmm0d/zKVaGTcA==
Subject: Including python libs
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
X-List-Received-Date: Fri, 30 Dec 2011 15:33:46 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us

Greetings all!

I'm having a little trouble figuring out the "right" way to include some
extra python libraries into a recipe, and for the life of me, I cannot
figure it out.  I'm using Python2.6 and I have a few python scripts that
depend on httplib.  I've found that httplib.py is contained within
"python-2.6.6-ml12.2".  

In my recipe, I've tried "include python-2.6.6ml12.2" and also "DEPEND +=
python-2.6.6ml12.2", neither of which actually include the
/usr/lib/python2.6/<python libs> into my rootfs.

I believe that httplib is part of python-netclient which appears to be
provided by python-2.6-manifest.inc.  I've also tried including this
manifest file into my recipe, but still, I cannot get the libraries into my
rootfs.

Can anyone provide some insight as to what I'm doing wrong?  Thanks in
advance.



