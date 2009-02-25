Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1LcSTB-00031S-9M
	for openembedded-devel@openembedded.org; Wed, 25 Feb 2009 23:43:35 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 446DA1409347
	for <openembedded-devel@openembedded.org>;
	Wed, 25 Feb 2009 23:40:58 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kXs3nNOG8rv5 for <openembedded-devel@openembedded.org>;
	Wed, 25 Feb 2009 23:40:58 +0100 (CET)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 0ED081417191
	for <openembedded-devel@openembedded.org>;
	Wed, 25 Feb 2009 23:40:57 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@openembedded.org
Date: Wed, 25 Feb 2009 23:39:59 +0100
Message-Id: <1235601599.7701.32.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: How to package locale files outside /usr/share/locale?
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
X-List-Received-Date: Wed, 25 Feb 2009 22:43:53 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I wanted to package locale dependent files to -locale- packages.

Is there anything simpler than following code?

python populate_packages_prepend () {
	mcdir = bb.data.expand('${datadir}/mc', d)
	do_split_packages(d, mcdir, '^mc\.[hm][ile][npn].*\.(.*)$',
		output_pattern='mc-locale-%s',
		description='%s translation for mc')
}
(packages/mc/mc.inc)


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



