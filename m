Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TnQfm-0003Dr-TG for openembedded-devel@lists.openembedded.org;
	Tue, 25 Dec 2012 10:19:43 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TnQRc-0005DI-SH for openembedded-devel@lists.openembedded.org;
	Tue, 25 Dec 2012 10:05:05 +0100
Received: from 107-110-80-78.tmcz.cz ([78.80.110.107])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Dec 2012 10:05:04 +0100
Received: from Martin.Jansa by 107-110-80-78.tmcz.cz with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Dec 2012 10:05:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 25 Dec 2012 08:59:18 +0000 (UTC)
Message-ID: <loom.20121225T095809-297@post.gmane.org>
References: <20121204094952.4CDE010383@opal>
	<20121204121707.GG14870@jama.jama.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 78.80.110.107 (Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20100101 Firefox/17.0)
Subject: Re: [oe-commits] Marcin Juszkiewicz : php: add apache configuration for php-fpm
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
X-List-Received-Date: Tue, 25 Dec 2012 09:19:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Martin Jansa <martin.jansa <at> gmail.com> writes:

> 
> On Tue, Dec 04, 2012 at 09:49:52AM +0000, git <at> git.openembedded.org wrote:
> > Module: meta-openembedded.git
> > Branch: master
> > Commit: 8424c379fba43c5073b1ca12ba6cb0546c822f3a
> > URL:   
http://git.openembedded.org/?p=meta-openembedded.git&a=commit;h=8424c379fba43c5073b1ca12ba6cb0546c822f3a
> > 
> > Author: Marcin Juszkiewicz <marcin.juszkiewicz <at> linaro.org>
> > Date:   Wed Nov 28 22:17:09 2012 +0000
> > 
> > php: add apache configuration for php-fpm
> > 
> > Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz <at> linaro.org>
> > Signed-off-by: Koen Kooi <koen <at> dominion.thruhere.net>
> 
> Not sure if it's caused by this patch or some other php change (except
> that upgrade), but now it has more unpackaged files:
> 
> WARNING: QA Issue: php: Files/directories were installed but not shipped
>   /var
>   /var/run
>   /var/log
>   /etc/php-fpm.conf.default
>   /OE
>   /OE/jansa-test
>   /OE/jansa-test/shr-core
>   /OE/jansa-test/shr-core/tmp-eglibc
>   /OE/jansa-test/shr-core/tmp-eglibc/sysroots
> 
> There was just that sysroots dir with older php version and php_5.3.19.bb 
> (only upgrade without other php patches)

Even more unpackaged directories when building without DISTRO set:
php-5.3.19: php: Files/directories were installed but not shipped
  /home
  /var
  /etc/php-fpm.conf.default
  /home/jenkins
  /home/jenkins/oe
  /home/jenkins/oe/shr-core-branches
  /home/jenkins/oe/shr-core-branches/shr-core
  /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc
  /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots
  /var/run
  /var/log
  /var/volatile
  /var/volatile/run
  /var/volatile/log




