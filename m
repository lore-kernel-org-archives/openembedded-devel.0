Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OsT5A-0006Nx-8y
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 06:13:35 +0200
Received: by pxi11 with SMTP id 11so926839pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Sep 2010 21:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=a4cFj/Nndz+lHEvCwW82bgY8Yuj+Zxsm0vckfcHfQpg=;
	b=mlgpqZQnqDd46c4kVPrBTJiX689JIoSmMdKE4XuKOFmMSoNctAOvWbAozaFEz0dw3H
	aGAgz9Bjl7emS6LDfmwHkpR1eKHQdr6pLXymeNcx97clkOUFFk4KdpLmOEgzqzqgwibG
	jO1UlR9RlC8S89YDZ/erk7TTudfrwIcr5IpSk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=cMTguFDLV1ozWRZ6LKo2ql5mb6HgQrLStnx99tNOTXCOxAfaKUscQMCCgHMvLcDfxg
	4CX8WFJhxLFjMZUMOnQDAUyWim+LjrP6UiaRlwhtYkjhY3ZowDBR6s1SiGdKtkvoJUVK
	ZJ1kCJWzVfCQSBDXOXPl2nN4HmCcES4nIYTVo=
Received: by 10.142.43.7 with SMTP id q7mr2087976wfq.45.1283746364528;
	Sun, 05 Sep 2010 21:12:44 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id n35sm3606043wfa.3.2010.09.05.21.12.42
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 05 Sep 2010 21:12:43 -0700 (PDT)
Date: Sun, 5 Sep 2010 21:12:26 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100906041226.GC5320@gmail.com>
References: <1282482111330517500@rkmorris.us> <1282619676244726500@rkmorris.us>
MIME-Version: 1.0
In-Reply-To: <1282619676244726500@rkmorris.us>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-users@linuxtogo.org, openembedded-issues@linuxtogo.org
Subject: Re: H1940 Boot Issue
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
X-List-Received-Date: Mon, 06 Sep 2010 04:13:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (23/08/10 22:14), openembedded@rkmorris.us wrote:
> Hi,
> One more observation after a bit of debugging here - I am able to use my OE generated kernel with an older (non-OE) initrd was able to find ... so it seems that the OE generated file system / initrd is the issue. I have tried using a ramdisk, and also a SD partition, to debug the issue - but the boot hangs before anything is written to the log files (on the SD partition).
> Any suggestions how to debug this?


it seems your kernel is booting fine you can point init to a statically
linked bash or dash and then debug init from there

-Khem


