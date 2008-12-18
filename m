Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LDEr4-0001Gn-Jk
	for openembedded-devel@openembedded.org; Thu, 18 Dec 2008 10:07:38 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LDEmb-0000Iz-2Z
	for openembedded-devel@openembedded.org; Thu, 18 Dec 2008 09:03:01 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 18 Dec 2008 09:03:01 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 18 Dec 2008 09:03:01 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 18 Dec 2008 10:02:53 +0100
Message-ID: <gid3jt$nr2$1@ger.gmane.org>
References: <20081218071901.GB2135@buddha.tw.openmoko.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081211 Shredder/3.0b2pre
In-Reply-To: <20081218071901.GB2135@buddha.tw.openmoko.com>
Sender: news <news@ger.gmane.org>
Subject: Re: openmoko-merges
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
X-List-Received-Date: Thu, 18 Dec 2008 09:07:38 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18-12-08 08:19, John Lee wrote:
> Hi,
>
> Please review john_lee/openmoko-merges.  I started from
> holger/openmoko-merges then rebased it to oe.dev.

> Not sure how long it's going to take.  My plan is to merge it this
> Monday if it's okay...

No. There's just too much in there too review in a week. Also, the stuff 
I did review is just waaaaay to ugly to go in.
Saying stuff will get fixed after the merge..... I've heard that before, 
no-one actually fixes things after a merge.

Most of these commits have two problems:

* They can be done in a much better, but still OM specific way (e.g. 
FILESPATH)
* They can be done in a generic way (e.g. alsa-states)


To give some small examples:

* 
http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&h=john_lee/openmoko-merges&id=c0041ba98c41b320a36cbc5a66d0c8762e52ac62

--- a/packages/alsa/alsa-state.bb
+++ b/packages/alsa/alsa-state.bb
@@ -20,6 +20,7 @@ inherit update-rc.d

INITSCRIPT_PARAMS = "defaults 10"
+INITSCRIPT_PARAMS_openmoko = "start 39 S ."

Distro overrides are strongly discouraged and in this case not needed, 
since it's using 'defaults', so an optimization is welcomed. In a 
similar vein, the change to the initscript can be done to the regular 
one, no need to add a special openmoko version.

* 
http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&h=john_lee/openmoko-merges&id=64b844ec5cc0c1a6acb1a97d1ea745f15eadb38d
this it what the device table feature is for, see org.oe/dev/files/ for 
the device tables, machines can have multiple ones if needed.

* 
http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&h=john_lee/openmoko-merges&id=db77b062d51be86b946a11efcadaf8e41fd41727

If you modify FILESPATH you can reuse the initscripts from the 
initscripts packages so you don't need to copy over unchanged ones. 
Having said that, I think this should all be merged into the initscripts 
recipe so everyone can benefit from it.

I suspect review and merging would be easier if you 'collapse' the 
patches per recipe or per directory. Reviewing all the seperate commits 
will take too much time :(

Koen



