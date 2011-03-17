Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Q0DSQ-0005rS-8E
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 14:41:42 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Q0DQm-0002wX-8z
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 14:40:00 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1300365679-20067-2-git-send-email-Martin.Jansa@gmail.com>
References: <1300365679-20067-1-git-send-email-Martin.Jansa@gmail.com>
	<1300365679-20067-2-git-send-email-Martin.Jansa@gmail.com>
Date: Thu, 17 Mar 2011 13:43:37 +0000
Message-ID: <1300369417.9054.5.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 2/2] gst-plugins: define disjunctive PACKAGES_DYNAMIC for each pack base/good/bad/ugly
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
X-List-Received-Date: Thu, 17 Mar 2011 13:41:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-17 at 13:41 +0100, Martin Jansa wrote:
> * adds a bit more bits to keep in sync while changing gst-plugins
>   version, but not that much (this patch was mostly prepared by script)
> * overlap in PACKAGES_DYNAMIC namespace causes notes like this in every build
>   NOTE: multiple providers are available for runtime gst-plugin-autodetect (gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plugins-ugly)
>   NOTE: consider defining a PREFERRED_PROVIDER entry to match gst-plugin-autodetect

Do the overlapping PACKAGES_DYNAMICs have any ill effects apart from
that diagnostic?  If not, I'm not entirely convinced that the extra
maintenance hassle of keeping those lists up to date for each release,
even if it's partly/mostly scripted, is justified by the marginal
benefit of silencing a NOTE.

p.




