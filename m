Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Nl9DT-0000Zk-N5
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Feb 2010 00:03:28 +0100
Received: by fxm20 with SMTP id 20so600492fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2010 15:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=nv3fc90EyOi5Dji0wioZLlond1C3EW71rDCP03LezoM=;
	b=TIPfa43SaToPcTECoJOEv0572TmRJLimnGr6IMWW7aW64uwqJ5FwMEjNPqc44B51NO
	BplORZA3C0wIXx6FvgzFazHl+Zmhe+oQJWAsREqMihzUF4WKXG7qk+mpCBDmmW4BBWjU
	K8uHWzehBwL4zgJ0RckZRhr44IBO8PKmi9QL0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=UxH8n/xxkIEgo6MHWuu/ncbs55drv4japwtKl9FgoT0IewlVhFtF0yJ/5Fi9V0YO6P
	lCQxYbUmHz67klN096Gge16yk4WFtczV5tYc6KKNdOLShyvKtdn8YWISSggj+UMQOgpq
	RFNrYOBsyV1LUW+QoV2fKqt166W0tYN0wQJRQ=
Received: by 10.223.164.165 with SMTP id e37mr1349846fay.43.1267225240163;
	Fri, 26 Feb 2010 15:00:40 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 12sm1118068fks.50.2010.02.26.15.00.39
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 26 Feb 2010 15:00:39 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1Nl9Gd-0000RO-9g; Sat, 27 Feb 2010 00:06:43 +0100
Date: Sat, 27 Feb 2010 00:06:43 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100226230643.GH30265@mx.loc>
References: <1266951776.18176.47.camel@trini-m4400>
	<4B87EC32.6030807@mwester.net> <hm93de$tnt$1@dough.gmane.org>
	<18e217241002261221u5f43eaebn19a52e6b86a22c00@mail.gmail.com>
	<20100226222650.GG30265@mx.loc>
	<1267224150.5437.435.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1267224150.5437.435.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Fix busybox SUID support
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
X-List-Received-Date: Fri, 26 Feb 2010 23:03:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 26, 2010 at 10:42:30PM +0000, Phil Blundell wrote:

>If you're primarily worried about case (a) then building two copies of
>the frontend which share a common libbusybox, one setuid and one not,
>probably is a reasonable thing to do.  However, as you say, busybox does
>already have a fairly robust mechanism in place for dropping privs when
>they are not wanted by a particular applet and hence the threat from
>this side seems to be quite low anyway.

Yes, and that's what i've read into Michaels mail that this was what he
was primarily concerned about, but rereading him he didn't actually say
that. My apologies.
>
>If you are primarily worried about case (b) then the easiest way to
>mitigate the threat is to reduce the amount of code which is linked in

indeed


