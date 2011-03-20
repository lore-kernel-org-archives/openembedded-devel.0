Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q1N5e-0007Kf-Ld
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Mar 2011 19:10:58 +0100
Received: by pwj9 with SMTP id 9so647418pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Mar 2011 11:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=gULbKn3rTwOdzQScn8I5dCpM+STm8SWDr2ONpzGcxlI=;
	b=kSA9LRqCZWrta8qO5h0gTOsYdsh2e9eFZbgLOfkqrYLPyOvz2+/HY7W+3LeUS+dORL
	X3tJuDPqcMBBhV4/YPmtv85LQHj1L1vjac15PYGYN/oULXDxGkrf9M202xOvgIcydjNc
	rUdwlcqEj6MjiXqKFSXb250jYx9SGSar//wm0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=GE3a3oLlwmIJRTCtdakysP3ZUgNSzpLVpXjLAvaZLTB0v+1RJaexDP0AHcSsECJvkV
	1p6bTFnfAm4yTZqPxK2FXfpMnNpj4TwkqltZmGCXJ213hug8jDddX06mCbxz0P6QO0m9
	+t/cItVjaTFHgSBoInoKseHkL8ZVbnBjriC7E=
Received: by 10.142.186.13 with SMTP id j13mr2065663wff.25.1300644097752;
	Sun, 20 Mar 2011 11:01:37 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id w27sm6155836wfd.4.2011.03.20.11.01.34
	(version=SSLv3 cipher=OTHER); Sun, 20 Mar 2011 11:01:35 -0700 (PDT)
Message-ID: <4D8640EC.6080102@gmail.com>
Date: Sun, 20 Mar 2011 11:01:16 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1299591298.3785.126.camel@mattotaupa>	<1300205205.4123.6.camel@mattotaupa>	<AANLkTimEXRbjaJ9VXOk4m+QvpF6ZVnWzAGaXY9Q2tiyc@mail.gmail.com>	<1300364903.3950.21.camel@mattotaupa>	<1300402006.17833.14.camel@mattotaupa>	<AANLkTi=xe7p694-8-bnGV85H59M-tJvTUnwm6TgCFPZk@mail.gmail.com>	<1300449625.3830.47.camel@mattotaupa>	<20110319183329.GA14868@sakrah.homelinux.org>	<1300583444.7379.1.camel@mattotaupa>
	<4D85835F.7070002@gmail.com> <1300616160.3950.4.camel@mattotaupa>
In-Reply-To: <1300616160.3950.4.camel@mattotaupa>
Subject: Re: [PATCH] xfce_session_4.6.{1, 2}: explicitly pass the path of `iceauth`
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 20 Mar 2011 18:10:58 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> That it is not a build time dependency and therefore only needed during
> runtime. I thought the pathes of programs during compile time do not
> matter since the build host and the host where it gets installed differ
> when cross compiling.

OK I see its a runtime dependency( not compile time/configure time) then 
its ok but I think we need to have iceauth in RDEPENDS too I think.



