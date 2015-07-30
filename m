Return-Path: <zboszor@pr.hu>
Received: from mail7.pr.hu (mail7.pr.hu [87.242.0.7])
	by mail.openembedded.org (Postfix) with ESMTP id 4224576398
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jul 2015 07:10:48 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <zboszor@pr.hu>) id 1ZKhww-0008Vw-2b
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Jul 2015 09:08:18 +0200
Received: from [88.132.201.202] (helo=s002.sicom.com)
	by mail.pr.hu with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <zboszor@pr.hu>) id 1ZKhzE-0007wm-Ak
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Jul 2015 09:10:45 +0200
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
From: Boszormenyi Zoltan <zboszor@pr.hu>
X-Enigmail-Draft-Status: N1110
Message-ID: <55B9CDED.8080204@pr.hu>
Date: Thu, 30 Jul 2015 09:10:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
X-Host-Lookup-Failed: Reverse DNS lookup failed for 88.132.201.202 (failed)
X-Spam-Score: 2.0 (++)
X-Spam-Report: Spam detection software, running on the system "prspamd3.pr.hu",
	has NOT identified this incoming email as spam.  The original
	message has been attached to this so you can view it or label
	similar future email.  If you have any questions, see
	the administrator of that system for details.
	Content preview:  Hi,
	I wanted to build a new image in a new empty buildroot, 
	with our Yocto 1.6 based custom distro that started off of Angstrom
	2014.06. The build failed with this: | chown: invalid group:
	'messagebus:messagebus' | WARNING:
	/data/OE/setup-scripts/build/tmp-angstrom_v2014_06-eglibc/work/core2-64-sicom-linux/dbus/1.6.18-r0/temp/run.do_install.6837:1
	exit 1 from | chown messagebus:messagebus
	/data/OE/setup-scripts/build/tmp-angstrom_v2014_06-eglibc/work/core2-64-sicom-linux/dbus/1.6.18-r0/image/var/lib/dbus
	| ERROR: Function failed: do_install (log file is located at
	/data/OE/setup-scripts/build/tmp-angstrom_v2014_06-eglibc/work/core2-64-sicom-linux/dbus/1.6.18-r0/temp/log.do_install.6837)
	ERROR: Task 2
	(/data/OE/setup-scripts/sources/openembedded-core/meta/recipes-core/dbus/dbus_1.6.18.bb,
	do_install) failed with exit code '1' NOTE: Tasks Summary: Attempted
	1241
	tasks of which 1234 didn't need to be rerun and 1 failed. NOTE: Writing
	buildhistory No currently running tasks (1241 of 1248) [...] 
	Content analysis details:   (2.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-0.2 ALL_TRUSTED Passed through trusted hosts only via SMTP
	3.5 BAYES_99               BODY: Bayes spam probability is 99 to 100%
	[score: 0.9997]
	0.2 BAYES_999 BODY: Bayes spam probability is 99.9 to 100%
	[score: 0.9997]
	-1.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Scan-Signature: 3da8dd007c9bc004c124c5756b0fc9e5
X-Spam-Tracer: backend.mail.pr.hu 2.0 20150730071045Z
Subject: chown problem in the dbus package
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
X-List-Received-Date: Thu, 30 Jul 2015 07:10:51 -0000
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit

Hi,

I wanted to build a new image in a new empty buildroot, with our
Yocto 1.6 based custom distro that started off of Angstrom 2014.06.
The build failed with this:

| chown: invalid group: 'messagebus:messagebus'
| WARNING:
/data/OE/setup-scripts/build/tmp-angstrom_v2014_06-eglibc/work/core2-64-sicom-linux/dbus/1.6.18-r0/temp/run.do_install.6837:1
exit 1 from
|   chown messagebus:messagebus
/data/OE/setup-scripts/build/tmp-angstrom_v2014_06-eglibc/work/core2-64-sicom-linux/dbus/1.6.18-r0/image/var/lib/dbus
| ERROR: Function failed: do_install (log file is located at
/data/OE/setup-scripts/build/tmp-angstrom_v2014_06-eglibc/work/core2-64-sicom-linux/dbus/1.6.18-r0/temp/log.do_install.6837)
ERROR: Task 2
(/data/OE/setup-scripts/sources/openembedded-core/meta/recipes-core/dbus/dbus_1.6.18.bb,
do_install) failed with exit code '1'
NOTE: Tasks Summary: Attempted 1241 tasks of which 1234 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
No currently running tasks (1241 of 1248)

Summary: 1 task failed:
  /data/OE/setup-scripts/sources/openembedded-core/meta/recipes-core/dbus/dbus_1.6.18.bb,
do_install
Summary: There were 19 WARNING messages shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

"bitbake -c cleansstate dbus" or "bitbake -c cleanall dbus" didn't help.

Our distro uses useradd-staticids with these set in conf/layer.conf:

USERADDEXTENSION = "useradd-staticids"
USERADD_UID_TABLES = "files/passwd"
USERADD_GID_TABLES = "files/group"
USERADD_ERROR_DYNAMIC = "1"

The messagebus user and group are defined with UID==81 and GID==81:

$ grep messagebus files/passwd files/group
files/passwd:messagebus:x:81:81::/var/lib/dbus:/bin/false
files/group:messagebus:x:81:

They also ended up in the sysroot's files:

$ grep messagebus
/data/OE/setup-scripts/build/tmp-angstrom_v2014_06-eglibc/sysroots/*/etc/{passwd,group}
/data/OE/setup-scripts/build/tmp-angstrom_v2014_06-eglibc/sysroots/genericx86-64/etc/passwd:messagebus:!:81:81::/var/lib/dbus:/bin/false
/data/OE/setup-scripts/build/tmp-angstrom_v2014_06-eglibc/sysroots/genericx86-64/etc/group:messagebus:x:81:

The USERADD_ERROR_DYNAMIC="1" setting would throw an error with
an obvious error message, but the above quoted message is not that one.

"bitbake -c devshell dbus" gives me a (pseudo?) root shell but /etc points
to the real /etc where the messagebus user and the messagebus and
netdev groups are not present and also, chown is /usr/sbin/chown.

Can this be the cause of the problem? If yes, how can I solve it without
modifying the host's passwd and group files?

The "pseudo-native" package was already built implicitly.
Installing fakeroot on the host (CentOS 7) didn't help.

Thanks in advance,
Zoltán Böszörményi


