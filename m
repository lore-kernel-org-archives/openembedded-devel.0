Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1TZQAg-0000AA-RI
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Nov 2012 18:57:44 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id qAGHhh9h021132
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 16 Nov 2012 18:43:43 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1TZPx8-0004IU-Pr; Fri, 16 Nov 2012 18:43:42 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1353082752-8187-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<CAP9ODKqkKu_1zwX+PcA6DcE-yyVsD9VQDjB0Nwe0-sf8huM+Pg@mail.gmail.com>
Date: Fri, 16 Nov 2012 18:43:42 +0100
In-Reply-To: <CAP9ODKqkKu_1zwX+PcA6DcE-yyVsD9VQDjB0Nwe0-sf8huM+Pg@mail.gmail.com>
	(Otavio Salvador's message of "Fri, 16 Nov 2012 15:28:42 -0200")
Message-ID: <lyhaopjve9.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.83
X-Spam-Score: -5.5
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] gitpkgv.bbclass: cache GITPKGV result
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
X-List-Received-Date: Fri, 16 Nov 2012 17:57:44 -0000
Content-Type: text/plain

Otavio Salvador <otavio@ossystems.com.br> writes:

>> This patch caches the result of 'git rev-list' into the sources cache
>> directory and uses it on the next run.  Because collisions of the sha1
>> hash are very unlikely, the git revision is used directly as the key.
> ...
> I'd prefer to have the hashes cache in same DL_DIR so we don't have another
> directory there. It is a file so I see no need for another dir. What do you
> think?

good idea; I will submit an updated patch soon.


Enrico


