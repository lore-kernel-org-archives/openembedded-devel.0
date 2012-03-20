Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vwyodapink@gmail.com>) id 1SA6sL-0004Ib-Dc
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Mar 2012 22:45:53 +0100
Received: by qao25 with SMTP id 25so326661qao.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2012 14:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=s6FSOamL0nrZyX5fHubQbGmQ2PuX89WwIti9Aq5DFrs=;
	b=sZ/g4wYy48C8ShsCHmdvAXwHdtjcYYf1Nhf0rWQGy9B2c/jb4U7PUlLswQhjMAFkDv
	aLyY2ytubDg42Uy8IzzKfoPXiCVbl5U/aV7I1nDvh1641sI5ODuG4eO3sgR6XIcNWkpy
	48SEybu6iXsaNzfhTrzJU97nVZkNzKWZWUz8hMYcZNoDNs1bzV2w+PYO5z04Ay/WFsOF
	8Go+9HiBbUlJdRRqZsBRrqZaMy7/UucNzwAlza6y97jpWAuP2hGGzhkSx6E031zW8dCK
	fqi1HLQXLQvV3kPGdRqItqcuQ5CGln2bZp9A5im1y9ntRFabPLQ83E3p+NoBCefzik0U
	4oUA==
Received: by 10.224.31.84 with SMTP id x20mr2976704qac.63.1332279419930;
	Tue, 20 Mar 2012 14:36:59 -0700 (PDT)
Received: from [192.168.1.3] (dpc674485156.direcpc.com. [67.44.85.156])
	by mx.google.com with ESMTPS id j17sm4726058qaj.9.2012.03.20.14.36.55
	(version=SSLv3 cipher=OTHER); Tue, 20 Mar 2012 14:36:59 -0700 (PDT)
Message-ID: <4F68F86D.3020606@gmail.com>
Date: Tue, 20 Mar 2012 14:36:45 -0700
From: j <vwyodapink@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120314 Thunderbird/11.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F66789C.7010503@gmail.com>
In-Reply-To: <4F66789C.7010503@gmail.com>
Subject: Re: having issues with libprelude and libpam
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
X-List-Received-Date: Tue, 20 Mar 2012 21:45:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/18/2012 05:06 PM, j wrote:
> I am trying to get libpam to build which fails due to not finding the 
> header from the libprelude build, which currently also fails to build 
> for me. I am hoping someone knows of a fix or can point me to the 
> right place to dig for a solution, I do not see any listed fixes or 
> workarounds from my digging online. I have attached the build logs for 
> each as well, since they were long if the preferred method is 
> different, sorry and please let me know how to post those. In the 
> libprelude error its saying there are files that seem to have moved, 
> but they actually exsist in the location it says it does not.
>
> I am running on Ubuntu 11.04 32bit (up to date). Bitbake branch 1.12, 
> OE branch overo-2011.03 (both up to date). I know this is not your 
> guys branch but have not gotten any feed back on gumstix in relation 
> to issues building these packages, so checked them verse what I 
> believe was the master branch and they had no diff. If I can give more 
> info on system specs or anything like that please let me know. I 
> believe I know the "issues" just not sure how to go about solving 
> them, as libprelude seems like a more serious error. These are the 
> only two packages that fail to build for image that do not rely on 
> these lib's. I also have both of these installed on the build machine 
> itself, I also built everything each rely on for the build, at least I 
> believe I did none failed.
>
> Thanks a ton for any help or info.

Well switching to the mainline branch but still bitbake 1.12 both still 
fail to build for me in the same manner. Does anyone have any ideas for 
libprelude that I can maybe try or try and track down further? As libpam 
should build once libprelude does.

Thanks for any help.


