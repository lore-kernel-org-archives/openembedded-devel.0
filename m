Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Jvq8F-0005V4-Qe
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 May 2008 10:45:11 +0200
Received: from world195.mi.fu-berlin.de ([160.45.115.195])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Jvq6v-0007Tm-WE
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 May 2008 10:43:50 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 May 2008 10:43:50 +0200
User-Agent: KMail/1.9.9
References: <200805080215.23729.zecke@selfish.org>
	<200805101405.38789.zecke@selfish.org> <g044dn$kot$1@ger.gmane.org>
In-Reply-To: <g044dn$kot$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200805131043.50899.zecke@selfish.org>
Subject: Re: Creating a pristine environment?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Tue, 13 May 2008 08:45:12 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Saturday 10 May 2008 14:28:39 Koen Kooi wrote:
> Holger Freyther wrote:
> > Okay. I added an option, I clean the environment after having parsed the
> > configuration. This means everything used from conf/local.conf (TOPDIR,
> > BBPATH, BBFILES, MACHINE...) will be inside the configuration data of
> > bitbake but not be exported.
>
> Implementation question: who will fix all the shell based functions in
> OE that rely on things like MACHINE being exported?

To my understanding there is nothing to fix. Bitbake will unexport the 
environment after having parsed the configuration. If you have export FOO 
inside a Bitbake file. data.py:emit_var will put an "export FOO=.." into the 
shell script.

comments.

	z.


