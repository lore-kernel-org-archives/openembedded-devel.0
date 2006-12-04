Received: from [64.233.162.228] (helo=nz-out-0102.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <andrew.paulsen@gmail.com>) id 1GrLtr-0007yT-Ch
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Dec 2006 23:02:59 +0100
Received: by nz-out-0102.google.com with SMTP id m22so1850183nzf
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Dec 2006 14:02:09 -0800 (PST)
Received: by 10.78.83.13 with SMTP id g13mr8125524hub.1165269728243;
	Mon, 04 Dec 2006 14:02:08 -0800 (PST)
Received: by 10.78.166.11 with HTTP; Mon, 4 Dec 2006 14:02:08 -0800 (PST)
Message-ID: <d46153c40612041402o2e1ed6fdmdd1a8fa8261d15ce@mail.gmail.com>
Date: Mon, 4 Dec 2006 16:02:08 -0600
From: "Andrew Paulsen" <andrew.paulsen@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: madwifi
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
X-List-Received-Date: Mon, 04 Dec 2006 22:03:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Does anyone have any tips for including madwifi into a gpe-image build?

I can "bitbake madwifi-ng" by itself and that appears to work.

If I add
BOOTSTRAP_EXTRA_RDEPENDS = "madwifi-ng"
to my machine.conf, or add

GPE_EXTRA_INSTALL += "madwifi-ng"
to my gpe-image.bb, I get an:

"ERROR: Nothing provides runtime dependency madwifi-ng"

Is there a better way to add packages to an image?


