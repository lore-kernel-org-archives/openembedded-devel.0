Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TB4Cp-0005kp-6P
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Sep 2012 15:39:15 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TB3jV-0008F5-N8
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Sep 2012 15:08:58 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Sep 2012 14:08:56 +0100
In-Reply-To: <504DE45C.2010202@communistcode.co.uk>
References: <504DE45C.2010202@communistcode.co.uk>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1347282537.2673.239.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: Couple of autotools configure problems
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
X-List-Received-Date: Mon, 10 Sep 2012 13:39:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-09-10 at 14:00 +0100, Jack Mitchell wrote:
> What is a portable version of ':=', maybe '+='? I can't get anything but 
> unrelated hits from Google.

I don't think there is any portable equivalent.  However, if you know
you will always be using GNU make then the portability is something of a
non-issue.  

You could work around it by just not passing -Werror -Wall to automake.

p.



