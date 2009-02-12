Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1LXiB6-0000wd-QN
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Feb 2009 21:28:57 +0100
Received: from 79-79-208-205.dynamic.dsl.as9105.com ([79.79.208.205]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1LXi9j-0002Ua-U9; Thu, 12 Feb 2009 20:27:32 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1234456715-23618-7-git-send-email-otavio@ossystems.com.br>
References: <1234456715-23618-1-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-2-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-3-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-4-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-5-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-6-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-7-git-send-email-otavio@ossystems.com.br>
Date: Thu, 12 Feb 2009 20:27:28 +0000
Message-Id: <1234470448.4890.379.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH 6/6] flash-plugin: add 10.0.12.36
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
X-List-Received-Date: Thu, 12 Feb 2009 20:28:57 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-02-12 at 14:38 -0200, Otavio Salvador wrote:
> +pkg_postinst() {
> +	test -n "$D" && exit 1
> +	mkdir -p ${libdir}/X11/fonts/misc
> +	cat >> ${libdir}/X11/fonts/misc/fonts.alias <<_PUNT
> +-*-*-medium-r-normal-*-10-*              -misc-fixed-medium-r-semicondensed--13-120-75-75-c-60-iso8859-1
> +-*-helvetica-medium-r-normal-*-10-*      -misc-fixed-medium-r-semicondensed--13-120-75-75-c-60-iso8859-1
> +-*-serf-medium-r-normal-*-10-*           -misc-fixed-medium-r-semicondensed--13-120-75-75-c-60-iso8859-1
> +-*-*-*-*-*-*-*-*-*-*-*-*-big5-*          -misc-fixed-medium-r-semicondensed--13-120-75-75-c-60-iso8859-1
> +-*-*-*-*-*-*-*-*-*-*-*-*-gb2312.1980-*   -misc-fixed-medium-r-semicondensed--13-120-75-75-c-60-iso8859-1
> +-*-*-medium-r-normal-*-14-*-*-*-*-*-*-*  -misc-fixed-medium-r-semicondensed--13-120-75-75-c-60-iso8859-1
> +-*-fixed-*--14-*                         -misc-fixed-medium-r-semicondensed--13-120-75-75-c-60-iso8859-1
> +_PUNT
> +}

This seems altogether pretty weird.  I'm not quite sure what you are
trying to accomplish but I am fairly sure that this can't be the right
way to do it :-)

For one thing, the fonts.alias file will be appended to every time the
package is installed (or, at least, configured) but won't be removed
when it is uninstalled.  For another thing, these changes will be wiped
out when font-alias is upgraded or reinstalled.  And, finally, you seem
to be aliasing a whole load of fonts of various different sizes (and
even different encodings!) to the same thing, which doesn't seem like it
can be generally good news.

If this is a workaround for some craving that the flash plugin has for
server-side fonts, and the intention is to allow you to run it without
crashing if you don't have the fonts in question, then it would probably
be better to put those bits in some appropriate package of their own so
that distribution people (and/or end users) can decide what they want to
do about it.  I guess there might be an argument for distributing a
dummy-server-fonts package that just ships one font and aliases
everything else to it for the purpose of keeping legacy applications
happy.

p.




