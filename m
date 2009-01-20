Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1LPBnu-0003bO-Bn
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jan 2009 09:17:46 +0100
Received: from w1157.wlan.rz.tu-bs.de ([134.169.204.141] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1LPBgz-00019x-Mc by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jan 2009 09:10:45 +0100
Received: from stefan by excalibur.local with local (Exim 4.69)
	(envelope-from <stefan@excalibur.local>) id 1LPBh4-0003gI-C7
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jan 2009 09:10:42 +0100
Date: Tue, 20 Jan 2009 09:10:42 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090120081042.GE13810@excalibur.local>
References: <1232393997.4974d70deeb97@imp.free.fr>
MIME-Version: 1.0
In-Reply-To: <1232393997.4974d70deeb97@imp.free.fr>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Subject: Re: problems with building
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
X-List-Received-Date: Tue, 20 Jan 2009 08:17:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Mon, 2009-01-19 at 20:39, Alain2210 wrote:
> 
> I'm trying to build an image with openembedded. But I have to problems :
> 1) for building linux-ezx-2.6.21-ezxdev-r24
> I have had to add information to checksums.ini
> -------------------------
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 4ebf4bc..c3de2df 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -13882,6 +13882,10 @@ sha256=9cd89808a3c63e48ea809510e25a0277a53c7cb2e039f35a
>  md5=7c4b0de088db249cd94ec0001c4d3edd
>  sha256=f91accabee3408cc318affb01b1dd764cad555441a2c8ee23c598880f5825807
> 
> +[http://www.rpsys.net/openzaurus/patches/archive/lzo_crypto-r1.patch]
> +md5=95b10e4703e970af59e32ea3b1e3bb02
> +sha256=3025b52d6f614935cc28a5133daaa7968ee0ea1dfef00c15cd4642a4ea312f88
> +
>  [http://www.rpsys.net/openzaurus/patches/archive/lzo_crypto-r2.patch]
>  md5=29162001c88d9dbe0ccb25103a1aefb4
>  sha256=0b68f2d73dc54404d29015455ba84021a925aa2cfb6f1fe75705fe2268b2e2e8
> -------------------------------------

I could apply this, but then you would still have an old kernel with patches the
OpenEZX team no longer support. We should better make the kernel from openezx
git the default and set a sane srcrev for it. Will try to test it this week.

> 2) I have a problem when fetching with git for exemple for dbus-hlid_git.bb
> or libgdbus_git.bb, I get :
> git pull --tags git://git.freesmartphone.org/dbus-hlid.git failed with signal 1,
> output:
> 
> and above
> 
> Fetching tags only, you probably meant:
>   git fetch --tags
> 
> I have tried by hand, git pull --tags does not work but git fetch --tags does.
> 
> What have I to change ?

You mentioned in your next mail that you still have bitbake 1.8.10, please
update to the latest release 1.8.12 and re-test.

regards
Stefan Schmidt


