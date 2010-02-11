Received: from mail-fx0-f225.google.com ([209.85.220.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NfUl8-00066l-Jj
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 09:50:53 +0100
Received: by fxm25 with SMTP id 25so836354fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2010 00:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=B9aq9tR/45hZq5qv6zCGOS21wyf7wHaCLEiu7psw6Jw=;
	b=a1BRB0SZYUgPitCt729ci5j9ndWtJqh8NMSSlsOG7TG+ZLG9Go2c1jKej1d2H8vwfe
	+gpCbmBD+NCYFcKqfRrsUfMlFQwkaIwomurTKQ2BzlLAD6k8xg2IDf91EbtLxOp96oOj
	eWqRtpnKgxRdk82df7NZ+Q3zXg9vGYv4uIkxc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=NZarLWCSb6BdBz79uPfzDdcEuKdFhsic/RSMUnWY8/lHrb8lMsHGLtZLnRWM9scVPf
	3IUENIi/WXa6+RQMwVJOupZf+0eIa4akigZqLrU0HvMf0kppnikZ0o2aOG6+AZrNcM/R
	uV3CdxpRG1eCKcSTT+MfZ4lWF7V7CYfWlx+PU=
Received: by 10.223.6.150 with SMTP id 22mr1853289faz.12.1265878096438;
	Thu, 11 Feb 2010 00:48:16 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm1030919fxm.13.2010.02.11.00.48.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 11 Feb 2010 00:48:15 -0800 (PST)
Date: Thu, 11 Feb 2010 09:47:57 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Steffen Sledz <sledz@dresearch.de>
Message-ID: <20100211084757.GE3378@jama>
References: <4B716436.6040301@dresearch.de>
	<1265784508-19281-1-git-send-email-sledz@dresearch.de>
	<4B73C297.70709@dresearch.de>
MIME-Version: 1.0
In-Reply-To: <4B73C297.70709@dresearch.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.225
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] vala-dbus-binding-tool-0.1.3: new recipe
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
X-List-Received-Date: Thu, 11 Feb 2010 08:50:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 11, 2010 at 09:40:55AM +0100, Steffen Sledz wrote:
> Steffen Sledz wrote:
> > Creates gobject interfaces out of DBus XML specifications.
> > 
> > Signed-off-by: Steffen Sledz <sledz@dresearch.de>
> > ...
> 
> No objections? So i will push this patch soon.
> 
> Steffen

I expect that you would move it to freesmartphone directory as is:
recipes/freesmartphone/vala-dbus-binding-tool-native_git.bb

Even better if you can use BBCLASSEXTEND="native" to merge those 2
recipes together.

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


