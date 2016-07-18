Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0830A60797
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 13:40:09 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id p126so6660238qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 06:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:from:date:to:subject:user-agent;
	bh=1IZZCqKbW7moE1j18wgy6IzcTyDoztCzPpviZ9tsBzw=;
	b=lN8qwtkmz6WAfr+1dOe0NN/TSutgK7x39AJgG9pQo4WQbiVZCVsHLc5ZaRFTe4AAZK
	PsQ1W4ei9wDZRrJRvBMVptyv8FyyYKW+Z0xArlJ0u6VrnKJRxxT8L8iUj/WV5j+fHLQq
	F33yE7ZX+IqgA3iCeuoHV1oZPNN8f/bonqu8goBfCTLXzLBDpphFS6lLxxyuWeNZb0ou
	wd1I1pY9pJWl7hM0tfIh2s0x8ka1xxLbpdrKvp35RLQ3b47+hUacV1Tlh/9gWLpwtvwD
	Mt2duk5krogaeT13ypByzkVYpd4n1d64v7qWOqyKQiSjlpvqwTqu4mnrELk3ktt0zrM/
	+/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:from:date:to:subject:user-agent;
	bh=1IZZCqKbW7moE1j18wgy6IzcTyDoztCzPpviZ9tsBzw=;
	b=ld3V1cu6AwY4whJD98Z3xsFDEpSmfh4XbR/KBNqziVaX2Dgpb81qBw/59isZDpG+bA
	NZRpiS1cXSQpfTsvHOY4fpOsEGiXRjwiaoGMzSRkswq79jUG8crkjGlzqoXcBIR8+LSh
	6lgTK3xzQcnog0giSwlbyOqRKTDDoiAJRH75jZqgEu2TZTfyGDS90hUQZ6bsknOmK/+z
	1gtDjAZnb0PBOTYHPIUECrXeCULJ0fxhH75pCLX3dvSVIXMuN+2I+qkjzy9hR5FrizJU
	SfEgswIEaPxA/oBSHsq456BNQHDw73IZHy0vzq1hNEdXAkSRMPoimiHIb0S0lmZ2h6Zp
	YUew==
X-Gm-Message-State: ALyK8tKIjTAZXZrRFxKgAgLHJWl+n9KBYKCjxLKamRCV3gzVGHg1gcbFMvpN1WGpPyqNlg==
X-Received: by 10.55.21.97 with SMTP id f94mr43461495qkh.8.1468849210069;
	Mon, 18 Jul 2016 06:40:10 -0700 (PDT)
Received: from localhost ([177.100.227.79])
	by smtp.gmail.com with ESMTPSA id a66sm398562qkg.2.2016.07.18.06.40.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jul 2016 06:40:08 -0700 (PDT)
Message-ID: <578cdc38.45e8e90a.7ef52.2915@mx.google.com>
Received: by localhost (sSMTP sendmail emulation);
	Mon, 18 Jul 2016 10:40:02 -0300
From: "Otavio Salvador" <otavio.salvador@gmail.com>
Date: Mon, 18 Jul 2016 10:40:02 -0300
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
User-Agent: mail v14.8.9
Subject: Updates to meta-java (master) in 2016-07-18
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Jul 2016 13:40:10 -0000

Hello,

I pushed following updates:

commit 5019f33ecc30608431f1221b27cdc78d439df328 (HEAD -> pending, yocto/master-next, yocto/master, m/master, m/krogoth)
Author: Daniel McGregor <daniel.mcgregor@vecima.com>
Date:   Fri Jul 15 15:08:20 2016 -0600

    openjdk-8: Detect compiler version
    
    Some supported hosts still use GCC 4.X. These don't support the flags
    needed to make GCC 6 work, so check the GCC version and add appropriate
    compiler flags.
    
    This implementation will append flags for any gcc version, but it's only
    used for GCC 6 right now.
    
    Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit dcef9ff46b9dc6f718cf2e63d48842dd0236bed1
Author: Daniel McGregor <daniel.mcgregor@vecima.com>
Date:   Thu Jul 7 10:55:18 2016 -0600

    openjdk-7, openjdk-8: use vardeps to fix shared state
    
    Previously if PARALLEL_MAKE changed, so did the task signature
    for do_configure. Use vardepsvalue so that the signature remains
    constant.
    
    Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
    Signed-off-by: Maxin B. John <maxin.john@intel.com>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

