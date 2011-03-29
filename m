Received: from harad.oktetlabs.ru ([89.163.14.95])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <helen@oktetlabs.ru>) id 1Q4XZ1-0000Op-T5
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Mar 2011 13:58:23 +0200
Received: from aule.oktetlabs.ru (aule.oktetlabs.ru [192.168.37.14])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by harad.oktetlabs.ru (Postfix) with ESMTPSA id 5E4CD7B4B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2011 15:31:10 +0400 (MSD)
Message-ID: <4D91C2FE.4000905@oktetlabs.ru>
Date: Tue, 29 Mar 2011 15:31:10 +0400
From: Elena Vengerova <helen@oktetlabs.ru>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.15) Gecko/20110307 Fedora/3.1.9-0.38.b3pre.fc13
	Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: patch 2.6 rejects relative paths
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
X-List-Received-Date: Tue, 29 Mar 2011 11:58:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I have patch 2.6.1 on my Fedora.
I've found out that it rejects patches like 
recipes/tcltk/tcl-8.5.8/mips-tclstrtod.patch with relative paths:

--- ../generic/tclStrToD.c.orig
+++ ../generic/tclStrToD.c

I failed to find the reason, but my colleague said me (she was unsure) 
that it was security hole fix.
Thus looks like it's no way to force patch behave like old one.

I wonder if some work around is possible (except patch downgrade) or 
it's necessary to fix the recipes.

Thanks,
     Helen


