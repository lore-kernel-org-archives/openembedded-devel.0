Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1N8G7J-0005s7-Mk
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 17:32:24 +0100
Received: by bwz9 with SMTP id 9so1138228bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2009 08:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=3wqLiE0TSdZ1o0UbvVnnO8qQOgSfbTFKuJCPuEHNssk=;
	b=UWRSL51pzZAcNbKwpPjdOAiUNxMazwkBNwhgLWPPwgSSZlwsiSFez0WrixvDGy+Nri
	h+vs04w4YhigAeaIK/lYDwC57XBgRJTxrsApPCWyubFOoQLbqvnZlljwGHkkewPoSz3r
	M7u1dmUySjsXVNCPc3UqAAF05XxCKXcd2PHA4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=OFC+PNzcs9wpaMOqDhRQ2534C72dmxHsoP0ZyCMAPFW5dzK+ovCI6jZjYa391VgxpQ
	+xeWtHLMzgnUYiiIXRG5UFf/RmxnuLP51+UBuCYkZx06YErJ6gLB2evtSzqjmzh9TNPY
	jQFhCIbM7YALfncTcAfLPOJVDlLByHGdseeEg=
Received: by 10.204.34.73 with SMTP id k9mr1780832bkd.45.1257957063403;
	Wed, 11 Nov 2009 08:31:03 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm610999fxm.7.2009.11.11.08.31.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 11 Nov 2009 08:31:03 -0800 (PST)
Date: Wed, 11 Nov 2009 17:30:39 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091111163039.GA11484@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Xorg-7.5 from branch martin_jansa/xorg-7.5
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
X-List-Received-Date: Wed, 11 Nov 2009 16:32:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

please review patches living in martin_jansa/xorg-7.5

Its used in shr distribution for openmoko devices and I've tested it on
Sharp Zaurus (C3000-spitz).

I'm not sure if you can also use mesa-dri fro other devices, even when
it's using swrast in the end (swrast is there as fallback option when
there is no usable drm module detected when Xorg starts).

So please test it and let me know what needs to be fixed before pushing
it to oe.dev.

Thanks

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


