Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PCc1Y-0006zD-GC
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Oct 2010 18:49:02 +0100
Received: by bwz10 with SMTP id 10so3838739bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Oct 2010 10:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=UUfbKpi/MNXsdZ0IiTvheQQBYkoPGpTuVb6eaiXX2M8=;
	b=oNvJAjOAp7GIkV18B74BB/u0ZQcfsneHlPRJ3O/YQptZk3PKoFnnkIGY0tb6OOa2x2
	03uJfpto1dol0uEI1gyomJFqUwcw+a15b38tEa+Sam8SAdPnpN/t6Wq2o3v3XrP1aWtc
	tBG8/KMWvHYgnOWwhYrxaI3rR4eBraNLvQOlY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=keQiRR+hEYS1lyjbWjnORnA0KgH15S7w1Mtlwk4i1YpSIABMJFLqmXGYJVTh6kawkD
	tnca0/6oGkQEbXuuszyDsYJjQJJ4bPYPjXgbuPNUr00cp9v8NoEPojZcoSOlGyoHc+K0
	j/1bNX6155DOPZMQ5TedyAC8zlBpbcMgpOoxs=
Received: by 10.204.131.209 with SMTP id y17mr12121994bks.32.1288547289988;
	Sun, 31 Oct 2010 10:48:09 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 4sm2760563bki.13.2010.10.31.10.48.08
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 31 Oct 2010 10:48:09 -0700 (PDT)
Date: Sun, 31 Oct 2010 18:48:00 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Menzel <paulepanter@users.sourceforge.net>
Message-ID: <20101031174800.GD6312@jama>
References: <1288543618.13060.5.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1288543618.13060.5.camel@mattotaupa>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] accelges_svn: sort `DEPENDS` alphabetically
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
X-List-Received-Date: Sun, 31 Oct 2010 17:49:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 31, 2010 at 05:46:58PM +0100, Paul Menzel wrote:
> Date: Sun, 31 Oct 2010 13:49:32 +0100
> 
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
>  recipes/accelges/accelges_svn.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/accelges/accelges_svn.bb b/recipes/accelges/accelges_svn.bb
> index db6a6ee..805dc11 100644
> --- a/recipes/accelges/accelges_svn.bb
> +++ b/recipes/accelges/accelges_svn.bb
> @@ -9,7 +9,7 @@ PR = "r4"
>  PE = "1"
>  SRCREV = "206"
>  
> -DEPENDS = "dbus dbus-glib libxrandr libnotify notification-daemon curl gtk+"
> +DEPENDS = "curl dbus dbus-glib gtk+ libnotify libxrandr notification-daemon"
>  RDEPENDS_${PN} = "notification-daemon"
>  
>  SRC_URI = "svn://accelges.googlecode.com/svn/;module=trunk;proto=http"
> -- 
> 1.7.2.3

Both pushed and patchwork updated, thanks.

BTW: any particular reason to have DEPENDS sorted alphabetically?

Regards,
-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


