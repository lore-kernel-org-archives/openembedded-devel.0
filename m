Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1PDmFN-0002Zw-0s
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 23:56:01 +0100
Received: by qyk9 with SMTP id 9so168800qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Nov 2010 15:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=r+tGhI3ZRJd6vcpbreABj09yJ7nUDS+u2EUnMam9XNM=;
	b=rykrsLxx1perS5uFjFydYTWczVCzuluV2SnpnkEOlVza0kmv/mWKXLkRgOmeL8QKJ6
	Q2rj1djwbbANDB5xKtqWPb9d2RtKhc93vhzIVAsVZ2qw4ZJEEXDZPhUmhDC8jjETlCCp
	N3XZBZRzuSxJZngSOZ1wsrCpAS2abosXm0ooU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=jg8t3UfmEVgNoa9mLWoA8qMzFTJe1FgmfBDn+a4tJdT8LEbWrTZutfrQGz7lcS55Ku
	0qK2XpIjQloBOgUamNTj+UIby7l65GK0MxqnoTxpzDpwSumN2Os6J/cpQYv9wFJUeotg
	M82oeP+QWR3RSb5nduNe7k9iiBdNbbYhWzcL8=
MIME-Version: 1.0
Received: by 10.229.91.75 with SMTP id l11mr18099194qcm.24.1288824908241; Wed,
	03 Nov 2010 15:55:08 -0700 (PDT)
Received: by 10.229.8.210 with HTTP; Wed, 3 Nov 2010 15:55:08 -0700 (PDT)
Date: Wed, 3 Nov 2010 15:55:08 -0700
Message-ID: <AANLkTik9vuL4RR0x1mn_dSGXP2r2dn1RrgbOyxqYw+TD@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: problems building openldap and libtool
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
X-List-Received-Date: Wed, 03 Nov 2010 22:56:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

I am having an issue of how libtool is building on my machine. I am
running Ubuntu 10.10 64bit Kernel 2.6.35-23-generic bitbake 1.10.1
overo branch. Here is what happens when building:

Error for openldap
NOTE: package openldap-2.4.23-r2: task do_configure: Started
ERROR: Function do_configure failed
NOTE: Task failed: ('function do_configure failed',
'/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/openldap-2.4.23-r2/temp/log.do_configure.12815')
ERROR: Logfile of failure stored in:
/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/openldap-2.4.23-r2/temp/log.do_configure.12815
Log data follows:
| cp: cannot stat
`/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/libtool/ltmain.sh':
No such file or directory
| ERROR: Function do_configure failed
NOTE: package openldap-2.4.23-r2: task do_configure: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/openldap/openldap_2.4.23.bb
do_configure failed
ERROR: Task 6423
(/home/vdubhack/overo-oe/org.openembedded.dev/recipes/openldap/openldap_2.4.23.bb,
do_configure) failed with 256

location libtool actually is being installed to
vdubhack@FEDUAV:~/overo-oe$ find tmp/sysroots -name "ltmain.sh"
tmp/sysroots/armv7a-angstrom-linux-gnueabi/home/vdubhack/overo-oe/tmp/sysroots/x86_64-linux/usr/share/libtool/ltmain.sh
tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/doc/gettext/examples/hello-c++-kde/admin/ltmain.sh
tmp/sysroots/x86_64-linux/usr/share/doc/gettext/examples/hello-c++-kde/admin/ltmain.sh
tmp/sysroots/x86_64-linux/usr/share/libtool/config/ltmain.sh

Problem location:
vdubhack@FEDUAV:~/overo-oe$ find tmp/sysroots -name "ltmain.sh"
tmp/sysroots/armv7a-angstrom-linux-gnueabi/home/vdubhack/overo-oe/tmp/sysroots/x86_64-linux/usr/share/libtool/ltmain.sh

aclocal and aclocal-1.11 also get installed this way


I can manually work around this by copying the file its not finding to
the location its asking but I am not sure thats really fixing any of
the problem. Also do not understand why aclocal and aclocal-1.11 are
being built in the same manner of libtool. Does anyone have any
suggestions on how to properly fix this ? Thanks for any help on this
one.


