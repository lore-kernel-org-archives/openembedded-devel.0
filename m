Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1Or754-00075F-SE
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 12:31:52 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1Or74T-0007kW-1I from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 03:31:05 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 2 Sep 2010 12:31:02 +0200
Message-ID: <989A078976CDAD4CB2DC976EEF70E2A5042F1397@eu2-mail.mgc.mentorg.com>
In-Reply-To: <1283419152.3990.9.camel@mattotaupa>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] [PATCH] sqlite3: Merged target and native recipe using
	BBCLASSEXTEND
Thread-Index: ActKgA4MOupNqXEwS3OaOvhhC+nVwwACTXGQ
References: <1283417769-26234-1-git-send-email-noor_ahsan@mentor.com>
	<1283419152.3990.9.camel@mattotaupa>
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Noor_Ahsan@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] sqlite3: Merged target and native recipe using BBCLASSEXTEND
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
X-List-Received-Date: Thu, 02 Sep 2010 10:32:00 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Dear Paul,

Thanks for the comment. I'll resubmit the recipe with modified commit
message. There is sqlite-native recipe I'll update it as well.

Regards,
Noor

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
Paul Menzel
Sent: Thursday, September 02, 2010 2:19 PM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [PATCH] sqlite3: Merged target and native recipe using
BBCLASSEXTEND

Dear Noor,


your commit summary is a bit misleading, since there does not seem to
have ever been a native recipe for 3.6.23.1. So I think >extend< instead
of >merge< would have been better.

Am Donnerstag, den 02.09.2010, 14:56 +0600 schrieb Noor Ahsan:
> * Set BBCLASSEXTEND to "native" to use target recipe as native recipe
> * In include file tcl-native was present in DEPENDS list, remove it
from DEPENDS list by setting DEPENDS_virtclass-native =3D =
"readline-native
ncurses-native"
> * Bump PR "${INC_PR}.1"
>=20
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>

[...]

Do you know if the other SQlite recipes can be converted too or are you
already on it?


Thanks,

Paul


