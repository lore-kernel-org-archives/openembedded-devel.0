Received: from [209.85.146.178] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MQmR6-00057y-7s
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jul 2009 20:09:05 +0200
Received: by wa-out-1112.google.com with SMTP id j4so426019wah.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jul 2009 10:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=x0j7oSsik3jS1sXgm5oYlZJKTVaizYLvaT48Z+dM2Fc=;
	b=cSWvFJT9GU3GPx3xB+sfFFwzs12VAoAyrT9LJw3TP1urGdzHxZ8+rPEnR4LpQhnxSw
	Jbh7thaMmvB1HeUIzuz1Xcv000mUJo3F3Qssk/10tbjtuz0yM+JUNlta2dmTSPUAGGZ6
	i2Ksmatpc7fyng+6+0Zp6yT3yIg4mWVfoC1is=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=aWshT7ERAzy/hn/n6ZWuhYZ3eVxXFBBaYuXIFHfl8NdnxDAikIbdgrEshisN+HmkFd
	QyWsOZxaZRZ3FuU/2mP0LhViTABHKfFCKt6aDmlNEwB8mlGstIDnblx/phwppzrnGyz6
	CLRQ7lE4UL1PC87zurrV3vXIvgz/rcnavSOi4=
Received: by 10.114.185.12 with SMTP id i12mr10999180waf.123.1247594144833;
	Tue, 14 Jul 2009 10:55:44 -0700 (PDT)
Received: from gmail.com (adsl-71-146-11-93.dsl.pltn13.sbcglobal.net
	[71.146.11.93])
	by mx.google.com with ESMTPS id j39sm11632976waf.10.2009.07.14.10.55.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 14 Jul 2009 10:55:43 -0700 (PDT)
Date: Tue, 14 Jul 2009 10:55:39 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090714175539.GA5298@gmail.com>
References: <20090714170415.GA24919@rhein.zuhause.netz>
MIME-Version: 1.0
In-Reply-To: <20090714170415.GA24919@rhein.zuhause.netz>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
Subject: Re: Broken git-native in dev
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
X-List-Received-Date: Tue, 14 Jul 2009 18:09:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (14/07/09 19:04), Henning Heinold wrote:
> Hi,
> 
> today I stumbled over some mess up with git-native. I wondered why disk was full. I examined
> that my staging dir was about 3 gig's. I examined further and found ot that most of the space comes
> from i686-linux/libexec/git-core. Problem is we install git-bins without calling strip
> so each 130 executables is about 22 Megs. If no one has a quick solution I will try dig further.
> 

I think this is due to -ggdb3 flag being passed to native recipes.
Unless we want to debug native recipes we should avoid excessive debug
info for those packages to save on disk space.

> Maybee we should put a test in the native class which checks if the executables are striped.

yeah that would work too but then why generate debug info at all if we 
do not want to keep it.

Thx
-Khem


