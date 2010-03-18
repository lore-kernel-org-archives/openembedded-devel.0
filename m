Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NsIG5-0003aN-LH for openembedded-devel@lists.openembedded.org;
	Thu, 18 Mar 2010 17:07:48 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NsID6-0007Y6-TH for openembedded-devel@lists.openembedded.org;
	Thu, 18 Mar 2010 17:04:36 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Mar 2010 17:04:36 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Mar 2010 17:04:36 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 18 Mar 2010 17:04:24 +0100
Message-ID: <hntiu8$ggu$1@dough.gmane.org>
References: <141020e31003180719n7c4b1bd0ve58e26c7b6b661ee@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100314 Shredder/3.0.4pre
In-Reply-To: <141020e31003180719n7c4b1bd0ve58e26c7b6b661ee@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gst-plugins-base_0.10.28 fails with thumb Was: [oe-commits] Koen Kooi : gstreamer: updates
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
X-List-Received-Date: Thu, 18 Mar 2010 16:07:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 18-03-10 15:19, Martin Jansa wrote:
> On Wed, Mar 17, 2010 at 9:34 PM, git version control
> <git@git.openembedded.org> wrote:
>> Module: openembedded.git
>> Branch: org.openembedded.dev
>> Commit: e04b826e9b24dbe3b9332da8da9b9310f5125dc4
>> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=e04b826e9b24dbe3b9332da8da9b9310f5125dc4
>>
>> Author: Koen Kooi <koen@openembedded.org>
>> Date:   Wed Mar 17 20:46:31 2010 +0100
>>
>> gstreamer: updates
>>
>> * switch to new-style staging
>> * add support for new-style checksums
>> * move plugins to newer versions, so plugins moved (e.g. ivorbis)
>> * fixup gstconfig header parsing
>>
>> ---
>>
>>  recipes/gstreamer/gst-common.inc              |    5 ----
>>  recipes/gstreamer/gst-plugins-bad_0.10.18.bb  |    9 ++++++++
>>  recipes/gstreamer/gst-plugins-base_0.10.28.bb |   26 +++++++++++++++++++++++++
>>  recipes/gstreamer/gst-plugins-good_0.10.21.bb |   16 +++++++++++++++
>>  recipes/gstreamer/gst-plugins-ugly_0.10.14.bb |   21 ++++++++++++++++++++
>>  recipes/gstreamer/gst-plugins.inc             |   13 +++++++++++-
>>  recipes/gstreamer/gst-rtsp_0.10.4.bb          |    3 +-
>>  recipes/gstreamer/gstreamer.inc               |    4 +-
>>  recipes/gstreamer/gstreamer_0.10.28.bb        |   11 ++++++++++
>>  9 files changed, 98 insertions(+), 10 deletions(-)
> 
> Hi Koen,
> 
> thanks for update, I have small issue with thumb mode enabled while
> building recipes/gstreamer/gst-plugins-base_0.10.28.bb, with
> ARM_INSTRUCTION_SET = "ARM"
> in recipe it compiles fine
> without it fails like this:
> 
> | Making all in vorbis
> |   CC    gstvorbisdeclib.o
> | /tmp/ccWB7NmH.s: Assembler messages:
> | /tmp/ccWB7NmH.s:65: Error: instruction not supported in Thumb16 mode
> -- `subs ip,r5,#32768'
> | /tmp/ccWB7NmH.s:66: Error: Thumb does not support conditional execution
> | /tmp/ccWB7NmH.s:67: Error: Thumb does not support conditional execution
> | /tmp/ccWB7NmH.s:68: Error: instruction not supported in Thumb16 mode
> -- `adds ip,r5,#32768'
> | /tmp/ccWB7NmH.s:69: Error: Thumb does not support conditional execution
> | /tmp/ccWB7NmH.s:124: Error: instruction not supported in Thumb16
> mode -- `subs ip,r5,#32768'
> | /tmp/ccWB7NmH.s:125: Error: Thumb does not support conditional execution
> | /tmp/ccWB7NmH.s:126: Error: Thumb does not support conditional execution
> | /tmp/ccWB7NmH.s:127: Error: instruction not supported in Thumb16
> mode -- `adds ip,r5,#32768'
> | /tmp/ccWB7NmH.s:128: Error: Thumb does not support conditional execution
> | make[3]: *** [libgstivorbisdec_la-gstvorbisdeclib.lo] Error 1
> | make[2]: *** [all-recursive] Error 1
> | make[1]: *** [all-recursive] Error 1
> | make: *** [all] Error 2
> | FATAL: oe_runmake failed
> | ERROR: Function do_compile failed
> NOTE: package gst-plugins-base-0.10.28-r7.0: task do_compile: Failed
> 
> 
> I'm not sure how big impact would be to disable thumb or how difficult
> it would be to modify that code to be thumb compatible.

Try using file://ivorbis-thumb.patch;patch=1 from gst-plugins-bad.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLok8HMkyGM64RGpERAucjAJ4uK/1mDOxpzhRrOJhlcYYiG/hmzgCgvc/r
kjCkiVVqZlp8gsJ4K2tPP18=
=UQdG
-----END PGP SIGNATURE-----



