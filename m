Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1QJp14-0002Y1-Nu
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 17:38:30 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with SMTP id p4AFZhmV016548
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 17:35:44 +0200
Received: by ensc-virt.intern.sigma-chemnitz.de (sSMTP sendmail emulation);
	Tue, 10 May 2011 17:35:43 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
References: <4DC8F3A2.2090005@nedap.com> <20110510100020.GA10493@mx.loc>
	<1305022004.8000.149.camel@phil-desktop> <4DC91B33.9080807@nedap.com>
	<1305025696.8000.155.camel@phil-desktop> <4DC91E4E.3070109@nedap.com>
	<4DC9363B.6070909@nedap.com> <1305038299.8000.178.camel@phil-desktop>
	<4DC9541B.6070208@nedap.com>
Date: Tue, 10 May 2011 17:35:43 +0200
In-Reply-To: <4DC9541B.6070208@nedap.com> (Jaap de Jong's message of "Tue, 10
	May 2011 17:04:59 +0200")
Message-ID: <lyiptilga8.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
X-List-Received-Date: Tue, 10 May 2011 15:38:30 -0000
Content-Type: text/plain; charset=us-ascii

Jaap de Jong <jaap.dejong@nedap.com> writes:

> TARGET_ARCH       = "x86_64"

did this ever work?  OE uses hardcoded 'lib' (instead of 'lib64') at
various places.  At least gcc has

| #define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"

which causes 64 bit binaries to look for the interpreter at /lib64.

I recall issues with openssl too which autodetects lib64 directories but
OE packages lib only.



Enrico


