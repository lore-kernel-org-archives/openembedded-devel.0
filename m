Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1PAfOy-0002zf-BH
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Oct 2010 11:01:06 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id o9Q90JTW018253
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Oct 2010 11:00:20 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.72) (envelope-from <ensc@sigma-chemnitz.de>) id 1PAfPE-0001IF-U8
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Oct 2010 11:01:20 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
References: <4CC14738.9070309@nedap.com>
	<lyfwvvaftm.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<AANLkTinMHO=XRv=EDuVVmLcfjJoLETgW8rv96jEus_YE@mail.gmail.com>
	<lyd3qy5ysk.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<AANLkTi=aXZP1fhpW4Cj9yQLgbzhzKt9wwiac2_hJdvyO@mail.gmail.com>
Date: Tue, 26 Oct 2010 11:01:20 +0200
In-Reply-To: <AANLkTi=aXZP1fhpW4Cj9yQLgbzhzKt9wwiac2_hJdvyO@mail.gmail.com>
	(Khem Raj's message of "Mon, 25 Oct 2010 10:49:48 -0700")
Message-ID: <lyy69l5nvj.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
X-List-Received-Date: Tue, 26 Oct 2010 09:01:06 -0000
Content-Type: text/plain; charset=us-ascii

Khem Raj <raj.khem@gmail.com> writes:

>>>>> -    install -m 0755 src/cacaoh/.libs/cacaoh ${STAGING_BINDIR}/cacaoh-cldc-${PV}
>>>>> +    install -m 0755 src/cacaoh/cacaoh ${STAGING_BINDIR}/cacaoh-cldc-${PV}
>>
>> * libtool creates sometimes a wrapper script for executables (e.g. when
>>   they are linked against local libraries) and places the real executable
>>   in .libs/.  Manually installing one of them is error prone and it might
>>   break with other linker flags or libtool versions.
>
> the binary in .libs do not exist so the link is final in this case.

Really?  The author of the original recipe had an environment where the
executable was in .libs/.  Are you really sure that such an environment
does not exist anymore? Or will the recipe now silently fail by installing
the shell wrapper sometimes?


> but in any case If you can come up with a patch to install it using
> libtool that would be nice.

Sorry; providing a patch means testing it (regardless whether it is
trivial).  Here, I am not sure whether 'libtool' or the platform
prefixed '<arch>-libtool' is required and how to express
'<arch>-libtool' in oe.

I gave my comment to a patch which fixed a broken recipe by replacing it
with another broken recipe.  So I expect that the author of this patch
fixes and tests his work.

For completeness; install command should be

| libtool --mode=install install -m 0755 src/cacaoh/cacaoh ${STAGING_BINDIR}/cacaoh-cldc-${PV}



Enrico


