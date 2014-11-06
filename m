Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f45.google.com (mail-qa0-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id C58D37202E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Nov 2014 17:42:53 +0000 (UTC)
Received: by mail-qa0-f45.google.com with SMTP id dc16so1106255qab.18
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Nov 2014 09:42:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=QJdpen0MURZ5udUZTbz+ur6oJz4SN16Yqxm73FwoJMs=;
	b=h3Na04qIOI4CjjHlEcyuAoER8+YdS3Eapkp4m0fo6bT34y7g4RP7RHcz3qcBCdFalz
	lzIgw7I7R9kSKo6qJ0Zcfp5Qp9FrWE2YOiorjdGFu9F/uIZo9mIfnRY8PLbFZGiOaUME
	K0PmI+wkKpHVNXTOsUfCHWIFtb+Fto4awWJE096gp8QyszGejfpiuSU2IVR9rqm1BMZa
	8OcgreKyqZgUmojvUOxYdLDHu4kfxrJH/CvGfQHcQTjw14Omci95IKAfIxi0caEbtYim
	6V+LG6qeO2dak40IA3LydwovkGjPO4aS31P+7Byz9tSArVgHt3qIZGqr+UDi9+ooXMdE
	6l2Q==
X-Gm-Message-State: ALoCoQnPx5b0natT2iWmfQ7eTXr+uB1/UaKvYYPPXEP8nkom4dsJQkH2tAViKSmVGLmpDj+A/wFY
X-Received: by 10.229.176.70 with SMTP id bd6mr9265249qcb.12.1415295773628;
	Thu, 06 Nov 2014 09:42:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Thu, 6 Nov 2014 09:42:33 -0800 (PST)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 6 Nov 2014 17:42:33 +0000
Message-ID: <CAJTo0LavfAPo3P4Mv9U-24KK7HhkBOgysg5ZAUZe1YOAL10pvw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OE-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Moving llvm to oe-core?
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
X-List-Received-Date: Thu, 06 Nov 2014 17:42:58 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

So I think it's fair to say that neither GCC nor LLVM are going away
anytime soon, both having their respective niches.  Because of this I'm
wondering if we should be adding LLVM to oe-core (taking the meta-oe
recipes).  GCC will still be the cross-compiler used but LLVM will be
available out of the box, for example the Gallium LLVM-based Mesa drivers
can be enabled without requiring meta-oe.

Anyone have thoughts/comments/objections?

Ross

