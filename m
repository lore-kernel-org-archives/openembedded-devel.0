Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 by mx.groups.io with SMTP id smtpd.web11.3173.1599037240838406053
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 02:00:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=oy5Dk0Rt;
 spf=pass (domain: skidata.com, ip: 91.230.2.99, mailfrom: prvs=507acaa50=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1599037240; x=1630573240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=TxQSy3mwIK8XkoLt/OssqH/q1kGNG4TMrOfFe831ZgM=;
  b=oy5Dk0RtQCWxEVQ4R5/VzPcmX2b5N7YGwcVrOFMkDNB+32bU0zYsbExu
   aO7nk8Wmi7gYrKeoseaW9wzUe2wEJuFQGRnDphDevAAZES9pGLM1ecT75
   S06tO3Yr5zidb45SH4rXkOJGW4OfKvewNRz+rl2V02J4llXs5yF/Ir3AP
   zrK/oFsOkgzA0gjfVKFGTDk/Pvx7xI0bdvhJZbv4OsZSRjqbQf2ydqgpM
   M7VtLlKGA8ymbUZxWgqIeMX8IBSX/6dmFuIhSMvDpG22YPCAbonhqj92x
   NeI0cQaZkf6x1ExAiWTmRiMUne9cDGTxmM6LlMoJZQKOtnNsQ0/yiqRhB
   g==;
IronPort-SDR: G7htKcZSzZn+b7leJ1pAJKwThKtCKK8/uGhprX6d45nsY9poqqTl0N61Ts5HIMiQInhlbq22Rh
 FCQJ3m1zI/ujhzu/NWU7+i9vbXnoH5W1NDpxlfYq1SJfLVpXJF/66gKcosp+kqkdb7YHF2fs/q
 AokOcAQAbtl+yHUPhqzMQDfD0tIV+AAfQr2bfFvAT/9D3p2icBZ/u/6R/5Zb7ggphLsWKJUkkP
 vHBEcZrFRI5bkRmc1ZdSS9acEf30a04CF6bDaVL8EYVuFTq6WwhLW3RZ1OU/OIYiRL7PLZAO8X
 MZ8=
X-IronPort-AV: E=Sophos;i="5.76,381,1592863200"; 
   d="scan'208";a="26542224"
Date: Wed, 2 Sep 2020 11:00:33 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Jacob Kroon <jacob.kroon@gmail.com>, OpenEmbedded Devel List
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-java] Changes from master-next merged to master
Message-ID: <20200902090033.GC81961@pcleri>
References: <20200824093831.GC2286@pcleri>
 <CANNYZj_LT1m2gSbhL+Di1PaFGzSYGmPVYsEus0YnSx19sOZ8jw@mail.gmail.com>
 <162E2BC2BA50B6B6.12673@lists.openembedded.org>
 <CANNYZj8fWMk1Ya+G-HbC2VVbC4HWV6x=4T=ni_cdW5-qNG1YnA@mail.gmail.com>
 <20200825055800.GA37583@pcleri>
 <CANNYZj-n4T1bkX4k36B5LgG+7nJANO+sVKGXbyf1mFZTMx-t1Q@mail.gmail.com>
 <20200825110343.GE37583@pcleri>
 <CANNYZj-a5HeUKExws6KNoofbPy4EQmmzx=2-ZtsD+N8j70g-HQ@mail.gmail.com>
 <20200902084348.GB81961@pcleri>
 <CANNYZj8=uS8Bm62J+5QXc5KYo53uoANw0nvwdJe8j9fJzPY=6g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj8=uS8Bm62J+5QXc5KYo53uoANw0nvwdJe8j9fJzPY=6g@mail.gmail.com>
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Sep 02, 2020 at 10:50:24AM +0200, Alexander Kanavin wrote:
> On Wed, 2 Sep 2020 at 10:43, Richard Leitner <richard.leitner@skidata.com>
> wrote:
> 
> >
> > > ping - I think dunfell is still at the old revision?
> >
> > Thanks for the reminder.
> >
> > dunfell and warrior should be up2date now.
> >
> 
> Dunfell is fine, but warrior does not have any new commits, particularly
> the cacao fix?

warrior should now build on GCC10 host machines.

It seems I really missed the cacao fix 😕
I've pushed it now, so it should be fine now.

Thanks again!

regards;rl

> 
> Alex
