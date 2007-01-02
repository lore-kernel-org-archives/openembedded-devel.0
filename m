Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1H1n3q-0003v3-Gb
	for openembedded-devel@openembedded.org; Tue, 02 Jan 2007 18:04:30 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l02H3DTQ001631
	for <openembedded-devel@openembedded.org>; Tue, 2 Jan 2007 17:03:13 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00983-10 for <openembedded-devel@openembedded.org>;
	Tue,  2 Jan 2007 17:03:11 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l02H3781001597
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Tue, 2 Jan 2007 17:03:07 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20070102002938.GA5825@stygia.hyboria>
References: <E1H1X7P-0006QB-FN@linuxtogo.org>
	<20070102002938.GA5825@stygia.hyboria>
Date: Tue, 02 Jan 2007 17:03:07 +0000
Message-Id: <1167757388.5592.15.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [oe-commits] org.oe.dev aspell: fix compilation for	powerpc
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Jan 2007 17:04:30 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-01-02 at 00:29 +0000, Graeme Gregory wrote:
> On Tue, Jan 02, 2007 at 01:03:03AM +0100, koen commit wrote:
> >  inherit autotools
> >  
> > +export CXXFLAGS += "-lstdc++"
> > +
> >  do_compile_prepend() {
> >  	install ${WORKDIR}/mk-dirs_h.py ${S}/common/mk-dirs_h
> >  }
> > 
> As this package seems to work for other platforms, isnt the bug
> elsewhere. I dont like this sort of unexplained "fix" for one particular
> platform. This type of "fix" to me just dirties the metadata.

I'll second that. Lets try and fix bugs properly please...

Richard



