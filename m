Return-Path: <zboszor@pr.hu>
Received: from mail7.pr.hu (mail7.pr.hu [87.242.0.7])
	by mail.openembedded.org (Postfix) with ESMTP id 2FB2760017
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Aug 2015 16:28:13 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <zboszor@pr.hu>) id 1ZN1Y0-0001TR-Qq
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Aug 2015 18:28:08 +0200
Received: from [88.132.201.202] (helo=s002.sicom.com)
	by mail.pr.hu with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <zboszor@pr.hu>) id 1ZN1Xx-0000Ex-Fy
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Aug 2015 18:28:10 +0200
To: openembedded-devel@lists.openembedded.org
From: Boszormenyi Zoltan <zboszor@pr.hu>
X-Enigmail-Draft-Status: N1110
Message-ID: <55C23992.4020008@pr.hu>
Date: Wed, 5 Aug 2015 18:28:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
X-Host-Lookup-Failed: Reverse DNS lookup failed for 88.132.201.202 (failed)
X-Spam-Score: 2.1 (++)
X-Spam-Report: Spam detection software, running on the system "prspamd4.pr.hu",
	has NOT identified this incoming email as spam.  The original
	message has been attached to this so you can view it or label
	similar future email.  If you have any questions, see
	the administrator of that system for details.
	Content preview:  Hi, I found this documentation:
	https://wiki.yoctoproject.org/wiki/images/e/e6/Custom_Users_Groups_in_Yocto1.1.pdf
	We have a custom Yocto 1.6 Daisy based distribution and one of our
	packages
	create one "central" user and 350 "support users". All the support
	users get a secondary group,
	which is the primary group of this central user. [...]
	Content analysis details:   (2.1 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-0.2 ALL_TRUSTED Passed through trusted hosts only via SMTP
	3.5 BAYES_99               BODY: Bayes spam probability is 99 to 100%
	[score: 0.9995]
	0.2 BAYES_999 BODY: Bayes spam probability is 99.9 to 100%
	[score: 0.9995]
	-1.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Scan-Signature: 00247148ec76130c8a78f769f9282e76
X-Spam-Tracer: backend.mail.pr.hu 2.1 20150805162810Z
Subject: How do useradd.bbclass and chown/chgrp in do_install work _internally_?
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
X-List-Received-Date: Wed, 05 Aug 2015 16:28:14 -0000
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit

Hi,

I found this documentation:
https://wiki.yoctoproject.org/wiki/images/e/e6/Custom_Users_Groups_in_Yocto1.1.pdf

We have a custom Yocto 1.6 Daisy based distribution and one of our
packages create one "central" user and 350 "support users".
All the support users get a secondary group, which is the primary group
of this central user.

The result is that the group of the first user became over 2800 bytes long.

If another package (like cronie) that also uses "inherit useradd" is built
after our custom package, its do_install step fails at chown or chgrp.

If I manually edit the .../sysroot/genericx86-64/etc/group file so the group(s)
created by such packages are moved earlier than that very long line,
the build of these packages succeed.

If I move it after the very long line in .../etc/group again, and do
"bitbake -c cleanall cronie ; bitbake cronie", it fails again.

I found that chown/chgrp are provided by coreutils. I found a patch
in Fedora's coreutils src.rpm files (coreutils-getgrouplist.patch)
that is a suspicious contender that fixes such problems.

The same problem (a lot of users put into the same group, creating
a very long line in /etc/group) does not cause a problem with the
real chown/chgrp commands on Fedora 21 / 22.

I applied that patch to coreutils-native and coreutils and the problem
still occurred on Yocto 1.6.

Which commands are actually run as chown and chgrp from do_install()
in OpenEmbedded recipes? Because apparently, it's not the ones from
coreutils-native and not the host provided ones either.

Thanks in advance,
Zoltán Böszörményi


