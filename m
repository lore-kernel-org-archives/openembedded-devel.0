Return-Path: <dominik.holland@pelagicore.com>
Received: from mail-bk0-f54.google.com (mail-bk0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 326CE6CEEA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2013 12:10:59 +0000 (UTC)
Received: by mail-bk0-f54.google.com with SMTP id v16so5312577bkz.41
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Dec 2013 04:10:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:content-type:content-transfer-encoding;
	bh=n5y2FRh4kokC5mxTPTkaWJ0u+/thIgR+wV0KegyeQ9U=;
	b=jLRcMWYnpkrt8OqwG06yLQotM+WOR3ZpfSi9iXRsoGDS2DEIUe29WB/6U7XP3yTJ7g
	dAIBfqo+lkKMZLcShlbdAblI4ytfjruaOsx3JGJAGqisMaoCIPBlU+na0E5WjDS0YpaL
	dzU3Cg3RRmNv4UHBlaJZCshN14vSIm/IOQlBlO6kLO0JHjyvGYJyZUI+4OqbPKeK5Ufe
	bge7xhu2PXxMp1gtsY4/HoA23D6Vjh+NvCGWjEEZztwkXrUpx6rDnvlF1H1czpG2uHxi
	Z1wohn22LQKaJGNjz25NI/l36WK/7QvPFcJCluv6w+iCRFBYqrMepqppc+c3sA/G0r9n
	D9jA==
X-Gm-Message-State: ALoCoQkcPpkAbyJztf8TXkhTlzgBK9NoHIFUUjWf3jtW24UlN6DRaN24yJUcpIMc2wfzN/+z5X4I
X-Received: by 10.205.64.9 with SMTP id xg9mr1067061bkb.52.1385986257951;
	Mon, 02 Dec 2013 04:10:57 -0800 (PST)
Received: from [10.10.1.61] (ppp-46-244-214-173.dynamic.mnet-online.de.
	[46.244.214.173])
	by mx.google.com with ESMTPSA id l5sm29547688bko.7.2013.12.02.04.10.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 02 Dec 2013 04:10:57 -0800 (PST)
Message-ID: <529C78D0.8030902@pelagicore.com>
Date: Mon, 02 Dec 2013 13:10:56 +0100
From: Dominik Holland <dominik.holland@pelagicore.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [meta-qt5][PATCH 0/2] Add nativesdk tools for Qt5 SDK
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
X-List-Received-Date: Mon, 02 Dec 2013 12:11:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

i'm the author of the merge-request on github.

The patchset from Denys looks nice. Especially because it cross compiles 
the host tools for the SDK_MACHINE which i forgot todo in my patchset.

I think the best way would be a combined version of both patchsets.

Because some of you think my patchset is too complicated i want to 
highlight why i added the complicated creation of the qt.conf and the 
additional patching of the mkspec files etc.

I didn't tested Denys version but i think it only works if you source 
the environment scripts of the SDK before.

As a Qt developer it's the defacto standard to get a SDK which works out 
of the box for your projects by just invoking qmake and no need to 
source a script before which changes your environment.

To get this done you need to patch the mkspec folder and the qt.conf to 
use relative paths instead the hardcoded paths which where created 
during the yocto build.

In addition i created a linux-oe-sdk-g++ which contains the real values 
of the environment variables but without --sysroot. This will be set by 
qt itself by using the CROSS_COMPILE prefix.


I hope you understand that this is really needed if you want to get a 
good qt5 integration into a OE SDK.

Best Reagrds

  Dominik

P.S. If you want to use the qmake inside qtcreator you would need to set 
all the env variable of the environment script inside qtcreator which is 
really inconvenient

