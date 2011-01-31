Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1PjrGJ-0005At-Uo
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 11:45:36 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id p0VAiexf022454
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jan 2011 11:44:42 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.71) (envelope-from <ensc@sigma-chemnitz.de>) id 1PjrFQ-0000ee-HI
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 11:44:40 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
References: <1296240753-10120-1-git-send-email-tom_rini@mentor.com>
	<1296240753-10120-3-git-send-email-tom_rini@mentor.com>
Date: Mon, 31 Jan 2011 11:44:40 +0100
In-Reply-To: <1296240753-10120-3-git-send-email-tom_rini@mentor.com> (Tom
	Rini's message of "Fri, 28 Jan 2011 11:52:30 -0700")
Message-ID: <lyy661s67b.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.2
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,SPF_NEUTRAL,T_RP_MATCHES_RCVD,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.71 on 62.153.82.30
Subject: Re: [PATCH 2/5] perl-native: Switch to userelocatableinc and not shared libperl
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
X-List-Received-Date: Mon, 31 Jan 2011 10:45:36 -0000
Content-Type: text/plain; charset=us-ascii

Tom Rini <tom_rini@mentor.com> writes:

> -	for PERLSCRIPT in `grep -rIl ${bindir}/perl ${D}${bindir}`; do
> -		sed -i -e 's|^#!${bindir}/perl|#!/usr/bin/env perl|' $PERLSCRIPT
> +	for PERLSCRIPT in `grep -rIEl '#!.*/perl' ${D}${bindir}`; do
> +		sed -i -e '1s|^#!.*|#!/usr/bin/env perl|' $PERLSCRIPT

This will break shebang lines with interpreter options (e.g. 
'#! /usr/bin/perl -T'):

| $ echo '#! /usr/bin/env perl -T' > /tmp/x.pl
| $ chmod +x /tmp/x.pl
| $ /tmp/x.pl
| /usr/bin/env: perl -T: No such file or directory



Enrico


