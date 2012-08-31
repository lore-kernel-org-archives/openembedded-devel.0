Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1T7YdE-00021o-Ib
	for openembedded-devel@lists.openembedded.org;
	Fri, 31 Aug 2012 23:20:00 +0200
Received: by daks35 with SMTP id s35so2183513dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2012 14:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=I89e4h0lY1HeWZjZsuB2vdKriRUDOIdFk9s/j47Ocmg=;
	b=ZPhx29DSnyTMFlhczxuKZFf9d/R621RRQHkYvXMxbtVrZzTGT/leJ0HYBqlUaCC2X5
	4EnaUZ2zwb9KWd3DwGJJYYvnr5PJgBU85XhpW+6Kto7CKIpiCxr8RL+H0WQ4Gusm6VUx
	upmhsdF+4lwdqlIUsl3ezA4O1hXgiv/c0NEid7OqLqQsEY9PsIbBKgIAxV6pMrI2gmtW
	ULF1ez+F3QTOeeAsyKebdbjbn9sLK2kr/0yTgN+21/nNnB/GheHcA2Gh02hy71yekABk
	sVtZxh9k8glNHPkTeQ6/hLKpJD4vgpGFkG3aMozksaGCRLBF98mjK3hbi8qhPX5tBv+y
	P0Ng==
Received: by 10.68.224.5 with SMTP id qy5mr20153258pbc.4.1346447262927;
	Fri, 31 Aug 2012 14:07:42 -0700 (PDT)
Received: from bill-the-cat ([2001:470:d:eba:c836:ce4f:cdcf:1baa])
	by mx.google.com with ESMTPS id st6sm4146000pbc.58.2012.08.31.14.07.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 31 Aug 2012 14:07:41 -0700 (PDT)
Date: Fri, 31 Aug 2012 14:07:38 -0700
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120831210738.GB9235@bill-the-cat>
References: <1346107854-28927-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1346107854-28927-1-git-send-email-raj.khem@gmail.com>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [2011.03-maintenance][PATCH] gtk+_2.20.1: Depend on gdk-pixbuf-native
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
X-List-Received-Date: Fri, 31 Aug 2012 21:20:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 27, 2012 at 03:50:54PM -0700, Khem Raj wrote:

> also BBCLASSEXTEND gdk-pixbuf recipes to provide
> native version
> 
> Newer distros which ship glib-2.0 version 2.32+
> there are some missing symbols that gtk+ 2.20
> will complain about. So we create own gdk-pixbuf
> so it does not link to library from host system
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Applied to 2011.03-maintenance branch.

-- 
Tom


