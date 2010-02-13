Received: from mail-fx0-f226.google.com ([209.85.220.226])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NgGnC-0004dl-JV
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Feb 2010 13:08:13 +0100
Received: by fxm26 with SMTP id 26so3345220fxm.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Feb 2010 04:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:cc
	:subject:message-id:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=x81EX+PVOtYJPS66CLLeqkKqd7axgY6VzyT1lfH80xQ=;
	b=mR4UMZ0cfV39ESEa3a1V5KCz9OpnzIL7fBqo2BI04AIc+vXKhLJdTFLmGIPsLx/gxl
	W0Q/CZC1KQTfbCafmHlqRsdlmPNo0+xWIdgta1EkbjBhH2xfGWoJPP2P0r662VEt0MhJ
	0kD1tK2hRlKoh+qFkfJjjsEHCAj34M+kOKQrI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=uUVPJ7m5OcKFNYGhcTCEUAxwwzAbkC6vQsg54RYXYAlCLT7VX32Sx+hOw/NIJrRIGb
	kSBAatcLCgD9m7ty2UY8tyC1xN7w1p+69BHJN4LXq6VgtGcZMqUiZOuS03LKHtXsTwAB
	FQCTMDD7Bh+HwtfHzUYr4Va+AQDhbeUqE31LQ=
Received: by 10.223.110.29 with SMTP id l29mr3018120fap.64.1266062734437;
	Sat, 13 Feb 2010 04:05:34 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id c28sm7060693fka.19.2010.02.13.04.05.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 13 Feb 2010 04:05:32 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NgGnM-0001JJ-V5; Sat, 13 Feb 2010 13:08:20 +0100
Date: Sat, 13 Feb 2010 13:08:20 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20100213120820.GH10632@mx.loc>
References: <1265663673-16312-1-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-2-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-3-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-4-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-5-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-6-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-7-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-8-git-send-email-rep.dot.nop@gmail.com>
	<20100211090437.GA17089@denix.org>
MIME-Version: 1.0
In-Reply-To: <20100211090437.GA17089@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.226
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 07/12] Document proxy setup in local.conf.sample
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
X-List-Received-Date: Sat, 13 Feb 2010 12:08:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 11, 2010 at 04:04:37AM -0500, Denys Dmytriyenko wrote:
>On Mon, Feb 08, 2010 at 10:14:28PM +0100, Bernhard Reutner-Fischer wrote:
>> diff --git a/conf/local.conf.sample b/conf/local.conf.sample
>> index 643ae0b..e7c4559 100644
>> --- a/conf/local.conf.sample
>> +++ b/conf/local.conf.sample
>> @@ -30,6 +30,9 @@ BBFILES := "${@bb.fatal('Edit your conf/local.conf: BBFILES')}"
>>  # This is a regulary expression, so be sure to get your parenthesis balanced.
>>  BBMASK = ""
>>  
>> +# Proxy settings:
>> +# BB_ENV_EXTRAWHITE="http_proxy ftp_proxy no_proxy"
>
>I'm sorry to inform you, but that won't work with the standard bitbake! Which 
>uses own HTTP_PROXY, FTP_PROXY, HTTP_PROXY_IGNORE and FTP_PROXY_IGNORE vars.
>
>I tried to persuade RP to change that back to standard http_proxy, ftp_proxy 
>and no_proxy to no avail[1].
>
>Because of that I had to keep my own version of bitbake[2] with the necessary 
>patches for my users - check the top 4 patches in that tree. Although, 
>GIT_PROXY_COMMAND one is already in the bitbake master...
>
>And looks like Khem has already pushed the above change though...

drats, you're right. I was erroneously checking against a patched bitbake.

khem, i'm very sorry for my sloppiness! Please
revert 3f602f72f0936ef773aa4767636d41bb82ecf3b0 :
---8<---
Unfortunately bitbake master allegedly uses the non-standard
{HT,F}TP_PROXY{,_IGNORE} config variables instead of the established
http_proxy, ftp_proxy, no_proxy environment variables.
---8<---
lynx has a good description for these, and especially a sane rule
for no_proxy (with domain.tld:port csv entries) which works very well
for me in practise, FYI.
http://lynx.isc.org/lynx2.8.5/lynx2-8-5/lynx_help/keystrokes/environments.html#proxy

Sorry for the wrong patch and thanks, Denys, for mentioning this!
>
>[1] http://thread.gmane.org/gmane.comp.handhelds.openembedded/19716
>[2] http://arago-project.org/git/?p=arago-bitbake.git;a=shortlog;h=refs/heads/next


