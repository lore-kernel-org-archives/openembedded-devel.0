Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1PwYfG-0004op-JF
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Mar 2011 12:31:50 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1PwYdo-00011Q-0Z
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Mar 2011 12:30:20 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4D74AF71.4070105@eukrea.com>
References: <1299360603-24687-1-git-send-email-eric@eukrea.com>
	<AANLkTikWU836s9FM0e0XKdZPuYb=cZs9c0Z3t9nvbZZh@mail.gmail.com>
	<4D74AA7F.6060506@eukrea.com> <1299491850.2132.12.camel@phil-desktop>
	<4D74AF71.4070105@eukrea.com>
Date: Mon, 07 Mar 2011 11:31:00 +0000
Message-ID: <1299497460.2132.21.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 1/2] dropbear: add 0.53.1
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
X-List-Received-Date: Mon, 07 Mar 2011 11:31:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-03-07 at 11:12 +0100, Eric Benard wrote:
> the changelog doesn't say it but the comment in option.h says :
> /* Set this if you want to use the DROPBEAR_SMALL_CODE option. This can save
> several kB in binary size, however will make the symmetrical ciphers (AES, DES
> etc) slower (perhaps by 50%). Recommended for most small systems. */
> 
> so maybe they prefered to get performance by default instead of saving 50kB.
> 
> We can keep this option by adding this to the recipe :
> +do_configure_prepend() {
> +       echo "#define DROPBEAR_SMALL_CODE" >>${S}/options.h
> +}
> +

Sounds like a good idea to me.  I guess the performance might be an
issue if you are doing lots of transfers with scp on a slow machine, but
I've never heard anybody complaining about it.  So I think we should
stick with SMALL_CODE if possible.

p.




