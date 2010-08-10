Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tasskjapp@gmail.com>) id 1Oil4F-0004MM-3i
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Aug 2010 11:24:32 +0200
Received: by eyf5 with SMTP id 5so3794782eyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Aug 2010 02:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=sbv9Ln0YPbRmrHe7mxauIwfzV3rK5/5zqiOUNIRlUeU=;
	b=uEWSMtlvUu4k260GTod8/CIdMTu7EaiaHj7sjdb4+Agqu3SwWETXZwTFz8BmATfcJj
	tslRd8sCNEwGlRj2fi/NOkEx2V0ZgPNnunh9L3CXkuHnnd1VwSCd6llmnvfmwVlL/sH9
	fvaY5hY3kKmXR83pHGsN2pUPrSXCMHXyupFAg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=H9YYR2wTdC9bOirt3lOs18uhUOm/vblVqiWPg3Z4keQ+/av3SYtjLOyslTYgJdah3x
	wqOc83MjhZX2FBpomjls+a6t3BNbRVCdEjBX3eQukFDz3K3xL2mqHI5SxL4vz/L4DwPc
	fnclP08kO6PJ2v6uxHT5R5VQh67bvSgpzL1fQ=
Received: by 10.213.10.202 with SMTP id q10mr4020587ebq.47.1281432250541;
	Tue, 10 Aug 2010 02:24:10 -0700 (PDT)
Received: from [192.168.0.49] (147.84-49-231.nextgentel.com [84.49.231.147])
	by mx.google.com with ESMTPS id u9sm9412221eeh.5.2010.08.10.02.24.09
	(version=SSLv3 cipher=RC4-MD5); Tue, 10 Aug 2010 02:24:09 -0700 (PDT)
Message-ID: <4C611B93.5020100@gmail.com>
Date: Tue, 10 Aug 2010 11:27:47 +0200
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.8) Gecko/20100802 Lightning/1.0b2 Thunderbird/3.1.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <mailman.497.1281430979.3621.openembedded-devel@lists.openembedded.org>
In-Reply-To: <mailman.497.1281430979.3621.openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: tasskjapp@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: SDK problems. GCC won't launch because it can't find libmpfr.so.4
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
X-List-Received-Date: Tue, 10 Aug 2010 09:24:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

  This is apparently because it wants a native version of libmpfr.so.4, 
which is not available for Ubuntu 10.04. OE compiled a version of the 
library in the TMPDIR where I created the SDK, but of course that is not 
distributed with the SDK.

I tried grabbing libmpfr.so.4 from Ubuntu 10.10, but then it complained 
about libgmp.so.10 not being found. Am I doing something very wrong 
compiling the SDK since it creates a GCC that wants libraries not 
present on the system where I created the SDK?

- Tasslehoff


