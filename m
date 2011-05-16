Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1QLwIE-0008SX-JA
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 13:48:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id AEB9A3150F12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 13:46:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id u6g3b12e+L-S
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 13:46:00 +0200 (CEST)
Received: from [172.22.22.61] (drms-590c46b9.pool.mediaWays.net [89.12.70.185])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 14DDD3150F13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 13:46:00 +0200 (CEST)
Message-ID: <4DD10E76.1060100@opendreambox.org>
Date: Mon, 16 May 2011 13:45:58 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1303134465.3910.63.camel@mattotaupa>	<1303134640.3910.67.camel@mattotaupa>	<4DAD7297.2030606@opendreambox.org>	<1303506946.4155.81.camel@mattotaupa>	<AF97BCF4-CD32-4069-BB81-FECAC104F6D9@dominion.thruhere.net>	<1303509611.4155.111.camel@mattotaupa>
	<iou12i$88c$1@dough.gmane.org>
	<1305476698.5838.622.camel@mattotaupa>
In-Reply-To: <1305476698.5838.622.camel@mattotaupa>
Subject: Re: [RFC] [PATCH 2/2] pkgconfig: add git version
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
X-List-Received-Date: Mon, 16 May 2011 11:48:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/15/2011 06:24 PM, Paul Menzel wrote:
> Am Samstag, den 23.04.2011, 10:02 +0200 schrieb Koen Kooi:
> 
>> On 23-04-11 00:00, Paul Menzel wrote:
>>> Date: Sun, 17 Apr 2011 19:19:58 +0200
>>>
>>> 1. The revision is close to the upcoming release of pkg-config 0.26. [1]
>>> 2. The patch `sysrootfix.patch` has been merged upstream [2].
>>> 3. No embedded GLib is shipped anymore [3]. Therefore drop patches `autofoo.patch` and `glibconfig-sysdefs.h`.
>>>
>>> The patch is tested using the following configuration
>>>
>>> 	Build Configuration:
>>> 	BB_VERSION        = "1.12.0"
>>> 	METADATA_BRANCH   = "pkg-config"
>>> 	METADATA_REVISION = "d4ae0c5"
>>> 	TARGET_ARCH       = "arm"
>>> 	TARGET_OS         = "linux-uclibceabi"
>>> 	MACHINE           = "beagleboard"
>>> 	DISTRO            = "minimal-uclibc"
>>> 	DISTRO_VERSION    = "dev-snapshot-20110417"
>>> 	TARGET_FPU        = "hard"
>>>
>>> and `angstrom-2010.x` and `minimal` too.
>>>
>>> [1] http://lists.freedesktop.org/archives/pkg-config/2011-April/000720.html
>>> [2] http://cgit.freedesktop.org/pkg-config/commit/?id=66d49f1375fec838bcd301bb4ca2ef76cee0e47c
>>> [3] http://cgit.freedesktop.org/pkg-config/commit/?id=99964eddb5935173fcedfc793e762d7dc7d01bba
>>>
>>> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
>>
>> Acked-by: Koen Kooi <koen@dominion.thruhere.net>
> 
> I did not commit this yet thinking Andreas would give his ack.

I still think that using SRCPV in PR is just wrong. SRCPV doesn't change
the version of the package but the version of the packaged content.
Otherwise it would be called SRCPR.

>>> +PV = "0.25+0.26"
>>> +PR = "${INC_PR}.0"
>>> +PR_append = "+gitr${SRCPV}"

Regards,
Andreas


