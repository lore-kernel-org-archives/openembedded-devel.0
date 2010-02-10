Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NfLip-0005UP-UO
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 00:11:55 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NfLgL-0006Pd-2Q from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Feb 2010 15:09:17 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 10 Feb 2010 15:09:16 -0800
Received: from 172.30.80.244 ([172.30.80.244]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Wed, 10 Feb 2010 23:09:15 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	10 Feb 2010 16:09:12 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hkvbfq$jo3$1@ger.gmane.org>
References: <1265838350-24498-1-git-send-email-rep.dot.nop@gmail.com>
	<hkvbfq$jo3$1@ger.gmane.org>
Organization: Mentor Graphics Corporation
Date: Wed, 10 Feb 2010 16:09:12 -0700
Message-Id: <1265843352.6312.187.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-OriginalArrivalTime: 10 Feb 2010 23:09:16.0786 (UTC)
	FILETIME=[11782520:01CAAAA6]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] recipes/*: use ${GNU_MIRROR}
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
X-List-Received-Date: Wed, 10 Feb 2010 23:11:55 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2010-02-10 at 23:20 +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 10-02-10 22:45, Bernhard Reutner-Fischer wrote:
> > sed -i -e 's|[hf]*[t]*p://ftp.gnu.org/gnu|${GNU_MIRROR}|g' $(git grep -l "ftp.gnu.org/gnu" recipes/)
> 
> I must note that this change will break checksums if ftp.gnu.org isn't
> used as GNU_MIRROR for recipes with old-style checksums.

Well, so what?  Maybe I missed someone updating gcc, but that (among
other things) already uses GNU_MIRROR...

-- 
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


