Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OMogY-0001F8-FU
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jun 2010 22:49:10 +0200
Received: by bwz14 with SMTP id 14so98275bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jun 2010 13:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:cc
	:subject:message-id:references:mime-version:content-type
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=j8K2ERJ2Nm46aX4p0FeEyfBQA6qbziSlyrURQDt6+FE=;
	b=V55UgXosAY1KaJymCIrs8i4C8Ru3IR9DFRNICVs0iTl+IH4nOjUTmAR7nwwkir5Tar
	DY3/mwADy+7SCzLmS9V8YtmI/5NVpGqNXKGJxUgLU7r4chHjD/k5WgXQ2Fa+4tpwh3fg
	2acrq+ZBXn90HsG6gq+6AaHJzhI/r/3pDzoSw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=fSDhOfV+kUr+7vF19+aPUNUWu1sFoK8uW9dF6qqqPd+yvwuKeA3kFE4gkjQf/Tib70
	vX/j9Q8JbTezqxg0onsZVPJAuh7sADUKZjFvQbVUsXITe2iBtejdKCYTU8lHgx/BoF5T
	+w6CBjqkQOxQNVPVFKSZw4zzME9dlqeRrThG4=
Received: by 10.204.47.21 with SMTP id l21mr534141bkf.134.1276202689144;
	Thu, 10 Jun 2010 13:44:49 -0700 (PDT)
Received: from s42.loc (85-127-249-17.dynamic.xdsl-line.inode.at
	[85.127.249.17])
	by mx.google.com with ESMTPS id v2sm1556171bkz.19.2010.06.10.13.44.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 10 Jun 2010 13:44:48 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OMocV-0000HR-EW; Thu, 10 Jun 2010 22:44:59 +0200
Date: Thu, 10 Jun 2010 22:44:59 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100610204459.GV14941@mx.loc>
References: <1276114963.4424.42.camel@lenovo.internal.reciva.com>
	<1276199208-31929-2-git-send-email-rep.dot.nop@gmail.com>
	<AANLkTin367SqiCodgs_CxGiwAihL-SI0nlCJKUWqUZjq@mail.gmail.com>
	<1276201371.13179.20.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1276201371.13179.20.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] busybox: configure according to {MACHINE, DISTRO}_FEATURES
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
X-List-Received-Date: Thu, 10 Jun 2010 20:49:11 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jun 10, 2010 at 09:22:51PM +0100, Phil Blundell wrote:
>On Thu, 2010-06-10 at 12:55 -0700, Chris Larson wrote:
>> Should this (ipv6 at least) use COMBINED_FEATURES, since it requires
>> kernel/machine support for it to be useful, along with distro support?
>
>I don't think it's machine dependent in any meaningful way; there is, to
>my knowledge, no OE-supported hardware which is actually incapable of
>supporting ipv6.  Any distro that wants to use it just needs to make
>sure that the kernel support is present (either built-in or as a module)

the kernel configury should also look whether it should enable
socket/ipv4/ipv6 or any combination.
There are quite some packages out there who can be configured with
--disable-ipv6 ¹) and these should probably also honor the distro's ipv6
choice, for example.
I think it would also be good to put USE_NLS into DISTRO_FEATURES as
"nls" like it was done for busybox and uclibc, yes?

¹) bind, mutt, libpcap, iptables, net-snmp, lighttpd, tcpdump, python,
quagga come to mind, to name just a few. Not sure if all of them detect
this properly so i tend to turn it off via configure.


