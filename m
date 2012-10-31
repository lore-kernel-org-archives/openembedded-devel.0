Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martiert@gmail.com>) id 1TTXOR-0008Tb-TK
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Oct 2012 13:27:35 +0100
Received: by mail-bk0-f47.google.com with SMTP id jk7so546273bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2012 05:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=abQeR/n1wTP2LmaUdw7wDg/eLlTwbV3Oybzgpq3X/fY=;
	b=u2d91htXsjERXyfB0QIEHBaxPBPvNbNtCQP7m8VU3nLs2+EQhQwv+z9iYPsX1+sEte
	Q80/tCALukNDniwvBwGT/D8Ta8pZ/GdESdp5t285G1C9kGsm/G7rJmVygkcslzlg7oPz
	vybFNWz42NXDUl0nLUSO7aCYocCUy09BDCMxrUn3U8EFwqmycy/Sf11JcVzPrKbb5y+7
	Hd9/k98SPaPS6W937LSeERj/mvweQz9gLmJB+OoZF4gVKZmdLoMCPHvdlaGqaGc8b/4w
	r/VXxV4Sx2SA8N0QHYwm7cUwMLFxfvlfv3k783Qoa/wtN0nUFhXGkc9wjghA7Y7wkRVF
	polg==
Received: by 10.204.146.23 with SMTP id f23mr10899973bkv.69.1351685638985;
	Wed, 31 Oct 2012 05:13:58 -0700 (PDT)
Received: from [10.54.74.11] (64-103-25-233.cisco.com. [64.103.25.233])
	by mx.google.com with ESMTPS id r15sm3091349bkw.9.2012.10.31.05.13.56
	(version=SSLv3 cipher=OTHER); Wed, 31 Oct 2012 05:13:57 -0700 (PDT)
Message-ID: <50911500.6010207@gmail.com>
Date: Wed, 31 Oct 2012 13:09:36 +0100
From: =?UTF-8?B?TWFydGluIEVydHPDpXM=?= <martiert@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.9) Gecko/20121025 Thunderbird/10.0.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1351681706-12778-1-git-send-email-otavio@ossystems.com.br>
	<50910EFB.7010804@gmail.com>
	<1351685486.13864.97.camel@phil-desktop>
In-Reply-To: <1351685486.13864.97.camel@phil-desktop>
Subject: Re: [meta-oe][PATCH v2 1/3] meta-systemd: Move ntp recipes to 'meta-networking' sublayer
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
X-List-Received-Date: Wed, 31 Oct 2012 12:27:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/31/12 13:11, Phil Blundell wrote:
> On Wed, 2012-10-31 at 12:43 +0100, Martin Ertsås wrote:
>
>> for now I guess we can just use pool.ntp.org
>
> I'm not sure that this is a very good idea.  The pool.ntp.org
> documentation is fairly explicit that they don't want this:
>
>
>         You must absolutely not use the default pool.ntp.org zone names
>         as the default configuration in your application or appliance. 
>
>
> p.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
Should we just leave the .service files broken then, until someone
registers a pool? Or are we allowed to use someone else's pool?

- Martin


