Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QZi2S-0008QX-Bl
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Jun 2011 13:25:36 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1QZhz0-0004pD-B7
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Jun 2011 13:22:02 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4E03211B.40205@freyther.de>
References: <4E03211B.40205@freyther.de>
Date: Thu, 23 Jun 2011 12:21:59 +0100
Message-ID: <1308828119.21613.138.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: RFC One recipe with two git repository as sources
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
X-List-Received-Date: Thu, 23 Jun 2011 11:25:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-23 at 13:18 +0200, Holger Freyther wrote:
> -        destdir = os.path.join(destdir, "git/")
> +        destsuffix = ud.parm.get("destsuffix", "git/")
> +        print destsuffix
> +        destdir = os.path.join(destdir, destsuffix)

I think that "print" might be extraneous, but other than this your patch
looks awesome.  I think this would resolve the problem that I was having
in
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-June/004375.html and to which I never found a solution which didn't involve patching bitbake.

p.




