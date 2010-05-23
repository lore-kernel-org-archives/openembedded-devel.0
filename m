Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1OGE14-0003zO-Nb
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 May 2010 18:27:07 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.3/8.14.4) with ESMTP id o4NGMtVE006599
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 23 May 2010 18:22:55 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.71) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1OGDx0-000281-Ro; Sun, 23 May 2010 18:22:54 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Chris Larson <clarson@kergoth.com>
References: <1268739774-10002-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1274619132-32390-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<AANLkTimyqUYuSfWUQZdwn1Q2KrojnjvsUqLSCX9H_FMa@mail.gmail.com>
Date: Sun, 23 May 2010 18:22:54 +0200
In-Reply-To: <AANLkTimyqUYuSfWUQZdwn1Q2KrojnjvsUqLSCX9H_FMa@mail.gmail.com>
	(Chris Larson's message of "Sun, 23 May 2010 07:21:50 -0700")
Message-ID: <lyhblyk2ox.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.1 (gnu/linux)
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
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH (updated)] autotools.bbclass: enhanced oe_runconf() to accept quoted arguments
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
X-List-Received-Date: Sun, 23 May 2010 16:27:07 -0000
Content-Type: text/plain; charset=us-ascii

Chris Larson <clarson@kergoth.com> writes:

>> This patch allows to pass quoted strings in EXTRA_OECONF.  E.g. with
>> this patch, it is possible to do
>>
>> | EXTRA_OECONF = "--with-build-cflags='${BUILD_CFLAGS}'"
>>
>> where 'BUILD_CFLAGS' contains multiple, whitespace separated arguments.
>>
>
> I don't think that doing EXTRA_OECONF =
> "'--with-build-cflags=${BUILD_CFLAGS}'"
>
> is that much more difficult, and works today, unless I'm missing
> something?

It does not work today... E.g. try the recipe

---- xxx.bb -----
EXTRA_OECONF = "--with-build-cflags='-O2 -g3 --help'"

inherit autotools

do_unpack() {
    mkdir -p ${S}
    echo 'AC_INIT()' > ${S}/configure.ac
}
----


Without the patch, there will be called

| $ ./bitbake -b /tmp/xxx.bb -c configure -f -D
| ...
| + ..../configure ...  '--with-build-cflags='\''-O2' -g3 '--help'\'''

and with the patch

| + ..../configure ...  '--with-build-cflags=-O2 -g3 --help'



Enrico


