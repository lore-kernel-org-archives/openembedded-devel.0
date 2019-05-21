Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7A4BA7E16B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 06:02:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 457QCY3mWHz3k;
	Tue, 21 May 2019 08:02:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558418553;
	bh=yCPd+Z/p4Izav+IWHV6AlYJRCVu1LhkPWUrSRTPQILg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lcnu7uPUMWDJNNugBdrK4tqbVga7oWErl+AyuZLYwT2YS3ud86v5oJ8vlsth3UeZa
	IfSqcZS6JDRtyx+6kVfE2SAM7wQhAPwnrvAKgimFLhRDm5ATZ4ZH7EUScsGtX7RD+V
	VRs/CLuH8Juu6WhJc0CwV+GFXyh+bPexM4eh2my9aTJ9AgyVvawdgISlDyJDwN1RlY
	zcTp4YvxVVK6iPXbRagEajX8CrlOi9Y6qfQ+Xayq73q84OWpTeP6gusKD06Qk33sQF
	GVcPDdDkvbRwKnz2X9wWVlYARzcPWhosBK2aziX1UlovNJNmxaoONq6MxKcdMAYA68
	Buvxx6MLJNHHkS/yElezIiqFk/y7ADJ/stkCh7imBxf1zDBlp88h0hPKLJ33/ckeQ1
	P98R1hbpfAyzMc3AXw0RfW5enUwCI62V5k5wPG97Xg6aLOZgRSDj0vP3W3ppLOCyFL
	BCza6d7J6IonOZRho1oupUzAoDZjJODwbCzELa7upfFvBnV9djC/fUE6AnV+mrLTU9
	SW/buam/JrVbJqMimjOxJvHcuKiarpSt89IN/1R1+v3LglY94rD50DNzTTsRsbZfuh
	TLm+7UkvuVcheqyEBIzVXsJnD3elWlVvF+We3Gted9Rsh/SVUtUfeCw8UsUBEbAdrc
	kKVRsDrgT+pSIDblZLkXJv7k=
Date: Tue, 21 May 2019 09:02:31 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190521060231.GC9971@localhost>
References: <20190521052103.2096-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190521052103.2096-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] libnfc: Fix build with musl
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
X-List-Received-Date: Tue, 21 May 2019 06:02:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, May 20, 2019 at 10:21:03PM -0700, Khem Raj wrote:
>...
> +--- a/libnfc/buses/usbbus.h
> ++++ b/libnfc/buses/usbbus.h
> +@@ -35,6 +35,8 @@
> + 
> + #ifndef _WIN32
> + // Under POSIX system, we use libusb (>= 0.1.12)
> ++#define _GNU_SOURCE
> ++#include <stdint.h>
>...

Defining feature test macros after headers have already been included is 
documented to be wrong, and can lead to nasty runtime breakages.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


