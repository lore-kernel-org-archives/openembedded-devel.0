Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NsDAy-0001uA-IU
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Mar 2010 11:42:06 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NsD80-00011A-Rl
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Mar 2010 10:39:00 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NsD80-00014v-FF
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Mar 2010 10:39:00 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ac9c93b11003180018u761e78f6l67b3f76869a95612@mail.gmail.com>
References: <4BA1B29B.8040704@tait.co.nz>
	<ac9c93b11003180018u761e78f6l67b3f76869a95612@mail.gmail.com>
Date: Thu, 18 Mar 2010 10:38:56 +0000
Message-ID: <1268908736.14566.1422.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 4/4] Renamed prefix_native, bindir_native, etc using 	hyphens
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
X-List-Received-Date: Thu, 18 Mar 2010 10:42:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-03-18 at 08:18 +0100, Frans Meulenbroeks wrote:
> 2010/3/18 Douglas Royds <douglas.royds@tait.co.nz>:
> >   - Avoids clashing with the machine override when MACHINE=native
> >   - bindir_cross similarly renamed for consistency
> >
> [...]
> >
> >  # Path prefixes
> >  base_prefix = "${STAGING_DIR_NATIVE}"
> > -prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
> > -exec_prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
> > +prefix = "${STAGING_DIR_NATIVE}${prefix-native}"
> > +exec_prefix = "${STAGING_DIR_NATIVE}${prefix-native}"
> 
> [...]
> 
> Shouldn't we then for consistent naming also go to exex-prefix etc ?

That would need to be done carefully since ${exec_prefix} is exported.
I am not sure it would be worth the effort to get it right at the
moment.  This would probably be better done as a part of a larger effort
to tidy up the semantics of the bitbake variable namespace.

p.




