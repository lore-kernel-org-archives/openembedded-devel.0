Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1QJq0B-0005x0-Cc
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 18:41:40 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with SMTP id p4AGcnbr025294
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 18:38:50 +0200
Received: by ensc-virt.intern.sigma-chemnitz.de (sSMTP sendmail emulation);
	Tue, 10 May 2011 18:38:49 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
References: <4DC8F3A2.2090005@nedap.com> <20110510100020.GA10493@mx.loc>
	<1305022004.8000.149.camel@phil-desktop>
Date: Tue, 10 May 2011 18:38:49 +0200
In-Reply-To: <1305022004.8000.149.camel@phil-desktop> (Phil Blundell's message
	of "Tue, 10 May 2011 11:06:44 +0100")
Message-ID: <ly8vueldd2.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
X-List-Received-Date: Tue, 10 May 2011 16:41:40 -0000
Content-Type: text/plain; charset=us-ascii

Phil Blundell <philb@gnu.org> writes:

> "x86_64" seems to be what's currently used as the architecture name.  If
> you want a value for ${MACHINE} then I guess something like
> "x86_64-generic" would do.  I don't think there's any prohibition
> against underscores in machine names.

OVERRIDES don't work correctly with this. E.g. (bitbake 1.10) a recipe
with

| xx = "default"
| xx_x86_64 = "XX"

results into

| OVERRIDES="...:x86_64:..."
| # xx_x86_64=XX
| xx_x86_64="XX"
| # xx=default
| xx="default"


Adding an additional "x86-64" to OVERRIDES in the machine configuration
and using it by

| xx_x86-64 = "XX"

gives the expected

| # xx_x86-64=XX
| xx_x86-64="XX"
| # xx=XX
| xx="XX"



Enrico


