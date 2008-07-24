Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KLwvb-00066o-Jn
	for openembedded-devel@openembedded.org; Thu, 24 Jul 2008 11:16:03 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KLwuO-0005h7-56
	for openembedded-devel@openembedded.org; Thu, 24 Jul 2008 09:14:48 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 24 Jul 2008 09:14:48 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 24 Jul 2008 09:14:48 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 24 Jul 2008 11:14:40 +0200
Message-ID: <g69h61$qvv$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird/3.0a2pre (Macintosh; 2008062403)
Sender: news <news@ger.gmane.org>
Subject: [RFC] changing staging layout based on MULTIMACH_TARGET_SYS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Thu, 24 Jul 2008 09:16:03 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Lately I've been encountering various build problems that are caused by 
OE lumping all my ARM build together in 
staging/arm-angstrom-linux-gnueabi, which isn't quite right for the 
following reasons:

* it mixes hard- and softfloat when doing armv5te and armv6 builds, 
which introduces subtle compilation problems. The resulting binaries 
work fine together on the target, as one would expect with EABI, but 
mixing them in staging leads to troubles

* In an ideal world we would use a single compiler version for all 
subarchs, but for arm we use 4.2.4 for armv4, armv4t, armv5te and armv6, 
but 4.3.1 for armv7a. C++ apps don't like that

* You can end up statically linking an armv6 lib into an armv5te application

The same problems exist for powerpc (ppc405 vs ppc603e).

The change basically boils down to this on bitbake.conf:

-STAGING_BINDIR_CROSS  = "${STAGING_DIR_NATIVE}${layout_bindir}/${HOST_SYS}"
+STAGING_BINDIR_CROSS  = 
"${STAGING_DIR_NATIVE}${layout_bindir}/${MULTIMACH_HOST_SYS}"

-STAGING_DIR_HOST = "${STAGING_DIR}/${HOST_SYS}"
+STAGING_DIR_HOST = "${STAGING_DIR}/${MULTIMACH_HOST_SYS}"


-STAGING_DIR_TARGET = "${STAGING_DIR}/${TARGET_SYS}"
+STAGING_DIR_TARGET = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}"

Richard and I have been talking about this for a while now and the 
change landed in Poky last week.

This is however an ABI break for staging, so we need to do this as well:

--- conf/sanity.conf	2008/07/19 11:57:00	4892
+++ conf/sanity.conf	2008/07/19 11:59:42	4893
@@ -11,7 +11,7 @@
  # that breaks the format and have been previously discussed on the 
mailing list
  # with general agreement from the core team.
  #
-SANITY_ABI = "1"
+SANITY_ABI = "2"
  SANITY_ABIFILE = "${TMPDIR}/abi_version"

And as the diff points out, ABI breaks have to be discussed on the 
mailinglist.

I'd like to apply this right after the toolchain build order changes to 
minimize the number of full rebuilds people have to do.

Comments, objections?

regards,

Koen



