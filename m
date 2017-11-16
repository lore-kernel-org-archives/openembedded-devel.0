Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6DF1278726
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Nov 2017 15:37:54 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id f125so30648952lff.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Nov 2017 07:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MoHA7nFtVQX8WoRYZC6sF12AG4L5LO5s+XHfSEPb4Dc=;
	b=l45p0S4QmFb1QNebgG0CUqVsm8wW6sQDdHjHgD+WP+NkwxjIABB+C8RoJxXD7oA+cz
	f/PrOlm4h/7eTEqWWVnaJakfJ6THCzUGLwhJXlfwT+p/w9QW1sEAlozSZciOwgMzXQX8
	4OF2sScGP80Lyb9VW4BLCqolLnnCNDZ6tSfzkBssUeKc8xsjfWYITqwnkGln2HQ9+5my
	a28mhsjsCAGIQ4doCvMBM6zDMrz8rDMSTs7ViFDBFLxtjnYXVxoTTLH5FkRvlBbpfVFm
	9Z0464OFFJfgFAnIsHC6LyIPLmNiaarjTtuQuEqWRF1Hg/l82lbGEdJbQklTAytHdHBm
	xCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MoHA7nFtVQX8WoRYZC6sF12AG4L5LO5s+XHfSEPb4Dc=;
	b=ANvQIygYqhMrKYBjGZ1Q/Cpe3p5H/YXayfNxRkBlJpCgXjY+MxkSNGD44flzYjN308
	PaqS+CGT0nhTSWx0ODFo6AqsQRDLUFAdTcfcX+VuVP//GW8eB3puUtZgAWGkUUpFPSPr
	Sbdhh/96oNW3JFpjq+D2qWDj2yHqpPNJHgHnmlNCOkg2LaFVjHr4/+Nz2yX/wwuKJT7j
	oDWNEZL95my8AyUC/YxZdsaBLNAbhSaohLqTjTDrSxxKE65eN3Pkc+2/5wL3rU+DcXwb
	JPW7RuPzAomwXKA3aeCBsocGHu0kscOYm4ZPCGsd/Z7d65RvOSdPIa/XriCt9XJKM/Vq
	fQjA==
X-Gm-Message-State: AJaThX5OF9ykrQXzY1ho6lnHoCLCsbLglUiRUBsC03K/g6B3zB0fHUdi
	6dD9CwovhHU+raD5/38yDDDlxpklH2qMXGkCNOg=
X-Google-Smtp-Source: AGs4zMbZKXx6p+fDgAetMmrL3NYkx3IKwO0GMjXXCbt/Shk1VMrOwQW0g5EKczfNEnuvkEyloCgNc3F3Ci2cElaA2m8=
X-Received: by 10.25.143.194 with SMTP id s63mr651655lfk.143.1510846675021;
	Thu, 16 Nov 2017 07:37:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.143.11 with HTTP; Thu, 16 Nov 2017 07:37:34 -0800 (PST)
In-Reply-To: <4f5c0b05-f8a5-d542-7a20-c40dd5100ae6@linux.intel.com>
References: <20171115141502.21516-1-ricardo.ribalda@gmail.com>
	<4f5c0b05-f8a5-d542-7a20-c40dd5100ae6@linux.intel.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 16 Nov 2017 16:37:34 +0100
Message-ID: <CAPybu_3CD3bRmYu97GD2gwOj0oX7xN2_Rkq0F3EfiWToMySJxw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] meson: update meson to 0.43.0
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
X-List-Received-Date: Thu, 16 Nov 2017 15:37:54 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Alex

On Thu, Nov 16, 2017 at 11:08 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 11/15/2017 04:15 PM, Ricardo Ribalda Delgado wrote:
>>
>> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>
>
> Meson is being moved to oe-core; can you please check the patches posted to
> oe-core list?

Do you mean review the patches on oe-core , or port my patches to oe-core?

Thanks!

>
>
> Alex



-- 
Ricardo Ribalda

