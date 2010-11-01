Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PCp9t-0004JF-E8
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Nov 2010 08:50:26 +0100
Received: by iwn42 with SMTP id 42so6196280iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 00:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=A669EDx+GKuht7Z3dz0LgcOB9t1qFOlVOVBauav5ERo=;
	b=dWtmZhc3oh8ZpDzJjU+rQzsdhXG57ojhxO9+Gt6+eaFmml7jjQQ2a9mQ0DBaWieo9Z
	IKWffjUQxMLkNpoeaL/GBfuS/gvYAZ9PCkeOCOjJ0hybQrZUjHyi8lBhaTzNDUfodluE
	mLMu7KZe7yCSBsR+fcCUsuncKHVtHf5U+MH+0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Ysd2KOTKwSktQrqU7Fb+moLHCMIvUdb9xe31I+PntP2vlPg9GKq6aJCxUbhLkEAMlT
	EXRyoKYf/WnpKXX3KuY2ZzYBV26p/YL1aY5ogfCV2BnfQrDKJPwBW/GdjXRvsplj/EaB
	IS2icKOYPN1dSWhZcGpBX/eT3UWpCx3nmYLGo=
MIME-Version: 1.0
Received: by 10.42.239.74 with SMTP id kv10mr1977681icb.453.1288597772688;
	Mon, 01 Nov 2010 00:49:32 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Mon, 1 Nov 2010 00:49:32 -0700 (PDT)
In-Reply-To: <iakpd7$ja7$1@dough.gmane.org>
References: <AANLkTin70=KBJDjW8K6ViS5X03ZaE92680oR88hhy9eK@mail.gmail.com>
	<AANLkTimEKL_6r_DZmq_W2i9eqHPgbRFc-oFMftKNFBJv@mail.gmail.com>
	<iakpd7$ja7$1@dough.gmane.org>
Date: Mon, 1 Nov 2010 08:49:32 +0100
Message-ID: <AANLkTikmqiDqWpHS=K73N8z6a0VPU8k7zMCP7yrb=G-Y@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
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
X-List-Received-Date: Mon, 01 Nov 2010 07:50:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/31 Koen Kooi <k.kooi@student.utwente.nl>:
> On 31-10-10 22:03, Yuri Bushmelev wrote:

>> Every build will be started with clean $TMPDIR for now at least
>
> I mentioned this at OEDEM as well, only doing clean builds hides upgrade
> path type of bugs (e.g. libcdio5 -> libcdio). It would be nice if an
> incremental build going from testing-prev to testing-next would be done
> as well before tagging.

From the wiki page [1], item 2:
"All volunteers start a clean build and build the combinations they
test, update the above chart, and report status/issues as replies to
the above email. "

But as far as I'm concerned feel free to run incremental tests and put
the results on the testing page (indicating that it is from an
incremental build).

I will remain starting with a clean tmp for now. As it stands:
- I don't have the space to store 6 tmp dirs
- There seem to be sufficient issues with a clean build
- My employer (who sponsors my testing activities by donating cpu
cycles and storage) is into embedded systems. Partial upgrades are not
relevant in our kind of embedded systems. A reliable and reproducible
build is much more important to us, hence my focus on clean builds.

Enjoy Frans.

PS: a few comments wrt the libcdio issue:

- it would have been nice if this was discussed with the recipe
maintainer. This is in accordance with our commit policy [2, 4th
block]. I strongly doubt that this has happened (and apologies if this
is a faulty assumption).
- I have strong doubts that the dependency change is sound. Actually
libcdio and libcddb are in a catch22 situation where both depend on
each other for some sample programs.
Solution is probably to make an additional package for the sample
progs (I seem to recall that is also the way debian handles this).
Haven't had time to dig into this and fix it.
- maybe some of the confusion and issues wrt libs is because the way
to do this is not really well documented. Eric had some questions on
this on irc on this yesterday too.
If you feel there is documentation, please pass a pointer, otherwise
please add some info to the wiki so the problem can be avoided.
(give a man a fish and he can eat a day, learn a man how to fish and
he can eat all his life).
I would have added the info to the wiki or manual myself, but I feel
my understanding of the issue and the way to handle it is not good
enough to be able to write a good section on it.

(btw: a good place would probably be [3] and yeah, I am aware of the
debian renaming [4], but I am also aware of [5] which as an example
says:
FILES_${PN} = "\
    ${bindir}/* \
    ${sbindir}/* \
    ${libexecdir}/* \
    ${libdir}/lib*.so.* \
    .....
which was exactly what was in the original commit [6]:
+FILES_${PN} = "${libdir}/lib${PN}${SOLIB}"
)

[1] http://wiki.openembedded.net/index.php/Testing#Testing_Procedure
[2] http://wiki.openembedded.net/index.php/Commit_Policy
[3] http://docs.openembedded.org/usermanual/usermanual.html#recipes_examples
[4] http://docs.openembedded.org/usermanual/usermanual.html#id593730
[5] http://docs.openembedded.org/usermanual/usermanual.html#id593138
[6] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=b672b28ba6a29e2715c91fcbbda8b2776b6f1105


