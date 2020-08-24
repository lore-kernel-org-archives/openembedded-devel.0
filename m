Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
 by mx.groups.io with SMTP id smtpd.web11.190500.1598255156312013709
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2020 00:45:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=DITt03uR;
 spf=pass (domain: skidata.com, ip: 91.230.2.91, mailfrom: prvs=498d700d9=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1598255156; x=1629791156;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zdx9vhGh5DnSvvv8ct7VsnRtRVy9TYpkNgiDwdgJcpQ=;
  b=DITt03uRLy70yWXPnJ/wUwjDIme0nNzo+MzxBPFVK1yC27stP0mNv8J2
   5qcW4zYxRIJ8VSZ65B62ZoICuvS6o5LgpG+6CQIrA39oE5l9DnKAsEqKR
   Ko0pCBAZKju0rgc1LxuJbVMrvbUW0kbLnp5Wp61zAOLuuunMGeRUg4uQ3
   dSN0ahF7dvOCOdh7eBZZHSxgzonJI1nUPbuKCIRkBDro+fjdV20Bdl27B
   frCrSpNpaqG5XQ4rGmwPdV7PZe6nOSTrpZd9EawNZTOT36LHhI33Kwg5C
   yPmgNYsb5k4MycAICzgZLqZ5AfPnDStGiZ/cATo+qF6+Z9j2N+0LJHFSR
   A==;
IronPort-SDR: RiXBSVdIIXgcS/Dqa7GlT94nHwWJanFOlY8Qw/KRsXNfxH8cOSN5XN4rqkPIOakTycyt6pXKeB
 D7c/c+Z2V/F42ELS00BQZ1d7X1gm/GWiJPOy1Z9YszKxAp+3y5VlH0VIt1U8xAs5VxYduW2utk
 rQGNz+xo3yHG5Zrd3hsM28vGXW3ng+aB7EZxqKP6lhTuQBm0SpLYfRNg5rh8tQh7mTc8OLtW76
 lLVDXMNjTdYbmNIdwEgAef1QGCTewIvkeXevpsuUEbgUjHdvRpJYS+8jDkYJ5RdH1E+6clC3cF
 bA4=
X-IronPort-AV: E=Sophos;i="5.76,347,1592863200"; 
   d="scan'208";a="2649052"
Date: Mon, 24 Aug 2020 09:45:54 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Alex Kiernan <alex.kiernan@gmail.com>, Chencheng Zhang
	<chencheng@wittra.se>, OpenEmbedded Devel List
	<openembedded-devel@lists.openembedded.org>, <ricardo@ribalda.com>
Subject: Re: [oe] Failed to fetch URL https://bitbucket.org/cacaovm/cacao-staging/get/2d6f6c14daf9.zip
Message-ID: <20200824074554.GF65616@pcleri>
References: <CAE5diG1AoUDZrO=V7pMjvgv3Gu5cMk3dvPzM82Dem1Sc8X3Wvg@mail.gmail.com>
 <CANNYZj8dyU6LpUBiM--YNsF8of56SG4-+VxMsM2B9_SwY0+1dA@mail.gmail.com>
 <20200824065011.GE65616@pcleri>
 <CANNYZj_CMwME4mhX0FfhVJbe94eW00TzjXuthWqWBCg3tJULHA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj_CMwME4mhX0FfhVJbe94eW00TzjXuthWqWBCg3tJULHA@mail.gmail.com>
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Aug 24, 2020 at 09:24:21AM +0200, Alexander Kanavin wrote:
> Thanks! But I guess dunfell needs the same set of fixes?

Yes. I'm currently running some tests and if they succeed I'll backport
a set of patches.

regards;rl

> 
> Alex
> 
