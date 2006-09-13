Received: from [64.233.166.180] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <philipp.zabel@gmail.com>) id 1GNO0p-0004H0-Tu
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Sep 2006 08:14:20 +0200
Received: by py-out-1112.google.com with SMTP id i75so2752465pye
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Sep 2006 23:10:49 -0700 (PDT)
Received: by 10.35.96.7 with SMTP id y7mr12370221pyl;
	Tue, 12 Sep 2006 23:10:49 -0700 (PDT)
Received: by 10.35.96.8 with HTTP; Tue, 12 Sep 2006 23:10:49 -0700 (PDT)
Message-ID: <74d0deb30609122310t64dc8b51wecfa7749806be097@mail.gmail.com>
Date: Wed, 13 Sep 2006 08:10:49 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: machine-specific udev packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Sep 2006 06:14:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

I only recently noticed that udev packages are machine specific now
due to the machine specific mount.blacklist file. It looks like most
machines blacklist the same devices, namely:

/dev/mtdblock*
/dev/loop*
/dev/ram*

Only spitz and slugos differ significantly.
(/dev/hda* on spitz, hd[a-z], sd[a-z] on slugos)

I'd like to add /dev/mtdblock to the default mount.blacklist and
remove the specialization for akita, amsdelta, c7x0, h2200,
ipaq-pxa270 and tosa.

Is there any good way to avoid spitz and slugos specific udev packages
that are only due mount.blacklist? Maybe this could be part of
base-files or some other package?

regards
Philipp


