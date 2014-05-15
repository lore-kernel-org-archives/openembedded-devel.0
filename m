Return-Path: <adam.yh.lee@gmail.com>
X-Greylist: delayed 1723 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 15 May 2014 17:42:04 UTC
Received: from mail-ve0-f182.google.com (unknown [209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5BA5165EA8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 May 2014 17:42:04 +0000 (UTC)
Received: by mail-ve0-f182.google.com with SMTP id sa20so1785655veb.27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 May 2014 10:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=zzs4z5SKAlImwQsU4UwhodrCTc4IxfgaxjIYT+PVA4M=;
	b=l2AoxvVMpCsLPBjXNVxoGkXAUDVFdlP4yyVvlsLkRV5E/74AYb/5HDMGmPdCApjFMX
	9sxX0SOROuIJ6rfCxgO8uRv/EUU9bIfT3TaY7fhJWEHw6ZmO4ZKQ0DY8odd/dKG1EmMl
	1mAjEBE0zRnNm3UsW1KYaT74ouMdZyyyraPFBJP3kedhTl4ifUlnqjhDYv5VNleaARqs
	M0HScLVqksT0IjgrYlEqG7axOgDn0HL7xcnl1xqsap6DVaYvsK8u1uOMqfDzuxZ0UbAi
	lSVOOgeUl7S/6M42r+vS3A4DOotcJE0mXMwa3SQVUXqnQrLXHfOBlpXdxJx5A9GQ8dtp
	BGBg==
MIME-Version: 1.0
X-Received: by 10.53.5.70 with SMTP id ck6mr972063vdd.74.1400174002561; Thu,
	15 May 2014 10:13:22 -0700 (PDT)
Received: by 10.52.85.67 with HTTP; Thu, 15 May 2014 10:13:22 -0700 (PDT)
Date: Thu, 15 May 2014 10:13:22 -0700
Message-ID: <CAFeBWL4O6Uv6d+KoKQcHdzKZpog0OYnNA794jYRcJEovw88X9g@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: initramfs only supported in x86?
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
X-List-Received-Date: Thu, 15 May 2014 17:42:07 -0000
Content-Type: text/plain; charset=UTF-8

Hello everyone, I thought I'd compare the performance of booting
rootfs from MMC vs ramdisk (the way Android is doing it). Some says it
may possibly take longer in ramdisk because the rootfs has to be first
loaded into memory. I'd like to test it out myself.

So I discovered core-image-minimal-initramfs, and thought it was
exactly what I needed. However the build doesn't go far, because its
dependency initramfs-live-install [1] only seems to support x86:

COMPATIBLE_HOST = "(i.86|x86_64).*-linux"

Is this the limitation of current OE? or am I just looking at the wrong corner?

Thanks,

Adam

[1]http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb?h=daisy

