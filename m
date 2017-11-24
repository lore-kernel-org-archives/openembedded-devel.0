Return-Path: <vladan.jovanovic@gmail.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id D5DD96093E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Nov 2017 10:24:07 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id i184so21713025ioa.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Nov 2017 02:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Hh18HPXWWI1CwAigX2nLBF5aycLFZZcqxb82wuPZtMA=;
	b=OyDqtX92+NucBXkH+wwwjjzIY3e/cIPdONVQ+VJ9GjZ+cNzn3v+IrUGhQjt6OLYYdi
	e6t30DPQ5HhJw+bx84NMc4p4Y9vtExQCV8P0w8meDauHs3P0T2REvZlcrwYgEmOx2FWU
	+w+btr7O6P3Nsz+uccebzVQyai0bRmvSJHgfn0lWr+p8x3ccJnBDPWnTI0iPh+8Xic5F
	sH1u/xEvtL1HOHVhXwJmoaiprbbiiXrIA4VfP0/zbkdnLHRr2XT/Rb5JOgSkxxBl+kDG
	PG/o/ROvOZzuyinQOrIHNUaNujqCZv+KpArQTPn3fWqNDXNxq2puJ35DVGZ9UW/3zi3k
	P1lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Hh18HPXWWI1CwAigX2nLBF5aycLFZZcqxb82wuPZtMA=;
	b=X1PLjsjnjUDnStBvVCRMOMyN0WZVqsa81gs9p5wMVZc5UOtwDKnDF+4XtBmQKhYKF4
	TRWxRh9S1jlp9Tpum6/ijIWFsA4u7aN7KXq9C+44OoGNPO/y9XmlHv/68E41nvAJhFdH
	NpMhRBc98viahw9QFYivZgGNOXB3YPLaYZ+JE6qlqpX9hvKYxeB3DuAh8FhxlQ0cl3r0
	378lQnjnsxAljprUu52oxY26bvAeCaA2EKeL4/HrbY5/PNAycyWTmUShjb3gctrVViUM
	9J1d+bjDH7sAKWyOV/lD8amzULQ6P8pxKEdbv9JW8+kc5AOXDX2x+XJp0m/TFqwPIv5G
	OsKw==
X-Gm-Message-State: AJaThX5++8OsWRq682hXZ381Fef992632KvV9/hNwP99x8JRXvx/YYXX
	WjHn55sjcINsdh9wPrUaqHn+OYxbCwrvoJdUWUHgo9D/
X-Google-Smtp-Source: AGs4zMbMnGc6U+k8FefWjOuFEMYPRJl7fV+pOnkcKnuTMHXuXcu4igXy1xvZVWqQBno9LNoSQqAk1fhxKUMpu//HhBQ=
X-Received: by 10.107.34.206 with SMTP id i197mr28880881ioi.134.1511519048841; 
	Fri, 24 Nov 2017 02:24:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.2.154.201 with HTTP; Fri, 24 Nov 2017 02:24:08 -0800 (PST)
In-Reply-To: <CAJTo0LYXU4mMY3pm6r7cZhRQ3=erY=j5+nkO-Bfnr0cLfx6vOg@mail.gmail.com>
References: <1511443538-32104-1-git-send-email-vladan.jovanovic@gmail.com>
	<CAJTo0LYXU4mMY3pm6r7cZhRQ3=erY=j5+nkO-Bfnr0cLfx6vOg@mail.gmail.com>
From: Vladan Jovanovic <vladan.jovanovic@gmail.com>
Date: Fri, 24 Nov 2017 12:24:08 +0200
Message-ID: <CAGTXB5kXiViW1w+eQ-qnefXp0kq7GktZoE6A3W1T=+oUVSC8Xw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] Fix PACKAGES assignment for fftw
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
X-List-Received-Date: Fri, 24 Nov 2017 10:24:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 23, 2017 at 4:43 PM, Burton, Ross <ross.burton@intel.com> wrote:

> You should explain why its the wrong operator, as =+ is as valid as += is.
>
>
I got build errors as shown below when trying to build fftw. Went away when
I changed the operator...

Vladan

ERROR: core-image-minimal-1.0-r0 do_rootfs: fftw not found in the feeds
(imx7dsabresd cortexa7t2hf-neon-mx7d cortexa7hf-neon-mx7d cortexa7hf-neon
cortexa7hf-vfp armv7vehf-neon armv7vehf-vfp armv7ahf-vfp armv6hf-vfp
armv5ehf-vfp armv5hf-vfp noarch any all) in
/home/vladan/fsl-release-bsp-4.9.11_1.0.0_ga/build-mx7d-x11/tmp/deploy/rpm.
ERROR: core-image-minimal-1.0-r0 do_rootfs: This is often caused by an
empty package declared in a recipe's PACKAGES variable. (Empty packages are
not constructed unless ALLOW_EMPTY_<pkg> = '1' is used.)
ERROR: core-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs
ERROR: Logfile of failure stored in:
/home/vladan/fsl-release-bsp-4.9.11_1.0.0_ga/build-mx7d-x11/tmp/work/imx7dsabresd-poky-linux-gnueabi/core-image-minimal/1.0-r0/temp/log.do_rootfs.29692
ERROR: Task
(/home/vladan/fsl-release-bsp-4.9.11_1.0.0_ga/sources/poky/meta/recipes-core/images/core-image-minimal.bb:do_rootfs)
failed with exit code '1'

