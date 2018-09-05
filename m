Return-Path: <marc@cpdesign.com.au>
X-Greylist: delayed 2036 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 05 Sep 2018 22:01:52 UTC
Received: from out116-37-vmse01.mailcluster.com.au
	(out116-37-vmse01.mailcluster.com.au [116.90.4.37])
	by mail.openembedded.org (Postfix) with ESMTP id CA57A793FB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2018 22:01:52 +0000 (UTC)
Received: from vmcp03.web-servers.com.au ([116.90.56.28])
	by vmse01.mailcluster.com.au with esmtps
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.89)
	(envelope-from <marc@cpdesign.com.au>) id 1fxfL8-0003vl-NL
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2018 07:27:56 +1000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=cpdesign.com.au; s=default; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=p4I9pEPvyLZKTP6lAJyMncYEtJlGPMEwiPbN0EoCakQ=;
	b=Q7hh1YwDjZI/yET1DAhv8R9S0T
	6/irp7AOpiv4Md3n2bYPVg77m171Hy6GUB61CJ1x76DzX/0/VUDqSsDMz5fH6eKQFanbeV7q2i1kD
	oTAh4WPEo+ZMFQ6bWJ2xWXeJ5FS8fJJRTaCkUTWYbc1jo3cFL3EIxGHtPE3fhiQOhDCuFrGdUtHvh
	ErxLtRvJmCHfGx+n2DLhKmMXKluVmVSPye+00hg37TUst3TRH/eg+qDeKDJdAjzb7px5R8yhGGXdF
	wm5MfA3kuZwiwaSGrzkgQ0LK8+PCE5lWQ60va8hRVC5v3MgFycB0DVqJ93zh1I87wB6+dvseo4/kG
	soeuH21g==;
Received: from ppp118-209-236-9.bras2.mel11.internode.on.net
	([118.209.236.9]:60218 helo=dev4.localnet)
	by vmcp03.web-servers.com.au with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.91)
	(envelope-from <marc@cpdesign.com.au>) id 1fxfKT-008LPJ-N9
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2018 07:27:13 +1000
From: Marc Reilly <marc@cpdesign.com.au>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 06 Sep 2018 07:27:13 +1000
Message-ID: <14229355.xykvgNZyFh@dev4>
Organization: Creative Product Design
In-Reply-To: <CAGCTLNSmcsfowyhEBXDACoiK4-hfoLAb9RPMius=PKw=Nx8Rwg@mail.gmail.com>
References: <CAGCTLNSmcsfowyhEBXDACoiK4-hfoLAb9RPMius=PKw=Nx8Rwg@mail.gmail.com>
MIME-Version: 1.0
X-Authenticated-User: marc@cpdesign.com.au
X-Authenticator: dovecot_plain
X-Originating-IP: 116.90.56.28
X-SpamExperts-Domain: panthur-sh-outbound0.mailcluster.com.au
X-SpamExperts-Username: 116.90.56.28
Authentication-Results: mailcluster.com.au; auth=pass
	smtp.auth=116.90.56.28@panthur-sh-outbound0.mailcluster.com.au
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.38)
X-Recommended-Action: accept
X-Filter-ID: EX5BVjFpneJeBchSMxfU5o0CozBosBQ8Q1DUKBbLkPN602E9L7XzfQH6nu9C/Fh9KJzpNe6xgvOx
	q3u0UDjvO6Y61ZkTr3+ohSgjjw6DWeGQf1l1fL6qA6F1IhiFnmhjYbirbVgsPNisggIr8baehbgN
	zB/4Jkrw1eDLcif59fuXf32htqV0hYHTgXAR13T/cD7g6rfkD501z7pOdWcyWoP1kxp/Q90I1E7H
	2LRCFTEISG0iU2596YVtTfLLVlYgpBTrcr9Crq3W5u+rDAGnOvHVgFMSznkuKtEuCmy8IW3uSSkB
	qBbjrDolErMrv/BJDCO6pwynrmwACiFMerxCDYrhylS5qWRAI3z2YWviHNWdhuuDinYBecBXGdF0
	kur+wc+jkLlVgHdKhBSfUTh3/LnkxMlqe3bxde6oGP5iqS2NDgfBsXhpZpGXRrEDnbmi5YE5enyc
	cp7RH4WQio3uGQiRtdZlCZVmqOKkeJ0MB55TjKT6cHpDpgZCny6AmGRBxRamOeYDBIwBrxIWz+W8
	eik4xAm9D8KTeKJT7gNACPeFIG5rVgSZqKqezztI0zHJ//F0ElM8N8vLAwCfRc9maWVCMoM0/sUZ
	7p0JxevUmna1gc/64jHpm9hXIkn6kqFVZ/3Su+IDKdiRxLJFZolHkcQj8fSOWJadTiMVDIZoB6nx
	+sXcZUQ+Z99QziSoDnwU0a7RxMlf9XL1uzl2jW8ARMdvFvKHr17XSzfxhbDPcbC9iDAaUCMMs5F6
	ArPjhpPkE42Qh2u0mBwKpGj6DQz7ExacHY6DoL2e33S6CddrwhNNn1E3xT6i58FmZiLYoSBHtZfY
	sl6wKKWEHIxSfxg/7ZcAdAW/bklHMNlTiGDfjbj4sNl2Wo722zw8wHZfUVcmfqb5R4VemuUI6bcE
	ARsm0Ki8KfQ960HHbAL7phoLgzhUQA3uoClQPSnn0hTaIer3Y9Pmbg52pYx0TRvgmjPTz7hS19vP
	Oq5cFPdQRhf/rLvIoN7O8xGP44LyJ3Ns++IBkqlQzir5FTzS0QHfIdQs5NThjK3J+EDagbQ0uZRs
	aHlWRIX+54vyc6Aa7Pvb/zfDUqZ4k6xPhG09aWWlFTZ9PQ==
X-Report-Abuse-To: spam@vmse01.mailcluster.com.au
Subject: Re: [openembedded][qt5] : Text is hidden in Qt5 apps
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
X-List-Received-Date: Wed, 05 Sep 2018 22:01:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

On Tuesday, September 4, 2018 8:11:49 PM AEST Mohamed Dawod wrote:
> Hi,
> I built custom image based on wayland instead of x11
> it support Qt5 apps.
> I built simple Qt5 app and tried to build it for the custom image to run it
> there.
> the application is work but the text is hidden !
> The same for the test app "Qt5_Cinematicexperience"
> No text at all for all films.

I would guess that there is some font package(s) missing or some environment 
variable needs to be set up to tell Qt where the fonts are.
(But I don't use wayland, so not really sure)

Cheers
Marc



