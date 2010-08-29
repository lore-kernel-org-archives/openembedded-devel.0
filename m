Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1OpjOY-0007uo-Us
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 17:02:07 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id o7TF1Y7U004398
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 17:01:35 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.72) (envelope-from <ensc@sigma-chemnitz.de>) id 1OpjO2-0001Ze-78
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 17:01:34 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
References: <1283086227-13224-1-git-send-email-eric@eukrea.com>
	<lysk1x5xk3.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20100829141015.GR17268@jama>
Date: Sun, 29 Aug 2010 17:01:34 +0200
In-Reply-To: <20100829141015.GR17268@jama> (Martin Jansa's message of "Sun, 29
	Aug 2010 16:10:15 +0200")
Message-ID: <lyy6bpmpip.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Scanned-By: MIMEDefang 2.68 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] alsa-utils-alsamixer: add ncurses-terminfo RDEPENDS
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
X-List-Received-Date: Sun, 29 Aug 2010 15:02:07 -0000
Content-Type: text/plain; charset=us-ascii

Martin Jansa <martin.jansa@gmail.com> writes:

>> > +RDEPENDS_alsa-utils-alsamixer = "ncurses-terminfo"
>> 
>> I think this should be solved in ncurses because it affects other
>> packages too; e.g. moving its /etc/terminfo files from 'ncurses' into
>> an own package and rrecommending this in the libtinfo package.
>
> I've already added this to few recipes:
> http://git.openembedded.org/cgit.cgi/openembedded/log/?qt=grep&q=terminfo

The 'ncurses-terminfo' is a large package (>500kB) and contains definitions
for exotic terminal.  The definitions on 'ncurses' take only 6kB and cover
perhaps 95% of all use cases (linux, xterm, vt100, screen).

I will move them into an own -terminfo-base package; atm I am not sure
whether I should write

| RSUGGESTS_${PN}-libtinfo = "${PN}-terminfo"
| RRECOMMENDS_${PN}-libtinfo = "${PN}-terminfo-base"

or

| RPROVIDES_${PN}-terminfo = "virtual/terminfo"
| RPROVIDES_${PN}-terminfo-base = "virtual/terminfo"
| RDEPENDS_${PN}-libtinfo = "virtual/terminfo"

I tend to the first variant.


Enrico


