Received: from ns.penguin.cz ([84.21.108.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <utx@penguin.cz>) id 1QRmtT-0000gC-Re
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jun 2011 16:59:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id E7E941417193;
	Wed,  1 Jun 2011 16:59:34 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id im36BnxrE3bm; Wed,  1 Jun 2011 16:59:34 +0200 (CEST)
Received: from [10.20.5.32] (nat.scz.novell.com [213.151.88.252])
	by ns.penguin.cz (Postfix) with ESMTP id BC10B1416BC5;
	Wed,  1 Jun 2011 16:59:34 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: Paul Menzel <paulepanter@users.sourceforge.net>
In-Reply-To: <1306933759.5710.2.camel@mattotaupa>
References: <1306933759.5710.2.camel@mattotaupa>
Date: Wed, 01 Jun 2011 16:56:22 +0200
Message-ID: <1306940182.23523.23.camel@oct.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.1 
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: gammu: task compile fails with `/oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/lib/libcurl.so: could not read symbols: File in wrong format`
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
X-List-Received-Date: Wed, 01 Jun 2011 14:59:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Paul Menzel wrote:
> Dear Stanislav,
> task compile of `gammu` fails with the following error message using
>         /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/lib/libcurl.so: could not read symbols: File in wrong format

Could you try to add curl to DEPENDS and try again (note that you have
to include do_configure call again). Maybe I overseen this dependency.

Well, the recipe contains one ugly FIXME. If somebody would be able to
locate target python includes better, feel free to fix it.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



