Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id C3FFA7264F
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Jan 2015 17:49:16 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id r10so26493388pdi.23
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Jan 2015 09:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=n1rPXZU6LTH++56eQQFjZjsX/LSszoCGlc5PCIKfLBs=;
	b=jtiRKh71svnX+vKn/BiMIxE6bfleGQwjQgr09Ns9fEx2Rkzg/aegiZhIMTwTcStX49
	PkYvocsU1PjHxBvHGhupLUQ1KULoiOAqCn9n5+ABs2guO7oM6+NBh4EYS+H5k9OeqKUg
	OBdyO69bHeuvA+xSCdzZdRhcXiYzu7S7Tfv+uS3Pykz7rFN7SsBaRKMOswLfy1f4XrKf
	LPq+eHmxppfBDcvwxDHzW/59CmNSKMkrh2cgPCw9E6ui47sw1pAAwz8kZJQ33a2VdSey
	kTqsgYN3/2meMMfLAxvXcfGOFRtucsWHRiXVVZO9m3Z6FLkhhbZ4GW5ceoj9+00ieddI
	NpyQ==
X-Received: by 10.66.160.199 with SMTP id xm7mr137326809pab.58.1420393757442; 
	Sun, 04 Jan 2015 09:49:17 -0800 (PST)
Received: from ?IPv6:2601:c:a700:272f:a5a9:3777:6846:fa5e?
	([2601:c:a700:272f:a5a9:3777:6846:fa5e])
	by mx.google.com with ESMTPSA id x8sm52173472pdi.7.2015.01.04.09.49.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Jan 2015 09:49:16 -0800 (PST)
Message-ID: <54A97D15.4080801@gmail.com>
Date: Sun, 04 Jan 2015 09:49:09 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: recent addition of libgxim depends issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 04 Jan 2015 17:49:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

While building world I found and issue with libgxim.

libgxim depends on ruby-native. meta-ruby is not a layer depends for 
meta-oe.

Can meta-oe have layer depends other then 'core' ? if so, this is an 
easy fix.

regards,
Armin

