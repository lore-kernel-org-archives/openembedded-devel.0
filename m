Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1QEj5j-0003wF-BA
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 16:18:15 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with SMTP id p3QEFgwo014548
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2011 16:15:42 +0200
Received: by ensc-virt.intern.sigma-chemnitz.de (sSMTP sendmail emulation);
	Tue, 26 Apr 2011 16:15:42 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
References: <1303813776-6345-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1303821303-447-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<ip6ijr$k1a$1@dough.gmane.org>
Date: Tue, 26 Apr 2011 16:15:42 +0200
In-Reply-To: <ip6ijr$k1a$1@dough.gmane.org> (Koen Kooi's message of "Tue, 26
	Apr 2011 15:50:50 +0200")
Message-ID: <lywrihp08h.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -1.3
X-Spam-Level: -
X-Spam-Tests: AWL,BAYES_00,SPF_NEUTRAL,T_RP_MATCHES_RCVD
X-Scanned-By: MIMEDefang 2.71 on 62.153.82.30
Subject: Re: [PATCH, v2] openssl: enforce libdir=lib
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
X-List-Received-Date: Tue, 26 Apr 2011 14:18:15 -0000
Content-Type: text/plain; charset=us-ascii

Koen Kooi <koen@dominion.thruhere.net> writes:

>> +	perl ./Configure ${EXTRA_OECONF} shared --prefix=$useprefix --libdir=`basename ${libdir}`
>
> Why not plain ${base_libdir}?

openssl's '--libdir' option expects a relative name. E.g. there is done

| $libdir="lib$multilib" if $libdir eq "";
| ...
| 	s/^LIBDIR=.*$/LIBDIR=$libdir/;
| ...
|		my $foo = "$prefix/$libdir/engines";

in Configure and

|	    echo 'libdir=$${exec_prefix}/$(LIBDIR)'; \

in Makefile.


Using absolute paths (as in ${base_libdir}) would create paths with
double '/'.  Perhaps, this would be a cosmetical issue only but using
plain 'lib' (or 'lib64') is better imo.


Enrico


