Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mr.dash.four@googlemail.com>) id 1RTaMc-0008F9-Hu
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 15:33:23 +0100
Received: by bkbzs2 with SMTP id zs2so2849129bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 06:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=message-id:disposition-notification-to:date:from:user-agent
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=Rv7IXl9S0aNIY1Z3y56Icvi+jQwLyoFrFf+4b8jHN+Q=;
	b=F/SCFpNXi4QA7e47XJL3LH6i/GI1rUIcRleDe0yoir6bEFudx4q4sbLowzDjLWQsGk
	ze7ktvRcgaigxSg7l1PPYhQbcBdXp09vlmUF52s+FPwPQYWbIcQv2Hseg4iYimhD0YLc
	bg1U7fO2fCcovqoH7PLeksvQz4r4p6zjfFL+k=
Received: by 10.204.10.81 with SMTP id o17mr29528014bko.65.1322144809544;
	Thu, 24 Nov 2011 06:26:49 -0800 (PST)
Received: from [10.68.68.173]
	(cpc2-gill1-0-0-cust1894.basl.cable.virginmedia.com. [82.34.63.103])
	by mx.google.com with ESMTPS id x14sm15948831bkf.10.2011.11.24.06.26.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Nov 2011 06:26:48 -0800 (PST)
Message-ID: <4ECE5422.3070504@googlemail.com>
Date: Thu, 24 Nov 2011 14:26:42 +0000
From: Mr Dash Four <mr.dash.four@googlemail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4EC81A85.8050704@googlemail.com>
	<CAMKF1srcWq1mD4wNZEi2Eff2iMCVcwvjL_swTJ7z1Y6=qjZA1Q@mail.gmail.com>
	<4ECE4B0D.6030401@googlemail.com>
In-Reply-To: <4ECE4B0D.6030401@googlemail.com>
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
X-List-Received-Date: Thu, 24 Nov 2011 14:33:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


> Any ideas why OE can't find my ppl_c libs?
Further to my previous post, the gcc prerequisites are clearly stated 
here -> http://gcc.gnu.org/install/prerequisites.html. Both PPL and 
CLooG are in that list. I have just looked at my OE source directory and 
I could see that neither of these packages have been downloaded during 
the OE build. These are not present in the gcc svn tree either.

Is it possible that the OE build might have missed them and that is why 
it fails? I know that there are two ways to include them for the gcc 
build - either as a subdirectory to the main tree (libppl/ and 
libcloog/) in which case gcc builds them "automatically" or build them 
separately as static libs and then point to these during the actual gcc 
build.

Am I missing something here or is this a bug?


