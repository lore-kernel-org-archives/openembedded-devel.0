Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OgxKV-0005dH-18
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 12:05:39 +0200
Received: by fxm12 with SMTP id 12so2825816fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Aug 2010 03:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=JjYtCt3nztYPBEfYauah9lCct2gJzTMEo9c6RGVxwdE=;
	b=j5efnRoNjwFYnAaMyzdnhnvIZsqxlbsdncFIsVi9AvYhtWD45ZU1SDCLp8jJIdZwSE
	nc+sd7aPjSAxDI9+UppbiuO23gdu7Pdz10rK3WktEZ4DIrXCjT+2EB0DHxVKLvslrbgj
	8UYBeAMBJTnHEknTbptpMs98uBNJ3WfqycAyg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=k8SEYZiwk7hyoEU+IHDFgk7fRbUuR1nF1q29DctREfR8+tNydX9+31NKs+co42OWXk
	Ow6i9PMawsMysnrufFZWnnxC8mjMFE4srYoTVvTp7w6Opa4pFp2uXm5cq2i2bxyoKB6T
	VZPDsBBxNZgpl/ByVN+2gcKG8OJnneD0ifa40=
MIME-Version: 1.0
Received: by 10.204.46.159 with SMTP id j31mr7265023bkf.5.1281002733981; Thu, 
	05 Aug 2010 03:05:33 -0700 (PDT)
Received: by 10.204.21.202 with HTTP; Thu, 5 Aug 2010 03:05:33 -0700 (PDT)
In-Reply-To: <loom.20100805T104704-558@post.gmane.org>
References: <AANLkTik=Xm39yJcLnLH12heRyvS0gUEvSwFCJMBtWeLi@mail.gmail.com>
	<1280926084-7605-1-git-send-email-henri.bragge@dcombus.com>
	<AANLkTinnz+cB5Au1hMsniwFbCSjo-EaNWoR=9Xae4krA@mail.gmail.com>
	<loom.20100805T104704-558@post.gmane.org>
Date: Thu, 5 Aug 2010 12:05:33 +0200
Message-ID: <AANLkTik=13a7k7D1n=VfJnqO5DdPy5PUVdLdnDHtZh1d@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2 1/2] recipe for gsnmp-0.3.0
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
X-List-Received-Date: Thu, 05 Aug 2010 10:05:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/5 Henri Bragge <henri.bragge@dcombus.com>:
> Frans Meulenbroeks <fransmeulenbroeks <at> gmail.com> writes:
>
>>
>> tried to build this, stranded at this:
>>
>> ...
>>
>> NOTE: oestats: task failed, see
>> http://tinderbox.openembedded.net/packages/668019/
>> ERROR: TaskFailed event exception, aborting
>>
>> No idea what the policy on this is, but I'm not too eager to add all kind of
>> certificates to my system
>>
>
> Posted v3, this time with ftp sources. Had forgotten that Deutsche Telekom
> (which that certificate is rooted to) was an untrusted authority.
>
> Sorry the hassle, this is my first patch to oe.

It is no problem, ftp is definitely better than svn/https (at least in
my opinion).
And wrt the hassle: we all had to go through the learning curve at one
point in time.

Frans


