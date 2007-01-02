Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <dp@xora.org.uk>) id 1H1qDT-0002tm-Kz
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Jan 2007 21:26:35 +0100
Received: from xora.org.uk ([::ffff:81.179.98.244])
	(AUTH: LOGIN dp, TLS: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Tue, 02 Jan 2007 20:25:15 +0000
	id 0007002D.459ABFAC.000059BE
Date: Tue, 2 Jan 2007 20:24:58 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070102202458.GB5825@stygia.hyboria>
References: <E1H1X7P-0006QB-FN@linuxtogo.org>
	<20070102002938.GA5825@stygia.hyboria>
	<1167757388.5592.15.camel@localhost.localdomain>
	<459A987C.9050902@dominion.kabel.utwente.nl>
Mime-Version: 1.0
In-Reply-To: <459A987C.9050902@dominion.kabel.utwente.nl>
User-Agent: Mutt/1.5.11
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
X-List-Received-Date: Tue, 02 Jan 2007 20:26:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Jan 02, 2007 at 06:38:04PM +0100, Koen Kooi wrote:
> Can we agree that .la files shouldn't contain references to tmp/work? Any volunteers for
> adding the necessary logic to the appropriate bbclass?
> 
> regards,
> 

I think adding some sed along the lines of this in gcc staging should
cure the problem. As I beleive the "wrongness" leaks out of gcc when
libtool starts making other .la files (it seem to just concatentate
lines from dependant .la files)

sed -e "s|dependency_libs\s*=\s*.*|dependency_libs = '
-L${CROSS_DIR}/${HOST_SYS}/lib -lgcc_s -lc -lgcc_s -lm -lgcc_s -lc
-lgcc_s '|"

I have previously used this in my build personally to fix such problems,
but would appreciate someone giving a second look over and someone
familiar with the appropriate .bbclasses to put it in the right place.

Thanks

Graeme (XorA)



