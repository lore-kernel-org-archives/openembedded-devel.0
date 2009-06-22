Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MIpbg-0001Tj-Rk
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Jun 2009 21:55:11 +0200
Received: from 79-71-239-25.dynamic.dsl.as9105.com ([79.71.239.25]
	helo=[192.168.2.175])
	by crown.reciva.com with esmtpsa (TLS-1.0:RSA_ARCFOUR_MD5:16)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MIpR3-0004bb-Kh
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Jun 2009 20:44:09 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1245698893.7001.18.camel@utx.utx.cz>
References: <1245698893.7001.18.camel@utx.utx.cz>
Date: Mon, 22 Jun 2009 20:37:40 +0100
Message-Id: <1245699460.3521.17.camel@kc.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
Subject: Re: Is RDEPENDS = "foo" supported?
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
X-List-Received-Date: Mon, 22 Jun 2009 19:55:25 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-06-22 at 21:28 +0200, Stanislav Brabec wrote:
> Is RDEPENDS = "foo" allowed in recipes? If yes, then it does not work.

It is allowed, and in at least some situations it will even work, but in
the vast majority of cases it is not the right thing to do.  There are
two problems with it: both of them have been discussed here on the list
quite recently, but to recap:

1) ${RDEPENDS} will apply to all the output subpackages, i.e. ${PN}-dev,
${PN}-doc and various ${PN}-locale-* things.  In most cases, ${PN} is
the only one that you actually want to receive the dependency.

2) ${RDEPENDS} will be overridden by ${RDEPENDS_${PN}} if the latter is
set.  This is sometimes done by .bbclass files and the like, in which
case any dependencies you set in ${RDEPENDS} will be ineffective.

> I have been searching for a reason, why my image does not set keymap.
> Reason: console-tools were missing. Replacing RDEPENDS by RDEPENDS_${PN}
> in the keymaps recipe fixed it.

In this particular case, update-rc.d.bbclass sets RDEPENDS_${PN} and
hence (2) above will apply.

> Does it mean, that this and another 622 recipes use invalid syntax of
> RDEPENDS or is it a bug in the toolchain?

It's probably true that almost all of those 623 recipes should be using
RDEPENDS_${PN} or something similar instead of plain RDEPENDS.

p.



