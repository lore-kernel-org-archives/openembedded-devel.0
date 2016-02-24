Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 57F3D731AC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2016 19:50:35 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id c10so19083256pfc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2016 11:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:date:message-id:subject:to:content-type;
	bh=S6rxiB1qsLV4Ac5LXOKatC0cvMF2vs+KDEA8sj/zV/k=;
	b=b56sr7dnMPWUWOCuLuWpoAiEpI1wiRtvBYgnFCayThYXiuW9f3++HxSNdIoSvC+zF6
	uiaS9PEuLuYPynffjcMFqGDAyQknUqo2vyqrJlVMhcpKGSzT95w/GiVfvfUn6Bpjaf4q
	Pn+sNdJ7MiWmD5ayK8KwL7Cv3YrAKCyQjw/GxsIw5oFKlWBdf9BFTmBq4VAQHQNFNBXq
	VNNgn2rFatnVTngV5uCgZ0LdNJP0WfHFj5PoPysm0l51y+w/ys5EX5PSm1inlI2jKH/0
	s7kxDejCYJ3MjU6dn80aRUQWgM9ZwGobyS2ANu6Jm+V8/tX1Pj0gCjV2LdXsOx5OgyG/
	rmSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:date:message-id:subject:to
	:content-type;
	bh=S6rxiB1qsLV4Ac5LXOKatC0cvMF2vs+KDEA8sj/zV/k=;
	b=fpGci2fQYz+H8UOB6hnVbFqx6hwqaPC8uLiPBcP3JG3jat/AjGMjb9JM+bvdaDSCk8
	CLQtFK1+Jh0hBLrYkhH1fZXlgXZk5VCQm11yEOLR1hIoJTCoYu3jhWOqIkuKHTb9w+o0
	s5PzCn0OJsMZ4kAX8Dw+y1lqxOoBJPuzt4J/Kx2938fltDEqRVSYxuIOAi37CAfF3Nqz
	9HS0M//C1TDpClkbTr1PW75CzyCyu/6woZo3q6Hz9GOUVPnixvROOe5IWbI3GYcyBRQE
	3EkcIUsSKjlkR86s3bQHwmQ6XqkzxN20+cZgcCdJy9lxDqm7QMHRgz5iUiZ+Mjv6J8e1
	eZZA==
X-Gm-Message-State: AG10YOTwpADT6K46YGckAN6isUlV4tULkOV1Q+gxWrDcZ4TfB3LAT1U1fb+62LYOp1L2Ew==
X-Received: by 10.98.15.17 with SMTP id x17mr57977226pfi.52.1456343436728;
	Wed, 24 Feb 2016 11:50:36 -0800 (PST)
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com.
	[209.85.192.181]) by smtp.gmail.com with ESMTPSA id
	d81sm6862956pfj.77.2016.02.24.11.50.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Feb 2016 11:50:35 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f181.google.com with SMTP id c10so19082699pfc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2016 11:50:34 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.87.80 with SMTP id l77mr57328770pfb.101.1456343434561;
	Wed, 24 Feb 2016 11:50:34 -0800 (PST)
Received: by 10.67.3.163 with HTTP; Wed, 24 Feb 2016 11:50:34 -0800 (PST)
Date: Wed, 24 Feb 2016 16:50:34 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpg19uSG8=jvwrqsA88EJQQOTkWROwxvmdziLpoA8HG_w@mail.gmail.com>
Message-ID: <CAP9ODKpg19uSG8=jvwrqsA88EJQQOTkWROwxvmdziLpoA8HG_w@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Robert Yang <liezhi.yang@windriver.com>
Subject: [jethro] Backport proposal
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
X-List-Received-Date: Wed, 24 Feb 2016 19:50:37 -0000
Content-Type: text/plain; charset=UTF-8

Hello folks,

[Cced Robert Yang]

I would like to propuse the backport of following changes:

Author: Mariano Lopez <mariano.lopez@linux.intel.com>
Date:   Wed Dec 30 06:52:54 2015 +0000

    image_types.bbclass: Rebuild when WICVARS change

    The procces to do a wic image is to save a file with
    variables required by wic and then call wic using this
    file. Because this is external to bitbake if the vars
    change, the image won't be rebuild; an example of such
    is IMAGE_BOOT_FILES.

    This patch adds these variables to vardeps of do_rootfs
    when a wic image is build. This will rebuild the image
    if a variable needed by wic changes.

    [YOCTO #8693]

    Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
    Signed-off-by: Ross Burton <ross.burton@intel.com>
    (cherry picked from commit 12c54d50ed4c321dc272beb3c6cb770965c979f1)

Author: Christopher Larson <chris_larson@mentor.com>
Date:   Tue Nov 10 14:18:20 2015 -0700

    image_types: improve wks path specification

    Hardcoding a full input path with zero flexibility goes against
everything the
    Yocto Project is about. Rework it to let the user specify the wks base
    filename with WKS_FILE and it'll search the layers for the wks file and use
    it.

    Signed-off-by: Christopher Larson <chris_larson@mentor.com>
    Signed-off-by: Ross Burton <ross.burton@intel.com>
    (cherry picked from commit 8cc7f5229f5447c2183ac319dd52c7ed737ec89b)

Those improve the 'wic' image support on Jethro and are merged into
master for a while. Could those be backported?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

