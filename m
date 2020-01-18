Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id F3D847FC42
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 08:41:40 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 20so9841851wmj.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 00:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=5cLqdS2ykwY+s0+3V2oMEkUp6SZNVymfVLLOjhhCFt4=;
	b=cM93nSazA7KdEQdpiGhwL40ntbIwfbmhhE75lTCjYkhLqOozxfcEyRd4g1+8McXMxZ
	/qjhREEWipUIz9+NZ5mx+MfvhQUZhYcgsKMVXR2OH5HI/iv4YsIkX6pIjwqC2mGLIome
	jbGeRunqRaM3YFH1RjSkUi2tr/Ps+Ymtl/ho8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=5cLqdS2ykwY+s0+3V2oMEkUp6SZNVymfVLLOjhhCFt4=;
	b=p9FHQUfTzIV4bXqlIoOfasmCtfJHqQRt4pbKqxn7eDx07Yi0ShcqxhISgBDjBJI8k0
	ZVeliUsWYwB5ax1/1/nlnePdj/THEc2kMO37l63wF9DZD64qhmdWjImJOC6FT2+3Yi4Z
	2eTzfl1/VwvPnuYhIkdu2mEGF7+YcCVT8dTs910WCcybnyXbgEyNbGDYOPVSyZY2Oz7p
	Rp4XL+9WI6Ij0iKEGyudIH5ZTECuXjf7N2HnypNuJVS2YNQOVal+qT2JKwu+n3514CQJ
	v/E2WyqJWqrmDpi6OJKGr2B+LfQIZt7TkENp7PE+QbQ4w+wOlbMyxwC0dAonyNIXrMZI
	vJMg==
X-Gm-Message-State: APjAAAUC55JilIzkCWJ/srvcFIfTGfw/DNs5VjPmHXXGfNfMYPBXLXyF
	/P7so75qC26fGC1+111SAAIuMQ==
X-Google-Smtp-Source: APXvYqzNF2bukQXWdwrgiOYqQnKmkmOPegJ951hwayyvddEcwMp/7so0YOmMCOLERb9FLonqIbtXkQ==
X-Received: by 2002:a7b:c386:: with SMTP id s6mr8639746wmj.105.1579336901523; 
	Sat, 18 Jan 2020 00:41:41 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t25sm12958580wmj.19.2020.01.18.00.41.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 00:41:40 -0800 (PST)
Message-ID: <c87a580e6c5d567266026ffc903e9bf3e6e80d99.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 18 Jan 2020 08:41:39 +0000
In-Reply-To: <20200117141632.3809-1-ross.burton@intel.com>
References: <20200117141632.3809-1-ross.burton@intel.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: yocto@yoctoproject.org, openembedded-devel@lists.openembedded.org
Subject: Re: [RFC PATCH] python: remove Python 2 and all supporting classes
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
X-List-Received-Date: Sat, 18 Jan 2020 08:41:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-01-17 at 14:16 +0000, Ross Burton wrote:
> Python 2 ceased being maintained on the 1st January 2020.  We've
> already
> removed all users of it from oe-core so the final step is to move the
> recipe and supporting classes to meta-python2.
> 
> The following are removed in this commit:
> - python and python-native 2.7.17
> - python-setuptools
> - The classes pythonnative, pythondir, distutils, setuptools
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Thanks Ross. I tested this on the autobuilder, only 'surprise' is meta-
gplv2 fails:

https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/1458

(python dependency of mc). Just delete mc from that layer?

Some of the other failures there are from other bits of -next.

Cheers,

Richard


