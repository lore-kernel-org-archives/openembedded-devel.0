Received: from out3.smtp.messagingengine.com ([66.111.4.27])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vjensen@gmx.de>) id 1PVQ2R-00069g-6w
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 15:51:35 +0100
Received: from compute2.internal (compute2.nyi.mail.srv.osa [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 60EF89A7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 09:44:30 -0500 (EST)
Received: from frontend1.messagingengine.com ([10.202.2.160])
	by compute2.internal (MEProxy); Wed, 22 Dec 2010 09:44:30 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:message-id:mime-version:content-type;
	s=smtpout; bh=Ckyn+SB1dROxTniKocxS8XU9FpQ=;
	b=fcojop9H9AZ2CmAYfu027y9MUPFrX9LKNAs3Pm+mCirnZExVjSy+J+vHFefj9Lv20ssn9Z+o9Clse9EVPhpiVUKo6ZC8o+vLMdwNDVdI485L/kMC4yS0wakvNCvtvFu9zNM8+uU6L2Iijn3a1pLjZu9BV1RBUK7+jRwjsBicZI4=
X-Sasl-enc: DKfb3EDsUTr9MkpL8O/HXC/frmfqGqJ9OqGQ3oCX09K9 1293029069
Received: from [192.168.1.34] (hnvr-4dbd3c60.pool.mediaWays.net [77.189.60.96])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 76624404779
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 09:44:29 -0500 (EST)
Date: Wed, 22 Dec 2010 15:47:07 +0100 (CET)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <alpine.LNX.2.00.1012221538090.11293@asterix.crazy-teaparty.dyndns.org>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
Subject: monit, no include from monit.d
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
X-List-Received-Date: Wed, 22 Dec 2010 14:51:35 -0000
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII

Hej!

OE contains a receipe for the monit daemon which can monitor processes and 
restart them if they are not there.  The receipe creates a directory 
/etc/monit.d/ on the target system but does not enable the include 
directive in /etc/monitrc so the service is unusable from other receipes 
without editiing a file on the target system.  I think /etc/monit.d/ is a 
good idea and receipes should rely on monit to include from it.

The current receipe contains sed commands to modify monitrc, which I'm 
not very familiar with, so I added a path for the include.  Please comment 
if all monitrc changes should be combined somewhere (sed vs patch).  Patch 
to current head follows.

Vitus

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


