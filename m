Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1MdMGX-00035B-6Q
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 12:50:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 6BB7D140970B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 12:24:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IjMqcrQKumaA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 12:24:48 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 4311D1416BAB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 12:24:48 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1250567655-14771-1-git-send-email-msmith@cbnco.com>
References: <1250567655-14771-1-git-send-email-msmith@cbnco.com>
Date: Tue, 18 Aug 2009 12:33:05 +0200
Message-Id: <1250591585.3555.12.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: Re: [PATCH] glibc: fix hardcoded /sbin/ldconfig path
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
X-List-Received-Date: Tue, 18 Aug 2009 10:50:09 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Michael Smith wrote:

> -FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${datadir}/zoneinfo ${@base_conditional('USE_LDCONFIG', '1', '/sbin/ldconfig', '', d)}"
> +FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${datadir}/zoneinfo ${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig', '', d)}"

Did you test this change carefully? I seen this as well and tried
${@base_conditional('USE_LDCONFIG', '1', '${sbindir}/ldconfig', '', d)}

I don't know why, but it didn't work for me. If ${base_sbindir} works,
then I agree with your fix.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



