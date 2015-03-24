Return-Path: <gary.robertson@linaro.org>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2E3C073A99
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2015 20:26:02 +0000 (UTC)
Received: by oigv203 with SMTP id v203so4065869oig.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2015 13:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:references;
	bh=QMfpeLGQJ8sB516IVBz4NcgAhWhhnB8lVlR6GamBub4=;
	b=Rn+qSdq68G9Ze1wqPw7s5ngySwf6UmIQ7i8EEMIkdpj89eYxgNGnlaH0Y1lhUHMGmu
	4YEDNSFhrWcS3HailgiY32VVLzJuW7wd5hEB0f3zc4vjS1TANmzrOVt0VmNa/X++U4KU
	mDTl71wF+IXsLLFalX0d6I5odaghNxMvy8LBPtaXLS5QIkJn4Bc5Mfou5Bv1LybEpnGf
	ob/KdYkhHoGPnD1PDTq8pypchw2a+v2tSWUuGpdMj5htgJsgkpRz+V+HYRt04GvkC/1K
	iFBPNPIhQ3B8PSDPx6SeDEiOKecJ0paJR/91EEtklK9rBddo1tVOsL5Am0JtgqugC7bl
	1eug==
X-Gm-Message-State: ALoCoQlCYDbDVNU20bG7cC4MffgSMH3ZHy4yZ5XJV6tZUNy153JM9WRJPY02e02JG9LdPs1tJDj6
X-Received: by 10.202.197.139 with SMTP id v133mr4450053oif.1.1427228762352;
	Tue, 24 Mar 2015 13:26:02 -0700 (PDT)
Received: from honkintosh.cybertech.lan (65-120-133-114.dia.static.qwest.net.
	[65.120.133.114])
	by mx.google.com with ESMTPSA id z142sm227821oig.22.2015.03.24.13.25.59
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 Mar 2015 13:26:01 -0700 (PDT)
From: "Gary S. Robertson" <gary.robertson@linaro.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 24 Mar 2015 15:24:35 -0500
Message-Id: <1427228676-28169-1-git-send-email-gary.robertson@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <CA+chaQdOQKZRW7QH0qHS-ta8+oZDspRVGguF3iMDgOyrPAxg_Q@mail.gmail.com>
References: <CA+chaQdOQKZRW7QH0qHS-ta8+oZDspRVGguF3iMDgOyrPAxg_Q@mail.gmail.com>
References: <1416869955-13519-1-git-send-email-gary.robertson@linaro.org>
	<1416869955-13519-2-git-send-email-gary.robertson@linaro.org>
	<CAF7YWnxoQ22W85xbTfwmyLkQpf=vjwSmpbCvpG1oT-PeGa2GZg@mail.gmail.com>
	<CA+chaQdK8aEAHDnuPGak32bu+kNk74Vu-Z0XwoAxfxez-KKUbA@mail.gmail.com>
	<CAF7YWnwe1=jcfh=Xx5swt_3ug+GXdc8sfSQ76QRaaNuHT-8OAQ@mail.gmail.com>
	<CA+chaQdOQKZRW7QH0qHS-ta8+oZDspRVGguF3iMDgOyrPAxg_Q@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH V2] libhugetlbfs: add i586 to compatible hosts
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
X-List-Received-Date: Tue, 24 Mar 2015 20:26:06 -0000

I am revisiting this patch after a long interlude of doing other work...
please accept my apologies for resurrecting such an ancient thread.

After speaking with Koen Kool at Linaro Connect Hong Kong 2015,
it dawned on me that the only 32-bit ix86 architecture I had actually tested
was i586, and that the other arch designators might indeed somehow cause
build breakage in an OE build encompassing those architectures.

Consequently I have revised the patch such that it extends the list of
compatible hosts by adding ONLY the i586 architecture which I have tested
successfully.  I hope you will have similar success and can apply the
amended patch.

Regards,

Gary Robertson


