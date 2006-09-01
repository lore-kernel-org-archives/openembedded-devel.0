Received: from [64.233.166.183] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <philipp.zabel@gmail.com>) id 1GJATm-0001Ot-5A
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Sep 2006 16:58:46 +0200
Received: by py-out-1112.google.com with SMTP id i75so1092480pye
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Sep 2006 07:56:23 -0700 (PDT)
Received: by 10.35.108.12 with SMTP id k12mr3190352pym;
	Fri, 01 Sep 2006 07:56:23 -0700 (PDT)
Received: by 10.35.96.8 with HTTP; Fri, 1 Sep 2006 07:56:23 -0700 (PDT)
Message-ID: <74d0deb30609010756u38a55166kb2a7354641d9ae08@mail.gmail.com>
Date: Fri, 1 Sep 2006 16:56:23 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: "Using the OpenEmbedded metadata to build Linux Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <200608281131.31893.openembedded@hrw.one.pl>
MIME-Version: 1.0
References: <1156715171.5536.60.camel@localhost.localdomain>
	<200608281131.31893.openembedded@hrw.one.pl>
Subject: Re: What is task-base?
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
X-List-Received-Date: Fri, 01 Sep 2006 14:58:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 8/28/06, Marcin Juszkiewicz <openembedded@hrw.one.pl> wrote:
> I think that we lack "serial" in MACHINE_FEATURES - this would be needed
> by "irda" feature but will be also useful for machines which have normal
> serial (RS232/RS485) here we can put lrzsz.

Are there machines that have neither serial nor irda?

> "pcmcia" feature should recommend "serial", "bluetooth", "wifi" features
> atleast. It also contain now hostap-cs without checking for "wifi".
>
> "ext2" feature could be renamed to kind of "internal-storage" - most of
> our supported devices use ext2 but not every of them has internal storage
> with ext2.

I don't think ext2 shouldn't be a machine feature, but only one of the distro.
Possible uses for ext2 are SD cards, CF cards / microdrives in the CF slot
(pcmcia) or internal storage. I'd say ext2 packages should be pulled if the
machine has any of (sd, pcmcia, internal-hdd) and the distro supports ext2.
(hdparm is not ext2 specific, but ide specific...)

> "wifi" feature need some work too. There are machines which does not have
> Prism based wifi cards (so no need for hostap-utils) or do not support
> WPA (wpa-supplicant is not needed then). h4000 has internal wifi on
> ACX100 chipset (iirc) so it need only wireless-tools to have it working
> (chipset related packages should be listed in machine config).

There should be a task-pcmcia-wifi-rdepends/rrecommends for pcmcia wifi
cards that would only be used if the machine doesn't have internal wifi.
If somebody really needs a second wifi interface, he can be bothered
to install some packages.
If the machine has internal wifi, the needed packages are machine specific -
there could be a variable task-machine-wifi-rdepends (similar to
task-distro-wifi-rdepends)
I'd also propose:

 task-distro-wifi-rdepends = "\
     wireless-tools \
-    hostap-utils \
+    ${@base_contains("MACHINE_FEATURES", "wifi", "", "hostap-utils",d)} \
     wpa-supplicant-nossl"

A machine with an internal hostap card could then add hostap-utils to
task-machine-wifi-rdepends in the machine configuration file.
(For hx4700 this variable would just contain kernel-module-acx and
kernel-module-hx4700-acx).

cheers
Philipp


