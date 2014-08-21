Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id A0D0B65DD0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Aug 2014 10:09:02 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <zboszor@pr.hu>) id 1XKPIl-0005ou-QD
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Aug 2014 12:09:03 +0200
Received: from host-87-242-0-11.prtelecom.hu ([87.242.0.11]
	helo=webmail.prtelecom.hu) by mail.pr.hu with esmtp (Exim 4.80)
	(envelope-from <zboszor@pr.hu>) id 1XKPIe-0004ks-AN
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Aug 2014 12:09:01 +0200
Received: from 87.242.22.241 (SquirrelMail authenticated user zboszor@pr.hu)
	by webmail.prtelecom.hu with HTTP; Thu, 21 Aug 2014 12:08:56 +0200
Message-ID: <674e63b93b3c0bfe18d58d6c11c1cc7a.squirrel@webmail.prtelecom.hu>
Date: Thu, 21 Aug 2014 12:08:56 +0200
From: zboszor@pr.hu
To: openembedded-devel@lists.openembedded.org
User-Agent: SquirrelMail/1.4.23 [SVN]
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
X-Spam-Score: 1.6 (+)
X-Spam-Report: Spam detection software, running on the system "prspamd3.pr.hu",
	has NOT identified this incoming email as spam.  The original
	message has been attached to this so you can view it or label
	similar future email.  If you have any questions, see
	the administrator of that system for details.
	Content preview:  Hello,
	as a follow-up to my yesterday's mail about "[PATCH]
	Allow using a more recent php",
	here's the proof of the pudding. I needed
	GD support in PHP, and it turned out that PHP 5.4.x only supports GD 2.0,
	while current OE has 2.1. Not wanting to downgrade GD,
	I chose to upgrade PHP. [...] 
	Content analysis details:   (1.6 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-0.2 ALL_TRUSTED Passed through trusted hosts only via SMTP
	1.5 SUBJ_ALL_CAPS          Subject is all capitals
	0.8 BAYES_50               BODY: Bayes spam probability is 40 to 60%
	[score: 0.5000]
	-0.5 AWL AWL: From: address is in the auto white-list
X-Scan-Signature: a7cf27f25ef8a025e565bb3cf9269fc9
X-Spam-Tracer: backend.mail.pr.hu 1.6 20140821100901Z
Subject: [PATCH] PHP 5.5.15
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Aug 2014 10:09:12 -0000
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: 8bit

Hello,

as a follow-up to my yesterday's mail about "[PATCH] Allow using a more
recent php", here's the proof of the pudding.

I needed GD support in PHP, and it turned out that PHP 5.4.x only supports
GD 2.0, while current OE has 2.1. Not wanting to downgrade GD, I chose to
upgrade PHP.

I had to update imap-fix-autofoo.patch so it applies cleanly and I also
had to fix https://bugs.php.net/bug.php?id=66103 so it can be cross
compiled. (I also submitted the patch at the link).

I enabled more extensions in PHP than what was in the previous version,
this is what I needed locally.

Comments?

Feel free to use it in any way.

Best regards,
Zoltán Böszörményi



