Received: from [202.37.96.11] (helo=gatekeeper.tait.co.nz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <douglas.royds@tait.co.nz>) id 1MblCJ-0000Sw-V2
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Aug 2009 03:03:13 +0200
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by localhost.tait.co.nz (Postfix) with ESMTP id 8D88646751
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2009 12:46:36 +1200 (NZST)
Received: from sunstrike.tait.co.nz (sunstrike [172.25.40.92])
	by gatekeeper.tait.co.nz (Postfix) with ESMTP id 7C88546749
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2009 12:46:35 +1200 (NZST)
Received: from conversion-daemon.sunstrike.tait.co.nz by sunstrike.tait.co.nz
	(Sun Java System Messaging Server 6.1 (built Apr 28 2004))
	id <0KOC00001C7E3A00@sunstrike.tait.co.nz>
	(original mail from douglas.royds@tait.co.nz)
	for openembedded-devel@lists.openembedded.org; Fri,
	14 Aug 2009 12:46:35 +1200 (NZST)
Received: from [172.25.114.21] by sunstrike.tait.co.nz
	(Sun Java System Messaging Server 6.1 (built Apr 28 2004))
	with ESMTP id <0KOC00BXBCTJKVE0@sunstrike.tait.co.nz> for
	openembedded-devel@lists.openembedded.org; Fri,
	14 Aug 2009 12:46:33 +1200 (NZST)
Date: Fri, 14 Aug 2009 12:46:31 +1200
From: Douglas Royds <douglas.royds@tait.co.nz>
In-reply-to: <1250175641-4869-2-git-send-email-msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <4A84B3E7.4070602@tait.co.nz>
MIME-version: 1.0
References: <1250175641-4869-1-git-send-email-msmith@cbnco.com>
	<1250175641-4869-2-git-send-email-msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090608)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 2/4] gcc: fix libstdc/libgcc packaging on x86_64
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
X-List-Received-Date: Fri, 14 Aug 2009 01:03:14 -0000
Content-Type: text/plain; format=flowed; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT

FWIW, Ubuntu Hardy LTS 8.04 is on GCC 4.2.3:

    http://packages.ubuntu.com/search?keywords=gcc

Hardy LTS is the "Long-Term Support" version of Ubuntu, that they 
support for 2 years. It will be replaced in April 2010, which isn't 
tooooo far away.

Douglas.


Michael Smith wrote:
> do_install was looking under ${D}/some long cross path/*/lib;
> needs to be lib64 on x86_64. On x86_64 base_libdir would be set to
> /lib64, so we can go by that.
>
> Bump INC_PR for recent gccs (4.3.3, 4.4.1). Hopefully no one is using
> older gcc for x86_64.
>   







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


