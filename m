Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PyCW0-0004A9-2T
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 01:17:04 +0100
Received: by gwb11 with SMTP id 11so1182586gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 16:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=XvZ5ZvdCBHa0UzmR6J67DCJpPDd+1OZnLSnA/bDGcrs=;
	b=rSRVOR5B2l3L24SdNcJu9Xvj5NRh8FolLv30iFgcr4PbFd5hJe2SktUn+jB/l0e5+w
	ASt7K/Pb2syOhWtukh1LnnqaJ6a+hCASujQg/+ja35Mh4mij62EvzNkNgcuNB9RRT0JL
	/CQj634LTrT7l2LozelypcAN/0XtEwrLKwiZ8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=uS9reYHrM0zAqjpF4hnwXESeQt+el8+O5BuH/HeapNJZ+ZX6v8/VNASotBaytmcnq2
	QTZ8LEFQmvGAK2m5wV+ejN1hb/6wVVqOfAVjDbUes9ww2HImpf1920sNJX1ErfrvwMsl
	oYI1LUQzyXNxopKs0P9cnVTYHkMj7+68Wlk+M=
Received: by 10.150.75.4 with SMTP id x4mr859109yba.410.1299888921657;
	Fri, 11 Mar 2011 16:15:21 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id f2sm3436296ybh.19.2011.03.11.16.15.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Mar 2011 16:15:20 -0800 (PST)
Date: Fri, 11 Mar 2011 16:15:45 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110312001545.GG5603@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <25548103.69.1299852642806.JavaMail.marcusg@IT-marcusg-desktop>
	<3921414.74.1299852728608.JavaMail.marcusg@IT-marcusg-desktop>
MIME-Version: 1.0
In-Reply-To: <3921414.74.1299852728608.JavaMail.marcusg@IT-marcusg-desktop>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: EOL in string?
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
X-List-Received-Date: Sat, 12 Mar 2011 00:17:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (11/03/11 08:12), Marcus Gaskamp wrote:
> 
> bitbake helloworld 
> NOTE: Out of date cache found, rebuilding... 
> ERROR: Error evaluating '${@oe.utils.ifelse(bool(d.getVar('MACHINE', True)), '${MACHINE}', 'BASE_PACKAGE_ARCH')}' | ETA: --:--:-- 
> Traceback (most recent call last): 
> File "/home/marcusg/stuff/bitbake/lib/bb/data_smart.py", line 117, in expandWithRefs 
> s = __expand_python_regexp__.sub(varparse.python_sub, s) 
> File "/home/marcusg/stuff/bitbake/lib/bb/data_smart.py", line 69, in python_sub 
> codeobj = compile(code.strip(), self.varname or "<expansion>", "eval") 
> File "MACHINE_ARCH", line 1 
> oe.utils.ifelse(bool(d.getVar('MACHINE', True)), '${MACHINE 
> ^ 
> SyntaxError: EOL while scanning string literal 
> 
> ERROR: Error parsing /home/marcusg/stuff/openembedded/recipes/perl/libhttp-cache-transparent-perl_1.0.bb: EOL while scanning string literal (MACHINE_ARCH, line 1) 
> ERROR: Command execution failed: Exited with 1 
> 

please post the Build Configuration thats printed by bitbake before it
begins to build

> 
> Was installed according to Chumby instructions http://wiki.chumby.com/mediawiki/index.php/Building_OpenEmbedded_(Beta)#Building_with_OpenEmbedded . Openembedded is pulled via git and bitbake is installed in a home directory and added to path. 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


