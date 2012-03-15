Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1S88TF-0001Ap-Fv
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Mar 2012 12:03:49 +0100
Received: by iaag37 with SMTP id g37so3512695iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Mar 2012 03:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=6GB4oDNt1tVoCiwTbuCwpalPkpi1GWBAhe3RB+QzpnQ=;
	b=oFq5MG9koc6OtVCEm3z5Gli4I7jOb0SQayn+2iUid3JX2eBJhDEooIDRH4S5ZsvMem
	CFRWB4dD96IuWo+Muxr0eAD6lChdno2H3WSL6TvB6hvcmabNwaKjEff/Q/jJyPQggNXK
	VW3+105sIC84D+rD54hXqalEedWrKfBNoWlUR/jH4qDIyb7C4a7oU+pdcdyyJHt1yXmG
	EFVAFwiBWNzd/SkoYa/CEdpB0/qnqZzU4D4AGLuJiDi/YF/+S3pKlzLN4dgIp2ge0RFc
	esq6faAP3HolRCJ/pPz7qa1huLoTLI2m2h4C7Rn4Yr694hE4yjUMJb7IAr7cqW2w95IG
	qXMQ==
MIME-Version: 1.0
Received: by 10.50.171.67 with SMTP id as3mr8405046igc.61.1331808902444; Thu,
	15 Mar 2012 03:55:02 -0700 (PDT)
Received: by 10.231.182.68 with HTTP; Thu, 15 Mar 2012 03:55:02 -0700 (PDT)
Date: Thu, 15 Mar 2012 11:55:02 +0100
Message-ID: <CAOHjBZvk6ZTh5er-pzh2E3M_Jrnvzk1_G90aCBoDfwADL7wcsg@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [OE-classic] CONFIG_SITE override
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
X-List-Received-Date: Thu, 15 Mar 2012 11:03:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

I have written an own .bbclass file where (together with other commands) I
try to override the CONFIG_SITE to point to an own site config source.
However during packages build this CONFIG_SITE statenent seems to be
ignored and the site file is not used.
Any glue?

I'm using bitbake 1.12

Please let me know.
Cheers,
Giuseppe

