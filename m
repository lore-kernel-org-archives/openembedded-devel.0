Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1IW8Ja-00074y-Ms
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Sep 2007 12:22:22 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 4E22C28C013; Fri, 14 Sep 2007 12:15:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_NJABL_DUL,RCVD_IN_PBL,RCVD_IN_SORBS_DUL,
	REPTO_OVERQUOTE_THEBAT autolearn=no version=3.1.7-deb
Received: from PROMETHEUS (e180145041.adsl.alicedsl.de [85.180.145.41])
	by srv043.dedi23.de (Postfix) with ESMTP id BB39328C012
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Sep 2007 12:15:15 +0200 (CEST)
Date: Fri, 14 Sep 2007 12:18:59 +0200
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.3) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1902785051.20070914121859@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <46EA2668.6080307@student.utwente.nl>
References: <E1IVzbz-0007pX-Aa@linuxtogo.org>
	<46EA2668.6080307@student.utwente.nl>
MIME-Version: 1.0
Subject: Re: [oe-commits] org.oe.dev libgsmd: add modified start script for fic-gta01 due to problems w/ UART multiplexing
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Sep 2007 10:22:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> mickeyl commit schreef:
>> libgsmd: add modified start script for fic-gta01 due to problems w/ UART multiplexing
>> See http://bugzilla.openmoko.org/cgi-bin/bugzilla/show_bug.cgi?id=788 for more information
>> This is hopefully just a temporary solution...
>> 
>> Author: mickeyl@openembedded.org
>> Branch: org.openembedded.dev
>> Revision: 235d3c4d9fbc3aee4e352851f04eb4fa2da4a68f
>> ViewMTN: http://monotone.openembedded.org/revision/info/235d3c4d9fbc3aee4e352851f04eb4fa2da4a68f
>> Files:
>> 1
>> packages/gsm/files/fic-gta01
>> packages/gsm/files/fic-gta01/gsmd

> Coudn't this be done in the existing startup script with and if [ machine = gta01 ] guard?

We could, but...

>  We did a lot of work in the past to make gsmd not machine specific, this undoes that

No, I'd like it to be a BIG FAT sign that there is something wrong
here.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



