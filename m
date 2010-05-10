Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OBORX-0006XU-JX
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 May 2010 10:34:28 +0200
Received: by fxm11 with SMTP id 11so2178144fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 May 2010 01:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=86BwGTmYJXuIqipw3hI7XnwFWHpRgpO5VR2KqUf/d3s=;
	b=rcmYeSF5cMab36ewMm4uPpSpKmcvcy3vOhc8EYmwmuR4nK5m3eKo7k13TCRELW/ELT
	zpOX/tH3+NkNz665MRm97CCnSbC17bUIID1v98K0e3UD4w7IYNzN9qwoxZ0LdcNLaTl6
	2c54/czcLFlXxZzJjuvKmShO9fFJeEWgmygig=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=YjuzqNfnPgfmS8mliK9Io6QDKKdQstWakZmM5wUq+Arx2Byj0MPP6UQ/DJku4nyx0w
	lS+VW4G+B9Y44UTdsCkQsfmtfCcxNnVHeXd0bYWYQlKO0/sOwwbtzbdOqp5+KGtWp2lo
	rQxC4UrNozQiT2Hc0+rluCvyCRUVhLpZ5bcrs=
Received: by 10.223.17.150 with SMTP id s22mr3979941faa.14.1273480235401;
	Mon, 10 May 2010 01:30:35 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 7sm20432139far.18.2010.05.10.01.30.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 10 May 2010 01:30:34 -0700 (PDT)
Date: Mon, 10 May 2010 10:30:31 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100510083031.GB3188@jama>
References: <4BE41DF5.7040805@dresearch.de>
	<1273242036-7529-1-git-send-email-sledz@dresearch.de>
	<20100507144927.GH3204@jama> <4BE42BFB.2020806@dresearch.de>
MIME-Version: 1.0
In-Reply-To: <4BE42BFB.2020806@dresearch.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] busybox/syslogs: use update-alternatives for syslog selection
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
X-List-Received-Date: Mon, 10 May 2010 08:34:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 07, 2010 at 05:04:27PM +0200, Steffen Sledz wrote:
> > Configuring busybox-syslog.
> > update-rc.d: /etc/init.d/syslog: file does not exist
> > update-alternatives: Linking //etc/init.d/syslog to syslog.busybox
> 
> Are you sure that you run the patched version? It looks like
> running a version without touch in pkg_preinst.

Yes I'm sure.

Both reported problems are the same with PATCHv2.
Not sure why now I see also Permission denied (but maybe it was the same with PATCHv1).


SHR root@gojama ~ $ opkg remove busybox-syslog
Removing package busybox-syslog from root...
update-alternatives: removing //etc/init.d/syslog as no more alternatives exist for it
//usr/lib/opkg/info/busybox-syslog.prerm: line 6: /etc/init.d/syslog: Permission denied
Collected errors:
 * pkg_run_script: prerm script returned status 126.
SHR root@gojama ~ $ opkg install busybox-syslog
Installing busybox-syslog (1.15.3-r28.1.4) to root...
Downloading http://jama.homelinux.org/org.openembedded.shr/armv4t/busybox-syslog_1.15.3-r28.1.4_armv4t.ipk.
Configuring busybox-syslog.
 System startup links for /etc/init.d/syslog already exist.
/usr/sbin/update-rc.d: line 237: /etc/rc5.d/S20syslog: Permission denied
update-alternatives: Error: not linking //etc/init.d/syslog to syslog.busybox since //etc/init.d/syslog exists and is not a link
Collected errors:
 * pkg_run_script: postinst script returned status 1.
 * opkg_configure: busybox-syslog.postinst returned 1.

> 
> > ...
> >> -INITSCRIPT_NAME = "sysklogd"
> >> -INITSCRIPT_PARAMS = "start 39 S 1 2 3 . stop 99 0 6 ."
> > 
> > params not needed anymore?
> 
> Fall back to the defaults like in all the other syslog recipes.

OK.

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


