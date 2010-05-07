Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OALUC-0001Z3-7B
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 13:12:52 +0200
Received: by fxm11 with SMTP id 11so698749fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 May 2010 04:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=K7QB785G3GV2kDBSuLIqAbgSbol4Fx8kLI4qHTwXrZo=;
	b=fINCu9RcGdHrtJQNDlf5xNwyCb2Z0by78nnHZ9HR574+59+BBY/aNANa9gvc7GoNh2
	PTb0iEK0TLvHaVvSqRvI7kcp/bMN98veNHYbdEUmCP2wxd8PZ0SCqrWQlQWj8J7k/mUr
	Q4o2Iqq5YmjhgmWpIBySldEjNJBEKSjP+DkaM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=isDgC3VzBRX+YYepqlYIxnnFNZlUWP+QDcZ9Xjn2bXSOWiYCNtgE6zEre1tAHphpkR
	7RpQL1HhiaUb9n/WWJ6UZuP7lW42aBZ+feXe50Qfu5/qIyCted+Vb6MuXCIkSi8Q5CV0
	gOc1Tsi7ycNPxyXtXyIl/KcsSDyjbucRoHKWI=
Received: by 10.223.50.68 with SMTP id y4mr1337524faf.51.1273230542862;
	Fri, 07 May 2010 04:09:02 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 2sm6200976faf.15.2010.05.07.04.09.01
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 07 May 2010 04:09:02 -0700 (PDT)
Date: Fri, 7 May 2010 13:09:00 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100507110900.GF3204@jama>
References: <4BE25BFD.2090204@dresearch.de> <hrtmn1$bp1$3@dough.gmane.org>
	<4BE3C542.4070603@dresearch.de> <4BE3F2AE.8060305@dresearch.de>
MIME-Version: 1.0
In-Reply-To: <4BE3F2AE.8060305@dresearch.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: All the syslogs
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
X-List-Received-Date: Fri, 07 May 2010 11:12:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 07, 2010 at 12:59:58PM +0200, Steffen Sledz wrote:
> > OK, than i'll try to create an u-a setting for all the syslogs (btw: we
> > have not three but four different ones, there's sysklogd too).
> > 
> > Has anyone combined update-alternatives and update-rc.d for initscripts
> > before? I'm afraid there are some pitfalls in the naming of the initscript
> > itself and the symlinks.
> 
> I made some first tests and they confirmed my fears. :(
> 
> The recipes look like this:
> 
> -------------------->snip<---------------------------
> inherit autotools update-rc.d
> 
> do_install_append() {
>         ...
>         install -m 755 ${WORKDIR}/initscript ${D}/${sysconfdir}/init.d/syslog.${PN}
> }
> 
> pkg_postinst_${PN} () {
>     update-alternatives --install ${sysconfdir}/init.d/syslog syslog-init syslog.${PN} 300
> }
> 
> pkg_prerm_${PN} () {
>     update-alternatives --remove syslog-init syslog.${PN}
> }
> 
> INITSCRIPT_NAME = "syslog"
> -------------------->snip<---------------------------
> 
> When opkg installs the packages it wants to run update-rc.d *before*
> update-alternatives. This results in an "file does not exist" error. :(
> 
>   Installing rsyslog (5.5.4-r1.0.5) to root...
>   Installing busybox-syslog (1.13.2-r24.1.5) to root...
>   Configuring rsyslog
>   update-rc.d: /etc/init.d/syslog: file does not exist
>   update-alternatives: Linking //etc/init.d/syslog to syslog.rsyslog
> Any suggestions?

If there is only one u-a file in recipe you can try
inherit update-alternatives to see if it will generate postinst commands
in right order.

Or in worse case, move update-rc.d logic to your postinst scripts after
setting u-a links.

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


