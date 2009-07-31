Received: from [58.185.154.238] (helo=cassis-intl.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <galvez.andy@cassis-intl.com>) id 1MWprq-0001mW-TE
	for openembedded-devel@openembedded.org; Fri, 31 Jul 2009 13:01:44 +0200
Received: (qmail 16938 invoked by uid 509); 31 Jul 2009 18:40:58 +0800
Received: from 10.65.9.1 by postman.cassis-intl.com (envelope-from
	<galvez.andy@cassis-intl.com>,
	uid 501) with qmail-scanner-1.25-st-qms 
	(clamdscan: 0.83/1213. spamassassin: 3.0.4. perlscan: 1.25-st-qms.  
	Clear:RC:1(10.65.9.1):. 
	Processed in 0.049152 secs); 31 Jul 2009 10:40:58 -0000
X-Antivirus-MYDOMAIN-Mail-From: galvez.andy@cassis-intl.com via
	postman.cassis-intl.com
X-Antivirus-MYDOMAIN: 1.25-st-qms (Clear:RC:1(10.65.9.1):. Processed in
	0.049152 secs Process 16931)
Received: from unknown (HELO galvezljxpdt1) (10.65.9.1)
	by cassis-intl.com with SMTP; 31 Jul 2009 18:40:58 +0800
Message-ID: <ADE69874790445368C1FAACEA5FF1B82@sg01.cassis>
From: "Leandro Q. Galvez" <galvez.andy@cassis-intl.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 31 Jul 2009 18:55:08 +0800
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.5512
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.5579
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: libtool/libltdl problem
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
X-List-Received-Date: Fri, 31 Jul 2009 11:01:45 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

    I am trying to compile opie-image from a newly fetched sources from op=
enembedded. But I hit this stumbling block that prevented me to make any pr=
ogress for the whole day. My openembedded environment already built the lib=
tool 2.2.4-r16 based on the dependency requirements of the opie-image recei=
pe. But when the build process reached pulseaudio 0.9.15-r8.4, the process =
stopped with an error about liltdl not being found. searched through the di=
rectory and I confirmed that all the install and devel files are in the sta=
ging/../user/lib folder. Searched through the net and all the hits point th=
at libtool 2.2 is required for this pulseaudio version. But all the files a=
re there. Can anybody help me through this?

exact message:
checking for lt_dladvise_init in -lltdl... no
configure: error: Unable to find libltdl
FATAL: oe_runconf failed


Thanks and best regards,
Andy
From utx@penguin.cz Fri Jul 31 13:31:46 2009
Received: from [84.21.108.25] (helo
