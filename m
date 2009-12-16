Received: from gatekeeper.tait.co.nz ([202.37.96.11])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <douglas.royds@tait.co.nz>) id 1NKjHa-0002ku-Ee
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Dec 2009 03:06:34 +0100
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by localhost.tait.co.nz (Postfix) with ESMTP id DDB4446756
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Dec 2009 14:41:52 +1300 (NZDT)
Received: from sunstrike.tait.co.nz (sunstrike [172.25.40.92])
	by gatekeeper.tait.co.nz (Postfix) with ESMTP id CBBC946755
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Dec 2009 14:41:50 +1300 (NZDT)
Received: from conversion-daemon.sunstrike.tait.co.nz by sunstrike.tait.co.nz
	(Sun Java System Messaging Server 6.1 (built Apr 28 2004))
	id <0KUQ00A0114HEZ00@sunstrike.tait.co.nz>
	(original mail from douglas.royds@tait.co.nz)
	for openembedded-devel@lists.openembedded.org; Wed,
	16 Dec 2009 14:41:50 +1300 (NZDT)
Received: from [172.25.114.21] by sunstrike.tait.co.nz
	(Sun Java System Messaging Server 6.1 (built Apr 28 2004))
	with ESMTP id <0KUQ0072Z21JYQ10@sunstrike.tait.co.nz> for
	openembedded-devel@lists.openembedded.org; Wed,
	16 Dec 2009 14:41:45 +1300 (NZDT)
Date: Wed, 16 Dec 2009 14:41:43 +1300
From: Douglas Royds <douglas.royds@tait.co.nz>
In-reply-to: <200912021919.06663.marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Message-id: <4B283AD7.9020501@tait.co.nz>
MIME-version: 1.0
References: <200912021919.06663.marcin@juszkiewicz.com.pl>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
X-SA-Exim-Connect-IP: 202.37.96.11
X-SA-Exim-Mail-From: douglas.royds@tait.co.nz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SVN fetcher fix for SRCREV=AUTOREV situations
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
X-List-Received-Date: Wed, 16 Dec 2009 02:06:34 -0000
Content-type: text/plain; format=flowed; charset=ISO-8859-1
Content-transfer-encoding: 7BIT

Marcin Juszkiewicz wrote:
> $ svn co -r 7916 svn://svn.buglabs.net/bug/branches/R1.4/qa/com.buglabs.bug.audio.common@7916
> svn: URL 'svn://svn.buglabs.net/bug/branches/R1.4/qa/com.buglabs.bug.audio.common' doesn't exist
>
> But:
>
> $ svn co -r 7916 svn://svn.buglabs.net/bug/branches/R1.4/qa/com.buglabs.bug.audio.common
>
> works fine.
>   

The R1.4 branch didn't exist in r7916 - that branch was created in 
r8660. The correct URL is:

    svn://svn.buglabs.net/bug/trunk/com.buglabs.bug.audio.common

So this should work:

    $ svn co -r7916
    svn://svn.buglabs.net/bug/trunk/com.buglabs.bug.audio.common@7916

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



