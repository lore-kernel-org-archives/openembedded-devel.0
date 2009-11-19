Received: from mail-fx0-f209.google.com ([209.85.220.209])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NB9cf-00085M-M6
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 17:12:44 +0100
Received: by fxm1 with SMTP id 1so2445466fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2009 08:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=8uVwFVn6KW+pqVdus+vo3c1MJdOKvZ2+f0Albw4Mm/s=;
	b=F10Kydb6T7Zw6lFNFxxic3LL2zY2Z9FxGR73AWPObk937A8zclVpWtvdymRZrlxDd3
	4cq0ZzO9hbcGjC2sKLXjZSEdj3bPu9FJJ9YM6Q+N5ihqT6MUq124VHjlM9tOxX3huQIb
	o5es6vNaKpafeTYm4OEbfgmoWU91rK8Yc9Kp8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=oHc9D6/VkUv7/CVyc6sbUKb5HT+Iou/QTWtW5JBRpa6pndWR9loyXl7vUQqOL12+Xm
	WWi9qgC6aqSvy5ycX6Qy7gDKTbZluD65DCAvJfg8VQMuyxJ07bqdqYDwb0/mvzHYtSK6
	QbK0WIugXOlcW40N9ZTmHV9lHHp6SvWCVg2ZQ=
Received: by 10.204.10.2 with SMTP id n2mr175856bkn.91.1258647076760;
	Thu, 19 Nov 2009 08:11:16 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm236792fxm.4.2009.11.19.08.11.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 19 Nov 2009 08:11:16 -0800 (PST)
Date: Thu, 19 Nov 2009 17:11:08 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091119161108.GC3366@jama>
References: <20091115163618.GA3317@jama> <hdr31n$8b0$1@ger.gmane.org>
	<1258364356.5799.94.camel@dax.rpnet.com>
	<hdra17$t4d$1@ger.gmane.org>
	<1258368570.5799.99.camel@dax.rpnet.com>
	<hdrb9v$1dp$1@ger.gmane.org>
	<1258371591.5799.112.camel@dax.rpnet.com>
	<hdrffa$do6$1@ger.gmane.org>
	<1258375022.16625.3.camel@dax.rpnet.com>
	<he3q5u$mq2$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <he3q5u$mq2$1@ger.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.209
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SRCPV migration
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
X-List-Received-Date: Thu, 19 Nov 2009 16:12:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 19, 2009 at 05:02:05PM +0100, Koen Kooi wrote:
> On 16-11-09 13:37, Richard Purdie wrote:
> 
> >I think we will have to hold off some of the SRCPV migration until
> >bitbake has some kind of lock down functionality for the local build
> >numbers.
> 
> So at least 2 core developers (Richard, me) have said we shouldn't
> use SRCPV for git stuff, and what do I spot today:
> 
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=4f1f60e0f46324c6a968aff9bffeb727d98d5283
> 
> +PV = "0.0+1.0rc2+gitr${SRCPV}"
> 
> FFS!

Sorry for that :/

I'm merging stuff from shr/merge branch where its already used and it
sliped through.

Should I commit SRCPV->SRCREV now, or is it ok for now as there is also
DEFAULT_PREFERRENCE = -1? which I also should set to -2 to ensure that
won't be pulled instead of mplayer_svn :/.

Sorry again..

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


