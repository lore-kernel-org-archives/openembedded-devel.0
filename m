Return-Path: <contact@jgueytat.fr>
X-Greylist: delayed 1357 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 15 Dec 2016 15:36:04 UTC
Received: from slow1-d.mail.gandi.net (slow1-d.mail.gandi.net [217.70.178.86])
	by mail.openembedded.org (Postfix) with ESMTP id 32C54772B5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 15:36:04 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
	[217.70.183.194])
	by slow1-d.mail.gandi.net (Postfix) with ESMTP id 457B8536B25
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 16:06:12 +0100 (CET)
Received: from mfilter33-d.gandi.net (mfilter33-d.gandi.net [217.70.178.164])
	by relay2-d.mail.gandi.net (Postfix) with ESMTP id 0D677C5AA2;
	Thu, 15 Dec 2016 16:06:11 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mfilter33-d.gandi.net
Received: from relay2-d.mail.gandi.net ([IPv6:::ffff:217.70.183.194])
	by mfilter33-d.gandi.net (mfilter33-d.gandi.net [::ffff:10.0.15.180])
	(amavisd-new, port 10024)
	with ESMTP id icuOdRjA6d04; Thu, 15 Dec 2016 16:06:08 +0100 (CET)
X-Originating-IP: 10.58.1.142
Received: from webmail.gandi.net (webmail2-d.mgt.gandi.net [10.58.1.142])
	(Authenticated sender: contact@jgueytat.fr)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPA id 884DFC5AAF;
	Thu, 15 Dec 2016 16:05:39 +0100 (CET)
MIME-Version: 1.0
Date: Thu, 15 Dec 2016 16:05:39 +0100
From: Julien Gueytat <contact@jgueytat.fr>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <d4453d09-2112-0a1e-2812-0c63c932ca6a@gmail.com>
References: <1481809716-24451-1-git-send-email-samuli.piippo@qt.io>
	<d4453d09-2112-0a1e-2812-0c63c932ca6a@gmail.com>
Message-ID: <b71d5e25dfb662edef6fb77a58c3b211@jgueytat.fr>
X-Sender: contact@jgueytat.fr
User-Agent: Roundcube Webmail/1.1.2
Subject: Re: [meta-qt5][PATCH v4] Upgrade to Qt 5.8
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
X-List-Received-Date: Thu, 15 Dec 2016 15:36:05 -0000
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi,

thanks for the job!
Is this on the master of meta-qt5? If so I will be able to check if this 
patch 0009-Reorder-EGL-libraries-from-pkgconfig-and-defaults.patch is 
still needed or not. I hope not.

Regards,


On 2016-12-15 15:49, Samuli Piippo wrote:
> Changes from v3 patch:
> - sha1s updated to expected RC content
> - fixed the qt3d assimp build-deps issue
> - the new Qt configuration system taken into use where applicable
> 
> webengine build problem with x86_64 host and x86 target is still there.
> 
> -samuli
> 
> On 15.12.2016 15:48, Samuli Piippo wrote:
>> The linux-oe-g++ mkspec is changed to use $$(...) operator to obtain
>> the contents of an environment value when qmake is run instead of when
>> Makefile is processed. All OE_QMAKE_xxx variables need to be exported
>> for qmake to find them. configure's setBootstrapVariable function 
>> needs
>> to change $$(..) to normal $(...) operator to work with qmake's 
>> Makefile.
>> 
>> qt.conf generation for qtbase recipes is not needed, as configure will
>> generate its own version based on configure arguments. Skip running
>> qmake, since configure is now automatically invoked when it's run in
>> qtbase's root folder.
>> 
>> Update PACKAGECONFIGs for qtbase to match current configure options.
>> 
>> The new Qt configuration system [1] can be used with a new variable
>> EXTRA_QMAKEVARS_CONFIGURE, which takes both command line and feature
>> arguments.
>> 
>> Merge the two qtwayland recipes to one that supports all three targets
>> (target, native, nativesdk) without need for additional patch.
>> 
>> [1] 
>> https://www.mail-archive.com/development@qt-project.org/msg25257.html
>> 

-- 
"Yesterday is history, Tomorrow is a mystery, But today is a gift. That 
is why it is called the "present"."

Adress: 29 Boulevard Joseph Garnier 06100 Nice FRANCE
Mobile: +33 6 17 98 03 83

