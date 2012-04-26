Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SNHp0-0003Ou-SO for openembedded-devel@lists.openembedded.org;
	Thu, 26 Apr 2012 08:04:54 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SNHfj-0006Xm-Oe for openembedded-devel@lists.openembedded.org;
	Thu, 26 Apr 2012 07:55:19 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2012 07:55:19 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2012 07:55:19 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 26 Apr 2012 07:55:11 +0200
Message-ID: <jnanvu$otl$1@dough.gmane.org>
References: <1335383487-25405-1-git-send-email-obi@opendreambox.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
In-Reply-To: <1335383487-25405-1-git-send-email-obi@opendreambox.org>
X-Enigmail-Version: 1.4
Subject: Re: [meta-oe][PATCH] layer.conf: add distro-feed-configs to SIGGEN_EXCLUDERECIPES_ABISAFE
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
X-List-Received-Date: Thu, 26 Apr 2012 06:04:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 25-04-12 21:51, Andreas Oberritter schreef:
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org> --- 
> meta-oe/conf/layer.conf |    1 + 1 files changed, 1 insertions(+), 0
> deletions(-)
> 
> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf index
> 6f05871..2120482 100644 --- a/meta-oe/conf/layer.conf +++
> b/meta-oe/conf/layer.conf @@ -29,4 +29,5 @@ SIGGEN_EXCLUDERECIPES_ABISAFE
> += " \ mplayer-common \ task-x11-server \ fbset-modes \ +
> distro-feed-configs \ "

Since distro-feed-configs does the wrong thing, I'd rather take a patch to
remove it from meta-oe.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPmOM9AAoJEHZqAkdh1vT6MVgP/R0h/cjG+guVOg/3iIoAg9g2
ibXuNhcv4NSTLIXoCyMhFftSVMn4SsUGZeWtnxw8qwYfAqvNzP+QdPj3KjykGJV6
myVXKn0e69TmQ+bs8Xc+b7E7UXWuGqsvn/HMik+KeftUPzzGOnA1fePINENN6Xac
HgyRBUHYDGiDvBEaIwMWBbHuHSNhhMHSSdKfM2CWOzJT990jAsmVTRNM7jL/KdOj
yPCvQJ+9WBca30VxRqp1J1Orgw0d0lX0vYZk6kwWku58tvr3jRp7LK+vVz1m1qO7
L7AF2BNa93dAeLjkoLdfogVESh43x/jNuSE7FAZUq80FHyYqr4K8GHDjrGfJfISh
XWtY0i0+5Cbjn/87PkbvRgQsnDjB7yA63MnVoroBoq0bpTpoQTwmSJMQEysxmCcr
nL1cd9TOKJ4H6V5DDUExBMaqVIQJzykQMlWPaAQjyHfOWfykiqyQiYb5dpzwUii7
fbFVEGbiVM2rXN1eXNZlHtE2HAhPP2rn/tD67kCpPThUqKVYXXycTk7fj7hqOoCr
xvDFdo/Si0zqifFrrEuORDP93C/QB1VrHZUJ0LuDPF9iN+0kESHzK3zPZAODDjaO
jJlRdWKzbtx6UnC4WmrdGFS9neJhx2HKgoy/Dwh9vjoUvlvuuVeLp06fG/+3aISO
gLCERTnxYwNRFxlJP3Yx
=UmT1
-----END PGP SIGNATURE-----



