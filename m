Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wj0-f195.google.com (mail-wj0-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id A7A027768B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 17:36:54 +0000 (UTC)
Received: by mail-wj0-f195.google.com with SMTP id hb5so4018667wjc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 09:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/JNPgo8FWVmDblMo8I+d2BpIiHQ9fa+ErApW7F2d6D4=;
	b=laRyFINBYR49Hp9Kynw3zrs2uA8uLke1tJHFEhWM/8pl4j7XQkIcbgsKhKniHcypXr
	VieV+ERqsuF3ec63+F6BAyo3AqVLhieNC0AtqBSyw242m2sGaSF0C9ut8bGlIsgLAqq4
	Cvdo3pbNXmi/NdwLzcmzHya0wUysOLeoz6iBZ5TEhXtfYqvEM/opAUInIeDTpquviyZx
	9/qwW/GPRkTy4h7//2FeSDnqKVbAjFBEMc0z+QWOduCOQh6QsMD8vW+cGCsn1HE7zhCS
	9nmf1XoqU9KNIqXkDCGYomlMOmtu0VzSx5hAUmJJgeSJXeaa8mI4/iB+5tmSL9Rt+fJy
	Mjlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/JNPgo8FWVmDblMo8I+d2BpIiHQ9fa+ErApW7F2d6D4=;
	b=fWm71+PlulARpzJn+xo6JyhnZ7KP6aP7uJMLr4Ej5HBcZeGlbDhNhgmPPNFTOWJVBM
	d55PFilEMwFvCfDi8Kg7mIpLUIz6rNSWABYQIe43di+pYJ5/pQzudRZuaUMRhDUzPPPB
	P9AMaRwCyGodThnGUiISldbyUUxaBjVHe/RFljzk8GzKgOq8b8t7V7jAJZ3E+ITnf7z4
	zz2Ix6Pg0xOSqNDy5nudClhiWZxetkOY6ABvngeT6eNrhP6fkuZLi4mAIZgtRliQJ7rU
	V4j3MSlhQDe0T4koCOzdN2MTFre9M8QBi/ZaGT7qANIAD5X+vMdTDz0wxhkaSFwRP2V2
	FnCg==
X-Gm-Message-State: AIkVDXL0iElrNHL1y4gfRQjXplvazO4IMCzEAftIlu0bcIfJFfZniQALOGCau8stzxUSVhN/IiT/OvSdYUVpRw==
X-Received: by 10.194.113.169 with SMTP id iz9mr11505893wjb.57.1482428215249; 
	Thu, 22 Dec 2016 09:36:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.126.38 with HTTP; Thu, 22 Dec 2016 09:36:34 -0800 (PST)
In-Reply-To: <B2EC9E23-FB3F-44F0-9711-1589CEF1C21A@gmail.com>
References: <20161213234618.31312-1-ricardo.ribalda@gmail.com>
	<20161213234618.31312-3-ricardo.ribalda@gmail.com>
	<20161222165029.GE3544@jama>
	<B2EC9E23-FB3F-44F0-9711-1589CEF1C21A@gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 22 Dec 2016 18:36:34 +0100
Message-ID: <CAPybu_1mPNJEnwOMfXauUQyN3u3v2DrqzdODCCqRhMgOZh-rCg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2 3/8] opencv: Add missing depends
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
X-List-Received-Date: Thu, 22 Dec 2016 17:36:55 -0000
Content-Type: text/plain; charset=UTF-8

Hi Khem



On Thu, Dec 22, 2016 at 6:17 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Dec 22, 2016, at 8:50 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> On Wed, Dec 14, 2016 at 12:46:13AM +0100, Ricardo Ribalda Delgado wrote:
>
> contrib/modules/sfm depends on glog, gflags and libeigen. The CmakeList
> does not seem to provide a way to disable/enable its build.
>
>
> There is also floating dependency on tesseract as shown in last test
> dependencies build:
>
> opencv-3.1+gitAUTOINC+92387b1ef8: libopencv-text rdepends on tesseract,
> but it isn't a build dependency, missing tesseract in DEPENDS or
> PACKAGECONFIG? [build-deps]
>
>
> There seems to be no knob for tesseract in openCVs build system. but
> extensions modules needs it may be
> adding a knob for OPENCV_FIND_TESSERACT will solve it. I also notices that

What about doing somthing simlar to:
http://git.openembedded.org/meta-openembedded/commit/?h=master-next&id=b9946087985e011a71a63cdf47d5496c3c5e2a9c

but with the modules that uses tesseact.?

I can take a look to it tomorrow morning.

> SRC_URI should be changed as well
> git://github.com/Itseez/ has moved to git://github.com/opencv

I have already send a patch for that:
http://git.openembedded.org/meta-openembedded/commit/?h=master-next&id=a1f5340a025c2e75330ef3b9940bb8aced39fa00




Regards!!!

