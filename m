Received: from [209.85.219.166] (helo=mail-ew0-f166.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LcmVu-0003ut-N0
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Feb 2009 21:07:25 +0100
Received: by ewy10 with SMTP id 10so918585ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Feb 2009 12:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=/MmGXsce7dCBz/7XBXfAjWZKxDdlCVzjuXvQQwT7mqQ=;
	b=lZo0IGjfJ1ityo66nu7UegTmG0Y/0itvs1jpDhHW22p7KV8yn0LHmHZHH5r2tnLoqz
	IkypXuqRhjayRPPR9kfYviKD7m+MMxpJw0eRZw9BlMdpl1y18ts9QTO1qrqlZl1X2srw
	ojfQteTaEfvp8ffSiR6qLBf3LkQTnbhBULITY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=AdW40/TzbkMOFg15ZZ1WhOTGrR18haehMDKlSDs9paObhzNYTvUew0q+qRnYhYBwu1
	vkBAA2f5md8cHwcLq1wr+0PJ83FwgVRWE608xRt1/MRblyCXPvfb3RsR292oSPQ7bBuO
	knRb0p0N3Vt0he87ZSgKLlkny/+CeLOBC/9cQ=
Received: by 10.143.160.17 with SMTP id m17mr814479wfo.298.1235678214955;
	Thu, 26 Feb 2009 11:56:54 -0800 (PST)
Received: from gmail.com (adsl-71-146-30-62.dsl.pltn13.sbcglobal.net
	[71.146.30.62])
	by mx.google.com with ESMTPS id 30sm6554099wfa.38.2009.02.26.11.56.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 26 Feb 2009 11:56:54 -0800 (PST)
Date: Thu, 26 Feb 2009 11:56:49 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090226195649.GA26281@gmail.com>
References: <a7f8874a0902252037h6177f2efu1be098779fe87a69@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <a7f8874a0902252037h6177f2efu1be098779fe87a69@mail.gmail.com>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
Subject: Re: [OT] Prefered Endianess for ixp4xx Processors
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
X-List-Received-Date: Thu, 26 Feb 2009 20:07:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (25/02/09 20:37), Hans Henry von Tresckow wrote:
> Hi,
> Sorry if this is way off topic, but I was wondering if there are any
> advantages running an ixp4xx in either BE or LE mode

Depends on your needs. If you are looking for network processors then
the incoming data could be big endian format so if you use in BE mode
you avoid swapping. 

In LE machine you can access least signicant bits with same address and on
BE machine you have immediate access to sign bit. etc etc.

-Khem


