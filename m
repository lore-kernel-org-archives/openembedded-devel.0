Received: from [72.14.220.158] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J5L8k-0004xk-8W
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Dec 2007 14:08:42 +0100
Received: by fg-out-1718.google.com with SMTP id 22so540392fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Dec 2007 05:03:35 -0800 (PST)
Received: by 10.86.95.20 with SMTP id s20mr10067488fgb.63.1198155815819;
	Thu, 20 Dec 2007 05:03:35 -0800 (PST)
Received: from widy.lan ( [194.79.8.36])
	by mx.google.com with ESMTPS id o11sm22733754fkf.2007.12.20.05.03.23
	(version=SSLv3 cipher=OTHER); Thu, 20 Dec 2007 05:03:35 -0800 (PST)
Date: Thu, 20 Dec 2007 15:08:12 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <1871890373.20071220150812@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <476A26BB.1010602@student.utwente.nl>
References: <fkc9de$365$1@ger.gmane.org> <476A26BB.1010602@student.utwente.nl>
MIME-Version: 1.0
Cc: Rolf Leggewie <no2spam@nospam.arcornews.de>
Subject: Re: RFC: drop quilt version 0.39
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
X-List-Received-Date: Thu, 20 Dec 2007 13:08:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Thursday, December 20, 2007, 10:24:27 AM, you wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1

> Rolf Leggewie schreef:
>> Hi,
>> 
>> driven by bug 1960, I have been doing some work on quilt in OE,
>> refactoring, cleaning up and adding version 0.46.  In the process I also
>> dropped version version 0.39.  Is there anybody that needs this
>> particular version or can I commit to drop it?  I grepped through OE and
>> found no reference to it.  If you want it kept, speak up now.

> What are your good reasons to drop it? I see no point in removing stuff
> just to boost someones commit stats under the moniker "clean up"

  I would like to second this (following my always-conservative
attitude to dropping stuff (without good reason) on which someone
worked hard previously (and someone can in the future)).

  To elaborate, I hope that we'll revamp OE support for using external
toolchains for building single packages, because it seems that people
have got a stereotype that OE is for building entire system from
scratch (at that would be too limiting - why I'd use top-notch
solution to build a whole distro while revert to using adhoc tools to
build packages for 3rd-party systems?)

  For example, I just pushed openwrt-sdk distro config, which allows
to build packages against OpenWRT SDK. Due to OpenWRT dependencies, it
may be required to build older than the latest versions of some
packages.



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



