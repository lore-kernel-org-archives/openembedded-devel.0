Received: from libra.cs.put.poznan.pl ([150.254.30.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <przemyslaw.wesolek@cs.put.poznan.pl>)
	id 1NSFbw-0000dK-1P for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jan 2010 21:02:39 +0100
Received: from kas30pipe.localhost (unknown [127.0.0.1])
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id C2F96A7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jan 2010 20:00:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cs.put.poznan.pl
Received: from libra.cs.put.poznan.pl ([127.0.0.1])
	by localhost (libra.cs.put.poznan.pl [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id ZIkdUmfoVtgn
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jan 2010 21:00:17 +0100 (CET)
Received: from [150.254.31.31] (idss-pw.cs.put.poznan.pl [150.254.31.31])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id 8A1A6A4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jan 2010 21:00:13 +0100 (CET)
Message-ID: <4B439A5A.9030908@cs.put.poznan.pl>
Date: Tue, 05 Jan 2010 21:00:26 +0100
From: Przemyslaw Wesolek <przemyslaw.wesolek@cs.put.poznan.pl>
Organization: Poznan University of Technology
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.96.0
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0278], KAS30/Release
X-SpamTest-Info: Not protected
X-SA-Exim-Connect-IP: 150.254.30.30
X-SA-Exim-Mail-From: przemyslaw.wesolek@cs.put.poznan.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: ushare_hg problems
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
X-List-Received-Date: Tue, 05 Jan 2010 20:02:39 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit

After commit f60bce0c2475242b733b28998b2de5c7b6e01a4c, I have problems
parsing newly added recipes/ushare/ushare_hg.bb:

> NOTE: Handling BitBake files: \ (4122/7940) [51 %]ERROR: SRCREV was used yet no valid SCM was found in SRC_URI
> NOTE: <class 'bb.fetch.ParameterError'>: while evaluating:
> ${@bb.fetch.get_srcrev(d)}
> NOTE: <class 'bb.fetch.ParameterError'>: while evaluating:
> r1+hg${SRCPV}
> NOTE: <class 'bb.fetch.ParameterError'>: while evaluating:
> ${PN}-${EXTENDPE}${PV}-${PR}
> NOTE: <class 'bb.fetch.ParameterError'>: while evaluating:
> ${TMPDIR}/work/${MULTIMACH_TARGET_SYS}/${PF}
> NOTE: <class 'bb.fetch.ParameterError'>: while evaluating:
> ${WORKDIR}/ushare
> NOTE: <class 'bb.fetch.ParameterError'>: while evaluating:
> ${S}
> ERROR:  while parsing /home/jest/miszmasz/angstrom.dev/openembedded/recipes/ushare/ushare_hg.bb
> NOTE: Handling BitBake files: | (7940/7940) [100 %]
> NOTE: Parsing finished. 7306 cached, 310 parsed, 323 skipped, 0 masked.
> ERROR: Parsing errors found, exiting...

Przemek


