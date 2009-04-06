Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <florian.boor@kernelconcepts.de>)
	id 1LqnTz-0008Ms-IH; Mon, 06 Apr 2009 13:59:21 +0200
Received: from [192.168.2.162] by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>)
	id 1Lqnkg-0001Nz-PU; Mon, 06 Apr 2009 14:16:34 +0200
Message-ID: <49D9EDE7.6080001@kernelconcepts.de>
Date: Mon, 06 Apr 2009 13:56:23 +0200
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20090403221352.GH30840@smtp.west.cox.net>
In-Reply-To: <20090403221352.GH30840@smtp.west.cox.net>
X-Enigmail-Version: 0.95.0
X-SA-Exim-Connect-IP: 212.60.202.196
X-SA-Exim-Mail-From: florian.boor@kernelconcepts.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Subject: Re: Fix relocation of our SDK toolchains
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
X-List-Received-Date: Mon, 06 Apr 2009 11:59:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Tom Rini schrieb:
> Hey all.  For some time, myself and others have wished that the
> toolchain we install with our SDK target (meta-toolchain*) could be
> relocatible.  I've finally spent some time digging into this and I've

that's great - I guess you'll make quite some users happy.

> come up with the following series of patches.  We had two problems.  The
> first is that things like 'as', 'ld', 'cpp', etc that the toolchain
> invokes were absolute links rather than relative links within the SDK.
> The second issue is that we were using --with-gxx-include-dir in
> configuring gcc when really we don't want that, we want to put the C++
> includes where GCC is going to look for them already, not in an absolute
> path.
> 
> I've tested this series of patches with gcc-4.1.2 / 4.2.4 and 4.3.3
> cross-sdk targets on Linux and 4.2.4 on Windows.  For Linux I've
> compiled qtopia-core-4.3.5 as a stand-in for a large complex app.

I didn't find any obvious problems with the patches and since the changes are
tested I vote for pushing them!

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de
                                        http://www.kernelconcepts.de/en


