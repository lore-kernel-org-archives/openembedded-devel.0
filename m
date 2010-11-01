Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PCpdf-0005SD-Mu
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Nov 2010 09:21:15 +0100
Received: by bwz10 with SMTP id 10so4165706bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 01:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=VGIgu1o3IR2QMOw42CM86ZPZSGTf2Jqmf5ubWNAjYMg=;
	b=QZtrKXA9L3AMTeeDbbEWrSJl0fZ2XOY8T03ePpoUthqg+Iq9POwrLft3qsz+XyEv99
	PVbpE2Kjv3guH8h3StxufnMtChdd1vaZR2AzqhHle4YQAIXm5hBUHTXU8dbNxgcw3vvd
	0GEY7izN0UVEvYWpzi+CT01d70mv/HBfoOlkU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=nv5WRPthyCo2KR7TZGoGFmM5WDfgukQ7g4pd7SUnwlhM3WnsPhAwYBTqPRUkiaoqV3
	uni3J2fDDgaB3NrY85c4scKqLnEyaDT5NW1zhRsJGhfuEgDEVlDIK9870RByLcU5FiEF
	mjo/AVK44u9Q5yoYWSE9tTvAuP3R60hb8K6EY=
Received: by 10.204.123.135 with SMTP id p7mr12658948bkr.6.1288599624447;
	Mon, 01 Nov 2010 01:20:24 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id u4sm3266973bkz.5.2010.11.01.01.20.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 01 Nov 2010 01:20:20 -0700 (PDT)
Date: Mon, 1 Nov 2010 09:19:56 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101101081956.GA3440@jama>
References: <AANLkTin70=KBJDjW8K6ViS5X03ZaE92680oR88hhy9eK@mail.gmail.com>
	<AANLkTimEKL_6r_DZmq_W2i9eqHPgbRFc-oFMftKNFBJv@mail.gmail.com>
	<iakpd7$ja7$1@dough.gmane.org>
	<AANLkTikmqiDqWpHS=K73N8z6a0VPU8k7zMCP7yrb=G-Y@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTikmqiDqWpHS=K73N8z6a0VPU8k7zMCP7yrb=G-Y@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-10-29
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
X-List-Received-Date: Mon, 01 Nov 2010 08:21:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 01, 2010 at 08:49:32AM +0100, Frans Meulenbroeks wrote:
> 2010/10/31 Koen Kooi <k.kooi@student.utwente.nl>:
> > On 31-10-10 22:03, Yuri Bushmelev wrote:
> 
> >> Every build will be started with clean $TMPDIR for now at least
> >
> > I mentioned this at OEDEM as well, only doing clean builds hides upgrade
> > path type of bugs (e.g. libcdio5 -> libcdio). It would be nice if an
> > incremental build going from testing-prev to testing-next would be done
> > as well before tagging.
> 
> From the wiki page [1], item 2:
> "All volunteers start a clean build and build the combinations they
> test, update the above chart, and report status/issues as replies to
> the above email. "
> 
> But as far as I'm concerned feel free to run incremental tests and put
> the results on the testing page (indicating that it is from an
> incremental build).
> 
> I will remain starting with a clean tmp for now. As it stands:
> - I don't have the space to store 6 tmp dirs
> - There seem to be sufficient issues with a clean build
> - My employer (who sponsors my testing activities by donating cpu
> cycles and storage) is into embedded systems. Partial upgrades are not
> relevant in our kind of embedded systems. A reliable and reproducible
> build is much more important to us, hence my focus on clean builds.
> 
> Enjoy Frans.
> 
> PS: a few comments wrt the libcdio issue:
> 
> - it would have been nice if this was discussed with the recipe
> maintainer. This is in accordance with our commit policy [2, 4th
> block]. I strongly doubt that this has happened (and apologies if this
> is a faulty assumption).
> - I have strong doubts that the dependency change is sound. Actually
> libcdio and libcddb are in a catch22 situation where both depend on
> each other for some sample programs.
> Solution is probably to make an additional package for the sample
> progs (I seem to recall that is also the way debian handles this).
> Haven't had time to dig into this and fix it.
> - maybe some of the confusion and issues wrt libs is because the way
> to do this is not really well documented. Eric had some questions on
> this on irc on this yesterday too.
> If you feel there is documentation, please pass a pointer, otherwise
> please add some info to the wiki so the problem can be avoided.
> (give a man a fish and he can eat a day, learn a man how to fish and
> he can eat all his life).
> I would have added the info to the wiki or manual myself, but I feel
> my understanding of the issue and the way to handle it is not good
> enough to be able to write a good section on it.
> 
> (btw: a good place would probably be [3] and yeah, I am aware of the
> debian renaming [4], but I am also aware of [5] which as an example
> says:
> FILES_${PN} = "\
>     ${bindir}/* \
>     ${sbindir}/* \
>     ${libexecdir}/* \
>     ${libdir}/lib*.so.* \
>     .....
> which was exactly what was in the original commit [6]:
> +FILES_${PN} = "${libdir}/lib${PN}${SOLIB}"

It's OK, but much better if you also PR bump packages depending on it.
Because as long as "${bindir}/*" was included in FILES_${PN}, debian
naming didin't happen (because of multiple binaries in 1 package), the
same happens when you have multiple libraries in 1 package without
LEAD_SONAME defined.

So moving binaries to new FILES_${PN}-utils is probably good move, but
as side effects it renames libcdio to libcdio5. And because already
built packages have libcdio instead of libcdio5 in it's runtime depends,
those needs to be rebuilt (to pick libcdio5 as libcdio.so provider)

Not sure how to check all recipes depending on it (I don't trust DEPENDS
as some packages are voluntary linked to libcdio just because autotools
found it). So usually I notice it only when image build fails (opkg
complaining about missing packages), but that works only for packages
included in built image :/. And when I notice it, I usually do something
like:
find deploy/ipk/ -name Packages -exec grep -B 3 libcdio {} \;
to see where wrong Depends is and then PR bump those (which still fixes
only those recipes I'm building as part of some image or ie
task-shr-feed)

sometimes it gets even worse, like in this case:
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=5fa427d06922297496fcf5ebd6c0a6a5c2adac46
when edbus.ipk gets empty after moving all libs to separate packages, so
it won't get upgrade on target and creates conflicts between old package
containing ie libehal.so.* and new edbus-ehal.ipk providing the same lib
in newer version.

Feel free to update wiki if you found this explanation (or at least some
part of it :)) understandable.

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


