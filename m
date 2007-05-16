Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lenehan@twibble.org>) id 1HoBs3-0002xt-9D
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 May 2007 07:16:19 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id DF3B4103E89
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2007 15:16:02 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 02972-05
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2007 15:16:01 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 6F69F103D8D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2007 15:16:01 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 47F62B70149; Wed, 16 May 2007 15:16:01 +1000 (EST)
Date: Wed, 16 May 2007 15:16:01 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070516051600.GA5179@twibble.org>
References: <464613B3.8090003@dominion.kabel.utwente.nl>
MIME-Version: 1.0
In-Reply-To: <464613B3.8090003@dominion.kabel.utwente.nl>
User-Agent: Mutt/1.5.12-2006-07-14
X-Virus-Scanned: by amavisd at twibble.org
Subject: uclibc 0.9.29 & SYS_SIGLIST
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
X-List-Received-Date: Wed, 16 May 2007 05:16:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Currently SYS_SIGLIST is disabled in uclibc but the site files all
say it's present. For the old uclibc version some of the
configurations enabled SYS_SIGLIST support and some didn't. We don't
really need it and the uclibc help says it's going to go away one day
so if no one objects I'll add the following site entries:

common-glibc

 bash_cv_under_sys_siglist=${bash_cv_under_sys_siglist=yes}
 bash_cv_sys_siglist=${bash_cv_sys_siglist=yes}
 ac_cv_have_decl_sys_siglist=${ac_cv_have_decl_sys_siglist=yes}

common-uclibc

 bash_cv_under_sys_siglist=${bash_cv_under_sys_siglist=no}
 bash_cv_sys_siglist=${bash_cv_sys_siglist=no}
 ac_cv_have_decl_sys_siglist=${ac_cv_have_decl_sys_siglist=no}

And remove the above entries from all the other site files.

This siglist things needs to be sorted out to build apr at least
(which is needed to build subversion).

-- 
 Jamie Lenehan <lenehan@twibble.org>


