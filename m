Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1PAKgK-0000dj-Cl
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 12:53:45 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id o9PAqJrC016775
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 12:52:20 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.72) (envelope-from <ensc@sigma-chemnitz.de>) id 1PAKfz-0002NZ-U3
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 12:53:15 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
References: <4CC14738.9070309@nedap.com>
	<lyfwvvaftm.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<AANLkTinMHO=XRv=EDuVVmLcfjJoLETgW8rv96jEus_YE@mail.gmail.com>
Date: Mon, 25 Oct 2010 12:53:15 +0200
In-Reply-To: <AANLkTinMHO=XRv=EDuVVmLcfjJoLETgW8rv96jEus_YE@mail.gmail.com>
	(Khem Raj's message of "Sun, 24 Oct 2010 11:36:37 -0700")
Message-ID: <lyd3qy5ysk.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Scanned-By: MIMEDefang 2.68 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] cacaoh: patches to get do_install do its work
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
X-List-Received-Date: Mon, 25 Oct 2010 10:53:45 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Khem Raj <raj.khem@gmail.com> writes:

>>> - =A0 =A0install -m 0755 src/cacaoh/.libs/cacaoh ${STAGING_BINDIR}/caca=
oh-cldc-${PV}
>>> + =A0 =A0install -m 0755 src/cacaoh/cacaoh ${STAGING_BINDIR}/cacaoh-cld=
c-${PV}
>>
>> This is the wrong way to install libtool binaries/libraries. =A0Please
>> use 'libtool --mode=3Dinstall install -m ...' (or the platform prefixed
>> 'libtool' program).
>
> whats the difference ?

* 'libtool --mode=3Dinstall' is the documented way[1] to install libtool
  binaries (in case of libraries, a 'libtool --mode=3Dfinish' might be
  required too)

* libtool creates sometimes a wrapper script for executables (e.g. when
  they are linked against local libraries) and places the real executable
  in .libs/.  Manually installing one of them is error prone and it might
  break with other linker flags or libtool versions.


Enrico

Footnotes:=20
[1]  info libtool -> Installing libraries + Installing executables



