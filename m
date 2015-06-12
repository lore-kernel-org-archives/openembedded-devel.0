Return-Path: <picmaster@mail.bg>
Received: from mx3.mail.bg (mx3.mail.bg [193.201.172.119])
	by mail.openembedded.org (Postfix) with ESMTP id D9621758D9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jun 2015 06:51:42 +0000 (UTC)
Received: from [192.168.0.62] (unknown [93.152.143.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx3.mail.bg (Postfix) with ESMTPSA id D519C20336EC;
	Fri, 12 Jun 2015 09:51:42 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mail.bg; s=default;
	t=1434091902; bh=2k6R3QTl79sfCOvGpiT8JUwIwpfLJiPx0prn3r+tU7E=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=Xngdk/oAigjGNR/Sbc2RBXbf2Zpt4GxQlVpuTgsxIyb145E+PmKzJe7QssfuZqDYS
	mWzDL+Q8wxkUGoqM0QcWBoObjAlg1vAgXdkA9E7th1Hx5aVFzfNWhNiLgjcwUPqS/v
	+MNYS5HkQtkONjlTeXiYhvoguGF/5cjl1ptSQAy0=
Message-ID: <557A817E.7070709@mail.bg>
Date: Fri, 12 Jun 2015 09:51:42 +0300
From: Nikolay Dimitrov <picmaster@mail.bg>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <5579F20D.5040900@mail.bg>
In-Reply-To: <5579F20D.5040900@mail.bg>
Cc: meta-freescale@yoctoproject.org
Subject: Re: [meta-freescale] Chromium crashes on HTML5 video tag
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
X-List-Received-Date: Fri, 12 Jun 2015 06:51:44 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Adding openembedded guys in the loop.


On 06/11/2015 11:39 PM, Nikolay Dimitrov wrote:
> Hi gang,
>
> Chromium tabs are crashing when they see an HTML5 <video> tag, like
> this one:
>
> <video width="320" height="240" controls>
>    <source src="movie.mp4" type="video/mp4">
> </video>
>
> (Code is from http://www.w3schools.com/html/html5_video.asp)
>
> I'm pretty sure that this worked fine some weeks ago, so it's a recent
> regression on Fido, 100% reproducible on imx6q sabresd. At this moment
> I still can't point to a specific commit in meta-fsl-arm or
> meta-browser.
>
> Thanks in advance for any ideas. Regards,
> Nikolay

