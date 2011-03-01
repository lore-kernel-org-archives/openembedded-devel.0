Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1PuNa8-0000On-Jo
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 12:17:32 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>)
	id 1PuNYm-0007Am-Si; Tue, 01 Mar 2011 12:16:09 +0100
From: Phil Blundell <philb@gnu.org>
To: Otavio Salvador <otavio@ossystems.com.br>
In-Reply-To: <AANLkTim1EdeGgyy3siyL99ugY-v=uqW_v4MRHJV0evq6@mail.gmail.com>
References: <1298466445-16486-1-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-2-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-3-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-4-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-5-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-6-git-send-email-otavio@ossystems.com.br>
	<1298468511.2178.430.camel@phil-desktop>
	<AANLkTim1EdeGgyy3siyL99ugY-v=uqW_v4MRHJV0evq6@mail.gmail.com>
Date: Tue, 01 Mar 2011 11:21:35 +0000
Message-ID: <1298978495.23547.64.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 05/14] cmake.bbclass: use 2.8 modules
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
X-List-Received-Date: Tue, 01 Mar 2011 11:17:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-02-23 at 13:47 +0000, Otavio Salvador wrote:
> In any case cmake will know the "internal" modules directory by itself
> so it works even if this value doesn't match. This is where it is
> going to look as fallback and I was using 2.8 without 2.6 for long
> time without noticing any issue.
> 
> This seems safe. We could drop the CMAKE_MODULE_PATH if preferred. I
> just fixed it to 2.8 to reflect the current default one.

If I understand right, you're saying that the CMAKE_MODULE_PATH doesn't
serve any useful purpose since cmake works just fine without it.  If
that's the case then yes, let's just drop it altogether.

p.




