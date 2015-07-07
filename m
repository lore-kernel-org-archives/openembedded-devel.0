Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id C49526FA45
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jul 2015 13:49:08 +0000 (UTC)
Received: by qkbp125 with SMTP id p125so139787474qkb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jul 2015 06:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:from:date:to:subject:user-agent:mime-version
	:content-type; bh=T1fJ90jSGjZXhCDnFt6npC6CjcT3S56/VB1aTBPmcV8=;
	b=w9uI9DbfYBzsWZN0F8iy48kX44wI98EL3ogbTtO0miqfgvdV2KtcUvtfPSflOkFplU
	/jrcNHvRfcRi9PIj/cg3k5SaBT34YnHV3gaKMspk+mDqyFz9uH9dqeoML8h5moQRs0J9
	qfBUYBHZEN4lIfexlPMEKe6+PF7ac7i9ARUUZPLWGQ977ENUxaPf3EAAx4iV0jLK7H7n
	Fqf1/vjAd8ZaPldV2ns47pxz/Z0fK8eKPJOCdyyWe2SXRMkXysJ7Tq9F/BD3QjXGGBmj
	NDCmlUdTUhjwrGc6htO0v2Fo0sSnCdTOQ5weAX3a9zYImJkWjZPz0Nn9eFQql15ldnfm
	PEXQ==
X-Received: by 10.140.86.212 with SMTP id p78mr2783259qgd.49.1436276948315;
	Tue, 07 Jul 2015 06:49:08 -0700 (PDT)
Received: from localhost ([177.100.226.57])
	by mx.google.com with ESMTPSA id e63sm9870824qga.39.2015.07.07.06.49.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Jul 2015 06:49:07 -0700 (PDT)
Message-ID: <559bd8d3.c52b8c0a.f864b.378f@mx.google.com>
Received: by localhost (sSMTP sendmail emulation);
	Tue, 07 Jul 2015 10:49:02 -0300
From: "Otavio Salvador" <otavio.salvador@gmail.com>
Date: Tue, 07 Jul 2015 10:49:02 -0300
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
User-Agent: mail v14.8.2
MIME-Version: 1.0
Subject: Updates to meta-java (master) in 2015-07-07
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
X-List-Received-Date: Tue, 07 Jul 2015 13:49:08 -0000
Content-Type: text/plain; charset=US-ASCII

Hello,

I pushed following updates:

commit 66c97ae7461f4c1a13917131787bb76dc34e6b6f (HEAD -> pending, origin/master, origin/HEAD)
Author: Otavio Salvador <otavio@ossystems.com.br>
Date:   Fri Jun 19 12:30:25 2015 -0300

    Add explict getVar param for (non) expansion
    
    Rather than just use d.getVar(X), use the more explict d.getVar(X, False)
    since at some point in the future, having the default of expansion would
    be nice. This is the first step towards that.
    
    This patch was mostly made using the command:
    
    sed -e 's:\(getVar([^,()]*\)\s*):\1, False):g' -i `grep -ril getVar *`
    
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

