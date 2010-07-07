Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1OWQkm-0001n6-Dm
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 11:17:16 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.3) with ESMTP id o679CM41020653
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 7 Jul 2010 11:12:23 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.72) (envelope-from <ensc@sigma-chemnitz.de>) id 1OWQg1-0000qs-Iz
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 11:12:22 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
References: <AANLkTik1mhR1trtNfJcNrehMg0gs2lNSXyp51PPpaSPu@mail.gmail.com>
	<lyeifgcyxm.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1278439840.30247.3632.camel@rex>
	<AANLkTimI2cM6ehyfx2VQ3FnZiwxkl1SiXJG4Gf4gCGLR@mail.gmail.com>
Date: Wed, 07 Jul 2010 11:12:21 +0200
In-Reply-To: <AANLkTimI2cM6ehyfx2VQ3FnZiwxkl1SiXJG4Gf4gCGLR@mail.gmail.com>
	(Khem Raj's message of "Tue, 6 Jul 2010 11:46:19 -0700")
Message-ID: <lysk3v8xl6.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Scanned-By: MIMEDefang 2.68 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: native glibc-initial-2.9 unpack error
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
X-List-Received-Date: Wed, 07 Jul 2010 09:17:17 -0000
Content-Type: text/plain; charset=us-ascii

Khem Raj <raj.khem@gmail.com> writes:

> right. OE needed a fix too
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=5ac52371b09a25518b60e23e80c8c812cdea6e36
>
> which means that bitbake fix should also go
> into 1.8 an 1.10 to keep building oe .dev with those versions of bitbake.

I still think that adding a small fix to OE like

| if type == 'file' and host != '':
| 	path = host + path

after the bb.decodeurl() call would be better than to require that
everybody uses a patched bitbake version.



Enrico


