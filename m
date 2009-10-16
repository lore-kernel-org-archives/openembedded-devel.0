Received: from [64.202.165.181] (helo=smtpauth01.prod.mesa1.secureserver.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1MywUm-0000I5-Vo
	for openembedded-devel@openembedded.org; Sat, 17 Oct 2009 01:46:08 +0200
Received: (qmail 12461 invoked from network); 16 Oct 2009 23:45:07 -0000
Received: from unknown (75.60.2.127)
	by smtpauth01.prod.mesa1.secureserver.net (64.202.165.181) with ESMTP;
	16 Oct 2009 23:45:07 -0000
Message-ID: <4AD90574.1080800@mwester.net>
Date: Fri, 16 Oct 2009 18:44:52 -0500
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@openembedded.org>
X-SA-Exim-Connect-IP: 64.202.165.181
X-SA-Exim-Mail-From: mike@mwester.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: commit 806811bf2d72827d3031bfcd5dbab1e82324d34e breaks distros
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
X-List-Received-Date: Fri, 16 Oct 2009 23:46:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

The following commit breaks numerous non-angstrom distros:

commit 806811bf2d72827d3031bfcd5dbab1e82324d34e
Author: Denys Dmytriyenko <denis@denix.org>
Date:   Wed Oct 14 14:25:07 2009 -0400

    angstrom: clean ups of the external toolchain support


The symptom of the problem is this:

$ bitbake slugos-image
ERROR: Unable to parse conf/bitbake.conf (Could not include required
file conf/distro/include/glibc.inc)
$

It seems that glibc.inc has been removed, and possibly replaced by
either an external or an internal variant, but no non-angstrom distros
have been updated.

Please forgive me if there was a discussion of this change on the
mailing list; I have been locked away behind corporate firewalls, and
living on-the-road for the past months, and just haven't been able to
keep up. :(

How do I fix this, please?

-Mike (mwester)


