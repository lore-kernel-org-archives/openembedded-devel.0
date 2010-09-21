Received: from web30303.mail.mud.yahoo.com ([209.191.69.65])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <dcraw101@yahoo.com>) id 1OyAue-0007iZ-9z
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 00:02:11 +0200
Received: (qmail 17094 invoked by uid 60001); 21 Sep 2010 21:55:11 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1285106111; bh=yWj4Hs4BAUwGgoqgk08nTEPpf10QuQBa1fEHIRwcV2I=;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=JbQ60NFeZAQMgT/Hidm/e37dhbn5DadZqnsFk3MU9w2gCAMMcPiWdm3VEo6zDwXft28mS+EkSSOUKe1+QAgka4TP0M1D3BllbRh85bF7CsxTv1OJ7gNvLUwM01MeslMjSieU1RS3dLp11LS9xt6K5ywcv6T7rHws19goz3FZ/sA=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.com;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=Fo6G20oKgp5+kZIk147wuLEVSQpXcXH8X2dAfcslodlBQS3AcheizHCwUIucNPwlJ1F9HAAWIeVRtFqnoDaRdQZ0a9tWyfss2xXW6u8qZdrd2HZj6KsVuY1R7moZoya26J874rxmqtYV6wzEYH9cXxkQD+/oNlBlk3ppmseV5nI=;
Message-ID: <243538.53234.qm@web30303.mail.mud.yahoo.com>
X-YMail-OSG: efsv364VM1m8.YDKQ9kLMu7nsJA_LzZBT1XkGf8koOs6jEr
	9WpA15v7ANGeGGUXF8fuORz3BE_FD1zatRKqa226smDGIUxwo8ztARYn6LkK
	hnLR2kfuNfiSC4_h_RDUdov9_NLcxImb7ZUrdHjQ.aF2eCn1UqunY4.9x23Z
	vbqH2rNyzxAe0M7yg7uHF25mCHsCtytlrDTdIGTBinwbFjlr.Z_2dY2AXio6
	.CR_GZeDHnaHGCUgfhsSARXSI_nLBgMvqenJHkYkdRzXmyWHv8gI.jGlRZ..
	v9.IcrIwZ6192CAj4OH.s2fDJ93NC5cr8XKhgzQm5yyX.J7.6fU1byA--
Received: from [174.18.94.114] by web30303.mail.mud.yahoo.com via HTTP;
	Tue, 21 Sep 2010 14:55:11 PDT
X-Mailer: YahooMailRC/497 YahooMailWebService/0.8.105.279950
Date: Tue, 21 Sep 2010 14:55:11 -0700 (PDT)
From: Doug Crawford <dcraw101@yahoo.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 209.191.69.65
X-SA-Exim-Mail-From: dcraw101@yahoo.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: qt4-embedded-gles only build runtime libraries
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
X-List-Received-Date: Tue, 21 Sep 2010 22:02:11 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

If I include qt4-embedded-gles in my IMAGE_INSTALL then bitbake builds all =
of =0Aqt4: runtime libs, demos, and development tools.=A0 How can I specify=
 that I only =0Awant to build the qt runtime libs or just specific runtime =
libs and not build =0Athe demos, documentation, or dev tools?=A0 I still wa=
nt to use the =0Aqt4-embedded-gles recipe to include the opengl symbols in =
the gui libraries.=0A=0AThanks,=0ADoug=0A=0A=0A      


