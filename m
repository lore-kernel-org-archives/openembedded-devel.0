Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1QwEyC-00073J-VP
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Aug 2011 17:02:21 +0200
Received: by ewy5 with SMTP id 5so520424ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2011 07:57:34 -0700 (PDT)
Received: by 10.204.130.129 with SMTP id t1mr2345694bks.231.1314197854304;
	Wed, 24 Aug 2011 07:57:34 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (pd95cb174.dip0.t-ipconnect.de
	[217.92.177.116])
	by mx.google.com with ESMTPS id h26sm312111bkt.52.2011.08.24.07.57.32
	(version=SSLv3 cipher=OTHER); Wed, 24 Aug 2011 07:57:32 -0700 (PDT)
Message-ID: <4E55115B.6070102@dresearch-fe.de>
Date: Wed, 24 Aug 2011 16:57:31 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0) Gecko/20110812 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E54DA89.2080105@dresearch-fe.de>
	<4E54EF12.2010100@dresearch-fe.de>
	<4E54F03E.3040806@juszkiewicz.com.pl>
	<4E550BDE.6010401@dresearch-fe.de>
	<20110824144529.GD5522@jama.jama.net>
In-Reply-To: <20110824144529.GD5522@jama.jama.net>
X-Enigmail-Version: 1.3.1
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: upstart vs. task-proper-tools
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
X-List-Received-Date: Wed, 24 Aug 2011 15:02:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.08.2011 16:45, Martin Jansa wrote:
> On Wed, Aug 24, 2011 at 04:34:06PM +0200, Steffen Sledz wrote:
>> On 24.08.2011 14:36, Marcin Juszkiewicz wrote:
>>> W dniu 24.08.2011 14:31, Steffen Sledz pisze:
>>>> BTW: What is the exact meaning/purpose/use of task-proper-tools?
>>> 
>>> Replace busybox components by full versions. Was made years ago and then updated by several people. While working for BugLabs company I used it to create rootfs without busybox.
>>> 
>>>> The list contains a lot of tools with existing alternatives (e.g. syslog-ng vs. rsyslog or pump vs. dhcpcd).
>>> 
>>> Then propose change which will allow to install one of them only at time?
>> 
>> Sorry, but my knowledge is not sufficient to do this. I've no idea how to reference u-a related tools here.
> 
> Why you don't remove task-proper-tools from your images RDEPENDS and add only tools you need which aren't provided by upstart?

task-proper-tools is not directly in our image RDEPENDS but inherited via task-sdk-native (may be via others too).

> or use something like DISTRO_SYSLOG ?= "syslog-ng" in task-proper-tools
> 
> and set DISTRO_SYSLOG = upstart for your distro if distro level granularity is fine for you (all supported images are using upstart).

We do not have an own distro (we use angstrom). It's only a custom image.

And the initial problem is sysvinit vs. upstart which are not u-a but need to be installed exclusively. If i'm right this is done by setting IMAGE_INIT_MANAGER. Can this variable used inside the task-proper-tools RDEPENDS?

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


