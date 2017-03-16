Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6BF137769E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Mar 2017 15:42:36 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id m27so48421379iti.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Mar 2017 08:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=+8r57kwCgoYdSQLOEUSAo05nA8tFHWPcuzn4jnY+DVU=;
	b=oxT2xmh5hs+8nHa3OC8EIYLK4xXc8r2VGA16eAD2tJmcFgtJsbqrjLlrtXCpvC71uc
	jxHhK5HLpiMuB5tk9dZbhA6w0jDvnQFnM/bobgrpXk+WXIohW51aWM/xaCctqih8ukaM
	HbgoQL9ATryGl5kaune9D7WJDMK08Dlybenv2/t0yzwOJixoEcWHH6qaJRkg585kTkWm
	emnSqlCh08xQRMOBxf2XidM/fmRx/LsrLLegujVCmvAm4KPmoAvP2FyYvs6RW2Wm5mFv
	cmDz8sfY7mlLxHfG6I1/B23Pb1pQG34qY3+3HssYDyg0BW378CMKTK0FbAZ9CO6EMota
	7exw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=+8r57kwCgoYdSQLOEUSAo05nA8tFHWPcuzn4jnY+DVU=;
	b=PNERHmZCuoRJLZwHmgWfdnHdtUEm0zdrM+zt61Oxk1ClmaBZr45bZ+nypBNF4t4eo5
	ALNtNNKxZISGP9IBNrQ80bOVMsyJTp54bBniDcBPx5D72+4/hOmPVsZzynPlhryKAAeL
	0SislN6RFNkzZ7h7LrDD4CR+7dOdARqNWzSNsNpuUSTtcfCbNQBgBt+dUtKL0juN0TM3
	ETNkavbUs3c6aoqmiVEkmMViaIc4d7MnRDmOzkJAhHoTQ9Ua9Dmo428FIzDb3vj9N2zX
	skAzUcQy7TyXYbk8WO1dk0iqDhF3XnB7ncUcaU/nZjwZYcOBdcAI14l/tGTmbk2wlP36
	Yw9w==
X-Gm-Message-State: AFeK/H0E1fMGV1FJzJKMoWiEl/7fL/m9w2P/D6B8EXFdHxaMZqf2IaU0ntlt6wNchRDjTrcJ
X-Received: by 10.36.213.196 with SMTP id a187mr25777578itg.4.1489678957070;
	Thu, 16 Mar 2017 08:42:37 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8DCA9.dip0.t-ipconnect.de. [93.232.220.169])
	by smtp.gmail.com with ESMTPSA id
	z204sm3109397iod.3.2017.03.16.08.42.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Mar 2017 08:42:35 -0700 (PDT)
Message-ID: <1489678953.6396.121.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-devel@lists.openembedded.org, Peter Kjellerstedt
	<peter.kjellerstedt@axis.com>
Date: Thu, 16 Mar 2017 16:42:33 +0100
In-Reply-To: <20170218021012.31978-8-pkj@axis.com>
References: <20170218021012.31978-1-pkj@axis.com>
	<20170218021012.31978-8-pkj@axis.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: Re: [meta-oe][PATCH 8/8] lvm2: Move libdevmapper to a separate package
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
X-List-Received-Date: Thu, 16 Mar 2017 15:42:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2017-02-18 at 03:10 +0100, Peter Kjellerstedt wrote:
> This allows, e.g., cryptsetup to use libdevmapper without having to
> pull in all of lvm2.

I'm experiencing an issue where both kpartx and cryptsetup hang
infinitely. For kpartx, I traced it down to the lack of dmsetup udev
rules in the rootfs, the same problem as in
https://github.com/docker/docker/issues/22025#issuecomment-243943728

Adding lvm2 to my image fixed it, but that defeats the purpose of this
patch... ;-}

Peter, do you know which parts of lvm2 are needed for kpartx
+libdevicemapper to work correctly? My initial attempt with moving just
the udev rules to the libdevicemapper packages was either flawed or
incomplete.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




