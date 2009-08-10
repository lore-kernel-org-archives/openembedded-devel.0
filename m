Received: from [209.85.198.245] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Maaoa-0001MF-NW
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Aug 2009 21:45:56 +0200
Received: by rv-out-0708.google.com with SMTP id l33so949316rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Aug 2009 12:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=r/qIHa+tPb8KJR0AA8f389aAixsa1S39EyBCNCUg6to=;
	b=F1ALTTb35M0UuEGbaukkoIa4sy8jPuFCKfAgcbLy6sd3OPmJlpZhuhSl1HILDHUslg
	GZu4RgLnEqodA23EsFFtcPD5esiVGPtcJI3jklOmR7nc8Ow6pQYAepVeITqZL3zC0rF4
	/EUSJHRccJfP0fvjFQoOYPP4AKz86gebrwrVU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=xw2907LgvXDz4qm9TtKwiYFsmD9Zj5ic/dLc+SilLpvex1x4/DuLQFd4j9hGaR4dYV
	wmA5/eYrI/1Yiu2C+G5kTKEOOsuvaiSXZX6nuJvmVodm5tJbCRuVeWhKnGNjD6Q/uXIo
	yuzE6/DLgz19ZJTbyQEDWxy+7181QTGfYnovs=
Received: by 10.140.208.15 with SMTP id f15mr1818229rvg.49.1249932579138;
	Mon, 10 Aug 2009 12:29:39 -0700 (PDT)
Received: from gmail.com (adsl-71-146-8-242.dsl.pltn13.sbcglobal.net
	[71.146.8.242])
	by mx.google.com with ESMTPS id g22sm24419395rvb.52.2009.08.10.12.29.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 10 Aug 2009 12:29:37 -0700 (PDT)
Date: Mon, 10 Aug 2009 12:29:32 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090810192932.GA8142@gmail.com>
References: <1249923716-19141-1-git-send-email-msmith@cbnco.com>
MIME-Version: 1.0
In-Reply-To: <1249923716-19141-1-git-send-email-msmith@cbnco.com>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
Subject: Re: [PATCH] pciutils: fix generation of pci.ids.gz
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
X-List-Received-Date: Mon, 10 Aug 2009 19:46:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (10/08/09 13:01), Michael Smith wrote:
> Set ZLIB=yes to prevent auto-detection by the lib/configure script,
> which only looks in /usr/include.

Some older versions of hal could only use uncompressed version. So may be you
could package both versions or leave a possiblity to package
uncompressed version somehow.

Thx

-Khem


