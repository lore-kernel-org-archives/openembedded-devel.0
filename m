Received: from [209.85.211.182] (helo=mail-yw0-f182.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MlHbz-0002Kb-Ma
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Sep 2009 09:29:06 +0200
Received: by ywh12 with SMTP id 12so5756314ywh.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Sep 2009 00:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=FOZe6RCK+WC+1cdZTEd3PnC1xWesNno+x2lEmOfSlxE=;
	b=w0RFAtdefJLX7NT5/lBrAEvqTAE5w5NJcyxXnvkZ24JhWEImp9B031B7S8fMb/MCxS
	05EJrn+Rrtm5OmaHYhBDePXFhXFo9TZsix2//CytZsJbMKG2BH1I5mJ2zBrY2CbMtEjy
	7+v14aNFIxh6Nllox8Xrp3V/eE6ubGjM4Blqs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=MzSBa57zTprTQQGQxJGCHVXnsBJ6gzoWspUj1JpBJlNOYfsf4YSUn/xZEFiuY4Jm7j
	379PvUZrqypxdaUpTetJu6Xt5GxBRwImjxCDvd+MFZIDxqPKa2zyi6Aq54quWoUMjnE5
	nucauBFY4d6Cevz6F+HATyug7MC9Hl2sNnKv4=
Received: by 10.150.236.10 with SMTP id j10mr4957623ybh.313.1252481316643;
	Wed, 09 Sep 2009 00:28:36 -0700 (PDT)
Received: from localhost.minsk.epam.com (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id 20sm458054ywh.2.2009.09.09.00.28.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 09 Sep 2009 00:28:35 -0700 (PDT)
Date: Wed, 9 Sep 2009 10:28:05 +0300
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090909072805.GB19070@localhost.minsk.epam.com>
References: <fce2a370908310326i1f784f25qd4ed91d7864ef38a@mail.gmail.com>
	<1252439456.8256.2.camel@utx.utx.cz>
MIME-Version: 1.0
In-Reply-To: <1252439456.8256.2.camel@utx.utx.cz>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.211.182
X-SA-Exim-Mail-From: ihar.hrachyshka@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Unzip missing
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
X-List-Received-Date: Wed, 09 Sep 2009 07:29:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 08, 2009 at 09:50:56PM +0200, Stanislav Brabec wrote:
> Ihar Hrachyshka wrote:
> > Hello!
> > I encountered the following error when unpacking faad2 recipe on bare
> > debian lenny system (stable/2009 tree):
> > sh: unzip: command not found
> > The problem is that there is no 'unzip' utility on the host. I tried
> > to specify DEPENDS = "unzip-native" for faad2 recipe but it somehow
> > doesn't wait for unzip-native to be built. Any suggestions on how to
> > make faad2 unpack task wait for unzip-native staging? Or should we
> > just put unzip into list of required host software in sanity.bbclass?
> > Thanks for help.
> 
> Here is a fix per-package:
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=d5345f88b5ffdca098e0281f42f51e42ef43e79d
> 
> There can be even more affected packages.
> 

I send unzip autodetection fix two days ago but list was in outage.
Gmail should resend it in a while I think.


