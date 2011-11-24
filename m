Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mr.dash.four@googlemail.com>) id 1RTdnN-0006zW-Ks
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 19:13:14 +0100
Received: by bkbzs2 with SMTP id zs2so3079467bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 10:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=message-id:disposition-notification-to:date:from:user-agent
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=yDc+/k9GVAXhvaU5/vx/9Hcu6GEHbQiRayikt/0LKjU=;
	b=FKV3OmXscVon5BInVWGNLs7yAZCKWjIGJg4BxZayUeaow0d4FmcRN2/KOnL0R6bM5E
	lsRe/tqOGos9sEcuECAj3tQDjBFGSFegffu+DLQ+o4JIDuO67WYz8IRH1R6SenzUmx4z
	AKbo5UcO25MLCsi+QFcNPHIBdECWrJuGIlAdE=
Received: by 10.204.143.148 with SMTP id v20mr26343261bku.104.1322158000440;
	Thu, 24 Nov 2011 10:06:40 -0800 (PST)
Received: from [10.68.68.173]
	(cpc2-gill1-0-0-cust1894.basl.cable.virginmedia.com. [82.34.63.103])
	by mx.google.com with ESMTPS id l5sm13013377bkv.9.2011.11.24.10.06.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Nov 2011 10:06:38 -0800 (PST)
Message-ID: <4ECE87A9.8040109@googlemail.com>
Date: Thu, 24 Nov 2011 18:06:33 +0000
From: Mr Dash Four <mr.dash.four@googlemail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4EC81A85.8050704@googlemail.com>
	<CAMKF1srcWq1mD4wNZEi2Eff2iMCVcwvjL_swTJ7z1Y6=qjZA1Q@mail.gmail.com>
	<4ECE4B0D.6030401@googlemail.com> <4ECE5422.3070504@googlemail.com>
	<20111124174936.GA28767@sakrah.homelinux.org>
In-Reply-To: <20111124174936.GA28767@sakrah.homelinux.org>
Subject: Re: "cannot find -lppl_c" link error
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
X-List-Received-Date: Thu, 24 Nov 2011 18:13:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


>> Am I missing something here or is this a bug?
>>     
> I think the fact that you have ppl/cloog installed its trying to use it
> general distros dont install them by default and hence more often gcc
> with OE is build without them.
>
> what we could have done in OE is disable ppl/cloog exlicitly in
> configure
>   
OK, but how does this tie up with the error I am getting? The ppl/cloog 
libs are clearly installed and in the library path, but the toolchain's 
gcc cannot be build because the said libraries "cannot be found"? How do 
I correct this so that my build could proceed further?


