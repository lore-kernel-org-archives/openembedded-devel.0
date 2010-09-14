Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OvUSR-0007N8-UJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Sep 2010 14:19:58 +0200
Received: by qwa26 with SMTP id 26so3765144qwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Sep 2010 05:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=m6YYz6IXdds0lvmxAn426C2vKU5tc6xEZzphf9nSeKk=;
	b=RBXU5R9+DLpzDiAFHmsftyQfpj0TdJSTXcdqkoQ9bw2VYW6RLjnsE64W74IlMLcl8Q
	oQtpAD60RYiw1XuoaQC+eUua6DCvvZCcN5N6kDoSqcH+wHxOhz8N4BeKH8VRD+XMpuE9
	ohhaaesS56M65gVbq+4+uwxiTCu/MtiKoqP38=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=lEKaSoU/1cW8iwhdn5/MfLQ1EtYhIRtH0asIcHqQXBM/H5ldeYihQSZ6ktkoWGtscJ
	0/G9hUTL+fbzOr1/0qqAHBpXsqmc7tRa7NnkFvtYfCD+jxMAhgAWA8IhkVQC3Noq2bBL
	NMvRqdZL4YyP7tAdG9l5ZSpmAuY69fBAKuWJE=
MIME-Version: 1.0
Received: by 10.229.192.21 with SMTP id do21mr4373677qcb.57.1284466627363;
	Tue, 14 Sep 2010 05:17:07 -0700 (PDT)
Received: by 10.229.71.78 with HTTP; Tue, 14 Sep 2010 05:17:07 -0700 (PDT)
Date: Tue, 14 Sep 2010 14:17:07 +0200
Message-ID: <AANLkTi=dxxtk=ajzU2a4ZrGZU0DMqgB-+RmrNabJYycH@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: klcc-cross packaging issues
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
X-List-Received-Date: Tue, 14 Sep 2010 12:20:44 -0000
X-List-Received-Date: Tue, 14 Sep 2010 12:20:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I'm getting lost with this klibc recipe mixing buildhost and target...

I'd appreciate some advices about proper packaging for klcc-cross
(split from klibc recipe).

In order to remove the legacy do_stage from the recipe it sorted out
the perl-crosscompiler-wrapper (klcc) cannot be installed by the same
klibc recipe which packages target stuff.

So, klcc has now its own -cross recipe and is installed as
${D}${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}klcc but somehow is not
packaged (NOTE: the following files were installed but not shipped in
any package: TMPDIR/sysroots/i686-linux/usr/armv5te/bin/arm-angstrom-linux-gnueabi-klcc)

The issue raises now: the klcc-cross ipk is not created because it's
empty (nothing to install for target here).
Though, the staging-klcc-cross ipk seems sane, being that it contains
the crosscompiler and a correct fixme path.

Anyway, all's fine until here, one can build e.g. kexec-tools-klibc
from scratch or from packaged-staging and the build will succeed..

Still, the NOTE suggests there is a packaging issue.
So, what to do with this 'dummy' ipk? Recipes needing to build against
klibc are inheriting klibc.bbclass which adds dependency on klcc-cross
(which DEPENDS on klibc).


Thanks in advance

Andrea


P.S. Second doubt, somehow unrelated, is the presence of
${base_bindir}/klcc in the klibc recipe. Should this file be removed
in e.g. do_install_append? Is this intended to do builds on target
(not cross?)


