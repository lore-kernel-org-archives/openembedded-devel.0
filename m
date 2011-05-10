Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1QJq50-000645-1N
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 18:46:38 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with SMTP id p4AGhom1025823
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 18:43:50 +0200
Received: by ensc-virt.intern.sigma-chemnitz.de (sSMTP sendmail emulation);
	Tue, 10 May 2011 18:43:50 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
References: <4DC8F3A2.2090005@nedap.com> <20110510100020.GA10493@mx.loc>
	<1305022004.8000.149.camel@phil-desktop> <4DC91B33.9080807@nedap.com>
	<1305025696.8000.155.camel@phil-desktop> <4DC91E4E.3070109@nedap.com>
	<4DC9363B.6070909@nedap.com> <1305038299.8000.178.camel@phil-desktop>
	<4DC9541B.6070208@nedap.com>
	<lyiptilga8.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<Pine.LNX.4.64.1105101144120.12200@juice.ott.cti.com>
Date: Tue, 10 May 2011 18:43:50 +0200
In-Reply-To: <Pine.LNX.4.64.1105101144120.12200@juice.ott.cti.com> (Michael
	Smith's message of "Tue, 10 May 2011 11:47:10 -0400 (EDT)")
Message-ID: <ly7h9yld4p.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
X-List-Received-Date: Tue, 10 May 2011 16:46:38 -0000
Content-Type: text/plain; charset=us-ascii

Michael Smith <msmith@cbnco.com> writes:

>> did this ever work?  OE uses hardcoded 'lib' (instead of 'lib64') at
>> various places.
>
> This is my MACHINE config:
> ...
> # Some packages install files into /lib/packagename, not /lib64/packagename.
> FILES_${PN} += "${prefix}/lib/${PN}/*"
> FILES_${PN}-dbg += "${prefix}/lib/${PN}/.debug"

I think, this will break/change some packages...


After creating (manually) lib64 -> lib symlinks in the sysroot, I managed
to build a non trivial 64-bit system (e.g. with vdr and perl stuff) with
(nearly) standard settings (2011.03-maintenance).  But necessary tricks
like the BUILD_VENDOR and some minor fixes (like these in openssl) caused
me to see this as very experimental.


> And gcc-cross:
> EXTRA_OECONF_append_x86_64 = " --disable-multilib"

should not be needed anymore; flag is set by
847c0dadb9f55af5cc4556486cde3d9dcc2129af


Enrico


