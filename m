Received: from [212.227.126.188] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <christian.glindkamp@taskit.de>) id 1M1i6Z-0004Mg-Sg
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 May 2009 16:28:16 +0200
Received: from localhost.localdomain (port-87-234-225-18.static.qsc.de
	[87.234.225.18])
	by mrelayeu.kundenserver.de (node=mreu1) with ESMTP (Nemesis)
	id 0MKv1o-1M1i0j0Tm2-000jAN; Wed, 06 May 2009 16:22:13 +0200
Received: from christian.taskit.de (unknown [192.168.4.114])
	by localhost.localdomain (Postfix) with ESMTP id 3E55A7B78B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 May 2009 16:20:41 +0200 (CEST)
Date: Wed, 6 May 2009 16:22:12 +0200
From: Christian Glindkamp <christian.glindkamp@taskit.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090506162212.7cd43f30@christian.taskit.de>
X-Mailer: Claws Mail 3.7.1 (GTK+ 2.14.4; i486-pc-linux-gnu)
Mime-Version: 1.0
X-Provags-ID: V01U2FsdGVkX19jop64E+tse2j2I6s2gOKtrL7zmIpqdklQ2y7
	mi+iD8e8oMRoCZaFuBOi11PXuU4DEKpokUy6t4yQK0TV+owjh0
	+ChgvtA/9Fd3kjD5WfDnw==
Subject: Building jamvm and cacao (cacao is missing a patch)
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
X-List-Received-Date: Wed, 06 May 2009 14:28:16 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

I'm trying to build jamvm from stable/2009. This implicitly builds cacao.
As I see it this happens because cacao provides java2-runtime and classpath
rdepends on it. The problem is, that cacao does not build because of a missing
patch. In revision af5fcda66139e002d098c0df952b43c455806aba
cacao-disable-stackbase-check.patch was added to SRC_URI but the patch itself
was not committed. Reverting the commit at least allowed me to continue the
build of jamvm.

I also checked the dev branch and it is missing the patch, too. So this patch
should be added to both branches (or the patch removed from SRC_URI if it is
obsolete).

On a sidenote: Why is bitbake building cacao at all, jamvm already provides
java2-runtime?

Regards,
Christian Glindkamp



