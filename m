Received: from [209.85.134.190] (helo=mu-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JJd2H-00010i-5n
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Jan 2008 00:05:05 +0100
Received: by mu-out-0910.google.com with SMTP id w9so966175mue.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2008 15:05:11 -0800 (PST)
Received: by 10.78.193.19 with SMTP id q19mr8393160huf.69.1201561511227;
	Mon, 28 Jan 2008 15:05:11 -0800 (PST)
Received: from widy.localdomain ( [88.231.77.184])
	by mx.google.com with ESMTPS id s38sm2373999hub.24.2008.01.28.15.05.09
	(version=SSLv3 cipher=OTHER); Mon, 28 Jan 2008 15:05:10 -0800 (PST)
Date: Tue, 29 Jan 2008 01:16:35 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20080129011635.42467fc9@widy.localdomain>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.1; i686-pc-linux-gnu)
Mime-Version: 1.0
Subject: [RFC] A case of distro config overriding DISTRO var
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
X-List-Received-Date: Mon, 28 Jan 2008 23:05:06 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

I'd like to know what's the idea behind overriding DISTRO var from the
value being set by user? For example, angstrom.inc does:

DISTRO = "angstrom" 

The problem with is that real distro name is lost, as thus
cannot be passed to some other tool (e.g., bbimage).

If there're good reasons to do that, and we would be lazy enough to
convert to something like: DISTRO_FOO = "${DISTRO}" in bitbake.conf,
and let those good reasons apply to DISTRO_FOO, which must replace
DISTRO in the appropriate places, then I at least propose to do:

DISTRO_ORIGINAL := "${DISTRO}"

in bitbake.conf, so we always have real distro config name handy.


-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


