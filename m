Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1OKtcq-0006yH-2s
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 15:41:24 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.3/8.14.4) with ESMTP id o55Db09a029195
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 5 Jun 2010 15:37:00 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.71) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1OKtYZ-00008j-Uf; Sat, 05 Jun 2010 15:36:59 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
References: <A24693684029E5489D1D202277BE89445316FB43@dlee02.ent.ti.com>
	<20100605055722.GR16035@jama>
Date: Sat, 05 Jun 2010 15:36:59 +0200
In-Reply-To: <20100605055722.GR16035@jama> (Martin Jansa's message of "Sat, 5
	Jun 2010 07:57:22 +0200")
Message-ID: <lypr058utg.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
Cc: martin.jansa@gmail.com
Subject: Re: We need newer ncurses Was: Host Environment affect on target builds
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
X-List-Received-Date: Sat, 05 Jun 2010 13:41:24 -0000
Content-Type: text/plain; charset=us-ascii

Martin Jansa <martin.jansa@gmail.com> writes:

> BTW: 5.4 is >6years old, 5.7 ~2years old (latest)
>
> Is someone already working on newer ncurses recipes?

https://www.cvg.de/people/ensc/ncurses_5.7.bb

Problem with ncurses is, that it needs a patched autoconf 2.13 to do
the full autoconf step.  Recipe above uses shipped ./configure. Newer
ncurses need some termcap/tinfo related changes in multiple packages
too and I did not had time to clean them all up for submission.


Enrico


