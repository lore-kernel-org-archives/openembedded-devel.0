Return-Path: <gary.robertson@linaro.org>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 521E260034
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Apr 2015 22:23:46 +0000 (UTC)
Received: by obvd1 with SMTP id d1so102760544obv.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Apr 2015 15:23:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:references;
	bh=RZvWD+TFpy8tcLlsHrJMKQLm2jspXYQmNBbKicUA6mU=;
	b=BGI7P+Fb+T7wsVVhIYkKgf3WTpv8hdo/tt3QibqcfYo8poM3OOFxLyJAdToUVqX4Ym
	9ZxwpAH2q0srGZboH6uIHsQn+TidMUa+pQoQrVa6Nq15IIHc19sirpWunw/6ALD/T7C4
	tqwwfQV7IUFsWt4NtKhU9MyBIH2Z8i++T985uRZkzikdCR+6kj+b76YE9CH3rQA7ffxH
	SLg3XY1Ef1zt2/qAXkbo+3GSFQrNuwH/VtbLRe8/UiB0E0Kb7HhNpDHYqTmb5chRKwIE
	4GqYgvxiZi9oMAiVnogl4H7nfz7h0XmPM1viktGUXxzTwjaIYM5DP+bmn6mkA48eYNIy
	o7mg==
X-Gm-Message-State: ALoCoQmtqGahACkjsjN+LLmzts0how2ReUVbE2QuyFryqwu+FNNcN3u8cB1wpFjl42Ujiu4HRff4
X-Received: by 10.182.142.101 with SMTP id rv5mr41117059obb.13.1427927027323; 
	Wed, 01 Apr 2015 15:23:47 -0700 (PDT)
Received: from honkintosh.cybertech.lan (65-120-133-114.dia.static.qwest.net.
	[65.120.133.114])
	by mx.google.com with ESMTPSA id bp2sm2987596oec.0.2015.04.01.15.23.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Apr 2015 15:23:46 -0700 (PDT)
From: "Gary S. Robertson" <gary.robertson@linaro.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed,  1 Apr 2015 17:23:24 -0500
Message-Id: <1427927005-7808-1-git-send-email-gary.robertson@linaro.org>
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
Subject: [meta-oe][PATCH V3] libhugetlbfs: add i586 to compatible hosts
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
X-List-Received-Date: Wed, 01 Apr 2015 22:23:47 -0000

Some months back in your last comment regarding this proposed patch,
you indicated that my original version of this patch had broken
one or more builds when applied.

That version added i386, i486, i586, and i686 ito the list of compatible
host architectures for libhugetlbfs in an effort to cover all 32-bit
ix86 variants.

After speaking with Koen Kool at Linaro Connect Hong Kong 2015,
it dawned on me that the only 32-bit ix86 architecture I had actually tested
was i586, and that the other arch designators might indeed somehow cause
build breakage in an OE build encompassing those architectures.

Consequently I have revised the patch such that it extends the list of
compatible hosts by adding ONLY the i586 architecture which I have tested
successfully.  I hope you will have similar success and can apply the
amended patch.

Finally your response to another recent patch submission I made caused me
to realize that the 'Upstream-Status' line in this commit was malformed -
so I am resubmitting the commit with a more compliant upstream status.

Regards,

Gary Robertson


