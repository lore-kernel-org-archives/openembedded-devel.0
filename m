Received: from hermes.mlbassoc.com ([76.76.67.137] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1OJTLl-00063V-JM
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jun 2010 17:25:55 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id A48EE166070C; Tue,  1 Jun 2010 09:21:40 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 2DDD01660615;
	Tue,  1 Jun 2010 09:21:40 -0600 (MDT)
Message-ID: <4C052584.2040905@mlbassoc.com>
Date: Tue, 01 Jun 2010 09:21:40 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100330 Fedora/3.0.4-1.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C04F6FD.4070804@mlbassoc.com>	<alpine.DEB.2.00.1006011021440.32142@lynx>
	<201006011647.23770.ml@vdm-design.de>
In-Reply-To: <201006011647.23770.ml@vdm-design.de>
X-SA-Exim-Connect-IP: 76.76.67.137
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Is Angstrom dead?
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
X-List-Received-Date: Tue, 01 Jun 2010 15:25:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/01/2010 08:47 AM, Thomas Zimmermann wrote:
> Am Dienstag 01 Juni 2010, 16:24:33 schrieb Robert P. J. Day:
>> On Tue, 1 Jun 2010, Gary Thomas wrote:
>>> |   libcanberra-gtk gudev-1.0) were not met:
>>> | No package 'gstreamer-plugins-base-0.10' found
>>> |
>>> | Consider adjusting the PKG_CONFIG_PATH environment variable if you
>>> | installed software in a non-standard prefix.
>>> |
>>> | Alternatively, you may set the environment variables CHEESE_CFLAGS
>>> | and CHEESE_LIBS to avoid the need to call pkg-config.
>>> | See the pkg-config man page for more details.
>>>
>>> NOTE: package cheese-2.30.1-r0: task do_configure: Failed
>>
>>    now i'm slightly confused since neither ubuntu or fedora appear to
>> have any pkgconfig info for the cheese package, so why would there be
>> a test for it that you would need to override?  or is this not
>> pkgconfig-related?
>
> It should never depend on the pkconfig files installed on your buildhost. Are
> you sure that the gstreamer package is build?

I reran my build and it passed through (no repository changes).
This particular problem seems to be a multi-threaded build (I run
with BB_NUMBER_THREADS = "4")

Sadly, the final image still does not build:

| log_check: Matched keyword: [Cannot satisfy the following dependencies]
| Collected errors:
|  * resolve_conffiles: Existing conffile /local/Angstrom_BeagleBoard/tmp/rootfs/beagleboard-linuxtag2010-demo-image/etc/device_table is different from the conffile in the new 
package. The new conffile will be placed at /local/Angstrom_BeagleBoard/tmp/rootfs/b * satisfy_dependencies_for: Cannot satisfy the following dependencies for angstrom-task-gnome:
|  *    encodings *     encodings *     encodings *
|
NOTE: package beagleboard-linuxtag2010-demo-image-1.0-r0: task do_rootfs: Failed

I don't understand this error well enough (believe me, I've
spent hours reading the various recipes and trying things)
to hazard a guess as to what this error means.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


