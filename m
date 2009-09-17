Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MoB7W-0002WU-1b
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Sep 2009 09:09:37 +0200
Received: from [81.170.68.179] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MoB6u-0003GP-Pn
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Sep 2009 08:08:57 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0909161316l74594a96seed94b7a144472ee@mail.gmail.com>
References: <1252941903-6186-1-git-send-email-enric.balletbo@telefonica.net>
	<1252941903-6186-2-git-send-email-enric.balletbo@telefonica.net>
	<1252941903-6186-3-git-send-email-enric.balletbo@telefonica.net>
	<h8lu4h$jte$1@ger.gmane.org>
	<70c9a9110909150058k34419c27n8bcc80abb2cda147@mail.gmail.com>
	<c384c5ea0909161316l74594a96seed94b7a144472ee@mail.gmail.com>
Date: Thu, 17 Sep 2009 08:08:49 +0100
Message-Id: <1253171329.4490.1390.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-Broken-Reverse-DNS: no host name found for IP address 81.170.68.179
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: pb@reciva.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] linux-igep2: Add 2.6.28.10 for IGEP v2 machine
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
X-List-Received-Date: Thu, 17 Sep 2009 07:09:37 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-09-16 at 22:16 +0200, Leon Woestenberg wrote:
> #do_patch_append() {
> #        curl -o mach-types
> "http://www.arm.linux.org.uk/developer/machines/download.php"
> #}
> 
> do_configure_prepend() {
>         # update machine types list for ARM architecture
>         curl -o mach-types
> "http://www.arm.linux.org.uk/developer/machines/download.php" && \
>         cp mach-types arch/arm/tools/mach-types
> 
> 
> However, can someone see why the do_patch_append() approach does not work?

do_patch() is a Python function.  You won't get any good result from
appending shell to it.

A better approach might be to create a new task and arrange for it to
run after patch and before configure.

p.




