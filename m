Received: from [213.39.232.198] (helo=moskovskaya.fh-wedel.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <di@mail.fh-wedel.de>) id 1HF7V3-00033A-GQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Feb 2007 12:31:37 +0100
Received: from di by moskovskaya.fh-wedel.de with local (Exim 4.50)
	id 1HF7V2-0000VB-T4 for openembedded-devel@lists.openembedded.org;
	Thu, 08 Feb 2007 12:31:36 +0100
Date: Thu, 8 Feb 2007 12:31:36 +0100
From: Martin Dietze <di@fh-wedel.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070208113136.GA1408@fh-wedel.de>
Mime-Version: 1.0
X-PGP-Fingerprint: C98D 598A DA73 DF9F 610D  632E 4468 B911 BF9B 8D95
X-PGP-Key-ID: 0xBF9B8D95
User-Agent: Mutt/1.5.9i
Sender: Martin Dietze <di@mail.fh-wedel.de>
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: di@mail.fh-wedel.de
Subject: Thread-support in perl-native often breaks libintl-perl
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Feb 2007 11:31:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

 on most platforms thread support is turned off for the
cross-compiled perl packages. However it is always turned 
on in the perl-native package. Since libraries like
libintl-perl depend on perl-native since they include their
headers from staging/[my-platform]-linux/lib/perl5 we get
an inconsistent configuration: the shared lib gettext_xs.so
is cross-compiled with headers with thread support turned
on while the actual (non-native) perl has it turned off. In
the end libintl-perl will not work:

| /var/bin/perl: relocation error: /var/lib/perl5/auto/Locale/gettext_xs/gettext_xs.so: undefined symbol: Perl_Gthr_key_ptr

Removing the `-Dusethreads' from the perl-native recipe solves
this problem, but will it cause problems for others?

BTW, where is bugs.openembedded.org - it has not been up for a 
longer while...

Cheers,

Martin

-- 
-------------- Martin Dietze --------------- / -- 4G Systeme GmbH Hamburg ---
-- martin@the-little-red-haired-girl.org -- / ---- dietze@4g-systems.com ----
------------- / http://herbert.the-little-red-haired-girl.org / -------------
=+= 
- Are you attempting to tell me my duty, sir?
- No. Just having fun trying to guess what they are.


