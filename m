Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1QK6NE-0007ET-Jl
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 May 2011 12:10:32 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with SMTP id p4BA7eJS007900
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 May 2011 12:07:42 +0200
Received: by ensc-virt.intern.sigma-chemnitz.de (sSMTP sendmail emulation);
	Wed, 11 May 2011 12:07:40 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
References: <4DC8F3A2.2090005@nedap.com> <20110510100020.GA10493@mx.loc>
	<1305022004.8000.149.camel@phil-desktop>
	<ly8vueldd2.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1305059419.3355.108.camel@lenovo.internal.reciva.com>
Date: Wed, 11 May 2011 12:07:40 +0200
In-Reply-To: <1305059419.3355.108.camel@lenovo.internal.reciva.com> (Phil
	Blundell's message of "Tue, 10 May 2011 21:30:19 +0100")
Message-ID: <ly62phpn2r.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -1.3
X-Spam-Level: -
X-Spam-Tests: AWL,BAYES_00,SPF_NEUTRAL,T_RP_MATCHES_RCVD
X-Scanned-By: MIMEDefang 2.71 on 62.153.82.30
Subject: Re: x86_64
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
X-List-Received-Date: Wed, 11 May 2011 10:10:32 -0000
Content-Type: text/plain; charset=us-ascii

Phil Blundell <philb@gnu.org> writes:

> Changing the architecture to x86-64 would be a possibility, 

no; will cause too much pain because all the ./config.guess scripts
expect 'x86_64'.

I kept TARGET_ARCH='x86_64' but added an additional OVERRIDES where '_'
is replaced by '-'.


Enrico


