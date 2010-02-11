Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NfYks-0000mJ-GS
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 14:06:53 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NfYiP-0004ky-3j
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 13:04:17 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NfYiO-0005Tc-P1
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 13:04:16 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1265663673-16312-13-git-send-email-rep.dot.nop@gmail.com>
References: <1265663673-16312-1-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-2-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-3-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-4-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-5-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-6-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-7-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-8-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-9-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-10-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-11-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-12-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-13-git-send-email-rep.dot.nop@gmail.com>
Date: Thu, 11 Feb 2010 13:04:13 +0000
Message-ID: <1265893453.3777.1053.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 12/12] task-base.bb: use uniform test for set
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
X-List-Received-Date: Thu, 11 Feb 2010 13:06:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2010-02-08 at 22:14 +0100, Bernhard Reutner-Fischer wrote:=20
> -    if not hasattr(__builtins__, 'set'):
> +    try:
> +	set
> +    except NameError:
>  	from sets import Set as set

It's not completely obvious to me that this patch is an improvement: it
replaces a single line of code with three new ones and doesn't seem to
change the outcome.  Maybe one of our Python =C3=BCberhackers can comment o=
n
whether or not this is really better.

p.




