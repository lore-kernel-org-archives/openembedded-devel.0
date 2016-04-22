Return-Path: <george.mccollister@gmail.com>
Received: from mail-ig0-f195.google.com (mail-ig0-f195.google.com
	[209.85.213.195])
	by mail.openembedded.org (Postfix) with ESMTP id C594F6FEE0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 16:30:40 +0000 (UTC)
Received: by mail-ig0-f195.google.com with SMTP id g8so2868114igr.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 09:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=IJRnTO/IJkNdG7oqIsswKX4yhjA/QXnX1TgPCOEHPtM=;
	b=eFwpwpnufp6w0vaw0FQ2pKzqS6DjXiO7DRYmHrkMnH0SbcxmKwjpPrYGtiE6ZGd5PA
	ODnRnYvGtOg28u85L0ZeTqjbhdQpmwuTM0mxHkk3PRlVvFCD9xf8XhJ4mC8m+LrsOJF+
	Myycu8KBZK7Vnli1O0Ru31pl+R0mt/M9pFAwCrstzdh2NKrCUunYg3UEyb5miUnyoz8c
	up/rf5v6nYF/n1Vt4PNtXpDsD018pTMczaT/oJV184YdS9Fv2ulULKGatAcalTcJrSS5
	E32w+s+tIdfIFbjcbUdnsOc/3Ti/bZ4OAa/5NrU57JeIm6RXl1Ga+KJrkjR5cQwAmcx5
	CVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=IJRnTO/IJkNdG7oqIsswKX4yhjA/QXnX1TgPCOEHPtM=;
	b=XcCI/lUvQK7q4TbbHblpubCeQy1SnunNuuPwkgNMt9lrvMnDNiOdrC9zUVPhb6KZWL
	N+yFD57q6yQzvZwqi4dhJREJ9liZ34YXVdHXsJWXwzguq6niQOG3F80/LiKbrl9iyUIC
	9UuiTO5rS08eXHUBNOKyiFi6O84pRPg0NgzTjO/xOMbq8tPBS45zqiEWZLcGCbdp35Ay
	9tAd1EpAkR2OcJfIATXWxkjsplIh0g/wdhdKrwCJH4URJBAxQHyfE921+ejmydNsLwsG
	L58avH2GSVeEISFuPD6ohkVArqc7y+VWoMxd6Ii6r4y0yVv70AWxiLkirJgeoCZF2+Q8
	0Gsw==
X-Gm-Message-State: AOPr4FU3HjTCuPrhxub0qcQtHCFA3TRATgEbKF4F9WN7Vuaii0ObVYZbPKYMW0to08NT98CIkWrwZBi9q+cJfA==
MIME-Version: 1.0
X-Received: by 10.50.81.197 with SMTP id c5mr5355492igy.67.1461342638747; Fri,
	22 Apr 2016 09:30:38 -0700 (PDT)
Received: by 10.36.81.212 with HTTP; Fri, 22 Apr 2016 09:30:38 -0700 (PDT)
In-Reply-To: <1461013253-2350-1-git-send-email-joe_macdonald@mentor.com>
References: <1461013253-2350-1-git-send-email-joe_macdonald@mentor.com>
Date: Fri, 22 Apr 2016 11:30:38 -0500
Message-ID: <CAFSKS=OrhdjemW+1t1uMpGUbcnP0s5JX59Z4mvv_hqPpwBXG_w@mail.gmail.com>
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Update Samba
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
X-List-Received-Date: Fri, 22 Apr 2016 16:30:43 -0000
Content-Type: text/plain; charset=UTF-8

I'm looking forward to seeing these changes in krogoth as what is in
there now is unusable from a security standpoint. I cherry picked the
patches to krogoth and my builds suceeded but haven't gotten around to
doing any operational testing yet.

-George

On Mon, Apr 18, 2016 at 4:00 PM, Joe MacDonald <joe_macdonald@mentor.com> wrote:
> I'm still doing some testing on this and I haven't built for all the
> architectures yet, but it passed at least the most basic smoke-test.  Given the
> number of outstanding CVEs against our current version of Samba (thanks Armin!
> :-)) I think it's best fo rus to update this rather than trying to do any
> back-ports, but that also introduces a not-inconsiderable level of risk for
> Samba users.  So please, if you're one of them, kick the tires on this as soon
> as you can (or ping me back letting me know what your thoughts are on this, at
> least).
>
> Thanks all.
>
> --
> -Joe MacDonald.
> :wq
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

