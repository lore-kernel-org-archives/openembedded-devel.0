Received: from gatekeeper.tait.co.nz ([202.37.96.11])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <douglas.royds@tait.co.nz>) id 1NrJrp-0000pq-9c
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 00:38:41 +0100
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by localhost.tait.co.nz (Postfix) with ESMTP id 95BCE46756
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Mar 2010 12:35:53 +1300 (NZDT)
Received: from sunstrike.tait.co.nz (sunstrike [172.25.40.92])
	by gatekeeper.tait.co.nz (Postfix) with ESMTP id 7C23146749
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Mar 2010 12:35:53 +1300 (NZDT)
Received: from conversion-daemon.sunstrike.tait.co.nz by sunstrike.tait.co.nz
	(Sun Java System Messaging Server 6.1 (built Apr 28 2004))
	id <0KZC00601K3BW900@sunstrike.tait.co.nz>
	(original mail from douglas.royds@tait.co.nz)
	for openembedded-devel@lists.openembedded.org; Tue,
	16 Mar 2010 12:35:34 +1300 (NZDT)
Received: from [172.25.116.17] by sunstrike.tait.co.nz
	(Sun Java System Messaging Server 6.1 (built Apr 28 2004))
	with ESMTP id <0KZC0025UK6ZAZ50@sunstrike.tait.co.nz> for
	openembedded-devel@lists.openembedded.org; Tue,
	16 Mar 2010 12:35:23 +1300 (NZDT)
Date: Tue, 16 Mar 2010 12:35:23 +1300
From: Douglas Royds <douglas.royds@tait.co.nz>
In-reply-to: <6C2434209962DC46B88345CA85C334A285DAA67634@Courier.syntech.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <4B9EC43B.10201@tait.co.nz>
MIME-version: 1.0
References: <6C2434209962DC46B88345CA85C334A285DAA67634@Courier.syntech.org>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
X-SA-Exim-Connect-IP: 202.37.96.11
X-SA-Exim-Mail-From: douglas.royds@tait.co.nz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Need help with "No GNU_HASH in the elf binary"
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
X-List-Received-Date: Mon, 15 Mar 2010 23:38:42 -0000
Content-type: text/plain; format=flowed; charset=ISO-8859-1
Content-transfer-encoding: 7BIT

For some background reading, try this:

    http://lwn.net/Articles/192624/

The -Wl,-O1 linker option is set in bitbake.conf (see TARGET_LDFLAGS). 
Angstrom sets -Wl,--hash-style=gnu in angstrom-glibc.inc (see 
TARGET_LINK_HASH_STYLE).

Hope this helps,
Douglas.





=======================================================================
This email, including any attachments, is only for the intended
addressee.  It is subject to copyright, is confidential and may be
the subject of legal or other privilege, none of which is waived or
lost by reason of this transmission.
If the receiver is not the intended addressee, please accept our
apologies, notify us by return, delete all copies and perform no
other act on the email.
Unfortunately, we cannot warrant that the email has not been
 altered or corrupted during transmission.
=======================================================================



