Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cdhmanning@gmail.com>) id 1Q2aDV-00056x-C3
	for Openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 03:24:05 +0100
Received: by fxm19 with SMTP id 19so8165040fxm.6
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2011 19:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=P3tBtdoR0Wb4yFST5vBWPNsnb9le4Oh4QRRNRiy6LUQ=;
	b=I9gDHeVXgSvdJRWUlpAczoAyTSx5n3WDS9v5SX22tllYsM1WlMNJLFcI6VtVcTVH2F
	ZHnCqk3IHXkC/+ElNPzvB10GJOSlYQguUMyc1Gni6rFhlBCCM7azOPSTlfApuoygAPKl
	HRsiqXLRMjkVFL5IX5DAZH6iCh8n+gecVsyjQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=aDAcYCDOY9drkLGrzjUH4DrRscxGPiMlgf/YPPX18WsKRVTCcMzmEULqGMQbDv0eJl
	ZutKz9jkmteZtW9KxBkKH8tWIyL+1DtnY/kjZM2ZUkHw00RpEwrdaOpSiBR5uxeXdeT/
	1R85H8t/0Ikh+7+IWwPKgpGvEdmtc//jsZCgc=
MIME-Version: 1.0
Received: by 10.223.69.130 with SMTP id z2mr4782070fai.107.1300933333858; Wed,
	23 Mar 2011 19:22:13 -0700 (PDT)
Received: by 10.223.70.195 with HTTP; Wed, 23 Mar 2011 19:22:13 -0700 (PDT)
Date: Thu, 24 Mar 2011 15:22:13 +1300
Message-ID: <AANLkTi=4V9JnT1HKi1VJo9j46xXoTHJk_MwAh1fU9F_0@mail.gmail.com>
From: Charles Manning <cdhmanning@gmail.com>
To: Openembedded-devel@lists.openembedded.org
Subject: How do I change the kernel includes used in building a toolchain?
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
X-List-Received-Date: Thu, 24 Mar 2011 02:24:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

I've managed to make the recipes to build a toolchain.

I've also managed to make the recipes to build a new version kernel
uImage and modules.


But the problem I have is that the toolchain I built has kernel
headers from the wrong kernel version. That means packages like tslib
which use kernel includes don't work properly because they are
compiled against obsolete kernel interfaces.

What do I change so that the sdk includes the correct kernel includes?

Thanks

Charles


