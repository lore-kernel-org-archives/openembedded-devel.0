Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OBrFC-0002SY-Kz
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 May 2010 17:19:39 +0200
Received: by fxm11 with SMTP id 11so3713025fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 May 2010 08:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=HZt+Tsl1bGOPNBgwqNsRUjh3PG1gkGHOpidsq0xzzZw=;
	b=aGFjbtRST84pJKNNQCNTPSW0bhfnrRUK+WehOwO7y9/5kNxlEIruAS+U28HiNAgFpl
	O8sY8n8KA51AU6ECzFZA5OiRS0Nq2EsKMD+cbCtArOhcbYzxEhYNB9QBDscJhskMImTP
	ifmquEW0nG5cFFaAas87SgRPgwIvdh7P1b10w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=g7xns+Vafkm4xKTUrBgYvIh5K3jSR8kh5P+c5yrYCnFFXowcX7LQLq77hvKnmyQMqm
	/kBR894hO6+1pymKYdWceEEmWponlbUOE1wmIKoPyzaYqm6oZgODO6Esps3mGb5nBqFF
	h/8bSMSun/w94/CZoCNOstBQu4ki8/wQ2UMAA=
Received: by 10.223.21.17 with SMTP id h17mr6473927fab.45.1273590945428;
	Tue, 11 May 2010 08:15:45 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id z12sm27048850fah.21.2010.05.11.08.15.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 11 May 2010 08:15:44 -0700 (PDT)
Date: Tue, 11 May 2010 17:15:49 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100511151549.GB30963@jama>
References: <201005111904.06230.khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <201005111904.06230.khimov@altell.ru>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] logrotate scripts policy
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
X-List-Received-Date: Tue, 11 May 2010 15:19:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 11, 2010 at 07:04:05PM +0400, Roman I Khimov wrote:
> Hello all.
> 
> Seems like most OE users are fine with /var/log being on tmpfs and thus not 
> care about logs and their rotation. We actually care about logs and thus need 
> to rotate them. I have several patches adding logrotate scripts to recipes but 
> I'd like to discuss the way they should be packaged in order to satisfy both 
> camps (caring about logs and don't) and hopefully develop some policy for 
> that.
> 
> As of now, my patches package logrotate scripts like this:
> 
> +PACKAGES =+ "${PN}-logrotate"
> +FILES_${PN}-logrotate = "${sysconfdir}/logrotate.d/squid"
> +RRECOMMENDS_${PN} += "${PN}-logrotate"
> +RDEPENDS_${PN}-logrotate += "logrotate"
> 
> It works fine here, but I guess that people not caring about logs don't want 
> to have logrotate installed and probably don't want /etc/logrotate.d cruft 
> either. So, an opposite approach could be:
> 
> +RSUGGESTS_${PN} += "${PN}-logrotate"
> +RSUGGESTS_${PN}-logrotate += "logrotate"
> 
> But then if you need logrotate scripts, you have to add all those *-logrotate 
> packages to the respective image along with logrotate program itself. As the 
> number of *-logrotate packages can be quite big it might be easier to add some 
> IMAGE_LINGUAS-alike hook to image class with "IMAGE_LOGROTATE=y" parameter 
> activating it.
> 
> So, probably a better approach and what I'm proposing is:
> 
> +RRECOMMENDS_${PN} += "${PN}-logrotate"
> +RSUGGESTS_${PN}-logrotate += "logrotate"
> 
> This way all *-logrotate packages will get installed by default, but not the 
> logrotate program. So, it will eat some little space in /etc/logrotate.d for 
> everyone by default (but you can get rid of those packages if you really don't 
> want them), but would allow to switch rotation on/off easily with just one 
> package included or not in the image.
> 
> Also, in org.oe.dev there is already callweaver, asterisk and cluster-
> resource-agents that have logrotate scripts installed in /etc/logrotate.d 
> (that legitimizes RRECOMMENDS for *-logrotate a bit) and callweaver 
> RRECOMMENDS logrotate (asterisk has that commented out, so it supports 
> RSUGGESTS approach to logrotate itself a bit).
> 
> Suggestions, recommendations, comments?

Both proposed aproaches seem good to me. We have /var/log on tmpfs but I
would still add logrotate to image because realy big log in tmpfs is
much worse than few more kB in image (nobody wants a unusable phone 
after 3 days just because of ram full of logs).

But maybe there are different "optimal" logrotate rules for people with
tmpfs and without, which is IMHO harder to implement. I don't care about
logs enough to ask for this :).

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


