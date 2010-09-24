Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OzGMC-0005EI-9V
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Sep 2010 00:03:05 +0200
Received: by bwz2 with SMTP id 2so2364923bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 15:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=FJdEU3LDDnkNyqHYOfJsd4R5MMKpltUC67iuP+flzk4=;
	b=Z8hEfmgksJ39Mp5UhWeL5DtBiCPcZT1pStiYoY19avlrY1zvsxc9Jl0GK8PRNUTvar
	YSdJ33++3dvFFdS/89N8xv7NwAVSTltDBl5LT+7wkx+pJqiE0wgMq1OjffunrXXvfuMH
	0IdTD/2ZLTAX2tbs07ZYC+DGqN0ADjy/Mc4bo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ZWFeMprrHUImToinJ0JYH8zjC9AkuTuPg/kW8mGjhv4qaDbCrvxJCqNHA6TI51Cn0z
	mxA1X2E3Getr6uNluWAa2a5XitTk9UvffLQstXhp4uNd0Y49OYfSFfaZTSAqMTOZfH8w
	NmPgP+1BE5KDf2qmCWIQnqR4SZGgXyAJ6eghc=
Received: by 10.204.67.77 with SMTP id q13mr2379963bki.214.1285365778861;
	Fri, 24 Sep 2010 15:02:58 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id y2sm1948791bkx.20.2010.09.24.15.02.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 24 Sep 2010 15:02:58 -0700 (PDT)
Date: Sat, 25 Sep 2010 00:02:56 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Michael Smith <msmith@cbnco.com>
Message-ID: <20100924220256.GA3423@jama>
References: <4C9D0872.5060404@cbnco.com>
MIME-Version: 1.0
In-Reply-To: <4C9D0872.5060404@cbnco.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: nano RRECOMMENDS ncurses-terminfo
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
X-List-Received-Date: Fri, 24 Sep 2010 22:03:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 24, 2010 at 04:22:10PM -0400, Michael Smith wrote:
> Hi,
> 
> Since 37df6011, nano recommends ncurses-terminfo.
> 
> +# actually RDEPENDS, but ncurses-terminfo is only in ncurses-5.7, so 
> RRECOMMENDS for now
> +RRECOMMENDS_${PN} = "ncurses-terminfo"
> 
> ncurses-terminfo exists in 5.4: it contains 2.4 MB of terminfo data 
> files that is just bloat for most people. (Then again, you could say 
> nano is also just bloat. :) The base ncurses-5.4 package includes some 
> common terminfo files in /etc/terminfo.
> 
> So for me, with ncurses 5.4, nano shouldn't depend on or recommend 
> ncurses-terminfo - it just bloats up the image.
> 
> Is there something special in ncurses-terminfo 5.7 that nano needs?

There wasn't any common /etc/terminfo in base ncurses-5.7 package and I
guess it's still isn't. So nano refused to start at all (like other apps
where I added this RRECOMMENDS after we switched to 5.7 and apps started
to fail.

If it's so big problem then please improve ncurses-5.7 recipe to include
most common terminfos and then feel free to drop those RRECOMMENDS I've
added. Or just move to newer ncurses (ie because of problems with newer
distributions on buildhost, also discussed here).

Regards,

> Thanks,
> Mike

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


