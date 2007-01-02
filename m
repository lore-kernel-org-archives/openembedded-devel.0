Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <dp@xora.org.uk>) id 1H1XYG-0004kZ-U9
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Jan 2007 01:30:56 +0100
Received: from xora.org.uk ([::ffff:81.179.98.244])
	(AUTH: LOGIN dp, TLS: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Tue, 02 Jan 2007 00:29:35 +0000
	id 0007001D.4599A76F.00004A79
Date: Tue, 2 Jan 2007 00:29:38 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070102002938.GA5825@stygia.hyboria>
References: <E1H1X7P-0006QB-FN@linuxtogo.org>
Mime-Version: 1.0
In-Reply-To: <E1H1X7P-0006QB-FN@linuxtogo.org>
User-Agent: Mutt/1.5.11
Subject: Re: [oe-commits] org.oe.dev aspell: fix compilation for powerpc
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
X-List-Received-Date: Tue, 02 Jan 2007 00:31:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Jan 02, 2007 at 01:03:03AM +0100, koen commit wrote:
>  inherit autotools
>  
> +export CXXFLAGS += "-lstdc++"
> +
>  do_compile_prepend() {
>  	install ${WORKDIR}/mk-dirs_h.py ${S}/common/mk-dirs_h
>  }
> 
As this package seems to work for other platforms, isnt the bug
elsewhere. I dont like this sort of unexplained "fix" for one particular
platform. This type of "fix" to me just dirties the metadata.

Graeme (XorA)



