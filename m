Received: from mail-yw0-f178.google.com ([209.85.211.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NRc05-0000nd-4K
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jan 2010 02:44:56 +0100
Received: by ywh8 with SMTP id 8so14660983ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jan 2010 17:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:subject:date:to
	:mime-version:content-transfer-encoding:from:organization:message-id
	:user-agent; bh=pxKtvZKGFItF4+k0KSXB3IYG8R8SNexpwAMutQ5C66A=;
	b=IISokr4HHZ3hNcXZ0nbNQEaOwuszFTMOQ9fy9rhpfCgR91V2SmXr+BI5x+ZIqITRdh
	lvvJqBtG6lUJCKjeAh5QhKWuT0cLdEC2SDGbARZl6hTreGqWsKiNuyi9sxMcmX6vNd0m
	IA43q7Qf1tKP/+NguMxEKbnuNSBLpsTt7e/Kg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:subject:date:to:mime-version:content-transfer-encoding
	:from:organization:message-id:user-agent;
	b=uaIaG63ecTwkzBCOADzTd3L723wMdMLn7e2Hc3kwUDLVy/34mMea/5TE1jxCtyoqZu
	qlEmDkync8sqfQrzFo66aZAhazk/8ytFKVw38J7aLDjQQbfrUlCkCPnBc/9AnMC9n9mK
	sOI0cp8N3M5cVL23K1X9yRLttQ2IcSPvcJYag=
Received: by 10.101.160.12 with SMTP id m12mr9734664ano.69.1262569369619;
	Sun, 03 Jan 2010 17:42:49 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.101.56])
	by mx.google.com with ESMTPS id 5sm7026496yxd.71.2010.01.03.17.42.46
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 03 Jan 2010 17:42:48 -0800 (PST)
Date: Mon, 04 Jan 2010 09:42:42 +0800
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u5zi1ghgmn1qzu@guohr-laptop-ubuntu>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.211.178
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: why we don't setup a buildbot for openembedded QA?
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
X-List-Received-Date: Mon, 04 Jan 2010 01:44:56 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi guys,
   I think we had better set up a continuous integration tool buildbot to  
automate the compile/test cycle required to validate changes to the  
project code base.

It can help openembedded user to save time on failed building.

Without buildbot, any volunteers can provide their available machine as  
buildslave and the continuous integration environment will be really  
scalable.

Thanks a lot.

-- 
Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


