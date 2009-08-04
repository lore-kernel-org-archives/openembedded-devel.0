Received: from [209.85.198.242] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1MY7pa-0003H7-Bg
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Aug 2009 02:24:42 +0200
Received: by rv-out-0708.google.com with SMTP id l33so1029417rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Aug 2009 17:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=fzjhAzgIFyHIUodAMiHOhT0VYxDY84vpDz/fYxPHj6w=;
	b=B3RqoDXW5FDuWW3wCJzANsq2tpj0eVdgZOZMvCpoQrtis10OvOE6VaSGkxD/t7XOcl
	fY6+yYLKjw5bWNZUAUCeIeYn5w6XLsXUuSzvKl8vtE/vNzBxPHzgR8TIhbjs+6omTQRq
	Vw0xw0pZPQ2uJmI260UJu1HiExF67pinlH2ms=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=gqqA/oo8TNK6OgM6Phxgi+Ba+TkJz0pquP4VnaBLRym6Z1c1WWXRMJJFhpTM8ygdRy
	NiiIyyqTo8YJRw2b6PTu14MxWtfe3DZOaOO3orpcuRohQqNDpjmLffr+x8Guhw6n2rff
	z0mvqrVxV/MQVpT9+44+Xfx0PNNV4DK0O/4O0=
Received: by 10.141.41.12 with SMTP id t12mr4206481rvj.288.1249344552801;
	Mon, 03 Aug 2009 17:09:12 -0700 (PDT)
Received: from ?10.0.0.19? (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	k37sm2041290rvb.42.2009.08.03.17.09.07
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 03 Aug 2009 17:09:11 -0700 (PDT)
Message-ID: <4A777C07.4030508@gmail.com>
Date: Tue, 04 Aug 2009 09:38:39 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20090803205909.GA24609@gmail.com>
In-Reply-To: <20090803205909.GA24609@gmail.com>
Subject: Re: Renaming gcc 4.4.0 to 4.4.1
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
X-List-Received-Date: Tue, 04 Aug 2009 00:24:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> Hi
> 
> Now that gcc 4.4.1 is out I would like to add the recipe but if gcc
> 4.4.0 is not been used then I would prefer to move gcc 4.4.0 to 4.4.1 
> and reduce a few recipes.

Makes sense.

Are there any plans to consolidate the gcc patch directories too? In
particular, there appears to be a lot of duplication between each of
the gcc-4.3.x and gcc-4.4.0 dirs. Among other things, I see...

grg@ubiquitous:~/oe/openembedded/recipes/gcc$ find . -name "svn-updates.dpatch"
./gcc-svn/debian/svn-updates.dpatch
./gcc-4.4.0/debian/svn-updates.dpatch
./gcc-4.3.3/debian/svn-updates.dpatch
./gcc-4.3.1/debian/svn-updates.dpatch
./gcc-4.3.2/debian/svn-updates.dpatch
grg@ubiquitous:~/oe/openembedded/recipes/gcc$ ls -l `find . -name "svn-updates.dpatch"`
-rw-r--r-- 1 grg grg 17668056 2009-07-22 10:57 ./gcc-4.3.1/debian/svn-updates.dpatch
-rw-r--r-- 1 grg grg 17668056 2009-07-22 10:57 ./gcc-4.3.2/debian/svn-updates.dpatch
-rw-r--r-- 1 grg grg 17668056 2009-07-22 10:57 ./gcc-4.3.3/debian/svn-updates.dpatch
-rw-r--r-- 1 grg grg 17668056 2009-07-22 10:57 ./gcc-4.4.0/debian/svn-updates.dpatch
-rw-r--r-- 1 grg grg 17668056 2009-07-22 10:57 ./gcc-svn/debian/svn-updates.dpatch
grg@ubiquitous:~/oe/openembedded/recipes/gcc$ grep -rn "svn-updates.dpatch" .
grg@ubiquitous:~/oe/openembedded/recipes/gcc$ 


Five copies of an unused 17mb patch?

-Graham


