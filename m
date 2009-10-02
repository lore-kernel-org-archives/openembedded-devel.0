Received: from [193.170.110.60] (helo=beta.fh-salzburg.ac.at)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1MtiMD-0003PZ-5L
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Oct 2009 15:39:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by beta.fh-salzburg.ac.at (Postfix) with ESMTP id A328B950678
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Oct 2009 15:38:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at fh-salzburg.ac.at
Received: from beta.fh-salzburg.ac.at ([127.0.0.1])
	by localhost (beta.fh-salzburg.ac.at [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 7hQK0Fl1cKTS
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Oct 2009 15:38:45 +0200 (CEST)
Received: from mail-relay.core.fh-salzburg.ac.at (pinky.fh-salzburg.ac.at
	[193.170.110.5])
	by beta.fh-salzburg.ac.at (Postfix) with ESMTP id 5F7B99505B1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Oct 2009 15:38:45 +0200 (CEST)
Received: from vanessa.fh-salzburg.ac.at (vanessa.fh-salzburg.ac.at
	[193.170.110.166])
	by mail-relay.core.fh-salzburg.ac.at (Postfix) with ESMTP id
	49A2B5EE8C9 for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Oct 2009 15:37:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by vanessa.fh-salzburg.ac.at (Postfix) with ESMTP id 6099E7A84A2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Oct 2009 15:38:45 +0200 (CEST)
Received: from vanessa.fh-salzburg.ac.at ([127.0.0.1])
	by localhost (vanessa.fh-salzburg.ac.at [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 17019-08 for <openembedded-devel@lists.openembedded.org>; 
	Fri,  2 Oct 2009 15:38:45 +0200 (CEST)
Received: from [192.168.1.2] (d86-32-77-106.cust.tele2.at [86.32.77.106])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by vanessa.fh-salzburg.ac.at (Postfix) with ESMTP id 241AE7A80DD
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Oct 2009 15:38:45 +0200 (CEST)
Message-ID: <4AC60263.7000908@gmail.com>
Date: Fri, 02 Oct 2009 15:38:43 +0200
From: Michael Lippautz <michael.lippautz@gmail.com>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Virus-Scanned: amavisd-new at fh-salzburg.ac.at
X-SA-Exim-Connect-IP: 193.170.110.60
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: wpa-supplicant 0.6.7 interface functions broken
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
X-List-Received-Date: Fri, 02 Oct 2009 13:39:40 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Hej all,

Just posting here because someone on irc told me it would be faster than
using the bugtracker.

wpa-supplicant 0.6.7 (as currently prefered by angstrom) is quite
unusable when used in an automatic startup sequence
(/etc/network/interfaces and its up/down scripts). It works when used as
standalone program though.

The problem(s):
wpa-supplicant-0.6.7/functions.sh:
* The variables WPA_SUP_BIN and WPA_CLI_BIN are pointing nowhere.
* WPA_SUP_LOGFILE="syslog" doesn't work because the -s flag is not
understood.
* Generally the -f flag (used for logging)  is not understood by
wpa_supplicant. Although --help shows that it should be.

Solution(?):
Version 0.6.9 looks fine concerning the scripts. Although i don't know
whether the syslog/file-logging flag are supported.

The script 'files/ifupdown.sh' also looks a bit weird using something
like (line 95 cont.):

|PHASE="pre-up"
echo "WPA: Configuring Interface"
case "$PHASE" in
...
|
Has this package been restructured? It looks like that the commit
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=6aea479c251050e0d13ae01b98c7a35da393b41f
did screw things up because the partially wrong config files were set up
for this recipe.

Couldn't test 0.6.9 so far but maybe it should be set as prefered
version in the configs.
Bug is online at: http://bugs.openembedded.org/show_bug.cgi?id=5323

Regards,
Michael



