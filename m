Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <dp@xora.org.uk>) id 1GKWbg-0002xw-E2
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Sep 2006 10:48:32 +0200
Received: from xora.org.uk ([::ffff:81.178.213.77])
	(AUTH: CRAM-MD5 dp, TLS: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Tue, 05 Sep 2006 09:45:40 +0100
	id 00068404.44FD3934.00004C6D
Date: Tue, 5 Sep 2006 09:49:52 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20060905084952.GA8359@stygia.hyboria>
References: <44FD3519.7000000@dominion.kabel.utwente.nl>
Mime-Version: 1.0
In-Reply-To: <44FD3519.7000000@dominion.kabel.utwente.nl>
User-Agent: Mutt/1.5.11+cvs20060403
Subject: Re: gtk 2.6/2.8 vs 2.10
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Sep 2006 08:48:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Sep 05, 2006 at 10:28:09AM +0200, Koen Kooi wrote:
> A lot of these problems can be solved with 'preferred-gtk-2.8-versions.inc', but ideally
> we'd want a way to get the gtk PV from inside other recipes (e.g. gtk-engines).
> 
> Does anyone have a good idea on how to handle all this?
> 
I just checked my gtk+-2.10.0 and gtk+-2.0.pc contans the following
line.

gtk_binary_version=2.10.0

If this exists for all gtk+ we could parse ths file in install and set
${LIBV} with it.

G



