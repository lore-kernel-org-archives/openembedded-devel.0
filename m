Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PIEor-0004ju-5X
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Nov 2010 07:15:06 +0100
Received: by bwz10 with SMTP id 10so320292bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Nov 2010 22:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=BQwIiGDxkUvXoFxUceh5SdyVPebuQohoQVgHwFm8pYs=;
	b=Hs+BBJKCeAxhEcb1+m9UPTogTE9KRXZYpBL++oQoFDEd8GvVfGDNgGsKGhJdy2UiuW
	qsoJBuEQjpIM6BlrS8AS8pUM5XJ5Vbupai6RMC7UCNXIhIpb3FlAtXuV4FZ6KFpJOE4d
	tyrn0qBvwIjDX8Gz/fPL6AcPsX4sDcCu5xE8k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=kHJ2/4DqplkWJqyhcdvEj5ug2udpsoOAw+rldI/8EQOsCWAyD+Tr2qDNDQcRWrD5gk
	mGLBA7YT0GUktU6d2FQLYAgB47cCDWMmmQVBeqll3CEQOfV+QGe6OWW3Zw3OryKiafBj
	p96m6AZ9lPl4NZcugVKS63t4dkSHRV1aY90CY=
Received: by 10.204.116.201 with SMTP id n9mr7133126bkq.138.1289888035260;
	Mon, 15 Nov 2010 22:13:55 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id p34sm387158bkf.15.2010.11.15.22.13.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 15 Nov 2010 22:13:52 -0800 (PST)
Date: Tue, 16 Nov 2010 07:13:52 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101116061352.GG20958@jama>
References: <4CE1D1D1.1000009@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4CE1D1D1.1000009@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: emacs copying ${STAGING_DIR_TARGET} - wtf?
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
X-List-Received-Date: Tue, 16 Nov 2010 06:15:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 16, 2010 at 11:05:29AM +1030, Graham Gower wrote:
> emacs.inc has this nugget in do_compile_prepend():
> cp -pPR ${STAGING_DIR_TARGET}/* $treedir

ah, ugly indeed :/
> 
> During a world build, both emacs and emacs-x11 copy some 5GB into
> their work dirs. This really seems like overkill.
> 
> Could someone familiar with building emacs take a look to see if
> there is a reasonable alternative?
> 
> thanks,
> -Graham
> 
> PS: emacs and emacs-x11 fail for me in do_compile.

Do you have make-3.82 on your host? emacs-x11_23.1.bb compiles fine with
SHR.

Regards,
-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


