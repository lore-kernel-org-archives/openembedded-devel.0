Return-Path: <gary.robertson@linaro.org>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3C022736B6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2015 04:11:33 +0000 (UTC)
Received: by obbgh1 with SMTP id gh1so8734507obb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Mar 2015 21:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=morXCq+m8TXcghNcjYnigZPfu+wAw4Nl7uRKLwL34gU=;
	b=bLffA+riERZqA03lIejPvZ+XYEO3L/mXLfWuI1hLKvdNVT5M3OwZZfYmgoxHfcAenj
	IVBpgNo1UdrjghNPK0YZNOhn+a15r91a+yYCJ+dhVD+09dKkHRLpyDGezX8ugVLNL9Hw
	CwnhD5HTd8Yt5OfygZBDMtFDSs0cUQ5orUeHjx9h7j6rQCbjp7axM6TI8cD29f/mYf4G
	JWS6Y6hsuS2HlsyzgIUdf94/RSQnvT1H9CZWc5T5qiVLfTIEMLozWT2K6U1+Vz+tUOmV
	8hHMAF5ts/taKNRLoM+xoWZWGxmGjaunmOXLTYB4VY4nvpmiFCwEBpzcNKvn7BJ3gVRx
	rJxw==
X-Gm-Message-State: ALoCoQlHt0rENBvloo4UwhQ+WQlFqTPqrJqQohY0UH6Vu6mWxGLG94pyj8xA0wYaS6xZZIIyWF5w
X-Received: by 10.60.96.5 with SMTP id do5mr8060331oeb.34.1427775094012;
	Mon, 30 Mar 2015 21:11:34 -0700 (PDT)
Received: from honkintosh.cybertech.lan (65-120-133-114.dia.static.qwest.net.
	[65.120.133.114])
	by mx.google.com with ESMTPSA id v10sm8025488obo.19.2015.03.30.21.11.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 30 Mar 2015 21:11:32 -0700 (PDT)
From: "Gary S. Robertson" <gary.robertson@linaro.org>
To: Martin Jansa <martin.jansa@gmail.com>, Ross Burton <ross.burton@intel.com>
Date: Mon, 30 Mar 2015 23:10:40 -0500
Message-Id: <1427775041-9330-1-git-send-email-gary.robertson@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1413992945-33655-1-git-send-email-mike.holmes@linaro.org>
References: <1413992945-33655-1-git-send-email-mike.holmes@linaro.org>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH V2] add CUnit test suite
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
X-List-Received-Date: Tue, 31 Mar 2015 04:11:35 -0000

Mike Holmes has asked me to resubmit this patch on his behalf, as other
duties have currently preempted his efforts to pursue acceptance of this
new recipe in OE.

A new patch file was added which sets the path configuration variables
to place documentation and headers in locations consistent with the
OE filesystem layout.

Looking in the ${WORKDIR}/*destdir and ${WORKDIR}/deploy-ipks subdirectories
after performing the recipe build, it appears that everything is being placed
into the appropriate locations.

We believe this version of the recipe addresses the concerns
raised in the email exchanges regarding the initial recipe submission,
and hope you will now find it acceptable.


