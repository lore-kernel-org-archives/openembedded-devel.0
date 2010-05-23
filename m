Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1OGEN2-0008N0-4F
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 May 2010 18:49:48 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.3/8.14.4) with ESMTP id o4NGjbBv009890
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 23 May 2010 18:45:37 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.71) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1OGEIy-00028b-VT; Sun, 23 May 2010 18:45:37 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Chris Larson <clarson@kergoth.com>
References: <1268739774-10002-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1274619132-32390-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<AANLkTimyqUYuSfWUQZdwn1Q2KrojnjvsUqLSCX9H_FMa@mail.gmail.com>
	<lyhblyk2ox.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<AANLkTim5GfCsCgW9Bnn4auW9fuN-5L7wDC9PI8ISeX59@mail.gmail.com>
Date: Sun, 23 May 2010 18:45:36 +0200
In-Reply-To: <AANLkTim5GfCsCgW9Bnn4auW9fuN-5L7wDC9PI8ISeX59@mail.gmail.com>
	(Chris Larson's message of "Sun, 23 May 2010 09:36:35 -0700")
Message-ID: <lyd3wmk1n3.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
X-List-Received-Date: Sun, 23 May 2010 16:49:48 -0000
Content-Type: text/plain; charset=us-ascii

Chris Larson <clarson@kergoth.com> writes:

>> >> This patch allows to pass quoted strings in EXTRA_OECONF.
>>
> I fail to see how this is a problem.  Seems to work fine for every
> other app, including make.

EXTRA_OEMAKE handling is implemented as

| ${MAKE} ${EXTRA_OEMAKE} "$@"

but EXTRA_OECONF as

| cfgcmd="... ${EXTRA_OECONF} $@"
| $cfgcmd


'make' arguments are expanded by bitbake which preserve the quoting.

The EXTRA_OECONF content was put into a shell variable and this variable
be executed.  This does not preserve quoting (and I am not aware of any
way how this can be with variable assignments).


> Is configure's argument passing that stupid, that it can't split by =
> and use the right side for the value?

It is not a configure issue, but a shell one.


Enrico


