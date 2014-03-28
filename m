Return-Path: <diego.ml@zoho.com>
Received: from sender1.zohomail.com (sender1.zohomail.com [72.5.230.95])
	by mail.openembedded.org (Postfix) with ESMTP id 32C0A610CD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Mar 2014 13:40:28 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
	h=from:to:subject:date:message-id:user-agent:mime-version:content-type; 
	b=QOTUMDLeAEHC+cbQf9e8wZzCMvtYJH1mg+nvUHIG6YeSi4Yzov3PdQ+C2rc7jEdb0Wu+R+RRqCVE
	1RHP6J9ovZJyhSW5fvzA98bSI3/J/QJHrxJig4rkdZLtifYrt88j  
Received: from localhost.localdomain
	(host65-246-static.10-188-b.business.telecomitalia.it
	[188.10.246.65]) by mx.zohomail.com
	with SMTPS id 1396014012915278.75034990517383;
	Fri, 28 Mar 2014 06:40:12 -0700 (PDT)
From: Diego <diego.ml@zoho.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Mar 2014 14:40:08 +0100
Message-ID: <45034856.Fj98ikVczS@localhost.localdomain>
User-Agent: KMail/4.12.3 (Linux/3.13.6-200.fc20.x86_64; KDE/4.12.3; x86_64; ; )
MIME-Version: 1.0
X-ZohoMailClient: External
X-Zoho-Virus-Status: 2
Subject: ntpd fails to start if libcap not installed
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
X-List-Received-Date: Fri, 28 Mar 2014 13:40:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi openembedders!

I've noticed that if ntp is built without libcap, ntpd fails to start from the 
initscript:
/etc/init.d/ntpd

giving the error:
Starting ntpd: /usr/sbin/ntpd: The ``user'' option has been disabled -- built 
without --enable-clockctl or --enable-linuxcaps
ntpd - NTP daemon program - Ver. 4.2.6p5
USAGE:  ntpd [ -<flag> [<val>] | --<name>[{=| }<val>] ]...

That is caused by the line:
start-stop-daemon --start -x /usr/sbin/ntpd -- -u ntp:ntp -p /var/run/ntp.pid 
"$@"

and in particular by the option "-u ntp:ntp" which is not supported which is 
not supported if ntp is build without --enable-clockctl.

Is anybody else experiencing this problem?

Bests,
Diego


