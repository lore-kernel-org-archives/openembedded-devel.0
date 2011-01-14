Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1PdgNl-0005No-Dm
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Jan 2011 10:55:45 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id p0E9t7vC027286
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jan 2011 10:55:08 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.71) (envelope-from <ensc@sigma-chemnitz.de>) id 1PdgN8-0006ro-SQ
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Jan 2011 10:55:06 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
References: <1294928952-25833-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<4D2FC1F3.20504@gmail.com>
Date: Fri, 14 Jan 2011 10:55:06 +0100
In-Reply-To: <4D2FC1F3.20504@gmail.com> (Khem Raj's message of "Thu, 13 Jan
	2011 19:24:35 -0800")
Message-ID: <ly4o9b95dx.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.6
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,T_RP_MATCHES_RCVD,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.71 on 62.153.82.30
Subject: Re: [PATCH] zlib: substitute sharedlibdir
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
X-List-Received-Date: Fri, 14 Jan 2011 09:55:45 -0000
Content-Type: text/plain; charset=us-ascii

Khem Raj <raj.khem@gmail.com> writes:

>> @sharedlibdir@ is not substituted so that linkerflags in zlib.pc expand to
>> "... -L@sharedlibdir@" which breaks e.g. glib builds.
>
> I think zlib has --sharedlibdir configure option since 1.2.4.4+
> so you could try to use it instead of patching

afais, the ./configure will be completely replaced due to the
0001-autotools.patch (added by a2393dbf941554098).  So there exists no
such option anymore.


>> --- a/recipes/zlib/zlib-1.2.5/0001-autotools.patch
>> +++ b/recipes/zlib/zlib-1.2.5/0001-autotools.patch
>> @@ -33,7 +33,7 @@ new file mode 100644
>>   index 0000000..177c89a
>>   --- /dev/null
>>   +++ b/configure.ac


Enrico


