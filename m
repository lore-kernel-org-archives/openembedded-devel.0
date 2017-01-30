Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2059271C84
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2017 01:15:57 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id r141so11868907wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jan 2017 17:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=V1QZf+iJBDE2DLBIKVKVTBFg20I3dLanJKtM+OrtrOc=;
	b=mZjGHJS0emsy5WK0XvQCy6HqAajX0WnCyAlxeKXPKEys4KfcgmNU/dEYC4udkVzhZt
	HTM2bh2QaRVPPE338oN9LTQebsHIjpOzOU4xPShom344nNbEDiHIYxmQvnw++qRqW7dl
	iSElpSD4GLJdbDpT7hiaf+y1cr66b6GnCCc1vr4Sa9CtfdkD7ZmrlnaNKiCvPKupxpgZ
	b63iByvx/NcFiaz8YvcwVpkY8rFcL5tEIpbZiEiCS5ImYZJJqXuu0iYAWm5e2csyDMV0
	xSjALPrJH+6FobcSV3W0sheUTVFYsv14/+BhXt2eaZYnBMQ3ON51xaAiVbWHIVJYohKv
	yUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=V1QZf+iJBDE2DLBIKVKVTBFg20I3dLanJKtM+OrtrOc=;
	b=sk6T4ZKWh4g9XplnsPKCT7+6/SXokVw+IIfE4gRwg7M3sFkTse+CdlVhUGebbRw5lf
	Lotvo2ZZYTlAqYRg+LiXt0I+XCWyR6JSKkvxL7Tl4QXMeSHA+Z0bMGeUv3+PykrinOXv
	VMSl2ntkKFrRyIW3jKWPuK/xXzcGbJDgISLl5QJ7eA5Jto52SBe/E7fmAvIdF6DqM3BW
	hIMLs/JPNDFsn8a/36x7Pwfq224I8Tiq2azLvZLLVTwP6meyBk5Vtyri0Guz1/ChUJse
	uVX3iR83PLP4OVN90G/Y1qd0i3Pfg76ii+ep7/OgXHwEM4v+J2TvAf0sIoYLa5CBB5Pj
	bSsA==
X-Gm-Message-State: AIkVDXLJG6120pDBnCJeM9fizPN9CER/j1VnKAv1LQh9VLnPG1QIzt6Uv1hXEncTpQLpl1ezuIChqNZQTFkX5A==
X-Received: by 10.223.154.165 with SMTP id a34mr15952421wrc.193.1485738957577; 
	Sun, 29 Jan 2017 17:15:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.164.227 with HTTP; Sun, 29 Jan 2017 17:15:37 -0800 (PST)
In-Reply-To: <ba9f9b77-b2d7-5f10-3b48-14f3c8ea53e7@gmail.com>
References: <20170127152157.15342-1-ricardo.ribalda@gmail.com>
	<ba9f9b77-b2d7-5f10-3b48-14f3c8ea53e7@gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Mon, 30 Jan 2017 02:15:37 +0100
Message-ID: <CAPybu_3Zgc216GEvkczZjgC+d9PhAN=J-By5HaPM84448X_CTg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] opencv: Configure freetype via PACKAGECONFIG
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
X-List-Received-Date: Mon, 30 Jan 2017 01:15:58 -0000
Content-Type: text/plain; charset=UTF-8

Hi Raj


On Fri, Jan 27, 2017 at 9:07 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>
> On 1/27/17 7:21 AM, Ricardo Ribalda Delgado wrote:
>> Since: http://errors.yoctoproject.org/Errors/Details/117456/ opencv
>> freetype module fails to build.
>>
>
> I wonder if we need to export RANLIB in configure
> along with CC and CXX

I would definitely like to try that out, but I am out of the office
until the 15th. If you do not want to wait for me, you are more than
welcome to send a patch. If I keep sending patched during our holidays
my wife will have a valid excuse to escape with the barman :)

Regards!

