Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1OULFr-0001s9-NS
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 17:00:44 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.3/8.14.3) with ESMTP id o61EtnOq000974
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 1 Jul 2010 16:55:51 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.72) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1OULB6-0004WG-OH; Thu, 01 Jul 2010 16:55:48 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
References: <4C2AC77A.70102@gmail.com> <4C2ACDE8.7080801@gmail.com>
Date: Thu, 01 Jul 2010 16:55:48 +0200
In-Reply-To: <4C2ACDE8.7080801@gmail.com> (Graham Gower's message of "Wed, 30
	Jun 2010 14:24:00 +0930")
Message-ID: <lyfx03gsjv.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Scanned-By: MIMEDefang 2.68 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] opkg recipe overhaul - removal of opkg-nogpg and opkg-nogpg-nocurl.
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
X-List-Received-Date: Thu, 01 Jul 2010 15:00:44 -0000
Content-Type: text/plain; charset=us-ascii

Graham Gower <graham.gower@gmail.com> writes:

> None of the distros in OE 

At least the openmoko SHR distribution fetches ipkg from network and
requires curl support hence.


> appear to want/need gpg or curl support in opkg; so have opkg.inc
> remove them by default.

I do not think that supporting only offline mode (due to removal of
curl support) is a good idea.  Although the opportunistic signature
verification is not secure, it would be imo bad to remove gpg support
completely because updating embedded devices in a secure manner is
important.

A better way might be to conditionalize your '--disable-*' options
resp. make them depend on some DISTRO_FEATURE.


> +EXTRA_OECONF += " --disable-gpg \ 
> +                  --disable-openssl \ 
> +                  --disable-ssl-curl \
> +                  --disable-curl"


Enrico


