Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id CEA80770FF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2016 20:55:58 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id yy13so56554072pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2016 12:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=asg4NM7DcEiNId69TSQu1sI/BxfM85jWg+J+Snnq8aE=;
	b=jO9VPMQm2abLTK5sAMsNQZPKXNPawgIVOevxq9KeRlWOKz87wJB2Pw6PczHTz3FHkn
	VL/FYyTChD1GGynz3hGMGS+vFqQ9RlEAwlOpzWCiYxMBS0SqaFAJStfW4+UdbiAsIuZ0
	9Fa/ztPkV+9MvupoLk4DQSpLF+Ts0Z2F+AT1zlJ+SSx9dusp8P3sq/O+XTFsONTt8SZM
	ygVErwxIniA69gkaF+s5353RPtEzk5q8M80T5gEJguMK2aVFjenVQ+7pEzi3TTppbRhk
	AcMngymJUqgc1BPikS7r4oDnb4aKNw/XwwlqRvBq+Ey34RPd6YY60diq0VWM2mIxg4jW
	sIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=asg4NM7DcEiNId69TSQu1sI/BxfM85jWg+J+Snnq8aE=;
	b=Kz/5glfBv5Dun4/qmOm8IKdxektKaqLj4ljPs0ajJo7E1riXP9Zpb+sD1USUEKcqre
	Q0fvlGQPR/86fQLthbIuhU9wyIHHuR8PpLL2LoxE/tqXajowuq+3bPKb+LwGajF0Wljy
	WI1BqnSotA/esVarr9z7n0Y/rwIE6/FmnGlsB3WyL5nmcFFBRwBQDeAsOH+3ngulQLFC
	lzqVEQGmsAv9su8QJm2u0xAECJskeBv/LWdzr7M3mayAlOkA+XGjE2j4mzDkF7tl7Bde
	ELhQeYNQSJIIkGHOxx/e3ehDouu67AMI/yLYzcMwusZnixRbZ0lkaLonVLHUHvMNBzri
	m8TA==
X-Gm-Message-State: AD7BkJLHpCNGWUyUZ4B6IkAhEyZee/tzHxN8VZaMcNwMZ2QWj2zHuWatmeTbp/Exhb87xg==
X-Received: by 10.66.190.229 with SMTP id gt5mr5012622pac.118.1456520159210;
	Fri, 26 Feb 2016 12:55:59 -0800 (PST)
Received: from Akusters-laptop.local ([2601:202:4000:1239:41b3:c7a5:a318:85c])
	by smtp.googlemail.com with ESMTPSA id
	x12sm21304325pfi.88.2016.02.26.12.55.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 26 Feb 2016 12:55:57 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <CAP9ODKpg19uSG8=jvwrqsA88EJQQOTkWROwxvmdziLpoA8HG_w@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <56D0BBDC.4080101@gmail.com>
Date: Fri, 26 Feb 2016 12:55:56 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpg19uSG8=jvwrqsA88EJQQOTkWROwxvmdziLpoA8HG_w@mail.gmail.com>
Subject: Re: [jethro] Backport proposal
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
X-List-Received-Date: Fri, 26 Feb 2016 20:55:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 2/24/16 11:50 AM, Otavio Salvador wrote:
> Hello folks
>
> [Cced Robert Yang]
>
> I would like to propuse the backport of following changes:


Seems responsible to me.

- armin
>
> Author: Mariano Lopez <mariano.lopez@linux.intel.com>
> Date:   Wed Dec 30 06:52:54 2015 +0000
>
>     image_types.bbclass: Rebuild when WICVARS change
>
>     The procces to do a wic image is to save a file with
>     variables required by wic and then call wic using this
>     file. Because this is external to bitbake if the vars
>     change, the image won't be rebuild; an example of such
>     is IMAGE_BOOT_FILES.
>
>     This patch adds these variables to vardeps of do_rootfs
>     when a wic image is build. This will rebuild the image
>     if a variable needed by wic changes.
>
>     [YOCTO #8693]
>
>     Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
>     (cherry picked from commit 12c54d50ed4c321dc272beb3c6cb770965c979f1)
>
> Author: Christopher Larson <chris_larson@mentor.com>
> Date:   Tue Nov 10 14:18:20 2015 -0700
>
>     image_types: improve wks path specification
>
>     Hardcoding a full input path with zero flexibility goes against
> everything the
>     Yocto Project is about. Rework it to let the user specify the wks base
>     filename with WKS_FILE and it'll search the layers for the wks file and use
>     it.
>
>     Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
>     (cherry picked from commit 8cc7f5229f5447c2183ac319dd52c7ed737ec89b)
>
> Those improve the 'wic' image support on Jethro and are merged into
> master for a while. Could those be backported?
>


