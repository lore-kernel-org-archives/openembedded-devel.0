Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kristoffer.ericson@gmail.com>) id 1P8slg-0004et-Uf
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 12:53:09 +0200
Received: by ewy1 with SMTP id 1so3020043ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 03:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:reply-to:references:mime-version:content-type
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=YNP4HsEStiMBKJryQAwj7lGbg/XzsRuMRzsSIOp6yrA=;
	b=kfKoPIHVwLzLtiUrjCHmH2EXA91ClTqnchZliFlXpDk+GSCZEDrORY4Ixc4a0Htc56
	3NPWfX71VXTTthwlvaeBQUlNwPKi8Aq+8c8iS3qHzwZrwTOrhcRtT+9EMyVJZtAoIGoo
	tD4GWy42krvqtskdP0xzoFwiBUTbLXCrVYMVk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:reply-to:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=IPKvjHze06nCs/xYhzbtNEVjDPETxgLpa9rto92RuX5GNbHWDj4D26Oa4rfag/htpk
	UuNcG4hGR4v17lMh7kBjHgOxeXAuK2JRE9xT7gR91qPMF69+AaO84zWW/PyLcgTGwxPI
	Ex4Qieh1UPSlHt652Hv44GZWmOsr2opD2LxKc=
Received: by 10.14.37.10 with SMTP id x10mr447360eea.33.1287658353785;
	Thu, 21 Oct 2010 03:52:33 -0700 (PDT)
Received: from localhost (c-fedae555.010-30-6c6b7012.cust.bredbandsbolaget.se
	[85.229.218.254])
	by mx.google.com with ESMTPS id w20sm1626324eeh.0.2010.10.21.03.52.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Oct 2010 03:52:32 -0700 (PDT)
Date: Thu, 21 Oct 2010 12:56:05 +0200
From: Kristoffer Ericson <kristoffer.ericson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101021105605.GB861@boggieman.bredbandsbolaget.se>
References: <201010151039.08619.marcin@juszkiewicz.com.pl>
	<20101018201429.GA818@boggieman>
	<201010190927.27217.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
In-Reply-To: <201010190927.27217.marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: kristoffer.ericson@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RFC: remove old kernels
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
X-List-Received-Date: Thu, 21 Oct 2010 10:53:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Oct 19, 2010 at 09:27:26AM +0200, Marcin Juszkiewicz wrote:
> Dnia poniedziałek, 18 października 2010 o 22:14:29 Kristoffer Ericson 
> napisał(a):
> > > 2. Drop kernels older then 2.6.20 - it was over 3 years ago so if someone
> > > uses older one then probably also uses 3 years old OE. 
> > 
> > Not sure that this is a good idea really. As an example, the best kernel
> > for the hp6xx is the 2.6.17 (yes its old I know, but everything works).
> > For the hp7xx its currently 2.6.19 (although its changing shortly to
> > 2.6.34).
> 
> Thats why I wrote "if you care about something raise your hand". As you are 
> maintainer of hp[67]xx machines and you know that 2.6.17/19 are best for them 
> then they stay.
>  
> > So how about putting the limit somewhat lower :) ? Like 2.6.15?
> 
> How about 2.2.2 one?

Sarcasm noted and throwned out the window :P As long as those two kernels
stay Im satisfied :)

> 
> Regards, 
> -- 
> JID:      hrw@jabber.org
> Website:  http://marcin.juszkiewicz.com.pl/
> LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


