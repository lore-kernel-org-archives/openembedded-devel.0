Received: from [209.85.128.191] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J5O9A-0003WW-Cw
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Dec 2007 17:21:20 +0100
Received: by fk-out-0910.google.com with SMTP id 18so4054452fks.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Dec 2007 08:16:13 -0800 (PST)
Received: by 10.82.174.20 with SMTP id w20mr268269bue.21.1198167373059;
	Thu, 20 Dec 2007 08:16:13 -0800 (PST)
Received: from widy.lan ( [194.79.8.36])
	by mx.google.com with ESMTPS id 13sm23170303fks.2007.12.20.08.16.11
	(version=SSLv3 cipher=OTHER); Thu, 20 Dec 2007 08:16:12 -0800 (PST)
Date: Thu, 20 Dec 2007 18:21:16 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <571189143.20071220182116@gmail.com>
To: Marcin Juszkiewicz <openembedded@haerwu.biz>
In-Reply-To: <200712201540.11149.openembedded@haerwu.biz>
References: <E1J5L4z-0004um-WD@linuxtogo.org>
	<200712201540.11149.openembedded@haerwu.biz>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.dev distro/openwrt-sdk.conf: Distro config to build packages for OpenWRT.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Dec 2007 16:21:20 -0000
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit

Hello Marcin,

Thursday, December 20, 2007, 4:40:09 PM, you wrote:

> Dnia czwartek, 20 grudnia 2007, pfalcon commit napisa³:

>> distro/openwrt-sdk.conf: Distro config to build packages for OpenWRT.
>> * Only package building is supported (not images).
>> * Uses SDK tarballs from OpenWRT projects.
>> * The distro itself is fully target-agnostic, you should just install
>> correct SDK tarball and pass correct TARGET_ARCH (using environment vs
>> local.conf is highly recommended).

> MACHINE=wrt54 + DISTRO=wrt54oe builds toolchain which builds packages 
> usable under OpenWRT. At least it worked like that when I tested it over
> year ago.

  Year, a year ago, that's the key. I'll have an RFC to deprecate wrt54oe,
asusoe and some other stuff possibly lurking there in favor of openwrt-sdk.conf,
once I'll prepare argument list for it (and the first one will be that its
name corresponds to what it does).



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



