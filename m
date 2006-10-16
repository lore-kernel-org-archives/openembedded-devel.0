Received: from [141.2.4.18] (helo=mail.tm.informatik.uni-frankfurt.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mickey@tm.informatik.uni-frankfurt.de>)
	id 1GZWTy-0000cM-Dz for openembedded-devel@lists.openembedded.org;
	Mon, 16 Oct 2006 19:42:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id DEE3DE29
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2006 19:35:47 +0200 (CEST)
Received: from mail.tm.informatik.uni-frankfurt.de ([127.0.0.1])
	by localhost (mail [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 20668-06 for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2006 19:35:43 +0200 (CEST)
Received: from [141.2.14.64] (gandalf.tm.informatik.uni-frankfurt.de
	[141.2.14.64])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id 83F88E21
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2006 19:35:43 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@tm.informatik.uni-frankfurt.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1810005940.20061016180005@gmail.com>
References: <1810005940.20061016180005@gmail.com>
Organization: VanilleMedia
Date: Mon, 16 Oct 2006 19:35:43 +0200
Message-Id: <1161020143.1649.80.camel@gandalf.tm.informatik.uni-frankfurt.de>
Mime-Version: 1.0
X-Mailer: Evolution 2.7.2.1-3mdv2007.0 
X-Virus-Scanned: by amavisd-new at tm.informatik.uni-frankfurt.de
Subject: Re: [RFC] Annotate machines with amount of RAM
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Oct 2006 17:42:34 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Montag, den 16.10.2006, 18:00 +0300 schrieb Paul Sokolovsky:
>   I'd like to propose to add setting like RAM_SIZE which would list
> available RAM. Generally, that would be in line with more comprehensive
> declaritive machine descriptions we move towards with introduction of
> MACHINE_FEATURES. Clever distro could use RAM_SIZE to select
> alternative packages/settings. For example, if we ever come to
> Firefox/Minimo being default browser for distros, RAM_SIZE="32"
> machines may still prefer something smaller.

This is a good idea. We definitely need something standardised here in
order to prevent even more growth of hand-selected variables.

Which features do we need to describe? At first glance, I could think
about

VOLATILE_STORAGE_SIZE (RAM)
NON_VOLATILE_STORAGE_SIZE (Flash, HD, etc.)
DISPLAY_TYPE (Touchscreen or not)
DISPLAY_RESOLUTION

We shouldn't stop here. With several groups working on device daemon
standards towards interoperable platforms, it could make sense to
describe

INPUT_METHODS

as well (buttons, keyboard, touchscreen, microphone).

Last but not least GSM and (A)GPS should make its way into
MACHINE_FEATURES pretty soon as well...

-- 
Regards,

Michael 'Mickey' Lauer | FreeLancer | http://www.Vanille-Media.de




