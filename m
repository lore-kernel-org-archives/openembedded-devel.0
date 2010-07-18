Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1OaY3t-0001Db-Nu
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jul 2010 19:54:30 +0200
Received: from p5b0352a5.dip.t-dialin.net ([91.3.82.165] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1OaY3g-0002n4-2d by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jul 2010 19:53:50 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1OaY3e-00010u-Q1
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jul 2010 19:53:46 +0200
Date: Sun, 18 Jul 2010 19:53:46 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100718175346.GB1772@excalibur.local>
References: <4C3FA2D7.6020006@gmail.com>
	<20100716093325.GA1772@excalibur.local>
	<1279462746.9402.8.camel@utx.lan>
MIME-Version: 1.0
In-Reply-To: <1279462746.9402.8.camel@utx.lan>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] lsof_4.83.bb: Make recipe buildable again.
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
X-List-Received-Date: Sun, 18 Jul 2010 17:54:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Sun, 2010-07-18 at 16:19, Stanislav Brabec wrote:
> Stefan Schmidt wrote:
> > 
> > On Fri, 2010-07-16 at 09:37, Graham Gower wrote:
> > > Breakage introduced by 74e32f114272668dfa4c88805741cf55ef965989.
> > > Other recipes which call base_do_unpack directly do not share this issue.
> > > 
> > > Signed-off-by: Graham Gower <graham.gower@gmail.com>
> > 
> > Acked-by: Stefan Schmidt <stefan@datenfreihafen.org>
> > 
> > I just run into the same issue and this fixes it for me. Will check this in.
> 
> Does not work here. This change fixes it:

And you are right here. I wonder why it worked for me when I tested it. It fails
now again and your patch fixes it.

Acked-by: Stefan Schmidt <stefan@datenfreihafen.org>

Will you commit this yourself?

regards
Stefan Schmidt


