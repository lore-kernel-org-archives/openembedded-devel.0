Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1O91IU-0002cj-Vh
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 May 2010 21:27:20 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1O91Ep-0005VN-SW from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 May 2010 12:23:31 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 3 May 2010 12:23:31 -0700
Received: from 172.30.80.22 ([172.30.80.22]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Mon,  3 May 2010 19:23:27 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	03 May 2010 12:23:27 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1272470468.3865.774.camel@trini-m4400>
References: <1272401386.3865.719.camel@trini-m4400>
	<1272402270.3865.734.camel@trini-m4400>
	<1272470468.3865.774.camel@trini-m4400>
Organization: Mentor Graphics Corporation
Date: Mon, 03 May 2010 12:23:27 -0700
Message-ID: <1272914607.2931.19.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 03 May 2010 19:23:31.0356 (UTC)
	FILETIME=[1DA30DC0:01CAEAF6]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCHv3] Remove scsi/scsi.h header from linux-libc-headers
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
X-List-Received-Date: Mon, 03 May 2010 19:27:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2010-04-28 at 09:01 -0700, Tom Rini wrote:
> linux-libc-headers: Delete include/scsi/scsi.h
>=20
> With 2.6.31, the kernel started exporting certain SCSI headers again and
> in particular scsi/scsi.h.  After talking with Christoph Hellwig and
> James Bottemley (scsi maintainer) the kernel shouldn't export
> scsi/scsi.h.  Removing this from the kernel, rather than trying to clean
> it up to be userland parseable is the right way to go.

So FYI all.  The kernel patch is now queued up for the .35 merge window.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


