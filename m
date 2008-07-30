Received: from [209.85.132.240] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1KODdV-0005Qm-J5
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jul 2008 17:30:45 +0200
Received: by an-out-0708.google.com with SMTP id b38so9600ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2008 08:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=3+l3UIzYMWgw6mPb9Y4LLdsmhd7f7uH7/G9GCa36CBM=;
	b=K+UItE4ViLyS/hS9CmHmETk9sdyQYh402PjkN2/nWcTu9XdlsxX/r3auLyxRII/wKC
	1vtUTneCBBKTS0oV5tRrqsV5h9eEYzh5idD77seLwuTS9OhaW2/fAXsYbti+dA7XP9C9
	FDcFf6/oQtxu+qqr7iFdtQqQ4xPw1S4wtwcBo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=dZ9yO1xr10laaV2CgpTiQ3I5SbEjqCRH5wT/F95CTc54+Pi27bOTO3miulcU1tYBaE
	gSP73iiTA4ulf/jsCqPOAGS4H2xCz4nyWM9uW1YVglyLKB+2MWoNBaNjVS8haiYhMkzD
	JA4k7b1QhsXi9hL1o08ubTI/0jxwWSh5S/jpM=
Received: by 10.100.93.19 with SMTP id q19mr9624746anb.67.1217431742044;
	Wed, 30 Jul 2008 08:29:02 -0700 (PDT)
Received: by 10.100.166.17 with HTTP; Wed, 30 Jul 2008 08:29:02 -0700 (PDT)
Message-ID: <c384c5ea0807300829s775020aej348bc06d62a47264@mail.gmail.com>
Date: Wed, 30 Jul 2008 17:29:02 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Tool for gathering/validating OE source package locations
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 30 Jul 2008 15:30:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Esben and all,


This is a C application I wrote to keep a database (it uses sqlite) of
valid (source package) locations.

http://www.sidebranch.com/leon/witpa_20080730.tar.bz2


Once you manually add a known-good package, it can use Google powers
to add new locations, after validating MD5 and SHA.

http://www.sidebranch.com/leon/witpa_20080730.tar.bz2

It could act as a OE fetcher back-end if we extend it a bit.

The tool is called 'witpa' for "Where Is That Package At?".


Regards,
-- 
Leon


