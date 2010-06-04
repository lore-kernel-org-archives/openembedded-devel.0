Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>)
	id 1OKgTv-0006ql-Vx; Sat, 05 Jun 2010 01:39:26 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.3/8.14.4) with ESMTP id o54NY2ef014397
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 5 Jun 2010 01:34:02 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.71) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1OKgOo-0004vF-0R; Sat, 05 Jun 2010 01:34:02 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Khem Raj <raj.khem@gmail.com>
References: <1275673186-16695-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<20100604220855.GA27712@gmail.com>
Date: Sat, 05 Jun 2010 01:34:01 +0200
In-Reply-To: <20100604220855.GA27712@gmail.com> (Khem Raj's message of "Fri, 4
	Jun 2010 15:08:55 -0700")
Message-ID: <lyy6eu8j9y.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Scanned-By: MIMEDefang 2.68 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] libvpx: disabled explicitly the generation of docs
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
X-List-Received-Date: Fri, 04 Jun 2010 23:39:27 -0000
Content-Type: text/plain; charset=us-ascii

Khem Raj <raj.khem@gmail.com> writes:

>> When buildsystem has 'doxygen' and 'php' the documentation will be
>> created and the path in do_install (vpx-vp8-nopost-nodocs) won't be
>> found anymore:
>
> Where do they get put when doxygen and php are found.

logic in configure is

| enabled doxygen && php -v >/dev/null 2>&1 && enable install_docs
| ...
| enabled debug_libs && DIST_DIR="${DIST_DIR}-debug"
| enabled codec_srcs && DIST_DIR="${DIST_DIR}-src"
| ! enabled postproc && DIST_DIR="${DIST_DIR}-nopost"
| ! enabled multithread && DIST_DIR="${DIST_DIR}-nomt"
| enabled eval_limit && DIST_DIR="${DIST_DIR}-eval"
| ! enabled install_docs && DIST_DIR="${DIST_DIR}-nodocs"

and build of documentation depends on 'install_docs'.

Current package assumes that DIST_DIR is -nodocs.


> You may also put doxygen-native and php-native in DEPENDS and generate
> the documentation always but that may be overkill if we already have
> documentation prebuilt which can be installed. is that the case?

There is no prebuilt documentation. doxygen in DEPENDS would be ok, but
adding a dependency on php seems to be overkill imho.


>> +          --disable-install_docs \
>
> Does it disable the doc generation completely ?

yes



Enrico


