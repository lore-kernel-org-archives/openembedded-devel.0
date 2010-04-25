Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1O660b-0004Wf-Tj
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Apr 2010 19:52:47 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1O65x3-00026s-MU from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Apr 2010 10:49:05 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Sun, 25 Apr 2010 10:49:05 -0700
Received: from 172.30.80.244 ([172.30.80.244]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Sun, 25 Apr 2010 17:49:04 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	25 Apr 2010 10:48:59 -0700
From: Tom Rini <tom_rini@mentor.com>
To: oe-devel <openembedded-devel@lists.openembedded.org>
Organization: Mentor Graphics Corporation
Date: Sun, 25 Apr 2010 10:48:59 -0700
Message-ID: <1272217739.3865.546.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 25 Apr 2010 17:49:05.0333 (UTC)
	FILETIME=[991E8E50:01CAE49F]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: The coreutils-native race...
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
X-List-Received-Date: Sun, 25 Apr 2010 17:52:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey all.  I thought I would try and explain what Chris has been up to
with at least some of the base.bbclass changes (the ones related to
md5sum and cp).

Right now, with a big enough BB_NUM_THREADS we can get into a race where
coreutils-native is installing programs and elsewhere we are in a
do_fetch and either trying to use 'cp' or 'md5sum', and blam, we try and
invoke the program while it's being installed (and see things like
sh: /path/to/staging/i686-linux/usr/bin/cp: Textfile is busy).

There's a few ways out of this:
1) Don't rely on 'cp' and 'md5sum' anymore but use python for it.
2) Make an oe_cp and oe_md5sum to go with oe_sha256sum
3) IIRC, the big part of coreutils-native was a fully functional,
always, 'install'.  We could just copy the install we build or provide
an install wrapper (oe_install) or so
4) ???

Thoughts? Comments?

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


