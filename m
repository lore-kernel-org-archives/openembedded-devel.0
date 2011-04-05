Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q6wHo-0002aN-8R
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 04:46:32 +0200
Received: by pwj9 with SMTP id 9so1726532pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2011 19:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=cuPsD3XehKfZ7uwPBQM1IJF4iaF3CJK0fQAjFghZJTM=;
	b=wcVxPCLArGSyAyDk5Un1xZWtNonCMMBY3RV72uDFFVALEFmNWS2yAL15iSqUEtGV5d
	d6xyLUj41v13vvNnj+H76Hj5gyIi+QY8tLAnjMRGsjVw0AI+fmGTNxA3E5uSfp7T/4ol
	U62PEwwngpN3wBqGUBwc2XM3Bu4jECDQCznQ0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=UCgSZrpy9k1LWMk8OYgVXpuhhw9UaJaGWgtxussCiqyR8WcG1T2IBSem5AC7cvFOok
	rXPUCn7bho+cER5ytC58eBTDOyWJVURnqScjEWDnEZYf5UVYJrUZ+EWjEdg8IK8miGzr
	8wMQupkE4vIQ74xuxtBkeuII4F9KR/zgcYmYY=
Received: by 10.142.224.11 with SMTP id w11mr7310890wfg.136.1301971465636;
	Mon, 04 Apr 2011 19:44:25 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id x11sm8367054wfd.1.2011.04.04.19.44.23
	(version=SSLv3 cipher=OTHER); Mon, 04 Apr 2011 19:44:24 -0700 (PDT)
Message-ID: <4D9A8204.1030908@gmail.com>
Date: Mon, 04 Apr 2011 19:44:20 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D997896.9050607@gmail.com>
In-Reply-To: <4D997896.9050607@gmail.com>
Subject: Re: Ignore externals from a SVN source in SRC_URI
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
X-List-Received-Date: Tue, 05 Apr 2011 02:46:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 4/4/2011 12:51 AM, Francois Retief wrote:
> Hello,
>
> What is the recommended way to ignore external directories from a SVN
> source? Tried SVNCOOPTS, but it did not work.
>

yes it could mislead thats why. Since it wont update external svn repos
when you change SRCREV it will give false information of updating all
thats checked out.

> So I hacked bitbake for my needs with the patch below. But is there a
> better way?
>

This seems ok

> SRC_URI =
> "svn://svn.somesite.com/trunk;module=somemodule;externals=ignore;proto=https"
>
> Cheers
>    Francois
>
> diff --git a/lib/bb/fetch/svn.py b/lib/bb/fetch/svn.py
> index ba9f6ab..f22f572 100644
> --- a/lib/bb/fetch/svn.py
> +++ b/lib/bb/fetch/svn.py
> @@ -114,6 +114,12 @@ class Svn(Fetch):
>           if command is "info":
>               svncmd = "%s info %s %s://%s/%s/" % (basecmd, "
> ".join(options), proto, svnroot, ud.module)
>           else:
> +            if "externals" in ud.parm:
> +                if ud.parm["externals"] == "ignore":
> +                    options.append("--ignore-externals")
> +                else:
> +                    raise FetchError("Invalid value for 'externals':
> expected 'ignore'")
> +
>               suffix = ""
>               if ud.revision:
>                   options.append("-r %s" % ud.revision)
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



