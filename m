Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MxzK7-00088J-Q6
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Oct 2009 10:35:10 +0200
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 3CFC31B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2009 08:42:32 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Oct 2009 10:33:46 +0200
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <fd72b8f50910020840r55927655h94deabff2e4da7cb@mail.gmail.com>
	<200910031214.22067.holger+oe@freyther.de>
	<1254676971.16851.0.camel@leeloo.somedomain>
In-Reply-To: <1254676971.16851.0.camel@leeloo.somedomain>
MIME-Version: 1.0
Message-Id: <200910141033.46093.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: libmikmod_3.2.0-beta2, build error
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
X-List-Received-Date: Wed, 14 Oct 2009 08:35:10 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Sunday 04 October 2009 19:22:51 Michael Lippautz wrote:
> Should be as easy as the following git diff. Correct me if I am wrong.
> 
> Regards,
> Michael
> 
> diff --git a/recipes/libmikmod/libmikmod_3.2.0-beta2.bb
> b/recipes/libmikmod/libmikmod_3.2.0-beta2.bb
> index 07e3af9..fd23568 100644
> --- a/recipes/libmikmod/libmikmod_3.2.0-beta2.bb
> +++ b/recipes/libmikmod/libmikmod_3.2.0-beta2.bb
> @@ -3,8 +3,12 @@ SECTION = "libs"
>  PRIORITY = "optional"
>  LICENSE = "LGPL"
> 
> +PR="r1"
> +
>  DEFAULT_PREFERENCE = "-1"
> 
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +
>  SRC_URI = "\
>    http://mikmod.raphnet.net/files/libmikmod-${PV}.tar.gz \
>    file://m4.patch;patch=1 \

Could you come up with a patch along the lines of the ldflags.patch applied in 
the other libmidmod directory?

holger


