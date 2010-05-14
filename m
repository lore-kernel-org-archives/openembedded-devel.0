Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OCxlJ-0007jM-GJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 18:29:26 +0200
Received: from host86-156-69-106.range86-156.btcentralplus.com
	([86.156.69.106] helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>)
	id 1OCxhW-0008Gt-R5; Fri, 14 May 2010 17:25:26 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>)
	id 1OCxhW-0005te-Cp; Fri, 14 May 2010 17:25:26 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4BED67FB.1060900@eukrea.com>
References: <1272921691-6963-1-git-send-email-eric@eukrea.com>
	<4BED67FB.1060900@eukrea.com>
Date: Fri, 14 May 2010 17:25:25 +0100
Message-ID: <1273854325.18119.794.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: k.kooi@student.utwente.nl
Subject: Re: [RFC][PATCH] module-base.bbclass: keep PR if MACHINE_KERNEL_PR is not set
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
X-List-Received-Date: Fri, 14 May 2010 16:29:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2010-05-14 at 17:10 +0200, Eric B=C3=A9nard wrote:
> -PR =3D "${MACHINE_KERNEL_PR}"
> +python __anonymous () {
> +    machine_kernel_pr =3D bb.data.getVar('MACHINE_KERNEL_PR', d, True)
> +
> +    if machine_kernel_pr:
> +       bb.data.setVar('PR', machine_kernel_pr, d)
> +}

Looks reasonable to me.  It seems a little bit sad to have this code
duplicated in both kernel.bbclass and module-base.bbclass but I guess
that is not a very big deal.

p.




