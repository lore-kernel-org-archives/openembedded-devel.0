Return-Path: <sadlife1990@gmail.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3678C738ED
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Mar 2015 10:30:53 +0000 (UTC)
Received: by wghl2 with SMTP id l2so30102495wgh.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Mar 2015 03:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=tiZoSDH3Z9Ey9hxorLuCX/hQYYa6yMtpRO4f6QhdVFg=;
	b=Tc0HFWk2uz21zx2aZsVZOvNnYbwn4dMxEouALfruyhvtc3Idvs1zK7sriT2vjSGc+q
	vTS6nglcCKVOFdkPQNCqMkiGX14XA8fP26YKvwq8coKKJIhabl7HKb0dAO5OZIFy7vvV
	j22z1IAW5ObedEpRK6eAglUAsemM16cMtsIrvqEyW436L/zqZ/uhXi8cZ3BhuPPnlbKN
	FGEjZhLfqqhOiL6aznAIMobjdDAY0xBYUvcLYaTzRnEeYWxErzFr8ONGz/6bbEJ8eVF0
	epW6U7tHOZnmr//dugaoWFTDfyPP49Mpt4ggUOaD4usVHrLcCxASjGlfg9GqFLRam7ee
	4gAA==
MIME-Version: 1.0
X-Received: by 10.180.95.97 with SMTP id dj1mr58527545wib.43.1425897054570;
	Mon, 09 Mar 2015 03:30:54 -0700 (PDT)
Received: by 10.194.36.196 with HTTP; Mon, 9 Mar 2015 03:30:54 -0700 (PDT)
In-Reply-To: <CAAHuHfxzC86bfWMeehHSXnNwNNvNeCVOGOH6h18agfwbR=D42A@mail.gmail.com>
References: <CAAHuHfxzC86bfWMeehHSXnNwNNvNeCVOGOH6h18agfwbR=D42A@mail.gmail.com>
Date: Mon, 9 Mar 2015 12:30:54 +0200
Message-ID: <CAAHuHfzyvwX8B4cAv1yS6ZaO6OKr9500fpKSzJxbyHs1NtZTuA@mail.gmail.com>
From: Life Life <sadlife1990@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: cups filters bannertopdf
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
X-List-Received-Date: Mon, 09 Mar 2015 10:30:54 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

I'm try to add cups filter for  yocto 1.6.2 daisy I add to Ghostscrip bb
this line is not work.
 ${exec_prefix}/lib/cups/filter/bannertopdf

But I add to this lines its work.

FILES_${PN}-cups += "${exec_prefix}/lib/cups/filter/gstoraster \
                     ${exec_prefix}/lib/cups/filter/gstopxl \

create cups filter folder and gstopxl and gstoraster filter was created.

Could you give me help how to add cups filter bannertopdf thanks.

