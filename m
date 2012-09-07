Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9uPq-00053R-O4
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Sep 2012 10:59:54 +0200
Received: from localhost ([127.0.0.1]:51943 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9uDp-0001qR-GO
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Sep 2012 08:47:29 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=9BfqVTlmov8CwPqura7E+Ql8WJE=; b=xCGL7FkH7bwpT/FeaZoAkf78JGuH
	KR9Xl3bAWj7fiWQAr23tHWTSBoIEvhrQVn5NibNQ8MYUGUCQmhH5TqfKlkb/TPfJ
	jsOW1yUr+upEDOEKGluiG3XqLOtme4wBn9uRfgCC+C7mmz3onCGCk5MABfU0m0nk
	vfJ+RgAr7+1mVbA=
Received: from [195.171.99.130] (port=18416 helo=[192.168.0.33])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9uDp-0001qN-E1
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Sep 2012 08:47:29 +0000
Message-ID: <5049B4DF.7060806@communistcode.co.uk>
Date: Fri, 07 Sep 2012 09:48:31 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120828 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <50476BCC.1090801@communistcode.co.uk>
In-Reply-To: <50476BCC.1090801@communistcode.co.uk>
Subject: Re: XBMC build for Raspberry Pi
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
X-List-Received-Date: Fri, 07 Sep 2012 08:59:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/12 16:12, Jack Mitchell wrote:
> Ok, so I'm delving in a little over my head here but you've got to 
> start somewhere, right ;)
>
> I'm trying to build XBMC for the Raspberry Pi and have run into the 
> following error which I don't know how to fix:
>
> configure: error: in 
> `/home/jack/Projects/poky-rasp/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/xbmc-11.0-r14+gitr1+5ea1d22052f4b6a13a10b1f2e80c90abfcd6023b/git':
> configure: error:
>   Could not link test program to Python. Maybe the main Python library 
> has been
>   installed in some non-standard library path. If so, pass it to 
> configure,
>   via the LDFLAGS environment variable.
>   Example: ./configure LDFLAGS="-L/usr/non-standard-path/python/lib"
> ============================================================================ 
>
>    ERROR!
>    You probably have to install the development version of the Python 
> package
>    for your distribution.  The exact name of this package varies among 
> them.
> ============================================================================ 
>
>
> Adding python-dev to DEPENDS seems to be a bit extreme, or is there 
> another way around this?
>
> Cheers,
>

Some more on this is that it seems to be picking up the host paths, 
rather than OE's.

My config.log is here: http://pastebin.com/7Um2J1kv

as you can see the PYTHON variables are all wrong. I tried adding:

PYTHON = "${libdir}${PYTHON_DIR}"
PYTHON_SITE_PACKAGE= "${PYTHON_SITEPACKAGES_DIR}"
PYTHON_LDFLAGS = "-L${libdir} -l${PYTHON_DIR}"

To the recipe but it didn't help. Has anyone any experience in this?

Cheers,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



