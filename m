Received: from kcmailp07.birch.net ([216.212.0.102] helo=mx01.birch.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dick@softplc.com>) id 1Pwgzv-0005m1-NW
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Mar 2011 21:25:44 +0100
Received: (qmail 70715 invoked from network); 7 Mar 2011 19:57:30 -0000
Received: by simscan 1.0.8 ppid: 70709, pid: 70713, t: 0.0607s scanners:none
Received: from unknown (HELO [192.100.100.3]) ([65.16.135.194])
	(envelope-sender <dick@softplc.com>)
	by mx01.birch.net (qmail-ldap-1.03) with SMTP
	for <openembedded-devel@lists.openembedded.org>;
	7 Mar 2011 19:57:30 -0000
Message-ID: <4D7538A9.3050803@softplc.com>
Date: Mon, 07 Mar 2011 13:57:29 -0600
From: Dick Hollenbeck <dick@softplc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110223 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] cc1 and cc1plus had about 20 mbytes of debug information each, in the final redistributable form. This patch strips those two binaries yielding a savings of about 40 mbytes per SDK.
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
X-List-Received-Date: Mon, 07 Mar 2011 20:25:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

> Signed-off-by: Dick Hollenbeck<dick at softplc.com
<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>>

>We recently added logic to conf/distro/include/sane-toolchain-* to 
>handle the debug level via DEBUG_LEVEL.  Would you mind adding a 
>DEBUG_LEVEL_HOST to conf/bitbake.conf and making BUILD_OPTIMIZATION obey 
>that instead so that we can drop debug info from all of them?  Thanks.


Tom,

Thanks.  On this one, please just take it over.  I am still coming up to
speed, and am not able to decipher what you want in a way that will make you
happy.

I know its only a few lines, and you'll want it done a certain way anyway.

Thanks tons.   The disk savings is substantial and worth your time.

Next time I'll be better positioned to help.

Dick





