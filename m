Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OQzlq-00051W-OE
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jun 2010 11:27:59 +0200
Received: from fwext.cambridgebroadband.com ([212.44.17.73]
	helo=[10.10.208.22])
	by crown.reciva.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OQzhQ-00078d-KJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jun 2010 10:23:20 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTim2-Y4qW9Wb-kycxo89vNZgBJkdeVSyERXZYCoJ@mail.gmail.com>
References: <AANLkTim2-Y4qW9Wb-kycxo89vNZgBJkdeVSyERXZYCoJ@mail.gmail.com>
Date: Tue, 22 Jun 2010 10:23:24 +0100
Message-ID: <1277198604.4745.99.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] patch file location
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
X-List-Received-Date: Tue, 22 Jun 2010 09:27:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2010-06-22 at 09:03 +0200, Frans Meulenbroeks wrote:
> Frankly speaking I have no clue at all which version of the patch will
> be used by the 2.10.1 recipe. The only ways to find out is to study
> the class code that does the patch or to actually build the package
> (in the hope it selects the patch in a deterministic way). I don't
> think it is good that if someone is debugging a problem that they
> should have such a hard time to find out what version of a file is
> actually used

See glibc_2.10.1.bb:

FILESPATHPKG =. "glibc-2.4:"

So, the answer is that it will use the version from the glibc-2.4
directory.  

I think the semantics of FILESPATHPKG are documented in the manual.  If
they're not, that is an oversight and should indeed be corrected.

> (optionally we might allow for a mechanism that allows specifying
> patches for higher level recipes; e.g. glibc_2.10.1 could look in
> glibc-2.10.1, glibc-2.10, glibc-2, glibc and files).

You can already do this with a suitable FILESPATHPKG setting, I think.

p.




